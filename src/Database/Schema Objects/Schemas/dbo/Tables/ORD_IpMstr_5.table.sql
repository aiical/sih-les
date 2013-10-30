﻿CREATE TABLE [dbo].[ORD_IpMstr_5] (
    [IpNo]                 VARCHAR (50)  NOT NULL,
    [ExtIpNo]              VARCHAR (50)  NULL,
    [GapIpNo]              VARCHAR (50)  NULL,
    [SeqNo]                VARCHAR (50)  NULL,
    [Type]                 TINYINT       NOT NULL,
    [OrderType]            TINYINT       NOT NULL,
    [OrderSubType]         TINYINT       NOT NULL,
    [QualityType]          TINYINT       NOT NULL,
    [Status]               TINYINT       NOT NULL,
    [DepartTime]           DATETIME      NOT NULL,
    [ArriveTime]           DATETIME      NOT NULL,
    [PartyFrom]            VARCHAR (50)  NOT NULL,
    [PartyFromNm]          VARCHAR (100) NULL,
    [PartyTo]              VARCHAR (50)  NOT NULL,
    [PartyToNm]            VARCHAR (100) NULL,
    [ShipFrom]             VARCHAR (50)  NULL,
    [ShipFromAddr]         VARCHAR (256) NULL,
    [ShipFromTel]          VARCHAR (50)  NULL,
    [ShipFromCell]         VARCHAR (50)  NULL,
    [ShipFromFax]          VARCHAR (50)  NULL,
    [ShipFromContact]      VARCHAR (50)  NULL,
    [ShipTo]               VARCHAR (50)  NULL,
    [ShipToAddr]           VARCHAR (256) NULL,
    [ShipToTel]            VARCHAR (50)  NULL,
    [ShipToCell]           VARCHAR (50)  NULL,
    [ShipToFax]            VARCHAR (50)  NULL,
    [ShipToContact]        VARCHAR (50)  NULL,
    [Dock]                 VARCHAR (100) NULL,
    [IsAutoReceive]        BIT           NOT NULL,
    [IsShipScanHu]         BIT           NOT NULL,
    [IsPrintAsn]           BIT           NOT NULL,
    [IsAsnPrinted]         BIT           NOT NULL,
    [IsPrintRec]           BIT           NOT NULL,
    [IsRecExceed]          BIT           NOT NULL,
    [IsRecFulfillUC]       BIT           NOT NULL,
    [IsRecFifo]            BIT           NOT NULL,
    [IsAsnUniqueRec]       BIT           NOT NULL,
    [IsCheckPartyFromAuth] BIT           NOT NULL,
    [IsCheckPartyToAuth]   BIT           NOT NULL,
    [RecGapTo]             TINYINT       NOT NULL,
    [AsnTemplate]          VARCHAR (100) NULL,
    [RecTemplate]          VARCHAR (100) NULL,
    [HuTemplate]           VARCHAR (100) NULL,
    [EffDate]              DATETIME      NOT NULL,
    [CreateUser]           INT           NOT NULL,
    [CreateUserNm]         VARCHAR (100) NOT NULL,
    [CreateDate]           DATETIME      NOT NULL,
    [LastModifyUser]       INT           NOT NULL,
    [LastModifyUserNm]     VARCHAR (100) NOT NULL,
    [LastModifyDate]       DATETIME      NOT NULL,
    [CloseDate]            DATETIME      NULL,
    [CloseUser]            INT           NULL,
    [CloseUserNm]          VARCHAR (100) NULL,
    [CloseReason]          VARCHAR (256) NULL,
    [Version]              INT           NOT NULL,
    [WMSNo]                VARCHAR (50)  NULL,
    [CreateHuOpt]          TINYINT       NOT NULL,
    [IsRecScanHu]          BIT           NOT NULL,
    [Flow]                 VARCHAR (50)  NULL,
    [ShipNo]               VARCHAR (50)  NULL,
    [Vehicle]              VARCHAR (50)  NULL
);

