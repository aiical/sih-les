﻿ALTER TABLE [dbo].[ORD_OrderMstr]
    ADD CONSTRAINT [FK_ORD_ORDE_REFERENCE_SCM_FLOW2] FOREIGN KEY ([Flow]) REFERENCES [dbo].[SCM_FlowMstr] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

