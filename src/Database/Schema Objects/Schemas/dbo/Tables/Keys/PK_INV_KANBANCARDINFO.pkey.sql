﻿ALTER TABLE [dbo].[INV_KanBanCardInfo]
    ADD CONSTRAINT [PK_INV_KANBANCARDINFO] PRIMARY KEY CLUSTERED ([CardNo] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

