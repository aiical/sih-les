﻿CREATE TABLE [dbo].[FIS_CreateOrderDAT] (
    [ID]             INT           IDENTITY (1, 1) NOT NULL,
    [OrderNo]        VARCHAR (50)  NULL,
    [MATNR]          VARCHAR (50)  NOT NULL,
    [LIFNR]          VARCHAR (50)  NULL,
    [ENMNG]          VARCHAR (50)  NOT NULL,
    [CHARG]          VARCHAR (50)  NULL,
    [COLOR]          VARCHAR (50)  NULL,
    [TIME_STAMP]     VARCHAR (50)  NULL,
    [CY_SEQNR]       VARCHAR (50)  NULL,
    [TIME_STAMP1]    VARCHAR (50)  NULL,
    [AUFNR]          VARCHAR (50)  NULL,
    [LGORT]          VARCHAR (50)  NULL,
    [UMLGO]          VARCHAR (50)  NULL,
    [LGPBE]          VARCHAR (50)  NULL,
    [REQ_TIME_STAMP] VARCHAR (50)  NULL,
    [FLG_SORT]       VARCHAR (50)  NULL,
    [PLNBEZ]         VARCHAR (50)  NULL,
    [KTEXT]          VARCHAR (50)  NULL,
    [ZPLISTNO]       VARCHAR (50)  NULL,
    [ErrorCount]     INT           NULL,
    [IsCreateDat]    BIT           NOT NULL,
    [CreateUserNm]   VARCHAR (100) NULL,
    [FileName]       VARCHAR (50)  NULL
);

