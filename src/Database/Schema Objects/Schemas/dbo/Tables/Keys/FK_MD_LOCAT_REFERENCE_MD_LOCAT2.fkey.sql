﻿ALTER TABLE [dbo].[MD_LocationArea]
    ADD CONSTRAINT [FK_MD_LOCAT_REFERENCE_MD_LOCAT2] FOREIGN KEY ([Location]) REFERENCES [dbo].[MD_Location] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

