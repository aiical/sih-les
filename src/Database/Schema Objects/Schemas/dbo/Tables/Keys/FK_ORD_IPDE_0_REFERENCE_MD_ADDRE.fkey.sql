﻿ALTER TABLE [dbo].[ORD_IpDet]
    ADD CONSTRAINT [FK_ORD_IPDE_0_REFERENCE_MD_ADDRE] FOREIGN KEY ([BillAddr]) REFERENCES [dbo].[MD_Address] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

