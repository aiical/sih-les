﻿ALTER TABLE [dbo].[INP_InspectDet]
    ADD CONSTRAINT [FK_INP_INSP_REFERENCE_MD_UOM2] FOREIGN KEY ([Uom]) REFERENCES [dbo].[MD_Uom] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

