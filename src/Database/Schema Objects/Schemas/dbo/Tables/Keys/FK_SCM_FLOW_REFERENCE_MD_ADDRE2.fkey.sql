﻿ALTER TABLE [dbo].[SCM_FlowMstr]
    ADD CONSTRAINT [FK_SCM_FLOW_REFERENCE_MD_ADDRE2] FOREIGN KEY ([ShipTo]) REFERENCES [dbo].[MD_Address] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

