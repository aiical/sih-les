﻿ALTER TABLE [dbo].[ORD_OrderDet_6]
    ADD CONSTRAINT [FK_ORD_OrderDet6_Container_REFERENCE_MD_Container_Code] FOREIGN KEY ([Container]) REFERENCES [dbo].[MD_Container] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

