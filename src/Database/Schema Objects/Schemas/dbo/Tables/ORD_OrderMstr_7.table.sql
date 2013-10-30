﻿CREATE TABLE [dbo].[ORD_OrderMstr_7] (
    [OrderNo]             VARCHAR (50)  NOT NULL,
    [Flow]                VARCHAR (50)  NULL,
    [ProdLineFact]        VARCHAR (50)  NULL,
    [TraceCode]           VARCHAR (50)  NULL,
    [OrderStrategy]       TINYINT       NOT NULL,
    [RefOrderNo]          VARCHAR (50)  NULL,
    [ExtOrderNo]          VARCHAR (50)  NULL,
    [Type]                TINYINT       NOT NULL,
    [SubType]             TINYINT       NOT NULL,
    [QualityType]         TINYINT       NOT NULL,
    [StartTime]           DATETIME      NOT NULL,
    [WindowTime]          DATETIME      NOT NULL,
    [PauseSeq]            INT           NOT NULL,
    [PauseTime]           DATETIME      NULL,
    [EffDate]             DATETIME      NULL,
    [IsQuick]             BIT           NOT NULL,
    [Priority]            TINYINT       NOT NULL,
    [Status]              TINYINT       NOT NULL,
    [PartyFrom]           VARCHAR (50)  NOT NULL,
    [PartyFromNm]         VARCHAR (100) NULL,
    [PartyTo]             VARCHAR (50)  NOT NULL,
    [PartyToNm]           VARCHAR (100) NULL,
    [ShipFrom]            VARCHAR (50)  NULL,
    [ShipFromAddr]        VARCHAR (256) NULL,
    [ShipFromTel]         VARCHAR (50)  NULL,
    [ShipFromCell]        VARCHAR (50)  NULL,
    [ShipFromFax]         VARCHAR (50)  NULL,
    [ShipFromContact]     VARCHAR (50)  NULL,
    [ShipTo]              VARCHAR (50)  NULL,
    [ShipToAddr]          VARCHAR (256) NULL,
    [ShipToTel]           VARCHAR (50)  NULL,
    [ShipToCell]          VARCHAR (50)  NULL,
    [ShipToFax]           VARCHAR (50)  NULL,
    [ShipToContact]       VARCHAR (50)  NULL,
    [Shift]               VARCHAR (50)  NULL,
    [LocFrom]             VARCHAR (50)  NULL,
    [LocFromNm]           VARCHAR (100) NULL,
    [LocTo]               VARCHAR (50)  NULL,
    [LocToNm]             VARCHAR (100) NULL,
    [IsInspect]           BIT           NOT NULL,
    [BillAddr]            VARCHAR (50)  NULL,
    [BillAddrDesc]        VARCHAR (256) NULL,
    [PriceList]           VARCHAR (50)  NULL,
    [Currency]            VARCHAR (50)  NULL,
    [Dock]                VARCHAR (100) NULL,
    [Routing]             VARCHAR (50)  NULL,
    [CurtOp]              INT           NULL,
    [IsAutoRelease]       BIT           NOT NULL,
    [IsAutoStart]         BIT           NOT NULL,
    [IsAutoShip]          BIT           NOT NULL,
    [IsAutoReceive]       BIT           NOT NULL,
    [IsAutoBill]          BIT           NOT NULL,
    [IsManualCreateDet]   BIT           NOT NULL,
    [IsListPrice]         BIT           NOT NULL,
    [IsPrintOrder]        BIT           NOT NULL,
    [IsOrderPrinted]      BIT           NOT NULL,
    [IsPrintAsn]          BIT           NOT NULL,
    [IsPrintRec]          BIT           NOT NULL,
    [IsShipExceed]        BIT           NOT NULL,
    [IsRecExceed]         BIT           NOT NULL,
    [IsOrderFulfillUC]    BIT           NOT NULL,
    [IsShipFulfillUC]     BIT           NOT NULL,
    [IsRecFulfillUC]      BIT           NOT NULL,
    [IsShipScanHu]        BIT           NOT NULL,
    [IsRecScanHu]         BIT           NOT NULL,
    [IsCreatePL]          BIT           NOT NULL,
    [IsPLCreate]          BIT           NOT NULL,
    [IsShipFifo]          BIT           NOT NULL,
    [IsRecFifo]           BIT           NOT NULL,
    [IsShipByOrder]       BIT           NOT NULL,
    [IsOpenOrder]         BIT           NOT NULL,
    [IsAsnUniqueRec]      BIT           NOT NULL,
    [RecGapTo]            TINYINT       NOT NULL,
    [RecTemplate]         VARCHAR (100) NULL,
    [OrderTemplate]       VARCHAR (100) NULL,
    [AsnTemplate]         VARCHAR (100) NULL,
    [HuTemplate]          VARCHAR (100) NULL,
    [BillTerm]            TINYINT       NOT NULL,
    [CreateHuOpt]         TINYINT       NOT NULL,
    [ReCalculatePriceOpt] TINYINT       NOT NULL,
    [PickStrategy]        VARCHAR (50)  NULL,
    [ExtraDmdSource]      VARCHAR (256) NULL,
    [CreateUser]          INT           NOT NULL,
    [CreateUserNm]        VARCHAR (100) NOT NULL,
    [CreateDate]          DATETIME      NOT NULL,
    [LastModifyUser]      INT           NOT NULL,
    [LastModifyUserNm]    VARCHAR (100) NOT NULL,
    [LastModifyDate]      DATETIME      NOT NULL,
    [ReleaseDate]         DATETIME      NULL,
    [ReleaseUser]         INT           NULL,
    [ReleaseUserNm]       VARCHAR (100) NULL,
    [StartDate]           DATETIME      NULL,
    [StartUser]           INT           NULL,
    [StartUserNm]         VARCHAR (100) NULL,
    [CompleteDate]        DATETIME      NULL,
    [CompleteUser]        INT           NULL,
    [CompleteUserNm]      VARCHAR (100) NULL,
    [CloseDate]           DATETIME      NULL,
    [CloseUser]           INT           NULL,
    [CloseUserNm]         VARCHAR (100) NULL,
    [CancelDate]          DATETIME      NULL,
    [CancelUser]          INT           NULL,
    [CancelUserNm]        VARCHAR (100) NULL,
    [CancelReason]        VARCHAR (256) NULL,
    [Version]             INT           NOT NULL,
    [FlowDesc]            VARCHAR (100) NULL,
    [WMSNo]               VARCHAR (50)  NULL,
    [ProdLineType]        TINYINT       NOT NULL,
    [PauseStatus]         TINYINT       NOT NULL,
    [SeqGroup]            VARCHAR (50)  NULL
);

