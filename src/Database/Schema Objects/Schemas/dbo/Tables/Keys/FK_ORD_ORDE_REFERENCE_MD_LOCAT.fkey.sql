﻿ALTER TABLE [dbo].[ORD_OrderOp]
    ADD CONSTRAINT [FK_ORD_ORDE_REFERENCE_MD_LOCAT] FOREIGN KEY ([Location]) REFERENCES [dbo].[MD_Location] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

