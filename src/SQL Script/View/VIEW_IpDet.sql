IF EXISTS(SELECT * FROM SYS.objects WHERE type='V' AND name='VIEW_IpDet')
	DROP VIEW VIEW_IpDet
GO

CREATE VIEW VIEW_IpDet
AS
SELECT a.Id,a.Type,a.IpNo,a.Seq,a.OrderNo,a.OrderType,a.OrderSubType,a.OrderDetId,a.OrderDetSeq,a.ExtNo,a.ExtSeq,a.Item,a.ItemDesc,a.RefItemCode,a.Uom,a.BaseUom,a.UC,a.UCDesc,a.Container,a.ContainerDesc,a.QualityType,a.ManufactureParty,a.Qty,a.RecQty,a.UnitQty,a.LocFrom,a.LocFromNm,a.LocTo,a.LocToNm,a.IsInspect,a.BillAddr,a.PriceList,a.UnitPrice,a.Currency,a.IsProvEst,a.Tax,a.IsIncludeTax,a.BillTerm,a.IsClose,a.GapRecNo,a.GapIpDetId,a.CreateUser,a.CreateUserNm,a.CreateDate,a.LastModifyUser,a.LastModifyUserNm,a.LastModifyDate,a.Version,a.StartTime,a.Windowtime,a.BinTo,a.IsScanHu,a.IsChangeUC,a.Flow,a.BWART,a.PSTYP FROM ORD_IpDet_0 AS a
UNION ALL
SELECT a.Id,a.Type,a.IpNo,a.Seq,a.OrderNo,a.OrderType,a.OrderSubType,a.OrderDetId,a.OrderDetSeq,a.ExtNo,a.ExtSeq,a.Item,a.ItemDesc,a.RefItemCode,a.Uom,a.BaseUom,a.UC,a.UCDesc,a.Container,a.ContainerDesc,a.QualityType,a.ManufactureParty,a.Qty,a.RecQty,a.UnitQty,a.LocFrom,a.LocFromNm,a.LocTo,a.LocToNm,a.IsInspect,a.BillAddr,a.PriceList,a.UnitPrice,a.Currency,a.IsProvEst,a.Tax,a.IsIncludeTax,a.BillTerm,a.IsClose,a.GapRecNo,a.GapIpDetId,a.CreateUser,a.CreateUserNm,a.CreateDate,a.LastModifyUser,a.LastModifyUserNm,a.LastModifyDate,a.Version,a.StartTime,a.Windowtime,a.BinTo,a.IsScanHu,a.IsChangeUC,a.Flow,a.BWART,a.PSTYP FROM ORD_IpDet_1 AS a
UNION ALL
SELECT a.Id,a.Type,a.IpNo,a.Seq,a.OrderNo,a.OrderType,a.OrderSubType,a.OrderDetId,a.OrderDetSeq,a.ExtNo,a.ExtSeq,a.Item,a.ItemDesc,a.RefItemCode,a.Uom,a.BaseUom,a.UC,a.UCDesc,a.Container,a.ContainerDesc,a.QualityType,a.ManufactureParty,a.Qty,a.RecQty,a.UnitQty,a.LocFrom,a.LocFromNm,a.LocTo,a.LocToNm,a.IsInspect,a.BillAddr,a.PriceList,a.UnitPrice,a.Currency,a.IsProvEst,a.Tax,a.IsIncludeTax,a.BillTerm,a.IsClose,a.GapRecNo,a.GapIpDetId,a.CreateUser,a.CreateUserNm,a.CreateDate,a.LastModifyUser,a.LastModifyUserNm,a.LastModifyDate,a.Version,a.StartTime,a.Windowtime,a.BinTo,a.IsScanHu,a.IsChangeUC,a.Flow,a.BWART,a.PSTYP FROM ORD_IpDet_2 AS a
UNION ALL
SELECT a.Id,a.Type,a.IpNo,a.Seq,a.OrderNo,a.OrderType,a.OrderSubType,a.OrderDetId,a.OrderDetSeq,a.ExtNo,a.ExtSeq,a.Item,a.ItemDesc,a.RefItemCode,a.Uom,a.BaseUom,a.UC,a.UCDesc,a.Container,a.ContainerDesc,a.QualityType,a.ManufactureParty,a.Qty,a.RecQty,a.UnitQty,a.LocFrom,a.LocFromNm,a.LocTo,a.LocToNm,a.IsInspect,a.BillAddr,a.PriceList,a.UnitPrice,a.Currency,a.IsProvEst,a.Tax,a.IsIncludeTax,a.BillTerm,a.IsClose,a.GapRecNo,a.GapIpDetId,a.CreateUser,a.CreateUserNm,a.CreateDate,a.LastModifyUser,a.LastModifyUserNm,a.LastModifyDate,a.Version,a.StartTime,a.Windowtime,a.BinTo,a.IsScanHu,a.IsChangeUC,a.Flow,a.BWART,a.PSTYP FROM ORD_IpDet_3 AS a
UNION ALL
SELECT a.Id,a.Type,a.IpNo,a.Seq,a.OrderNo,a.OrderType,a.OrderSubType,a.OrderDetId,a.OrderDetSeq,a.ExtNo,a.ExtSeq,a.Item,a.ItemDesc,a.RefItemCode,a.Uom,a.BaseUom,a.UC,a.UCDesc,a.Container,a.ContainerDesc,a.QualityType,a.ManufactureParty,a.Qty,a.RecQty,a.UnitQty,a.LocFrom,a.LocFromNm,a.LocTo,a.LocToNm,a.IsInspect,a.BillAddr,a.PriceList,a.UnitPrice,a.Currency,a.IsProvEst,a.Tax,a.IsIncludeTax,a.BillTerm,a.IsClose,a.GapRecNo,a.GapIpDetId,a.CreateUser,a.CreateUserNm,a.CreateDate,a.LastModifyUser,a.LastModifyUserNm,a.LastModifyDate,a.Version,a.StartTime,a.Windowtime,a.BinTo,a.IsScanHu,a.IsChangeUC,a.Flow,a.BWART,a.PSTYP FROM ORD_IpDet_4 AS a
UNION ALL
SELECT a.Id,a.Type,a.IpNo,a.Seq,a.OrderNo,a.OrderType,a.OrderSubType,a.OrderDetId,a.OrderDetSeq,a.ExtNo,a.ExtSeq,a.Item,a.ItemDesc,a.RefItemCode,a.Uom,a.BaseUom,a.UC,a.UCDesc,a.Container,a.ContainerDesc,a.QualityType,a.ManufactureParty,a.Qty,a.RecQty,a.UnitQty,a.LocFrom,a.LocFromNm,a.LocTo,a.LocToNm,a.IsInspect,a.BillAddr,a.PriceList,a.UnitPrice,a.Currency,a.IsProvEst,a.Tax,a.IsIncludeTax,a.BillTerm,a.IsClose,a.GapRecNo,a.GapIpDetId,a.CreateUser,a.CreateUserNm,a.CreateDate,a.LastModifyUser,a.LastModifyUserNm,a.LastModifyDate,a.Version,a.StartTime,a.Windowtime,a.BinTo,a.IsScanHu,a.IsChangeUC,a.Flow,a.BWART,a.PSTYP FROM ORD_IpDet_5 AS a
UNION ALL
SELECT a.Id,a.Type,a.IpNo,a.Seq,a.OrderNo,a.OrderType,a.OrderSubType,a.OrderDetId,a.OrderDetSeq,a.ExtNo,a.ExtSeq,a.Item,a.ItemDesc,a.RefItemCode,a.Uom,a.BaseUom,a.UC,a.UCDesc,a.Container,a.ContainerDesc,a.QualityType,a.ManufactureParty,a.Qty,a.RecQty,a.UnitQty,a.LocFrom,a.LocFromNm,a.LocTo,a.LocToNm,a.IsInspect,a.BillAddr,a.PriceList,a.UnitPrice,a.Currency,a.IsProvEst,a.Tax,a.IsIncludeTax,a.BillTerm,a.IsClose,a.GapRecNo,a.GapIpDetId,a.CreateUser,a.CreateUserNm,a.CreateDate,a.LastModifyUser,a.LastModifyUserNm,a.LastModifyDate,a.Version,a.StartTime,a.Windowtime,a.BinTo,a.IsScanHu,a.IsChangeUC,a.Flow,a.BWART,a.PSTYP FROM ORD_IpDet_6 AS a
UNION ALL
SELECT a.Id,a.Type,a.IpNo,a.Seq,a.OrderNo,a.OrderType,a.OrderSubType,a.OrderDetId,a.OrderDetSeq,a.ExtNo,a.ExtSeq,a.Item,a.ItemDesc,a.RefItemCode,a.Uom,a.BaseUom,a.UC,a.UCDesc,a.Container,a.ContainerDesc,a.QualityType,a.ManufactureParty,a.Qty,a.RecQty,a.UnitQty,a.LocFrom,a.LocFromNm,a.LocTo,a.LocToNm,a.IsInspect,a.BillAddr,a.PriceList,a.UnitPrice,a.Currency,a.IsProvEst,a.Tax,a.IsIncludeTax,a.BillTerm,a.IsClose,a.GapRecNo,a.GapIpDetId,a.CreateUser,a.CreateUserNm,a.CreateDate,a.LastModifyUser,a.LastModifyUserNm,a.LastModifyDate,a.Version,a.StartTime,a.Windowtime,a.BinTo,a.IsScanHu,a.IsChangeUC,a.Flow,a.BWART,a.PSTYP FROM ORD_IpDet_7 AS a
UNION ALL
SELECT a.Id,a.Type,a.IpNo,a.Seq,a.OrderNo,a.OrderType,a.OrderSubType,a.OrderDetId,a.OrderDetSeq,a.ExtNo,a.ExtSeq,a.Item,a.ItemDesc,a.RefItemCode,a.Uom,a.BaseUom,a.UC,a.UCDesc,a.Container,a.ContainerDesc,a.QualityType,a.ManufactureParty,a.Qty,a.RecQty,a.UnitQty,a.LocFrom,a.LocFromNm,a.LocTo,a.LocToNm,a.IsInspect,a.BillAddr,a.PriceList,a.UnitPrice,a.Currency,a.IsProvEst,a.Tax,a.IsIncludeTax,a.BillTerm,a.IsClose,a.GapRecNo,a.GapIpDetId,a.CreateUser,a.CreateUserNm,a.CreateDate,a.LastModifyUser,a.LastModifyUserNm,a.LastModifyDate,a.Version,a.StartTime,a.Windowtime,a.BinTo,a.IsScanHu,a.IsChangeUC,a.Flow,a.BWART,a.PSTYP FROM ORD_IpDet_8 AS a
GO