﻿ALTER TABLE [dbo].[ORD_RecLocationDet]
    ADD CONSTRAINT [FK_ORD_RECL_0_REFERENCE_INV_HU] FOREIGN KEY ([HuId]) REFERENCES [dbo].[INV_Hu] ([HuId]) ON DELETE NO ACTION ON UPDATE NO ACTION;

