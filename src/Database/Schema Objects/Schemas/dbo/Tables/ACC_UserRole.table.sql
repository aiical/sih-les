﻿CREATE TABLE [dbo].[ACC_UserRole] (
    [Id]               INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [UserId]           INT           NOT NULL,
    [RoleId]           INT           NOT NULL,
    [CreateUser]       INT           NOT NULL,
    [CreateUserNm]     VARCHAR (100) NOT NULL,
    [CreateDate]       DATETIME      NOT NULL,
    [LastModifyUser]   INT           NOT NULL,
    [LastModifyUserNm] VARCHAR (100) NOT NULL,
    [LastModifyDate]   DATETIME      NOT NULL
);

