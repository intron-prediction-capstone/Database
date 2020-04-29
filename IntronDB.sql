USE [master]
GO

/****** Object:  Database [IntronDB]    Script Date: 4/29/2020 2:09:26 PM ******/
CREATE DATABASE [IntronDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Major and Minor Intron', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Major and Minor Intron.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Major and Minor Intron_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Major and Minor Intron_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IntronDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [IntronDB] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [IntronDB] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [IntronDB] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [IntronDB] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [IntronDB] SET ARITHABORT OFF 
GO

ALTER DATABASE [IntronDB] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [IntronDB] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [IntronDB] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [IntronDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [IntronDB] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [IntronDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [IntronDB] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [IntronDB] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [IntronDB] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [IntronDB] SET  DISABLE_BROKER 
GO

ALTER DATABASE [IntronDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [IntronDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [IntronDB] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [IntronDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [IntronDB] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [IntronDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [IntronDB] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [IntronDB] SET RECOVERY FULL 
GO

ALTER DATABASE [IntronDB] SET  MULTI_USER 
GO

ALTER DATABASE [IntronDB] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [IntronDB] SET DB_CHAINING OFF 
GO

ALTER DATABASE [IntronDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [IntronDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [IntronDB] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [IntronDB] SET QUERY_STORE = OFF
GO

ALTER DATABASE [IntronDB] SET  READ_WRITE 
GO

