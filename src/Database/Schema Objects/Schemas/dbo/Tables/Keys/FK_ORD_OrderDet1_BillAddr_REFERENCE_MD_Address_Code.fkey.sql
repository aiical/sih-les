﻿ALTER TABLE [dbo].[ORD_OrderDet_1]
    ADD CONSTRAINT [FK_ORD_OrderDet1_BillAddr_REFERENCE_MD_Address_Code] FOREIGN KEY ([BillAddr]) REFERENCES [dbo].[MD_Address] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

