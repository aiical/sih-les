﻿ALTER TABLE [dbo].[PRD_MultiSupplyGroup]
    ADD CONSTRAINT [FK_PRD_MULT_REFERENCE_MD_SUPPL] FOREIGN KEY ([EffSupplier]) REFERENCES [dbo].[MD_Supplier] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

