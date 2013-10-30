﻿CREATE TABLE [dbo].[INV_LocTransDet_2] (
    [Id]              BIGINT          NOT NULL,
    [LocTransId]      BIGINT          NOT NULL,
    [OrderNo]         VARCHAR (50)    NULL,
    [OrderType]       TINYINT         NULL,
    [OrderSubType]    TINYINT         NULL,
    [OrderDetSeq]     INT             NULL,
    [OrderDetId]      INT             NULL,
    [OrderBomDetId]   INT             NULL,
    [OrderBomDetSeq]  INT             NULL,
    [IpNo]            VARCHAR (50)    NULL,
    [IpDetId]         INT             NULL,
    [IpDetSeq]        INT             NULL,
    [RecNo]           VARCHAR (50)    NULL,
    [RecDetId]        INT             NULL,
    [RecDetSeq]       INT             NULL,
    [SeqNo]           VARCHAR (50)    NULL,
    [BillTransId]     INT             NULL,
    [LocLotDetId]     INT             NULL,
    [TraceCode]       VARCHAR (50)    NULL,
    [Item]            VARCHAR (50)    NOT NULL,
    [Qty]             DECIMAL (18, 8) NOT NULL,
    [IsCS]            BIT             NOT NULL,
    [PlanBill]        INT             NULL,
    [PlanBillQty]     DECIMAL (18, 8) NOT NULL,
    [ActBill]         INT             NULL,
    [ActBillQty]      DECIMAL (18, 8) NOT NULL,
    [QualityType]     TINYINT         NOT NULL,
    [HuId]            VARCHAR (50)    NULL,
    [LotNo]           VARCHAR (50)    NULL,
    [TransType]       INT             NOT NULL,
    [IOType]          TINYINT         NOT NULL,
    [PartyFrom]       VARCHAR (50)    NULL,
    [PartyTo]         VARCHAR (50)    NULL,
    [LocFrom]         VARCHAR (50)    NULL,
    [LocTo]           VARCHAR (50)    NULL,
    [Bin]             VARCHAR (50)    NULL,
    [PlanBackflushId] INT             NULL,
    [LocIOReason]     VARCHAR (50)    NULL,
    [EffDate]         DATETIME        NOT NULL,
    [CreateUser]      INT             NOT NULL,
    [CreateDate]      DATETIME        NOT NULL
);

