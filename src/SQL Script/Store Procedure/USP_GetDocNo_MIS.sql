IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_GetDocNo_MIS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_GetDocNo_MIS]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_GetDocNo_MIS]
(
	@Type tinyint,
	@IsScanHu bit,
	@QualityType tinyint,
	@Region varchar(50),
	@Location varchar(50),
	@MisNo varchar(1000) output
)
AS
BEGIN
	SET NOCOUNT ON;
	
	/*
	declare @p6 varchar(100)
	set @p6=NULL
	exec USP_GetMisNo @Type=0,@IsScanHu=1,@QualityType=0,@Region='RDC',@Location='RDC2',@MisNo=@p6 output
	select @p6
	
	declare @MisNo varchar(1000)
	exec USP_GetMisNo 1,0,1,'aaa','bbb',@MisNo output
	select @MisNo
	*/
	
	DECLARE @Code varchar(50)
	DECLARE @BlockSeq varchar(10)
	DECLARE @PreFixed char(2)
	DECLARE @YearCode varchar(6)
	DECLARE @MonthCode varchar(4)
	DECLARE @DayCode varchar(4)
	DECLARE @SeqLength tinyint
	DECLARE @SeqMin int
	DECLARE @NumCtrKey varchar(1000)
	
	SELECT @BlockSeq = SUBSTRING(BlockSeq,2,LEN(BlockSeq)-1),@Code = Code,
		 @PreFixed = PreFixed, @YearCode = YearCode,
		 @MonthCode = MonthCode,@DayCode = DayCode,
		 @SeqLength = SeqLength,@SeqMin = SeqMin
	FROM dbo.SYS_SNRule 
	WHERE Code = 1501+@Type
	
	DECLARE @CurrSeq int
	DECLARE @CurrBlockSeq char(1)
	DECLARE @CurrRefColumn varchar(50)
	DECLARE @Temp int
	SET @Temp = 1
	DECLARE @MaxNO int
	DECLARE @CurrentDate datetime	
	SET @CurrentDate = GETDATE()
	
	SELECT ROWNO=ROW_NUMBER() OVER (ORDER BY B.FieldSeq),B.* INTO #TEMP FROM dbo.SYS_SNRule A
	LEFT JOIN SYS_SNRuleExt B
		ON A.CODE=B.CODE
	WHERE A.Code = 1501+@Type AND B.IsChoosed = 1
	
	SET @MisNo=@PreFixed	
	WHILE(@BlockSeq>0)
	BEGIN
		SET @CurrBlockSeq = SUBSTRING(@BlockSeq,1,1)
		--PRINT @BlockSeq
		--PRINT @CurrBlockSeq
		--PRINT @MisNo
		SET @BlockSeq = SUBSTRING(@BlockSeq,2,LEN(@BlockSeq)-1)
		
		IF @CurrBlockSeq = 2
		BEGIN
			SET @MisNo = @MisNo+dbo.FormatDate(@CurrentDate,@YearCode)
		END
		ELSE IF @CurrBlockSeq = 3
		BEGIN
			SET @MisNo = @MisNo+dbo.FormatDate(@CurrentDate,@MonthCode)
		END
		ELSE IF @CurrBlockSeq = 4
		BEGIN
			SET @MisNo = @MisNo+dbo.FormatDate(@CurrentDate,@DayCode)
		END
		ELSE IF @CurrBlockSeq = 5
		BEGIN
			--We will use '****' to replace the Seqence number for the number control key
			SET @MisNo = @MisNo+'****'
			--BEGIN TRAN
			--	IF NOT EXISTS(SELECT * FROM dbo.SYS_NumCtrl WHERE Code = @Code)
			--	BEGIN
			--		INSERT INTO SYS_NumCtrl(Code,IntValue)
			--		VALUES(@Code,@SeqMin)
			--		SET @CurrSeq = @SeqMin
			--	END
			--	ELSE
			--	BEGIN
			--		SELECT @CurrSeq = IntValue FROM dbo.SYS_NumCtrl WHERE Code = @Code
			--	END
			--	UPDATE dbo.SYS_NumCtrl SET IntValue = IntValue+1 WHERE Code = @Code
			--COMMIT		
			--SET @MisNo = @MisNo+RIGHT('00000000000000000000'+CAST(@CurrSeq AS VARCHAR(20)),@SeqLength)
		END	
		ELSE IF @CurrBlockSeq = 6
		BEGIN
			SELECT @MaxNO = MAX(ROWNO) FROM #Temp
			WHILE(@Temp<=@MaxNO)
			BEGIN
				SELECT @CurrRefColumn = Field FROM #Temp WHERE ROWNO = @Temp
				IF(@CurrRefColumn = 'Type')
				BEGIN
					SET @MisNo = @MisNo + CAST(@Type AS VARCHAR(10))
				END
				ELSE IF(@CurrRefColumn = 'IsScanHu')
				BEGIN
					SET @MisNo = @MisNo + CAST(@IsScanHu AS VARCHAR(10))
				END
				ELSE IF(@CurrRefColumn = 'QualityType')
				BEGIN
					SET @MisNo = @MisNo + CAST(@QualityType AS VARCHAR(10))
				END
				ELSE IF(@CurrRefColumn = 'Region')
				BEGIN
					SET @MisNo = @MisNo + ISNULL(@Region,'')
				END
				ELSE IF(@CurrRefColumn = 'Location')
				BEGIN
					SET @MisNo = @MisNo + ISNULL(@Location,'')
				END	
				SET @Temp = @Temp + 1														
			END
		END	
	END  
	
	--PRINT @MisNo
	
	IF CHARINDEX('****',@MisNo)>0
	BEGIN
		--PRINT @MisNo
		SET @NumCtrKey = @MisNo
		BEGIN TRAN
			IF NOT EXISTS(SELECT * FROM dbo.SYS_NumCtrl WHERE Code = @NumCtrKey)
			BEGIN
				INSERT INTO SYS_NumCtrl(Code,IntValue)
				VALUES(@NumCtrKey,ISNULL(@SeqMin,0))
				SET @CurrSeq = ISNULL(@SeqMin,0)
			END
			ELSE
			BEGIN
				SELECT @CurrSeq = IntValue FROM dbo.SYS_NumCtrl WHERE Code = @NumCtrKey
			END
			UPDATE dbo.SYS_NumCtrl SET IntValue = IntValue+1 WHERE Code = @NumCtrKey
		COMMIT		
		SET @MisNo = REPLACE(@MisNo,'****',RIGHT('00000000000000000000'+CAST(@CurrSeq AS VARCHAR(20)),@SeqLength))		
	END
	
END

GO


