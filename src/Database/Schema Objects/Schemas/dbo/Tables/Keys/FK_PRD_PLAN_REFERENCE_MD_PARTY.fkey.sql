﻿ALTER TABLE [dbo].[PRD_PlanBackflush]
    ADD CONSTRAINT [FK_PRD_PLAN_REFERENCE_MD_PARTY] FOREIGN KEY ([ManufactureParty]) REFERENCES [dbo].[MD_Party] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

