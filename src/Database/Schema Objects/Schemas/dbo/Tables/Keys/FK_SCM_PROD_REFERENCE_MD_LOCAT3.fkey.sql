﻿ALTER TABLE [dbo].[SCM_ProdLineFact]
    ADD CONSTRAINT [FK_SCM_PROD_REFERENCE_MD_LOCAT3] FOREIGN KEY ([LocTo]) REFERENCES [dbo].[MD_Location] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

