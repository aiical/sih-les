﻿ALTER TABLE [dbo].[ORD_OrderMstr_4]
    ADD CONSTRAINT [FK_ORD_OrderMstr4_PartyFrom_REFERENCE_MD_Party_Code] FOREIGN KEY ([PartyFrom]) REFERENCES [dbo].[MD_Party] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

