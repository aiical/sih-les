﻿ALTER TABLE [dbo].[ORD_RecDet]
    ADD CONSTRAINT [FK_ORD_RECD_0_REFERENCE_MD_PARTY] FOREIGN KEY ([ManufactureParty]) REFERENCES [dbo].[MD_Party] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

