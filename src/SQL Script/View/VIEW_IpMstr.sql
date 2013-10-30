IF EXISTS(SELECT * FROM SYS.objects WHERE type='V' AND name='VIEW_IpMstr')
	DROP VIEW VIEW_IpMstr
GO

CREATE VIEW VIEW_IpMstr
AS
SELECT a.IpNo,a.ExtIpNo,a.GapIpNo,a.SeqNo,a.Type,a.OrderType,a.OrderSubType,a.QualityType,a.Status,a.DepartTime,a.ArriveTime,a.PartyFrom,a.PartyFromNm,a.PartyTo,a.PartyToNm,a.ShipFrom,a.ShipFromAddr,a.ShipFromTel,a.ShipFromCell,a.ShipFromFax,a.ShipFromContact,a.ShipTo,a.ShipToAddr,a.ShipToTel,a.ShipToCell,a.ShipToFax,a.ShipToContact,a.Dock,a.IsAutoReceive,a.IsShipScanHu,a.IsPrintAsn,a.IsAsnPrinted,a.IsPrintRec,a.IsRecExceed,a.IsRecFulfillUC,a.IsRecFifo,a.IsAsnUniqueRec,a.IsCheckPartyFromAuth,a.IsCheckPartyToAuth,a.RecGapTo,a.AsnTemplate,a.RecTemplate,a.HuTemplate,a.EffDate,a.CreateUser,a.CreateUserNm,a.CreateDate,a.LastModifyUser,a.LastModifyUserNm,a.LastModifyDate,a.CloseDate,a.CloseUser,a.CloseUserNm,a.CloseReason,a.Version,a.WMSNo,a.CreateHuOpt,a.IsRecScanHu,a.Flow,a.ShipNo,a.Vehicle FROM ORD_IpMstr_0 AS a
UNION ALL
SELECT a.IpNo,a.ExtIpNo,a.GapIpNo,a.SeqNo,a.Type,a.OrderType,a.OrderSubType,a.QualityType,a.Status,a.DepartTime,a.ArriveTime,a.PartyFrom,a.PartyFromNm,a.PartyTo,a.PartyToNm,a.ShipFrom,a.ShipFromAddr,a.ShipFromTel,a.ShipFromCell,a.ShipFromFax,a.ShipFromContact,a.ShipTo,a.ShipToAddr,a.ShipToTel,a.ShipToCell,a.ShipToFax,a.ShipToContact,a.Dock,a.IsAutoReceive,a.IsShipScanHu,a.IsPrintAsn,a.IsAsnPrinted,a.IsPrintRec,a.IsRecExceed,a.IsRecFulfillUC,a.IsRecFifo,a.IsAsnUniqueRec,a.IsCheckPartyFromAuth,a.IsCheckPartyToAuth,a.RecGapTo,a.AsnTemplate,a.RecTemplate,a.HuTemplate,a.EffDate,a.CreateUser,a.CreateUserNm,a.CreateDate,a.LastModifyUser,a.LastModifyUserNm,a.LastModifyDate,a.CloseDate,a.CloseUser,a.CloseUserNm,a.CloseReason,a.Version,a.WMSNo,a.CreateHuOpt,a.IsRecScanHu,a.Flow,a.ShipNo,a.Vehicle FROM ORD_IpMstr_1 AS a
UNION ALL
SELECT a.IpNo,a.ExtIpNo,a.GapIpNo,a.SeqNo,a.Type,a.OrderType,a.OrderSubType,a.QualityType,a.Status,a.DepartTime,a.ArriveTime,a.PartyFrom,a.PartyFromNm,a.PartyTo,a.PartyToNm,a.ShipFrom,a.ShipFromAddr,a.ShipFromTel,a.ShipFromCell,a.ShipFromFax,a.ShipFromContact,a.ShipTo,a.ShipToAddr,a.ShipToTel,a.ShipToCell,a.ShipToFax,a.ShipToContact,a.Dock,a.IsAutoReceive,a.IsShipScanHu,a.IsPrintAsn,a.IsAsnPrinted,a.IsPrintRec,a.IsRecExceed,a.IsRecFulfillUC,a.IsRecFifo,a.IsAsnUniqueRec,a.IsCheckPartyFromAuth,a.IsCheckPartyToAuth,a.RecGapTo,a.AsnTemplate,a.RecTemplate,a.HuTemplate,a.EffDate,a.CreateUser,a.CreateUserNm,a.CreateDate,a.LastModifyUser,a.LastModifyUserNm,a.LastModifyDate,a.CloseDate,a.CloseUser,a.CloseUserNm,a.CloseReason,a.Version,a.WMSNo,a.CreateHuOpt,a.IsRecScanHu,a.Flow,a.ShipNo,a.Vehicle FROM ORD_IpMstr_2 AS a
UNION ALL
SELECT a.IpNo,a.ExtIpNo,a.GapIpNo,a.SeqNo,a.Type,a.OrderType,a.OrderSubType,a.QualityType,a.Status,a.DepartTime,a.ArriveTime,a.PartyFrom,a.PartyFromNm,a.PartyTo,a.PartyToNm,a.ShipFrom,a.ShipFromAddr,a.ShipFromTel,a.ShipFromCell,a.ShipFromFax,a.ShipFromContact,a.ShipTo,a.ShipToAddr,a.ShipToTel,a.ShipToCell,a.ShipToFax,a.ShipToContact,a.Dock,a.IsAutoReceive,a.IsShipScanHu,a.IsPrintAsn,a.IsAsnPrinted,a.IsPrintRec,a.IsRecExceed,a.IsRecFulfillUC,a.IsRecFifo,a.IsAsnUniqueRec,a.IsCheckPartyFromAuth,a.IsCheckPartyToAuth,a.RecGapTo,a.AsnTemplate,a.RecTemplate,a.HuTemplate,a.EffDate,a.CreateUser,a.CreateUserNm,a.CreateDate,a.LastModifyUser,a.LastModifyUserNm,a.LastModifyDate,a.CloseDate,a.CloseUser,a.CloseUserNm,a.CloseReason,a.Version,a.WMSNo,a.CreateHuOpt,a.IsRecScanHu,a.Flow,a.ShipNo,a.Vehicle FROM ORD_IpMstr_3 AS a
UNION ALL
SELECT a.IpNo,a.ExtIpNo,a.GapIpNo,a.SeqNo,a.Type,a.OrderType,a.OrderSubType,a.QualityType,a.Status,a.DepartTime,a.ArriveTime,a.PartyFrom,a.PartyFromNm,a.PartyTo,a.PartyToNm,a.ShipFrom,a.ShipFromAddr,a.ShipFromTel,a.ShipFromCell,a.ShipFromFax,a.ShipFromContact,a.ShipTo,a.ShipToAddr,a.ShipToTel,a.ShipToCell,a.ShipToFax,a.ShipToContact,a.Dock,a.IsAutoReceive,a.IsShipScanHu,a.IsPrintAsn,a.IsAsnPrinted,a.IsPrintRec,a.IsRecExceed,a.IsRecFulfillUC,a.IsRecFifo,a.IsAsnUniqueRec,a.IsCheckPartyFromAuth,a.IsCheckPartyToAuth,a.RecGapTo,a.AsnTemplate,a.RecTemplate,a.HuTemplate,a.EffDate,a.CreateUser,a.CreateUserNm,a.CreateDate,a.LastModifyUser,a.LastModifyUserNm,a.LastModifyDate,a.CloseDate,a.CloseUser,a.CloseUserNm,a.CloseReason,a.Version,a.WMSNo,a.CreateHuOpt,a.IsRecScanHu,a.Flow,a.ShipNo,a.Vehicle FROM ORD_IpMstr_4 AS a
UNION ALL
SELECT a.IpNo,a.ExtIpNo,a.GapIpNo,a.SeqNo,a.Type,a.OrderType,a.OrderSubType,a.QualityType,a.Status,a.DepartTime,a.ArriveTime,a.PartyFrom,a.PartyFromNm,a.PartyTo,a.PartyToNm,a.ShipFrom,a.ShipFromAddr,a.ShipFromTel,a.ShipFromCell,a.ShipFromFax,a.ShipFromContact,a.ShipTo,a.ShipToAddr,a.ShipToTel,a.ShipToCell,a.ShipToFax,a.ShipToContact,a.Dock,a.IsAutoReceive,a.IsShipScanHu,a.IsPrintAsn,a.IsAsnPrinted,a.IsPrintRec,a.IsRecExceed,a.IsRecFulfillUC,a.IsRecFifo,a.IsAsnUniqueRec,a.IsCheckPartyFromAuth,a.IsCheckPartyToAuth,a.RecGapTo,a.AsnTemplate,a.RecTemplate,a.HuTemplate,a.EffDate,a.CreateUser,a.CreateUserNm,a.CreateDate,a.LastModifyUser,a.LastModifyUserNm,a.LastModifyDate,a.CloseDate,a.CloseUser,a.CloseUserNm,a.CloseReason,a.Version,a.WMSNo,a.CreateHuOpt,a.IsRecScanHu,a.Flow,a.ShipNo,a.Vehicle FROM ORD_IpMstr_5 AS a
UNION ALL
SELECT a.IpNo,a.ExtIpNo,a.GapIpNo,a.SeqNo,a.Type,a.OrderType,a.OrderSubType,a.QualityType,a.Status,a.DepartTime,a.ArriveTime,a.PartyFrom,a.PartyFromNm,a.PartyTo,a.PartyToNm,a.ShipFrom,a.ShipFromAddr,a.ShipFromTel,a.ShipFromCell,a.ShipFromFax,a.ShipFromContact,a.ShipTo,a.ShipToAddr,a.ShipToTel,a.ShipToCell,a.ShipToFax,a.ShipToContact,a.Dock,a.IsAutoReceive,a.IsShipScanHu,a.IsPrintAsn,a.IsAsnPrinted,a.IsPrintRec,a.IsRecExceed,a.IsRecFulfillUC,a.IsRecFifo,a.IsAsnUniqueRec,a.IsCheckPartyFromAuth,a.IsCheckPartyToAuth,a.RecGapTo,a.AsnTemplate,a.RecTemplate,a.HuTemplate,a.EffDate,a.CreateUser,a.CreateUserNm,a.CreateDate,a.LastModifyUser,a.LastModifyUserNm,a.LastModifyDate,a.CloseDate,a.CloseUser,a.CloseUserNm,a.CloseReason,a.Version,a.WMSNo,a.CreateHuOpt,a.IsRecScanHu,a.Flow,a.ShipNo,a.Vehicle FROM ORD_IpMstr_6 AS a
UNION ALL
SELECT a.IpNo,a.ExtIpNo,a.GapIpNo,a.SeqNo,a.Type,a.OrderType,a.OrderSubType,a.QualityType,a.Status,a.DepartTime,a.ArriveTime,a.PartyFrom,a.PartyFromNm,a.PartyTo,a.PartyToNm,a.ShipFrom,a.ShipFromAddr,a.ShipFromTel,a.ShipFromCell,a.ShipFromFax,a.ShipFromContact,a.ShipTo,a.ShipToAddr,a.ShipToTel,a.ShipToCell,a.ShipToFax,a.ShipToContact,a.Dock,a.IsAutoReceive,a.IsShipScanHu,a.IsPrintAsn,a.IsAsnPrinted,a.IsPrintRec,a.IsRecExceed,a.IsRecFulfillUC,a.IsRecFifo,a.IsAsnUniqueRec,a.IsCheckPartyFromAuth,a.IsCheckPartyToAuth,a.RecGapTo,a.AsnTemplate,a.RecTemplate,a.HuTemplate,a.EffDate,a.CreateUser,a.CreateUserNm,a.CreateDate,a.LastModifyUser,a.LastModifyUserNm,a.LastModifyDate,a.CloseDate,a.CloseUser,a.CloseUserNm,a.CloseReason,a.Version,a.WMSNo,a.CreateHuOpt,a.IsRecScanHu,a.Flow,a.ShipNo,a.Vehicle FROM ORD_IpMstr_7 AS a
UNION ALL
SELECT a.IpNo,a.ExtIpNo,a.GapIpNo,a.SeqNo,a.Type,a.OrderType,a.OrderSubType,a.QualityType,a.Status,a.DepartTime,a.ArriveTime,a.PartyFrom,a.PartyFromNm,a.PartyTo,a.PartyToNm,a.ShipFrom,a.ShipFromAddr,a.ShipFromTel,a.ShipFromCell,a.ShipFromFax,a.ShipFromContact,a.ShipTo,a.ShipToAddr,a.ShipToTel,a.ShipToCell,a.ShipToFax,a.ShipToContact,a.Dock,a.IsAutoReceive,a.IsShipScanHu,a.IsPrintAsn,a.IsAsnPrinted,a.IsPrintRec,a.IsRecExceed,a.IsRecFulfillUC,a.IsRecFifo,a.IsAsnUniqueRec,a.IsCheckPartyFromAuth,a.IsCheckPartyToAuth,a.RecGapTo,a.AsnTemplate,a.RecTemplate,a.HuTemplate,a.EffDate,a.CreateUser,a.CreateUserNm,a.CreateDate,a.LastModifyUser,a.LastModifyUserNm,a.LastModifyDate,a.CloseDate,a.CloseUser,a.CloseUserNm,a.CloseReason,a.Version,a.WMSNo,a.CreateHuOpt,a.IsRecScanHu,a.Flow,a.ShipNo,a.Vehicle FROM ORD_IpMstr_8 AS a
GO
