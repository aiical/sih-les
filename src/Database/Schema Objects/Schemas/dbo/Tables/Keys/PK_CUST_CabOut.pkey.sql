﻿ALTER TABLE [dbo].[CUST_CabOut]
    ADD CONSTRAINT [PK_CUST_CabOut] PRIMARY KEY CLUSTERED ([OrderNo] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

