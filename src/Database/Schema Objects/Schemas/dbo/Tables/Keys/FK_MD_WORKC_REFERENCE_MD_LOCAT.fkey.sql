﻿ALTER TABLE [dbo].[MD_WorkCenter]
    ADD CONSTRAINT [FK_MD_WORKC_REFERENCE_MD_LOCAT] FOREIGN KEY ([Location]) REFERENCES [dbo].[MD_Location] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

