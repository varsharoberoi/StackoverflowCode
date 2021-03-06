USE [master]
GO
/****** Object:  Database [StackOverFlow]    Script Date: 10-06-2020 15:02:11 ******/
CREATE DATABASE [StackOverFlow]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StackOverFlow', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQL2017\MSSQL\DATA\StackOverFlow.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StackOverFlow_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQL2017\MSSQL\DATA\StackOverFlow_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [StackOverFlow] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StackOverFlow].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StackOverFlow] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StackOverFlow] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StackOverFlow] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StackOverFlow] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StackOverFlow] SET ARITHABORT OFF 
GO
ALTER DATABASE [StackOverFlow] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StackOverFlow] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StackOverFlow] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StackOverFlow] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StackOverFlow] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StackOverFlow] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StackOverFlow] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StackOverFlow] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StackOverFlow] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StackOverFlow] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StackOverFlow] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StackOverFlow] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StackOverFlow] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StackOverFlow] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StackOverFlow] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StackOverFlow] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StackOverFlow] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StackOverFlow] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StackOverFlow] SET  MULTI_USER 
GO
ALTER DATABASE [StackOverFlow] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StackOverFlow] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StackOverFlow] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StackOverFlow] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StackOverFlow] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StackOverFlow] SET QUERY_STORE = OFF
GO
USE [StackOverFlow]
GO
/****** Object:  Table [dbo].[Answers]    Script Date: 10-06-2020 15:02:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answers](
	[AnswerId] [int] IDENTITY(100001,1) NOT NULL,
	[QuestionId] [int] NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[AnswerByUser] [int] NOT NULL,
	[AnsweredOn] [datetime] NULL,
	[UpDownVote] [int] NULL,
 CONSTRAINT [PK_Answers] PRIMARY KEY CLUSTERED 
(
	[AnswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnswersComment]    Script Date: 10-06-2020 15:02:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnswersComment](
	[CommentId] [int] IDENTITY(1,1) NOT NULL,
	[AnswerId] [int] NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_AnswersComment] PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 10-06-2020 15:02:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[QuestionId] [int] IDENTITY(10001,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Title] [varchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[ViewCount] [int] NULL,
	[IsOpen] [bit] NOT NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagMaster]    Script Date: 10-06-2020 15:02:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagMaster](
	[TagId] [int] IDENTITY(1,1) NOT NULL,
	[TagDescription] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TagMaster] PRIMARY KEY CLUSTERED 
(
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagQuestions]    Script Date: 10-06-2020 15:02:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagQuestions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TagId] [int] NOT NULL,
	[QuestionId] [int] NOT NULL,
 CONSTRAINT [PK_TagQuestions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10-06-2020 15:02:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1001,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[ConfirmPassword] [varchar](50) NOT NULL,
	[MobileNumber] [varchar](50) NULL,
	[Gender] [varchar](10) NULL,
	[ImageName] [varchar](100) NULL,
	[Role] [varchar](10) NULL,
	[ReputaionPoints] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Questions] ADD  CONSTRAINT [DF_Questions_IsOpen]  DEFAULT ((1)) FOR [IsOpen]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Role]  DEFAULT (user_name()) FOR [Role]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_ReputaionPoints]  DEFAULT ((1)) FOR [ReputaionPoints]
GO
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Questions] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([QuestionId])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_Questions]
GO
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Users] FOREIGN KEY([AnswerByUser])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_Users]
GO
ALTER TABLE [dbo].[AnswersComment]  WITH CHECK ADD  CONSTRAINT [FK_AnswersComment_Answers] FOREIGN KEY([AnswerId])
REFERENCES [dbo].[Answers] ([AnswerId])
GO
ALTER TABLE [dbo].[AnswersComment] CHECK CONSTRAINT [FK_AnswersComment_Answers]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_Users]
GO
ALTER TABLE [dbo].[TagQuestions]  WITH CHECK ADD  CONSTRAINT [FK_TagQuestions_Questions] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([QuestionId])
GO
ALTER TABLE [dbo].[TagQuestions] CHECK CONSTRAINT [FK_TagQuestions_Questions]
GO
ALTER TABLE [dbo].[TagQuestions]  WITH CHECK ADD  CONSTRAINT [FK_TagQuestions_TagMaster] FOREIGN KEY([TagId])
REFERENCES [dbo].[TagMaster] ([TagId])
GO
ALTER TABLE [dbo].[TagQuestions] CHECK CONSTRAINT [FK_TagQuestions_TagMaster]
GO
/****** Object:  StoredProcedure [dbo].[getUser]    Script Date: 10-06-2020 15:02:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getUser]
@UserID int
AS
BEGIN

   select * from Users where UserId=@UserID;

END
GO
USE [master]
GO
ALTER DATABASE [StackOverFlow] SET  READ_WRITE 
GO
