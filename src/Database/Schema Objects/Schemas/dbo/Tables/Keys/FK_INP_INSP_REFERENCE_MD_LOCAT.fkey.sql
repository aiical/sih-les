﻿ALTER TABLE [dbo].[INP_InspectDet]
    ADD CONSTRAINT [FK_INP_INSP_REFERENCE_MD_LOCAT] FOREIGN KEY ([LocFrom]) REFERENCES [dbo].[MD_Location] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

