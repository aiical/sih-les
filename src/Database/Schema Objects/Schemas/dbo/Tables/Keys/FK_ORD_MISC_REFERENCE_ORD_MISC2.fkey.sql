﻿ALTER TABLE [dbo].[ORD_MiscOrderDet]
    ADD CONSTRAINT [FK_ORD_MISC_REFERENCE_ORD_MISC2] FOREIGN KEY ([MiscOrderNo]) REFERENCES [dbo].[ORD_MiscOrderMstr] ([MiscOrderNo]) ON DELETE NO ACTION ON UPDATE NO ACTION;

