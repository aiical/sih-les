﻿ALTER TABLE [dbo].[INP_InspectDet]
    ADD CONSTRAINT [FK_INP_INSP_REFERENCE_INP_INSP2] FOREIGN KEY ([InpNo]) REFERENCES [dbo].[INP_InspectMstr] ([InpNo]) ON DELETE NO ACTION ON UPDATE NO ACTION;

