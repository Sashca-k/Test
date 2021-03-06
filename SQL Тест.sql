USE [Тест]
GO
/****** Object:  Table [dbo].[Вид деятельности]    Script Date: 03.04.2020 11:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Вид деятельности](
	[Код вида деятельности] [int] NULL,
	[Вид деятельности] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Вид деятельности] PRIMARY KEY CLUSTERED 
(
	[Вид деятельности] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Открытые вакансии]    Script Date: 03.04.2020 11:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Открытые вакансии](
	[Код открытой вакансии] [int] NULL,
	[Код работодателя] [int] NOT NULL,
	[Должность] [nvarchar](50) NULL,
 CONSTRAINT [PK_Открытые вакансии] PRIMARY KEY CLUSTERED 
(
	[Код работодателя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Работодатели]    Script Date: 03.04.2020 11:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Работодатели](
	[Код работодателя] [int] NOT NULL,
	[Название] [nvarchar](50) NULL,
	[Вид деятельности] [nvarchar](50) NOT NULL,
	[Адрес] [nvarchar](50) NULL,
	[Телефон] [char](20) NULL,
 CONSTRAINT [PK_Работодатели] PRIMARY KEY CLUSTERED 
(
	[Вид деятельности] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сделки]    Script Date: 03.04.2020 11:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сделки](
	[Код соискателя] [int] NOT NULL,
	[Код работодателя] [int] NULL,
	[Должность] [nvarchar](50) NOT NULL,
	[Комисионные] [money] NULL,
 CONSTRAINT [PK_Сделки] PRIMARY KEY CLUSTERED 
(
	[Должность] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Соискатели]    Script Date: 03.04.2020 11:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Соискатели](
	[Код соискателя] [int] NOT NULL,
	[Фамилия] [nvarchar](50) NULL,
	[Имя] [nvarchar](50) NULL,
	[Отчество] [nvarchar](50) NULL,
	[Квалификация] [nvarchar](50) NULL,
	[Вид деятельности] [nvarchar](50) NOT NULL,
	[Зарплата] [money] NULL,
 CONSTRAINT [PK_Соискатели] PRIMARY KEY CLUSTERED 
(
	[Код соискателя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Вид деятельности]  WITH CHECK ADD  CONSTRAINT [FK_Вид деятельности_Работодатели] FOREIGN KEY([Вид деятельности])
REFERENCES [dbo].[Работодатели] ([Вид деятельности])
GO
ALTER TABLE [dbo].[Вид деятельности] CHECK CONSTRAINT [FK_Вид деятельности_Работодатели]
GO
ALTER TABLE [dbo].[Открытые вакансии]  WITH CHECK ADD  CONSTRAINT [FK_Открытые вакансии_Сделки] FOREIGN KEY([Должность])
REFERENCES [dbo].[Сделки] ([Должность])
GO
ALTER TABLE [dbo].[Открытые вакансии] CHECK CONSTRAINT [FK_Открытые вакансии_Сделки]
GO
ALTER TABLE [dbo].[Работодатели]  WITH CHECK ADD  CONSTRAINT [FK_Работодатели_Открытые вакансии1] FOREIGN KEY([Код работодателя])
REFERENCES [dbo].[Открытые вакансии] ([Код работодателя])
GO
ALTER TABLE [dbo].[Работодатели] CHECK CONSTRAINT [FK_Работодатели_Открытые вакансии1]
GO
ALTER TABLE [dbo].[Сделки]  WITH CHECK ADD  CONSTRAINT [FK_Сделки_Соискатели] FOREIGN KEY([Код соискателя])
REFERENCES [dbo].[Соискатели] ([Код соискателя])
GO
ALTER TABLE [dbo].[Сделки] CHECK CONSTRAINT [FK_Сделки_Соискатели]
GO
ALTER TABLE [dbo].[Соискатели]  WITH CHECK ADD  CONSTRAINT [FK_Соискатели_Вид деятельности] FOREIGN KEY([Вид деятельности])
REFERENCES [dbo].[Вид деятельности] ([Вид деятельности])
GO
ALTER TABLE [dbo].[Соискатели] CHECK CONSTRAINT [FK_Соискатели_Вид деятельности]
GO
