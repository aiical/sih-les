﻿ALTER TABLE [dbo].[INV_LocationLotDet_11]
    ADD CONSTRAINT [FK_INV_LocationLotDet11_Item_REFERENCE_MD_Item_Code] FOREIGN KEY ([Item]) REFERENCES [dbo].[MD_Item] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

