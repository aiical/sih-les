﻿ALTER TABLE [dbo].[BIL_PlanBill]
    ADD CONSTRAINT [FK_BIL_PLAN_REFERENCE_MD_PARTY] FOREIGN KEY ([Party]) REFERENCES [dbo].[MD_Party] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

