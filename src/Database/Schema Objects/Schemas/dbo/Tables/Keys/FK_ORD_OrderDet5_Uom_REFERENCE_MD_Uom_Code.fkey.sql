﻿ALTER TABLE [dbo].[ORD_OrderDet_5]
    ADD CONSTRAINT [FK_ORD_OrderDet5_Uom_REFERENCE_MD_Uom_Code] FOREIGN KEY ([Uom]) REFERENCES [dbo].[MD_Uom] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

