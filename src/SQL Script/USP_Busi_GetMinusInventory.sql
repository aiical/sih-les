IF EXISTS(SELECT * FROM SYS.OBJECTS WHERE TYPE='P' AND name='USP_Busi_GetMinusInventory')
	DROP PROCEDURE USP_Busi_GetMinusInventory	
GO
CREATE PROCEDURE [dbo].[USP_Busi_GetMinusInventory]
(
	@Location varchar(50),
	@Item varchar(50),
	@QualityType tinyint,
	@OccupyType tinyint
)
AS
BEGIN
/*******************获取负库存数据*********************************
*******************create info*************************************
Author:		zhangsheng
CreateDate;2012-05-25
*******************Modify Info*************************************
LastModifyDate:
Modify For:
exec [USP_Busi_GetMinusInventory] 'CS0010','5801306476',0,0,1
************steps**************************************************
step1.GetMinusInventory
******************************************************************/
	SET NOCOUNT ON;
	
	DECLARE @PartSuffix varchar(50)
	SELECT @PartSuffix = PartSuffix FROM MD_Location WHERE Code = @Location
	
	IF ISNULL(@PartSuffix,'')=''
	BEGIN
		SET @PartSuffix='0'
	END 
	
	IF ISNULL(@Item,'')='' OR @QualityType IS NULL OR @OccupyType IS NULL
	BEGIN
		RAISERROR ('Backend Query is not correct!' , 16, 1) WITH NOWAIT
	END	
	
	DECLARE @Statement nvarchar(4000)
	DECLARE @Parameter nvarchar(4000)
	
	SET @Statement=N'SELECT lld.Id, lld.Location, lld.Bin, lld.Item, lld.HuId, 
                      lld.LotNo, lld.Qty, lld.IsCS, lld.PlanBill, lld.CSSupplier, lld.QualityType, 
                      lld.IsFreeze, lld.IsATP, lld.OccupyType, lld.OccupyRefNo, 
                      lld.CreateUser, lld.CreateUserNm, lld.CreateDate, lld.LastModifyUser, 
                      lld.LastModifyUserNm, lld.LastModifyDate, lld.Version
                      FROM dbo.INV_LocationLotDet_'+@PartSuffix+' as lld
				WHERE lld.Item=@Item_1 AND lld.Location=@Location_1
				    AND lld.HuId is null AND lld.IsFreeze = 0 AND lld.Qty < 0 AND lld.QualityType=@QualityType_1 
					AND lld.OccupyType=@OccupyType_1 AND lld.IsCS=0 AND lld.CSSupplier is null'
	SET @Parameter=N'@Item_1 varchar(50),@QualityType_1 tinyint,@OccupyType_1 tinyint,@Location_1 varchar(50)'
	
	exec sp_executesql @Statement,@Parameter,
		@Item_1=@Item,@QualityType_1=@QualityType,@OccupyType_1=@OccupyType,@Location_1=@Location

END

GO


