﻿ALTER TABLE [dbo].[INP_InspectResult]
    ADD CONSTRAINT [FK_INP_INSP_REFERENCE_MD_UOM3] FOREIGN KEY ([BaseUom]) REFERENCES [dbo].[MD_Uom] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

