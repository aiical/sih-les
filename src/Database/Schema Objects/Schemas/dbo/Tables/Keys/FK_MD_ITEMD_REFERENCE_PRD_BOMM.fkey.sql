﻿ALTER TABLE [dbo].[MD_ItemDiscon]
    ADD CONSTRAINT [FK_MD_ITEMD_REFERENCE_PRD_BOMM] FOREIGN KEY ([Bom]) REFERENCES [dbo].[PRD_BomMstr] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

