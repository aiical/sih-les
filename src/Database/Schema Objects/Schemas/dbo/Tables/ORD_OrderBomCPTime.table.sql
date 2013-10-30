﻿CREATE TABLE [dbo].[ORD_OrderBomCPTime] (
    [Id]               BIGINT          IDENTITY (1, 1) NOT NULL,
    [OrderNo]          VARCHAR (50)    NULL,
    [VanProdLine]      VARCHAR (50)    NULL,
    [AssProdLine]      VARCHAR (50)    NULL,
    [Seq]              BIGINT          NULL,
    [SubSeq]           INT             NULL,
    [Op]               INT             NULL,
    [OpTaktTime]       INT             NULL,
    [CPTime]           DATETIME        NULL,
    [Item]             VARCHAR (50)    NULL,
    [OpRef]            VARCHAR (50)    NULL,
    [OrderQty]         DECIMAL (18, 8) NULL,
    [Location]         VARCHAR (50)    NULL,
    [IsCreateOrder]    BIT             NULL,
    [BomId]            INT             NULL,
    [DISPO]            VARCHAR (50)    NULL,
    [CreateDate]       DATETIME        NOT NULL,
    [ManufactureParty] VARCHAR (50)    NULL,
    [Uom]              VARCHAR (5)     NULL,
    [VanOp]            INT             NULL,
    [AssOp]            INT             NULL,
    [WorkCenter]       VARCHAR (50)    NULL
);

