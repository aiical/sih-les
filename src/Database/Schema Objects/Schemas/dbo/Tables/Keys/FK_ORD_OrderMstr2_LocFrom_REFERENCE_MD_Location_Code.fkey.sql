﻿ALTER TABLE [dbo].[ORD_OrderMstr_2]
    ADD CONSTRAINT [FK_ORD_OrderMstr2_LocFrom_REFERENCE_MD_Location_Code] FOREIGN KEY ([LocFrom]) REFERENCES [dbo].[MD_Location] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

