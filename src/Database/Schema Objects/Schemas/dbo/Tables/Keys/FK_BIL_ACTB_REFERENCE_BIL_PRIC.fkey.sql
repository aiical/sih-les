﻿ALTER TABLE [dbo].[BIL_ActBill]
    ADD CONSTRAINT [FK_BIL_ACTB_REFERENCE_BIL_PRIC] FOREIGN KEY ([PriceList]) REFERENCES [dbo].[BIL_PriceListMstr] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

