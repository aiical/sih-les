﻿ALTER TABLE [dbo].[ORD_RecMstr_7]
    ADD CONSTRAINT [FK_ORD_RecMstr7_PartyFrom_REFERENCE_MD_Party_Code] FOREIGN KEY ([PartyFrom]) REFERENCES [dbo].[MD_Party] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

