﻿ALTER TABLE [dbo].[ORD_OrderMstr_7]
    ADD CONSTRAINT [FK_ORD_OrderMstr7_Routing_REFERENCE_PRD_RoutingMstr_Code] FOREIGN KEY ([Routing]) REFERENCES [dbo].[PRD_RoutingMstr] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

