﻿ALTER TABLE [dbo].[INP_RejectDet]
    ADD CONSTRAINT [FK_INP_REJE_REFERENCE_INP_INSP] FOREIGN KEY ([InpNo]) REFERENCES [dbo].[INP_InspectMstr] ([InpNo]) ON DELETE NO ACTION ON UPDATE NO ACTION;

