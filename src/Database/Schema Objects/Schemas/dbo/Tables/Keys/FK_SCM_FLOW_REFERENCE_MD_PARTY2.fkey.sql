﻿ALTER TABLE [dbo].[SCM_FlowMstr]
    ADD CONSTRAINT [FK_SCM_FLOW_REFERENCE_MD_PARTY2] FOREIGN KEY ([PartyFrom]) REFERENCES [dbo].[MD_Party] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

