﻿ALTER TABLE [dbo].[BIL_BillMstr]
    ADD CONSTRAINT [PK_BIL_BILLMSTR] PRIMARY KEY CLUSTERED ([BillNo] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

