﻿ALTER TABLE [dbo].[ISS_IssueType]
    ADD CONSTRAINT [PK_ISS_ISSUETYPE] PRIMARY KEY CLUSTERED ([Code] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

