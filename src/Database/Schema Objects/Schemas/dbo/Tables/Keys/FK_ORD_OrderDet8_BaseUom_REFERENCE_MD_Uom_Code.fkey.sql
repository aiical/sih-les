﻿ALTER TABLE [dbo].[ORD_OrderDet_8]
    ADD CONSTRAINT [FK_ORD_OrderDet8_BaseUom_REFERENCE_MD_Uom_Code] FOREIGN KEY ([BaseUom]) REFERENCES [dbo].[MD_Uom] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

