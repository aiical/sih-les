﻿ALTER TABLE [dbo].[ORD_MiscOrderDet]
    ADD CONSTRAINT [FK_ORD_MISC_REFERENCE_MD_ITEM2] FOREIGN KEY ([Item]) REFERENCES [dbo].[MD_Item] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

