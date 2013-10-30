﻿CREATE TABLE [dbo].[ORD_RecDet_1] (
    [Id]               INT             NOT NULL,
    [RecNo]            VARCHAR (50)    NOT NULL,
    [Seq]              INT             NOT NULL,
    [OrderNo]          VARCHAR (50)    NULL,
    [OrderType]        TINYINT         NOT NULL,
    [OrderSubType]     TINYINT         NOT NULL,
    [OrderDetId]       INT             NULL,
    [OrderDetSeq]      INT             NULL,
    [IpNo]             VARCHAR (50)    NULL,
    [IpDetId]          INT             NULL,
    [IpDetSeq]         INT             NULL,
    [ExtNo]            VARCHAR (50)    NULL,
    [ExtSeq]           VARCHAR (50)    NULL,
    [Item]             VARCHAR (50)    NOT NULL,
    [ItemDesc]         VARCHAR (100)   NOT NULL,
    [RefItemCode]      VARCHAR (50)    NULL,
    [Uom]              VARCHAR (5)     NOT NULL,
    [BaseUom]          VARCHAR (5)     NOT NULL,
    [UC]               DECIMAL (18, 8) NOT NULL,
    [QualityType]      TINYINT         NOT NULL,
    [ManufactureParty] VARCHAR (50)    NULL,
    [RecQty]           DECIMAL (18, 8) NOT NULL,
    [UnitQty]          DECIMAL (18, 8) NOT NULL,
    [LocFrom]          VARCHAR (50)    NULL,
    [LocFromNm]        VARCHAR (100)   NULL,
    [LocTo]            VARCHAR (50)    NULL,
    [LocToNm]          VARCHAR (100)   NULL,
    [IsInspect]        BIT             NOT NULL,
    [BillAddr]         VARCHAR (50)    NULL,
    [PriceList]        VARCHAR (50)    NULL,
    [UnitPrice]        DECIMAL (18, 8) NULL,
    [Currency]         VARCHAR (50)    NULL,
    [IsProvEst]        BIT             NOT NULL,
    [Tax]              VARCHAR (50)    NULL,
    [IsIncludeTax]     BIT             NOT NULL,
    [BillTerm]         INT             NOT NULL,
    [CreateUser]       INT             NOT NULL,
    [CreateUserNm]     VARCHAR (100)   NOT NULL,
    [CreateDate]       DATETIME        NOT NULL,
    [LastModifyUser]   INT             NOT NULL,
    [LastModifyUserNm] VARCHAR (100)   NOT NULL,
    [LastModifyDate]   DATETIME        NOT NULL,
    [Version]          INT             NOT NULL,
    [IpDetType]        TINYINT         NOT NULL,
    [IpGapAdjOpt]      TINYINT         NOT NULL,
    [ScrapQty]         DECIMAL (18, 8) NOT NULL,
    [Flow]             VARCHAR (50)    NULL
);

