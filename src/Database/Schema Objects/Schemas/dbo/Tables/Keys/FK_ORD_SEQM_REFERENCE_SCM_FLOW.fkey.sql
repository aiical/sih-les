﻿ALTER TABLE [dbo].[ORD_SeqMstr]
    ADD CONSTRAINT [FK_ORD_SEQM_REFERENCE_SCM_FLOW] FOREIGN KEY ([Flow]) REFERENCES [dbo].[SCM_FlowMstr] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

