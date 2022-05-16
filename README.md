# prj301-flower-shop

# ONLINE FLOWER SHOP JAVA WEB APPLICATION

Note: This application is built as an assignment for a subject in my university. FPTU-PRJ301-VanTTN-Spring22 Assignment.

## Prerequisite
### Frontend
- HTML
- CSS
- Javascript
- Bootstrap 4.3.1
### Backend
- NetBeans IDE 8.2. Using higher versions of NetBeans or other IDE may cause the code to run not as smooth
- Java (JDK8+)
- Glassfish Server 4.1.1
- Used Java libraries: sqljdbc4-2.0.jar, JST 1.2.1, gson-2.8.2.jar, httpclient-4.4.5.jar, httpcore-4.4.9.jar, fluent-hc-4.5.5.jar, commons-logging-1.2.jar, mail.jar, smtp.jar
### Database
- Microsoft SQL Server 2014

Note: This is a school project only only so security issues are untouched.

## Sample database script

STEP 1: Open Microsoft SQL Server Management Studio (any version)

STEP 2: Create a new query.

STEP 3: Copy paste the following query into your newly created query. Afterwards, select all and run.

```
USE [master]
GO
/****** Object:  Database [PlantShop]    Script Date: 5/16/2022 8:13:29 PM ******/
CREATE DATABASE [PlantShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PlantShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PlantShop.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PlantShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PlantShop_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PlantShop] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PlantShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PlantShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PlantShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PlantShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PlantShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PlantShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [PlantShop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PlantShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PlantShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PlantShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PlantShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PlantShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PlantShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PlantShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PlantShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PlantShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PlantShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PlantShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PlantShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PlantShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PlantShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PlantShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PlantShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PlantShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PlantShop] SET  MULTI_USER 
GO
ALTER DATABASE [PlantShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PlantShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PlantShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PlantShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PlantShop] SET DELAYED_DURABILITY = DISABLED 
GO
USE [PlantShop]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 5/16/2022 8:13:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Accounts](
	[accID] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](30) NULL,
	[password] [varchar](30) NULL,
	[fullname] [varchar](30) NULL,
	[phone] [varchar](12) NULL,
	[status] [int] NULL,
	[role] [int] NULL,
	[token] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[accID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 5/16/2022 8:13:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categories](
	[CateID] [int] IDENTITY(1,1) NOT NULL,
	[CateName] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[CateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 5/16/2022 8:13:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[DetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[FID] [int] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/16/2022 8:13:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrdDate] [date] NULL,
	[shipdate] [date] NULL,
	[status] [int] NULL,
	[AccID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Plants]    Script Date: 5/16/2022 8:13:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Plants](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[PName] [varchar](30) NULL,
	[price] [int] NULL,
	[imgPath] [varchar](50) NULL,
	[description] [text] NULL,
	[status] [int] NULL,
	[CateID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([FID])
REFERENCES [dbo].[Plants] ([PID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([AccID])
REFERENCES [dbo].[Accounts] ([accID])
GO
ALTER TABLE [dbo].[Plants]  WITH CHECK ADD FOREIGN KEY([CateID])
REFERENCES [dbo].[Categories] ([CateID])
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD CHECK  (([role]=(1) OR [role]=(0)))
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(0)))
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD CHECK  (([quantity]>=(1)))
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(2) OR [status]=(3)))
GO
ALTER TABLE [dbo].[Plants]  WITH CHECK ADD CHECK  (([price]>=(0)))
GO
USE [master]
GO
ALTER DATABASE [PlantShop] SET  READ_WRITE 
GO
```

## Importing and running the project with NetBeans IDE 8.2

Step 1: Open NetBeans IDE 8.2. 
Step 2: Import the project with this git link: https://github.com/leduc212/prj301-flower-shop.git
Step 3: Import database [as the above steps](https://www.youtube.com/watch?v=D1e3Bj5KWLI)
Step 4: Config the database connection file: FlowerManagementSystem_1 > Source Packages > duclm.utils > DBUtils.java
Step 4: In DBUtils.java file, change the IP to localhost, instanceName into your device name (you can check your device name in SQL Server 2014), port to your SQL server config port (you can check for this with SQL server configuration manager), uid and pwd is the username and password to connect to SQL Server 2014. By default, your username is sa and there is no password for this account. Change the password in SQL Server in order to run the code. Here's a guide on how to change sa password: [link](https://blog.trimech.com/how-to-change-your-sql-sa-account-password)
Step 5: Save your DBUtils.java file and make sure you config the file correctly.
Step 6: Deploy the application with GlassFish.

## A step-by-step guide on how to create a web app like this
[Uploading JavaWeb_Setup_Workshop_Assignment_Plan.pdf…](Vietnamese)

## Additional Features (scuffed)
- Login with your Google accounts
- reCaptcha in Registration page
- Send confirmation email on successful account registration
- Pagination

### I will do a step-by-step guide on how to do the additional features in the future, thank you for reading this document.
