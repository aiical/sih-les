﻿ALTER TABLE [dbo].[INV_LocationLotDet]
    ADD CONSTRAINT [FK_INV_LOCA_0_REFERENCE_MD_ITEM] FOREIGN KEY ([Item]) REFERENCES [dbo].[MD_Item] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

