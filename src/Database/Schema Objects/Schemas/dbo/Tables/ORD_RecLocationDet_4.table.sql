﻿CREATE TABLE [dbo].[ORD_RecLocationDet_4] (
    [Id]               INT             NOT NULL,
    [RecNo]            VARCHAR (50)    NOT NULL,
    [RecDetId]         INT             NOT NULL,
    [OrderType]        TINYINT         NOT NULL,
    [OrderDetId]       INT             NULL,
    [Item]             VARCHAR (50)    NOT NULL,
    [HuId]             VARCHAR (50)    NULL,
    [LotNo]            VARCHAR (50)    NULL,
    [IsCreatePlanBill] BIT             NOT NULL,
    [IsCS]             BIT             NOT NULL,
    [PlanBill]         INT             NULL,
    [ActBill]          INT             NULL,
    [QualityType]      TINYINT         NOT NULL,
    [IsFreeze]         BIT             NOT NULL,
    [IsATP]            BIT             NOT NULL,
    [OccupyType]       TINYINT         NOT NULL,
    [OccupyRefNo]      VARCHAR (50)    NULL,
    [Qty]              DECIMAL (18, 8) NOT NULL,
    [CreateUser]       INT             NOT NULL,
    [CreateUserNm]     VARCHAR (100)   NOT NULL,
    [CreateDate]       DATETIME        NOT NULL,
    [LastModifyUser]   INT             NOT NULL,
    [LastModifyUserNm] VARCHAR (100)   NOT NULL,
    [LastModifyDate]   DATETIME        NOT NULL,
    [WMSSeq]           VARCHAR (50)    NULL
);

