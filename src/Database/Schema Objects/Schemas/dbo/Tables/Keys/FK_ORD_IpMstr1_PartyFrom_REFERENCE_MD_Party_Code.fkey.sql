﻿ALTER TABLE [dbo].[ORD_IpMstr_1]
    ADD CONSTRAINT [FK_ORD_IpMstr1_PartyFrom_REFERENCE_MD_Party_Code] FOREIGN KEY ([PartyFrom]) REFERENCES [dbo].[MD_Party] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

