﻿ALTER TABLE [dbo].[ORD_IpMstr]
    ADD CONSTRAINT [FK_ORD_IPMS_0_REFERENCE_MD_ADDRE] FOREIGN KEY ([ShipTo]) REFERENCES [dbo].[MD_Address] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

