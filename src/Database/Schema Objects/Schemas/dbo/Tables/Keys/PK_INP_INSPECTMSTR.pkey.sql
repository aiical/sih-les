﻿ALTER TABLE [dbo].[INP_InspectMstr]
    ADD CONSTRAINT [PK_INP_INSPECTMSTR] PRIMARY KEY CLUSTERED ([InpNo] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

