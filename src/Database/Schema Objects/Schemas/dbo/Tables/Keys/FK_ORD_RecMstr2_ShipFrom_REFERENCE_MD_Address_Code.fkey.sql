﻿ALTER TABLE [dbo].[ORD_RecMstr_2]
    ADD CONSTRAINT [FK_ORD_RecMstr2_ShipFrom_REFERENCE_MD_Address_Code] FOREIGN KEY ([ShipFrom]) REFERENCES [dbo].[MD_Address] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

