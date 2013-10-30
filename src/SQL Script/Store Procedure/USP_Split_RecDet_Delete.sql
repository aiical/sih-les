SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF EXISTS(SELECT * FROM SYS.objects WHERE type='P' AND name='USP_Split_RecDet_Delete')
	DROP PROCEDURE USP_Split_RecDet_Delete
GO

CREATE PROCEDURE USP_Split_RecDet_Delete
(
	@Id int,
	@Version int
)
AS 
BEGIN
	DECLARE @OrderType tinyint
	SELECT @OrderType=OrderType From VIEW_RecDet WHERE Id=@Id AND Version=@Version
	
	IF @OrderType IS NULL
	BEGIN
		SELECT NULL
	END
	
	DECLARE @Statement nvarchar(4000) 
	DECLARE @Parameters nvarchar(4000) 
	
	SET @Statement=N'DELETE FROM ORD_RecDet_'+@OrderType+' WHERE Id=@Id_1'
	SET @Parameters=N'@Id_1 int'
	EXEC SP_EXECUTESQL @Statement,@Parameters,@Id_1=@Id
END
GO
