﻿ALTER TABLE [dbo].[MD_ItemCategory]
    ADD CONSTRAINT [FK_MD_ITEMC_REFERENCE_MD_ITEMC] FOREIGN KEY ([ParentCategory]) REFERENCES [dbo].[MD_ItemCategory] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

