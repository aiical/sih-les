﻿ALTER TABLE [dbo].[INV_LocationLotDet_4]
    ADD CONSTRAINT [FK_INV_LocationLotDet_4_REFERENCE_MD_SUPPLIER] FOREIGN KEY ([CSSupplier]) REFERENCES [dbo].[MD_Supplier] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

