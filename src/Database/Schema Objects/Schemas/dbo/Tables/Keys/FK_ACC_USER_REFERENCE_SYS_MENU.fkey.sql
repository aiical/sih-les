﻿ALTER TABLE [dbo].[ACC_UserFav]
    ADD CONSTRAINT [FK_ACC_USER_REFERENCE_SYS_MENU] FOREIGN KEY ([Menu]) REFERENCES [dbo].[SYS_Menu] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

