﻿ALTER TABLE [dbo].[SYS_CodeDet]
    ADD CONSTRAINT [FK_SYS_CODE_REFERENCE_SYS_CODE] FOREIGN KEY ([Code]) REFERENCES [dbo].[SYS_CodeMstr] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

