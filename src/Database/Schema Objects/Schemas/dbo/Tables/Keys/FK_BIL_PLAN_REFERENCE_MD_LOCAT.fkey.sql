﻿ALTER TABLE [dbo].[BIL_PlanBill]
    ADD CONSTRAINT [FK_BIL_PLAN_REFERENCE_MD_LOCAT] FOREIGN KEY ([LocFrom]) REFERENCES [dbo].[MD_Location] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

