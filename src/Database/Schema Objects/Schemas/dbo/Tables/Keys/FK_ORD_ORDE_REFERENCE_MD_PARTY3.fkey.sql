﻿ALTER TABLE [dbo].[ORD_OrderMstr]
    ADD CONSTRAINT [FK_ORD_ORDE_REFERENCE_MD_PARTY3] FOREIGN KEY ([PartyTo]) REFERENCES [dbo].[MD_Party] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

