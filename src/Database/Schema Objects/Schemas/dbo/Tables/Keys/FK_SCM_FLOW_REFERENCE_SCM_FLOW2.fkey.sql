﻿ALTER TABLE [dbo].[SCM_FlowBinding]
    ADD CONSTRAINT [FK_SCM_FLOW_REFERENCE_SCM_FLOW2] FOREIGN KEY ([BindFlow]) REFERENCES [dbo].[SCM_FlowMstr] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

