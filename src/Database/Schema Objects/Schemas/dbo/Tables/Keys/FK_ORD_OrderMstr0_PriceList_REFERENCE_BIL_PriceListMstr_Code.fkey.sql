﻿ALTER TABLE [dbo].[ORD_OrderMstr_0]
    ADD CONSTRAINT [FK_ORD_OrderMstr0_PriceList_REFERENCE_BIL_PriceListMstr_Code] FOREIGN KEY ([PriceList]) REFERENCES [dbo].[BIL_PriceListMstr] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

