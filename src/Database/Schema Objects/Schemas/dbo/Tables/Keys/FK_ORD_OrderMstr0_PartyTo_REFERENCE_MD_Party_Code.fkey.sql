﻿ALTER TABLE [dbo].[ORD_OrderMstr_0]
    ADD CONSTRAINT [FK_ORD_OrderMstr0_PartyTo_REFERENCE_MD_Party_Code] FOREIGN KEY ([PartyTo]) REFERENCES [dbo].[MD_Party] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

