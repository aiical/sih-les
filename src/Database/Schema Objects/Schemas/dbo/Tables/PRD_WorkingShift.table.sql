﻿CREATE TABLE [dbo].[PRD_WorkingShift] (
    [Id]               INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [Shift]            VARCHAR (50)  NOT NULL,
    [WorkingCalendar]  INT           NOT NULL,
    [CreateUser]       INT           NOT NULL,
    [CreateUserNm]     VARCHAR (100) NOT NULL,
    [CreateDate]       DATETIME      NOT NULL,
    [LastModifyUser]   INT           NOT NULL,
    [LastModifyUserNm] VARCHAR (100) NOT NULL,
    [LastModifyDate]   DATETIME      NOT NULL
);

