﻿ALTER TABLE [dbo].[ORD_RecDet_3]
    ADD CONSTRAINT [FK_ORD_RecDet3_LocTo_REFERENCE_MD_Location_Code] FOREIGN KEY ([LocTo]) REFERENCES [dbo].[MD_Location] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

