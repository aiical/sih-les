﻿ALTER TABLE [dbo].[PRD_PlanBackflush]
    ADD CONSTRAINT [FK_PRD_PLAN_REFERENCE_MD_UOM] FOREIGN KEY ([BaseUom]) REFERENCES [dbo].[MD_Uom] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

