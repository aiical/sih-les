﻿ALTER TABLE [dbo].[ORD_RecLocationDet_0]
    ADD CONSTRAINT [FK_ORD_RecLocationDet0_PlanBill_REFERENCE_BIL_PlanBill_Id] FOREIGN KEY ([PlanBill]) REFERENCES [dbo].[BIL_PlanBill] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

