﻿ALTER TABLE [dbo].[ACC_UserRole]
    ADD CONSTRAINT [FK_ACC_USER_REFERENCE_ACC_ROLE] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[ACC_Role] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

