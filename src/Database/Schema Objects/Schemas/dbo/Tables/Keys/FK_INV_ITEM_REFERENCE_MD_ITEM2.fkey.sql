﻿ALTER TABLE [dbo].[INV_ItemExchange]
    ADD CONSTRAINT [FK_INV_ITEM_REFERENCE_MD_ITEM2] FOREIGN KEY ([ItemFrom]) REFERENCES [dbo].[MD_Item] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

