﻿ALTER TABLE [dbo].[INV_StockTakeMstr]
    ADD CONSTRAINT [PK_INV_STOCKTAKEMSTR] PRIMARY KEY CLUSTERED ([StNo] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

