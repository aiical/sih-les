﻿ALTER TABLE [dbo].[INV_LocationLotDet_19]
    ADD CONSTRAINT [FK_INV_LocationLotDet19_Location_REFERENCE_MD_Location_Code] FOREIGN KEY ([Location]) REFERENCES [dbo].[MD_Location] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

