﻿ALTER TABLE [dbo].[ORD_IpMstr_5]
    ADD CONSTRAINT [FK_ORD_IpMstr5_ShipTo_REFERENCE_MD_Address_Code] FOREIGN KEY ([ShipTo]) REFERENCES [dbo].[MD_Address] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

