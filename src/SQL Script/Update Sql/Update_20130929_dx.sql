IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CUST_ProdBomDetForecast]') AND type in (N'U'))
DROP TABLE [dbo].[CUST_ProdBomDetForecast]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CUST_ProdBomDetForecast](
	[RSNUM] [int] NOT NULL,
	[RSPOS] [int] NOT NULL,
	[AUFNR] [varchar](12) NULL,
	[WERKS] [varchar](4) NULL,
	[MATNR] [varchar](50) NULL,
	[MEINS] [varchar](6) NULL,
	[BDMNG] [decimal](18, 8) NULL,
	[CHARG] [varchar](50) NULL,
	[BDTER] [datetime] NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CUST_PRODBOMDETFORECAST] PRIMARY KEY CLUSTERED 
(
	[RSNUM] ASC,
	[RSPOS] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[CUST_ProdBomDetForecast] ADD  CONSTRAINT [DF__CUST_Prod__Creat__1EA62536]  DEFAULT (getdate()) FOR [CreateDate]
GO


