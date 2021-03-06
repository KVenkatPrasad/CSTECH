USE [master]
GO
/****** Object:  Database [CSTECH]    Script Date: 03-01-2022 3.33.56 AM ******/
CREATE DATABASE [CSTECH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CSTECH', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CSTECH.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CSTECH_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CSTECH_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CSTECH] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CSTECH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CSTECH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CSTECH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CSTECH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CSTECH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CSTECH] SET ARITHABORT OFF 
GO
ALTER DATABASE [CSTECH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CSTECH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CSTECH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CSTECH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CSTECH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CSTECH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CSTECH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CSTECH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CSTECH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CSTECH] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CSTECH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CSTECH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CSTECH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CSTECH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CSTECH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CSTECH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CSTECH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CSTECH] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CSTECH] SET  MULTI_USER 
GO
ALTER DATABASE [CSTECH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CSTECH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CSTECH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CSTECH] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CSTECH] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CSTECH] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CSTECH] SET QUERY_STORE = OFF
GO
USE [CSTECH]
GO
/****** Object:  Table [dbo].[t_Employee]    Script Date: 03-01-2022 3.33.58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_Employee](
	[f_Id] [int] IDENTITY(1,1) NOT NULL,
	[f_Image] [nvarchar](max) NULL,
	[f_Name] [varchar](50) NOT NULL,
	[f_Email] [varchar](50) NOT NULL,
	[f_Mobile] [varchar](10) NOT NULL,
	[f_Designation] [varchar](10) NOT NULL,
	[f_gender] [varchar](10) NOT NULL,
	[f_Course] [varchar](15) NOT NULL,
	[f_Createdate] [datetime] NOT NULL,
 CONSTRAINT [PK_t_Employee] PRIMARY KEY CLUSTERED 
(
	[f_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_login]    Script Date: 03-01-2022 3.33.58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_login](
	[f_sno] [int] NOT NULL,
	[f_userName] [nvarchar](50) NOT NULL,
	[f_Pwd] [varchar](20) NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[t_Employee] ON 

INSERT [dbo].[t_Employee] ([f_Id], [f_Image], [f_Name], [f_Email], [f_Mobile], [f_Designation], [f_gender], [f_Course], [f_Createdate]) VALUES (1, N'Images/User.png', N'hukum', N'hcgupta@cstech.in', N'9540100044', N'HR', N'Male', N'MCA', CAST(N'2022-01-03T03:13:02.477' AS DateTime))
INSERT [dbo].[t_Employee] ([f_Id], [f_Image], [f_Name], [f_Email], [f_Mobile], [f_Designation], [f_gender], [f_Course], [f_Createdate]) VALUES (2, N'Images/User.png', N'manish', N'manish@cstech.in', N'9540100033', N'Sales', N'Male', N'BCA', CAST(N'2022-01-03T03:14:11.773' AS DateTime))
INSERT [dbo].[t_Employee] ([f_Id], [f_Image], [f_Name], [f_Email], [f_Mobile], [f_Designation], [f_gender], [f_Course], [f_Createdate]) VALUES (3, N'Images/User.png', N'yash', N'yash@cstech.in', N'9540100022', N'Manager', N'Male', N'BSC', CAST(N'2022-01-03T03:15:49.510' AS DateTime))
INSERT [dbo].[t_Employee] ([f_Id], [f_Image], [f_Name], [f_Email], [f_Mobile], [f_Designation], [f_gender], [f_Course], [f_Createdate]) VALUES (4, N'Images/User.png', N'abhishek', N'abhishek@cstech.in', N'954010033', N'HR', N'Male', N'MCA', CAST(N'2022-01-03T03:16:33.383' AS DateTime))
SET IDENTITY_INSERT [dbo].[t_Employee] OFF
GO
INSERT [dbo].[t_login] ([f_sno], [f_userName], [f_Pwd]) VALUES (1, N'Prasad', N'prasad')
INSERT [dbo].[t_login] ([f_sno], [f_userName], [f_Pwd]) VALUES (2, N'Suresh', N'suresh')
INSERT [dbo].[t_login] ([f_sno], [f_userName], [f_Pwd]) VALUES (3, N'Shashi', N'shashi')
GO
ALTER TABLE [dbo].[t_Employee] ADD  CONSTRAINT [DF_t_Employee_f_Createdate]  DEFAULT (getdate()) FOR [f_Createdate]
GO
/****** Object:  StoredProcedure [dbo].[CheckEmail]    Script Date: 03-01-2022 3.33.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--EXEC CheckEmail 'Email@email.com'
create   proc [dbo].[CheckEmail](@Email nvarchar(50))
AS

BEGIN
IF EXISTS (SELECT * FROM t_Employee WHERE f_Email=@Email)
SELECT 1 'Check'
ELSE
SELECT 0 'Check'
END
GO
/****** Object:  StoredProcedure [dbo].[Dropdown]    Script Date: 03-01-2022 3.33.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [dbo].[Dropdown]
      @Action nvarchar(50)
AS
BEGIN
	if(@Action='getUser')
	Begin
	   select f_Id,f_Name,f_Email,f_Mobile,f_Designation,f_gender,f_Course,f_Image,CONVERT(varchar(10),f_Createdate,106)f_Createdate from dbo.t_Employee
	End
	
	else if(@Action='getGender')
	   Begin
	   select * from dbo.t_Employee
	   End
	   
	   else if(@Action='getDesignation')
	     Begin
	     select * from dbo.t_Employee
	     End
	     else if(@Action='getCourse')
	     Begin
	     select * from dbo.t_Employee
	     End
END
GO
/****** Object:  StoredProcedure [dbo].[UserDetails]    Script Date: 03-01-2022 3.33.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[UserDetails](
         @f_Id int=0,
         @Name nvarchar(50)=null,
         @EMail nvarchar(50)=null,
         @Phno nvarchar(10)=null,
         @Desig varchar(10)=null,
         @Gender varchar(10)=null,
         @Course varchar(15)=null,
         @Image nvarchar(MAX)=null,
		 @UserId varchar(10)=null,
         @Action varchar(50)=null)
AS
if(@Action='insert')
BEGIN
	insert into dbo.t_Employee (f_Name,f_Email,f_Mobile,f_Designation,f_gender,f_Course,f_Image)values(@Name,@EMail,@Phno,@Desig,@Gender,@Course,@Image)
END
else if(@Action='Update')
Begin
      Update dbo.t_Employee set f_Name=@Name,
                         f_Email=@EMail,
                         f_Mobile=@Phno,
                         f_Designation=@Desig,
                         f_gender=@Gender,
                         f_Course=@Course,
                         f_Image=@Image
                         where f_Id=@f_Id
      End
      else if(@Action='GetUserById')
           Begin
           select f_Name,f_Email,f_Mobile,f_Designation,f_gender,f_Course,f_Image
                                        from dbo.t_Employee where f_Id=@f_Id
           End                    
           else if(@Action='Deletuser')
           Begin
           delete dbo.t_Employee where f_Id=@f_Id
           End
GO
/****** Object:  StoredProcedure [dbo].[ValidateUser]    Script Date: 03-01-2022 3.33.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[ValidateUser](@User nvarchar(50),@pwd varchar(20))
AS

BEGIN
IF EXISTS (SELECT * FROM t_login WHERE f_userName=@User and f_Pwd=@pwd)
SELECT 1 'Check'
ELSE
SELECT 0 'Check'
END
GO
USE [master]
GO
ALTER DATABASE [CSTECH] SET  READ_WRITE 
GO
