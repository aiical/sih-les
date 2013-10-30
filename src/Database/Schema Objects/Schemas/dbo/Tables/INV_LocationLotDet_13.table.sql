﻿CREATE TABLE [dbo].[INV_LocationLotDet_13] (
    [Id]               INT             NOT NULL,
    [Location]         VARCHAR (50)    NOT NULL,
    [Bin]              VARCHAR (50)    NULL,
    [Item]             VARCHAR (50)    NOT NULL,
    [HuId]             VARCHAR (50)    NULL,
    [LotNo]            VARCHAR (50)    NULL,
    [Qty]              DECIMAL (18, 8) NOT NULL,
    [IsCS]             BIT             NOT NULL,
    [PlanBill]         INT             NULL,
    [QualityType]      TINYINT         NOT NULL,
    [IsFreeze]         BIT             NOT NULL,
    [IsATP]            BIT             NOT NULL,
    [OccupyType]       TINYINT         NOT NULL,
    [OccupyRefNo]      VARCHAR (50)    NULL,
    [CreateUser]       INT             NOT NULL,
    [CreateUserNm]     VARCHAR (100)   NOT NULL,
    [CreateDate]       DATETIME        NOT NULL,
    [LastModifyUser]   INT             NOT NULL,
    [LastModifyUserNm] VARCHAR (100)   NOT NULL,
    [LastModifyDate]   DATETIME        NOT NULL,
    [Version]          INT             NOT NULL,
    [CSSupplier]       VARCHAR (50)    NULL
);

