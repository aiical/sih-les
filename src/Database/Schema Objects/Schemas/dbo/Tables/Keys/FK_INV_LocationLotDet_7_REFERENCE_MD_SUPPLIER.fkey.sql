﻿ALTER TABLE [dbo].[INV_LocationLotDet_7]
    ADD CONSTRAINT [FK_INV_LocationLotDet_7_REFERENCE_MD_SUPPLIER] FOREIGN KEY ([CSSupplier]) REFERENCES [dbo].[MD_Supplier] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

