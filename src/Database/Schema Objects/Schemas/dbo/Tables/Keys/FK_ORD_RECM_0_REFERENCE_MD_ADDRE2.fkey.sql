﻿ALTER TABLE [dbo].[ORD_RecMstr]
    ADD CONSTRAINT [FK_ORD_RECM_0_REFERENCE_MD_ADDRE2] FOREIGN KEY ([ShipFrom]) REFERENCES [dbo].[MD_Address] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

