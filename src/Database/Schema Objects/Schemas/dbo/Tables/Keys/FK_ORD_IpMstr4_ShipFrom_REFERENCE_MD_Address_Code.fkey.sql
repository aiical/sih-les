﻿ALTER TABLE [dbo].[ORD_IpMstr_4]
    ADD CONSTRAINT [FK_ORD_IpMstr4_ShipFrom_REFERENCE_MD_Address_Code] FOREIGN KEY ([ShipFrom]) REFERENCES [dbo].[MD_Address] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

