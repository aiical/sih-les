﻿ALTER TABLE [dbo].[CUST_DeferredFeedCounter]
    ADD CONSTRAINT [FK_CUST_DEF_REFERENCE_SCM_FLOW] FOREIGN KEY ([Flow]) REFERENCES [dbo].[SCM_FlowMstr] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

