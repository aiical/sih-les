﻿ALTER TABLE [dbo].[ORD_OrderDet]
    ADD CONSTRAINT [FK_ORD_ORDE_0_REFERENCE_MD_UOM3] FOREIGN KEY ([BaseUom]) REFERENCES [dbo].[MD_Uom] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

