﻿ALTER TABLE [dbo].[ORD_RecLocationDet_2]
    ADD CONSTRAINT [FK_ORD_RecLocationDet2_HuId_REFERENCE_INV_Hu_HuId] FOREIGN KEY ([HuId]) REFERENCES [dbo].[INV_Hu] ([HuId]) ON DELETE NO ACTION ON UPDATE NO ACTION;

