﻿ALTER TABLE [dbo].[ORD_IpDet]
    ADD CONSTRAINT [FK_ORD_IPDE_0_REFERENCE_MD_LOCAT2] FOREIGN KEY ([LocFrom]) REFERENCES [dbo].[MD_Location] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

