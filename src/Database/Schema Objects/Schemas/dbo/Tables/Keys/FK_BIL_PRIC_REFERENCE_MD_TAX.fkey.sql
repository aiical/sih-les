﻿ALTER TABLE [dbo].[BIL_PriceListMstr]
    ADD CONSTRAINT [FK_BIL_PRIC_REFERENCE_MD_TAX] FOREIGN KEY ([Tax]) REFERENCES [dbo].[MD_Tax] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

