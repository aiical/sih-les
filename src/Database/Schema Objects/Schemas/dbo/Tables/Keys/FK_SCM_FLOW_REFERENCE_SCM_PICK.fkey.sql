﻿ALTER TABLE [dbo].[SCM_FlowDet]
    ADD CONSTRAINT [FK_SCM_FLOW_REFERENCE_SCM_PICK] FOREIGN KEY ([PickStrategy]) REFERENCES [dbo].[SCM_PickStrategy] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

