﻿ALTER TABLE [dbo].[ORD_IpLocationDet]
    ADD CONSTRAINT [FK_ORD_IPLO_0_REFERENCE_MD_ITEM] FOREIGN KEY ([Item]) REFERENCES [dbo].[MD_Item] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

