﻿ALTER TABLE [dbo].[INV_ContainerDet]
    ADD CONSTRAINT [FK_INV_CONT_REFERENCE_MD_CONTA2] FOREIGN KEY ([Container]) REFERENCES [dbo].[MD_Container] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;

