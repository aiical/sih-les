﻿ALTER TABLE [dbo].[ORD_OrderMstr]
    ADD CONSTRAINT [FK_ORD_ORDE_REFERENCE_BIL_PRIC2] FOREIGN KEY ([PriceList]) REFERENCES [dbo].[BIL_PriceListMstr] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

