﻿ALTER TABLE [dbo].[INV_LocationLotDet_5]
    ADD CONSTRAINT [FK_INV_LocationLotDet5_HuId_REFERENCE_INV_Hu_HuId] FOREIGN KEY ([HuId]) REFERENCES [dbo].[INV_Hu] ([HuId]) ON DELETE NO ACTION ON UPDATE NO ACTION;

