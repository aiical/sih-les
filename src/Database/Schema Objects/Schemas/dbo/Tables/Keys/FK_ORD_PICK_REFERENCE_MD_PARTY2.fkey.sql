﻿ALTER TABLE [dbo].[ORD_PickListMstr]
    ADD CONSTRAINT [FK_ORD_PICK_REFERENCE_MD_PARTY2] FOREIGN KEY ([PartyFrom]) REFERENCES [dbo].[MD_Party] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

