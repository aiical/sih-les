﻿ALTER TABLE [dbo].[INV_KanBanCard]
    ADD CONSTRAINT [FK_INV_KANB_REFERENCE_MD_UOM] FOREIGN KEY ([Uom]) REFERENCES [dbo].[MD_Uom] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

