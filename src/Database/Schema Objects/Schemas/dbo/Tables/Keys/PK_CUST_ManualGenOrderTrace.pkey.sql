﻿ALTER TABLE [dbo].[CUST_ManualGenOrderTrace]
    ADD CONSTRAINT [PK_CUST_ManualGenOrderTrace] PRIMARY KEY CLUSTERED ([ProdOrderNo] ASC, [OrderNo] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

