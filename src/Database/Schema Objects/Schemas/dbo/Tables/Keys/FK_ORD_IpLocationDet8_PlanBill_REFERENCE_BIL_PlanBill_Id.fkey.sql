﻿ALTER TABLE [dbo].[ORD_IpLocationDet_8]
    ADD CONSTRAINT [FK_ORD_IpLocationDet8_PlanBill_REFERENCE_BIL_PlanBill_Id] FOREIGN KEY ([PlanBill]) REFERENCES [dbo].[BIL_PlanBill] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

