﻿--select * from dbo.ORD_OrderMstr

CREATE procedure [dbo].[USP_Split_IpMstr_Delete]
(
	@IpNo varchar(4000),
	@Version int
)
as 
begin
	DECLARE @OrderType tinyint
	SELECT @OrderType=OrderType From VIEW_IpMstr WHERE IpNo=@IpNo AND Version=@Version
	
	IF @OrderType=1
	BEGIN
		DELETE FROM ORD_IpMstr_1 WHERE IpNo=@IpNo AND [Version]=@Version
	END
	ELSE IF @OrderType=2
	BEGIN
		DELETE FROM ORD_IpMstr_2 WHERE IpNo=@IpNo AND [Version]=@Version
	END
	ELSE IF @OrderType=3
	BEGIN
		DELETE FROM ORD_IpMstr_3 WHERE IpNo=@IpNo AND [Version]=@Version
	END
	ELSE IF @OrderType=4
	BEGIN
		DELETE FROM ORD_IpMstr_4 WHERE IpNo=@IpNo AND [Version]=@Version
	END
	ELSE IF @OrderType=5
	BEGIN
		DELETE FROM ORD_IpMstr_5 WHERE IpNo=@IpNo AND [Version]=@Version
	END
	ELSE IF @OrderType=6
	BEGIN
		DELETE FROM ORD_IpMstr_6 WHERE IpNo=@IpNo AND [Version]=@Version
	END
	ELSE IF @OrderType=7
	BEGIN
		DELETE FROM ORD_IpMstr_7 WHERE IpNo=@IpNo AND [Version]=@Version
	END
	ELSE IF @OrderType=8
	BEGIN
		DELETE FROM ORD_IpMstr_8 WHERE IpNo=@IpNo AND [Version]=@Version
	END
	ELSE IF @OrderType=0
	BEGIN
		DELETE FROM ORD_IpMstr_0 WHERE IpNo=@IpNo AND [Version]=@Version
	END
end
