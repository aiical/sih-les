﻿ALTER TABLE [dbo].[ORD_RecDet_0]
    ADD CONSTRAINT [FK_ORD_RecDet0_Item_REFERENCE_MD_Item_Code] FOREIGN KEY ([Item]) REFERENCES [dbo].[MD_Item] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

