﻿ALTER TABLE [dbo].[ACC_UserPermission]
    ADD CONSTRAINT [FK_ACC_USER_REFERENCE_ACC_PERM] FOREIGN KEY ([PermissionId]) REFERENCES [dbo].[ACC_Permission] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

