﻿ALTER TABLE [dbo].[ORD_IpLocationDet]
    ADD CONSTRAINT [FK_ORD_IPLO_0_REFERENCE_BIL_ACTB] FOREIGN KEY ([ActBill]) REFERENCES [dbo].[BIL_ActBill] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

