USE [master]
GO
/****** Object:  Database [HomeStay_HUB_Ver1]    Script Date: 01/06/2025 16:08:12 ******/
CREATE DATABASE [HomeStay_HUB_Ver1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HomeStay_HUB_Ver1', FILENAME = N'D:\app\SQL_SERVER\MSSQL16.MSSQLSERVER\MSSQL\DATA\HomeStay_HUB_Ver1.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HomeStay_HUB_Ver1_log', FILENAME = N'D:\app\SQL_SERVER\MSSQL16.MSSQLSERVER\MSSQL\DATA\HomeStay_HUB_Ver1_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [HomeStay_HUB_Ver1] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HomeStay_HUB_Ver1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HomeStay_HUB_Ver1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HomeStay_HUB_Ver1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HomeStay_HUB_Ver1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HomeStay_HUB_Ver1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HomeStay_HUB_Ver1] SET ARITHABORT OFF 
GO
ALTER DATABASE [HomeStay_HUB_Ver1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HomeStay_HUB_Ver1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HomeStay_HUB_Ver1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HomeStay_HUB_Ver1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HomeStay_HUB_Ver1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HomeStay_HUB_Ver1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HomeStay_HUB_Ver1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HomeStay_HUB_Ver1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HomeStay_HUB_Ver1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HomeStay_HUB_Ver1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HomeStay_HUB_Ver1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HomeStay_HUB_Ver1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HomeStay_HUB_Ver1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HomeStay_HUB_Ver1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HomeStay_HUB_Ver1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HomeStay_HUB_Ver1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HomeStay_HUB_Ver1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HomeStay_HUB_Ver1] SET RECOVERY FULL 
GO
ALTER DATABASE [HomeStay_HUB_Ver1] SET  MULTI_USER 
GO
ALTER DATABASE [HomeStay_HUB_Ver1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HomeStay_HUB_Ver1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HomeStay_HUB_Ver1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HomeStay_HUB_Ver1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HomeStay_HUB_Ver1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HomeStay_HUB_Ver1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'HomeStay_HUB_Ver1', N'ON'
GO
ALTER DATABASE [HomeStay_HUB_Ver1] SET QUERY_STORE = ON
GO
ALTER DATABASE [HomeStay_HUB_Ver1] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [HomeStay_HUB_Ver1]
GO
/****** Object:  Table [dbo].[Administrators]    Script Date: 01/06/2025 16:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrators](
	[adminID] [nvarchar](100) NOT NULL,
	[userID] [nvarchar](100) NULL,
	[roleID] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[adminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Advertisements]    Script Date: 01/06/2025 16:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advertisements](
	[adID] [int] IDENTITY(1,1) NOT NULL,
	[ownerID] [nvarchar](100) NULL,
	[adTitle] [nvarchar](255) NULL,
	[adDescription] [nvarchar](300) NULL,
	[adPicture] [nvarchar](500) NULL,
	[urlClick] [nvarchar](500) NULL,
	[startDate] [datetime] NULL,
	[endDate] [datetime] NULL,
	[statusAd] [int] NULL,
	[totalClick] [int] NULL,
	[createdDate] [datetime] NULL,
	[updatedDate] [datetime] NULL,
	[placement] [int] NULL,
	[cost] [float] NULL,
	[reasonReject] [nvarchar](500) NULL,
	[timePayment] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[adID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Amenities]    Script Date: 01/06/2025 16:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Amenities](
	[amenityID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[icon] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[amenityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Articles]    Script Date: 01/06/2025 16:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articles](
	[articleID] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[picturePreview] [nvarchar](300) NULL,
	[authorID] [nvarchar](100) NOT NULL,
	[publishDate] [date] NOT NULL,
	[cateArtID] [int] NULL,
	[description] [nvarchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[articleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingProcess]    Script Date: 01/06/2025 16:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingProcess](
	[processID] [int] IDENTITY(1,1) NOT NULL,
	[bookingID] [int] NOT NULL,
	[paymentTime] [datetime] NULL,
	[checkInTime] [datetime] NULL,
	[checkOutTime] [datetime] NULL,
	[stepOrder] [int] NOT NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
	[completeStatus] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[processID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 01/06/2025 16:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[bookingID] [int] NOT NULL,
	[cusID] [nvarchar](100) NULL,
	[ownerID] [nvarchar](100) NULL,
	[homestayID] [int] NULL,
	[roomID] [int] NULL,
	[checkInDate] [date] NULL,
	[checkOutDate] [date] NULL,
	[numberAdults] [int] NULL,
	[numberChildren] [int] NULL,
	[numberBaby] [int] NULL,
	[totalPrice] [float] NULL,
	[paymentMethod] [nvarchar](255) NULL,
	[discountPrice] [float] NULL,
	[discountCode] [nvarchar](50) NULL,
	[originalPrice] [float] NULL,
	[guestList] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[bookingTime] [datetime] NULL,
	[email] [nvarchar](150) NULL,
	[phone] [nvarchar](50) NULL,
	[name] [nvarchar](250) NULL,
	[isConfirm] [bit] NOT NULL,
	[isCancel] [bit] NOT NULL,
	[reasonCancel] [nvarchar](max) NULL,
	[isSuccess] [bit] NOT NULL,
	[statusBK] [int] NULL,
	[timeConfirm] [datetime] NULL,
	[timeReviewRating] [datetime] NULL,
	[CMND] [nvarchar](50) NULL,
	[extraCost] [float] NULL,
	[detailExtraCost] [nvarchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[bookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryArticles]    Script Date: 01/06/2025 16:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryArticles](
	[cateID] [int] IDENTITY(1,1) NOT NULL,
	[cateName] [nvarchar](255) NOT NULL,
	[description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[cateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conversations]    Script Date: 01/06/2025 16:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conversations](
	[conversationID] [int] IDENTITY(1,1) NOT NULL,
	[idUser1] [nvarchar](100) NOT NULL,
	[idUser2] [nvarchar](100) NULL,
	[createdAt] [datetime] NULL,
	[lastMessageAt] [datetime] NULL,
	[userName1] [nvarchar](100) NULL,
	[userName2] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[conversationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 01/06/2025 16:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[cusID] [nvarchar](100) NOT NULL,
	[userID] [nvarchar](100) NULL,
	[rentedRoomsTotal] [int] NULL,
	[totalAmountPaID] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[cusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetailHomeStays]    Script Date: 01/06/2025 16:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailHomeStays](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[homestayID] [int] NULL,
	[noteHomestay] [nvarchar](max) NULL,
	[stayRules] [nvarchar](max) NULL,
	[hasSwimmingPool] [bit] NULL,
	[hasBilliardTable] [bit] NULL,
	[manyActivities] [bit] NULL,
	[spaciousGarden] [bit] NULL,
	[lakeView] [bit] NULL,
	[mountainView] [bit] NULL,
	[seaView] [bit] NULL,
	[riceFieldView] [bit] NULL,
	[policies] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FAQs]    Script Date: 01/06/2025 16:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAQs](
	[faqID] [int] IDENTITY(1,1) NOT NULL,
	[question] [nvarchar](500) NOT NULL,
	[answer] [nvarchar](max) NOT NULL,
	[createdDate] [datetime] NULL,
	[updatedDate] [datetime] NULL,
	[authorID] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[faqID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favorites]    Script Date: 01/06/2025 16:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorites](
	[favID] [int] IDENTITY(1,1) NOT NULL,
	[cusID] [nvarchar](100) NULL,
	[homestayID] [int] NULL,
	[createdAt] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[favID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Homestay_Services]    Script Date: 01/06/2025 16:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Homestay_Services](
	[serviceID] [int] IDENTITY(1,1) NOT NULL,
	[ownerID] [nvarchar](100) NOT NULL,
	[serviceName] [nvarchar](100) NOT NULL,
	[description] [nvarchar](max) NULL,
	[price] [decimal](10, 2) NOT NULL,
	[unit] [nvarchar](200) NOT NULL,
	[isActive] [bit] NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
	[imagePreview] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[serviceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HomestayAmenities]    Script Date: 01/06/2025 16:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HomestayAmenities](
	[id] [int] NOT NULL,
	[homestayID] [int] NOT NULL,
	[amenityID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[homestayID] ASC,
	[amenityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HomeStays]    Script Date: 01/06/2025 16:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HomeStays](
	[homestayID] [int] IDENTITY(1,1) NOT NULL,
	[ownerID] [nvarchar](100) NOT NULL,
	[homestayName] [nvarchar](255) NOT NULL,
	[country] [nvarchar](200) NOT NULL,
	[province] [nvarchar](255) NULL,
	[district] [nvarchar](255) NULL,
	[wardOrCommune] [nvarchar](255) NULL,
	[addressDetail] [nvarchar](355) NOT NULL,
	[imageHomestay] [nvarchar](max) NULL,
	[linkGoogleMap] [nvarchar](500) NULL,
	[timeCheckIn] [nvarchar](50) NULL,
	[timeCheckOut] [nvarchar](50) NULL,
	[totalScore] [float] NULL,
	[viewCount] [int] NULL,
	[reviewCount] [int] NULL,
	[averageRating] [float] NULL,
	[statusHomestay] [int] NULL,
	[isLocked] [bit] NOT NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[homestayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 01/06/2025 16:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[MenuID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Icon] [nvarchar](255) NULL,
	[Url] [nvarchar](255) NULL,
	[ParentMenuID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 01/06/2025 16:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[msgID] [int] IDENTITY(1,1) NOT NULL,
	[conversationID] [int] NOT NULL,
	[content] [nvarchar](max) NULL,
	[idUserSend] [nvarchar](100) NULL,
	[isView] [int] NULL,
	[timestamp] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[msgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 01/06/2025 16:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[Message] [nvarchar](max) NULL,
	[Type] [nvarchar](255) NULL,
	[CreatedAt] [datetime] NULL,
	[IsRead] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OwnerStays]    Script Date: 01/06/2025 16:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OwnerStays](
	[ownerID] [nvarchar](100) NOT NULL,
	[userID] [nvarchar](100) NULL,
	[bannerImage] [nvarchar](200) NULL,
	[defaultCheckinTime] [nvarchar](200) NULL,
	[defaultCheckoutTime] [nvarchar](200) NULL,
	[description] [nvarchar](2000) NULL,
	[nameBank] [nvarchar](250) NULL,
	[numberBank] [nvarchar](50) NULL,
	[defaultRules] [nvarchar](2000) NULL,
	[defaultPolicies] [nvarchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ownerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnershipReg]    Script Date: 01/06/2025 16:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnershipReg](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customerID] [nvarchar](100) NULL,
	[companyName] [nvarchar](max) NULL,
	[fullName] [nvarchar](max) NULL,
	[address] [nvarchar](max) NULL,
	[phoneNumber] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	[totalHomeStay] [int] NOT NULL,
	[imgPreview] [nvarchar](max) NULL,
	[partnershipAgreement] [nvarchar](max) NULL,
	[businessLicense] [nvarchar](max) NULL,
	[note] [nvarchar](max) NULL,
	[bankAccount] [nvarchar](max) NULL,
	[status] [int] NOT NULL,
	[rejectionReason] [nvarchar](max) NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 01/06/2025 16:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[paymentID] [int] IDENTITY(1,1) NOT NULL,
	[bookingID] [int] NULL,
	[ownerID] [nvarchar](100) NULL,
	[cusID] [nvarchar](100) NULL,
	[paymentType] [int] NOT NULL,
	[amount] [float] NOT NULL,
	[paymentStatus] [int] NULL,
	[paymentMethod] [nvarchar](255) NULL,
	[paymentDate] [datetime] NULL,
	[notePayment] [nvarchar](350) NULL,
	[advertisementID] [int] NULL,
	[userID] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[paymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotions]    Script Date: 01/06/2025 16:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotions](
	[prmID] [int] IDENTITY(1,1) NOT NULL,
	[discountCode] [nvarchar](100) NULL,
	[discountAmount] [decimal](18, 0) NULL,
	[description] [nvarchar](300) NULL,
	[startDate] [datetime] NULL,
	[endDate] [datetime] NULL,
	[ownerID] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[prmID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReviewAndRatings]    Script Date: 01/06/2025 16:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReviewAndRatings](
	[reviewID] [int] NOT NULL,
	[cusID] [nvarchar](100) NULL,
	[homestayID] [int] NULL,
	[rating] [float] NULL,
	[comment] [nvarchar](255) NULL,
	[reviewDate] [date] NULL,
	[bookingID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[reviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 01/06/2025 16:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[roleID] [nvarchar](100) NOT NULL,
	[nameRole] [nvarchar](255) NULL,
	[permission] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 01/06/2025 16:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[roomId] [int] IDENTITY(1,1) NOT NULL,
	[homestayId] [int] NOT NULL,
	[roomName] [nvarchar](200) NOT NULL,
	[roomType] [nvarchar](50) NOT NULL,
	[roomSize] [float] NULL,
	[maxAdults] [int] NOT NULL,
	[maxChildren] [int] NULL,
	[maxBaby] [int] NULL,
	[bathroomCount] [int] NULL,
	[bedCount] [int] NULL,
	[pricePerNight] [float] NOT NULL,
	[priceFromSecondNight] [float] NULL,
	[extraFeePerChild] [float] NULL,
	[extraFeePerAdult] [float] NULL,
	[extraFeePerBaby] [float] NULL,
	[description] [nvarchar](max) NULL,
	[hasBalcony] [bit] NULL,
	[hasTv] [bit] NULL,
	[hasAirConditioner] [bit] NULL,
	[hasRefrigerator] [bit] NULL,
	[hasWifi] [bit] NULL,
	[hasHotWater] [bit] NULL,
	[roomImage] [nvarchar](2000) NULL,
	[status] [int] NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[roomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 01/06/2025 16:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ValueType] [nvarchar](50) NULL,
	[Description] [nvarchar](255) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 01/06/2025 16:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userID] [nvarchar](100) NOT NULL,
	[username] [nvarchar](255) NOT NULL,
	[fullName] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[phoneNumber] [nvarchar](20) NULL,
	[password] [nvarchar](255) NOT NULL,
	[profilePicture] [nvarchar](255) NULL,
	[dateOfBirth] [date] NULL,
	[country] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[accountStatus] [int] NULL,
	[createdAt] [date] NULL,
	[status] [int] NULL,
	[gender] [int] NULL,
	[typeUser] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Administrators] ([adminID], [userID], [roleID]) VALUES (N'2b69edce-0836-485c-a5c0-126b11831c19', N'2f9c055e-1a95-41e4-b331-c863cebc9a73', N'ed204707-f559-4d7c-85ab-feb3d22af9a4')
GO
SET IDENTITY_INSERT [dbo].[Advertisements] ON 
GO
INSERT [dbo].[Advertisements] ([adID], [ownerID], [adTitle], [adDescription], [adPicture], [urlClick], [startDate], [endDate], [statusAd], [totalClick], [createdDate], [updatedDate], [placement], [cost], [reasonReject], [timePayment]) VALUES (2, N'd1291e9a-31d4-414c-bcae-ee7441682162', N'Trốn Thành Phố - Nghỉ Dưỡng Tại Homestay Xanh', N'Hòa mình vào thiên nhiên với homestay mộc mạc, không gian yên bình và tiện nghi đầy đủ. Đặt ngay để tận hưởng kỳ nghỉ thư giãn!', N'/Images/20250529_144122_2794402_.jpg', N'http://localhost:3000/detail-homestay?id=8', CAST(N'2025-05-28T17:00:00.000' AS DateTime), CAST(N'2025-07-28T00:00:00.000' AS DateTime), 3, 0, CAST(N'2025-05-29T14:41:22.533' AS DateTime), CAST(N'2025-05-29T07:41:22.500' AS DateTime), 1, 2520000, NULL, CAST(N'2025-05-29T14:51:58.000' AS DateTime))
GO
INSERT [dbo].[Advertisements] ([adID], [ownerID], [adTitle], [adDescription], [adPicture], [urlClick], [startDate], [endDate], [statusAd], [totalClick], [createdDate], [updatedDate], [placement], [cost], [reasonReject], [timePayment]) VALUES (3, N'd1291e9a-31d4-414c-bcae-ee7441682162', N'Sống Chậm Cùng Homestay Núi Rừng', N'Thức dậy giữa rừng thông, thưởng thức cà phê sáng trong không gian mộc mạc. Lý tưởng cho những ai tìm kiếm sự tĩnh lặng.', N'/Images/20250529_144229_9994038_.jpg', N'http://localhost:3000/detail-homestay?id=8', CAST(N'2025-05-28T17:00:00.000' AS DateTime), CAST(N'2025-07-28T00:00:00.000' AS DateTime), 3, 0, CAST(N'2025-05-29T14:42:29.250' AS DateTime), CAST(N'2025-05-29T07:42:29.247' AS DateTime), 1, 2520000, NULL, CAST(N'2025-05-29T14:51:58.000' AS DateTime))
GO
INSERT [dbo].[Advertisements] ([adID], [ownerID], [adTitle], [adDescription], [adPicture], [urlClick], [startDate], [endDate], [statusAd], [totalClick], [createdDate], [updatedDate], [placement], [cost], [reasonReject], [timePayment]) VALUES (4, N'd1291e9a-31d4-414c-bcae-ee7441682162', N'Thoải Mái Như Nhà - Homestay Của Sự Bình Yên', N'Không gian hiện đại, tiện nghi, gần gũi như ở nhà. Phù hợp cho nhóm bạn hoặc gia đình muốn khám phá điểm đến mới.', N'/Images/20250529_144349_9754722_.jpg', N'http://localhost:3000/detail-homestay?id=8', CAST(N'2025-05-28T17:00:00.000' AS DateTime), CAST(N'2025-07-28T00:00:00.000' AS DateTime), 3, 1, CAST(N'2025-05-29T14:43:49.407' AS DateTime), CAST(N'2025-05-29T07:43:49.403' AS DateTime), 1, 2520000, NULL, CAST(N'2025-05-29T14:51:58.000' AS DateTime))
GO
INSERT [dbo].[Advertisements] ([adID], [ownerID], [adTitle], [adDescription], [adPicture], [urlClick], [startDate], [endDate], [statusAd], [totalClick], [createdDate], [updatedDate], [placement], [cost], [reasonReject], [timePayment]) VALUES (5, N'd1291e9a-31d4-414c-bcae-ee7441682162', N'Homestay Lãng Mạn Bên Hồ', N'View hồ thơ mộng, không khí trong lành, homestay ấm cúng cho cặp đôi hoặc gia đình. Trải nghiệm đáng nhớ đang chờ bạn!', N'/Images/20250529_144438_6547201_.jpg', N'http://localhost:3000/detail-homestay?id=8', CAST(N'2025-05-28T17:00:00.000' AS DateTime), CAST(N'2025-07-28T00:00:00.000' AS DateTime), 3, 1, CAST(N'2025-05-29T14:44:38.863' AS DateTime), CAST(N'2025-05-29T07:44:38.857' AS DateTime), 1, 2520000, NULL, CAST(N'2025-05-29T14:51:58.000' AS DateTime))
GO
INSERT [dbo].[Advertisements] ([adID], [ownerID], [adTitle], [adDescription], [adPicture], [urlClick], [startDate], [endDate], [statusAd], [totalClick], [createdDate], [updatedDate], [placement], [cost], [reasonReject], [timePayment]) VALUES (6, N'd1291e9a-31d4-414c-bcae-ee7441682162', N'Homestay Biển Xanh - Gió Mát Rượi', N'Chỉ vài bước chân đến bãi biển, homestay thoáng mát với không gian mở. Thư giãn và tận hưởng sóng biển ngay hôm nay!', N'/Images/20241216_132640.jpg', N'http://localhost:3000/detail-homestay?id=8', CAST(N'2025-05-28T17:00:00.000' AS DateTime), CAST(N'2025-07-28T00:00:00.000' AS DateTime), 3, 2, CAST(N'2025-05-29T14:45:25.523' AS DateTime), CAST(N'2025-05-29T07:45:25.520' AS DateTime), 1, 2520000, NULL, CAST(N'2025-05-29T14:53:39.887' AS DateTime))
GO
INSERT [dbo].[Advertisements] ([adID], [ownerID], [adTitle], [adDescription], [adPicture], [urlClick], [startDate], [endDate], [statusAd], [totalClick], [createdDate], [updatedDate], [placement], [cost], [reasonReject], [timePayment]) VALUES (7, N'd1291e9a-31d4-414c-bcae-ee7441682162', N'Homestay Biển Xanh - Gió Mát Rượi', N'Chỉ vài bước chân đến bãi biển, homestay thoáng mát với không gian mở. Thư giãn và tận hưởng sóng biển ngay hôm nay!', N'/Images/20250529_144651_7962995_.jpg', N'http://localhost:3000/detail-homestay?id=8', CAST(N'2025-05-28T17:00:00.000' AS DateTime), CAST(N'2025-07-28T00:00:00.000' AS DateTime), 3, 0, CAST(N'2025-05-29T14:46:51.263' AS DateTime), CAST(N'2025-05-29T07:46:51.257' AS DateTime), 3, 588000, NULL, CAST(N'2025-05-29T14:51:58.593' AS DateTime))
GO
INSERT [dbo].[Advertisements] ([adID], [ownerID], [adTitle], [adDescription], [adPicture], [urlClick], [startDate], [endDate], [statusAd], [totalClick], [createdDate], [updatedDate], [placement], [cost], [reasonReject], [timePayment]) VALUES (8, N'd1291e9a-31d4-414c-bcae-ee7441682162', N'Trốn phố về rừng – Homestay giữa thiên nhiên tươi xanh', N'Chỉ vài bước chân đến bãi biển, homestay thoáng mát với không gian mở. Thư giãn và tận hưởng sóng biển ngay hôm nay!', N'/Images/20250529_145812_7644124_.jpg', N'http://localhost:3000/detail-homestay?id=6', CAST(N'2025-05-28T17:00:00.000' AS DateTime), CAST(N'2025-07-28T00:00:00.000' AS DateTime), 3, 0, CAST(N'2025-05-29T14:58:13.020' AS DateTime), CAST(N'2025-05-29T15:11:41.547' AS DateTime), 2, 672000, NULL, CAST(N'2025-05-29T14:51:58.000' AS DateTime))
GO
INSERT [dbo].[Advertisements] ([adID], [ownerID], [adTitle], [adDescription], [adPicture], [urlClick], [startDate], [endDate], [statusAd], [totalClick], [createdDate], [updatedDate], [placement], [cost], [reasonReject], [timePayment]) VALUES (52, N'd1291e9a-31d4-414c-bcae-ee7441682162', N'Trải Nghiệm Văn Hóa Địa Phương Độc Đáo', N'Lưu trú tại homestay và cảm nhận sự mộc mạc, chân thành của con người cùng những nét đặc trưng văn hóa địa phương.', N'/Images/20250529_153412_9000360_.jpg', N'http://localhost:3000/detail-homestay?id=5', CAST(N'2025-05-28T17:00:00.000' AS DateTime), CAST(N'2025-12-12T03:50:13.000' AS DateTime), 3, 0, CAST(N'2024-12-12T10:52:10.000' AS DateTime), CAST(N'2025-05-29T15:34:12.527' AS DateTime), 2, 150000, NULL, CAST(N'2024-12-12T13:29:21.000' AS DateTime))
GO
INSERT [dbo].[Advertisements] ([adID], [ownerID], [adTitle], [adDescription], [adPicture], [urlClick], [startDate], [endDate], [statusAd], [totalClick], [createdDate], [updatedDate], [placement], [cost], [reasonReject], [timePayment]) VALUES (53, N'd1291e9a-31d4-414c-bcae-ee7441682162', N'Hành Trình Nghỉ Dưỡng Đẳng Cấp Bắt Đầu Tại Đây"', N'Không gian sang trọng, dịch vụ tận tâm, vị trí thuận tiện. Hãy để chúng tôi biến kỳ nghỉ của bạn thành kỷ niệm khó quên.', N'/Images/20250529_153341_970278_.jpg', N'http://localhost:3000/detail-homestay?id=6', CAST(N'2025-05-28T17:00:00.000' AS DateTime), CAST(N'2025-12-12T03:50:13.000' AS DateTime), 3, 2, CAST(N'2024-12-12T10:52:40.000' AS DateTime), CAST(N'2025-05-29T15:33:41.657' AS DateTime), 2, 150000, NULL, CAST(N'2024-12-12T13:29:21.000' AS DateTime))
GO
INSERT [dbo].[Advertisements] ([adID], [ownerID], [adTitle], [adDescription], [adPicture], [urlClick], [startDate], [endDate], [statusAd], [totalClick], [createdDate], [updatedDate], [placement], [cost], [reasonReject], [timePayment]) VALUES (54, N'd1291e9a-31d4-414c-bcae-ee7441682162', N'Thoát Khỏi Bộn Bề - Về Với Biển Cả', N'Homestay sát biển, làn gió mát rượi và âm thanh sóng vỗ sẽ giúp bạn thư giãn tuyệt đối. Đặt phòng ngay hôm nay!', N'/Images/20250529_153240_5777305_.jpg', N'http://localhost:3000/detail-homestay?id=6', CAST(N'2025-05-28T17:00:00.000' AS DateTime), CAST(N'2025-12-12T03:50:13.000' AS DateTime), 3, 1, CAST(N'2024-12-12T10:53:19.000' AS DateTime), CAST(N'2025-05-29T15:32:40.907' AS DateTime), 2, 150000, NULL, CAST(N'2024-12-12T13:29:21.000' AS DateTime))
GO
INSERT [dbo].[Advertisements] ([adID], [ownerID], [adTitle], [adDescription], [adPicture], [urlClick], [startDate], [endDate], [statusAd], [totalClick], [createdDate], [updatedDate], [placement], [cost], [reasonReject], [timePayment]) VALUES (55, N'd1291e9a-31d4-414c-bcae-ee7441682162', N'Điểm Đến Hoàn Hảo Cho Gia Đình Và Bạn Bè', N'Homestay rộng rãi, phù hợp cho các nhóm đông người. Cùng bạn bè hoặc gia đình tận hưởng kỳ nghỉ tuyệt vời bên nhau.', N'/Images/20250529_153221_3205663_.jpg', N'http://localhost:3000/detail-homestay?id=7', CAST(N'2025-05-28T17:00:00.000' AS DateTime), CAST(N'2025-12-12T03:50:13.000' AS DateTime), 3, 1, CAST(N'2024-12-12T10:53:53.000' AS DateTime), CAST(N'2025-05-29T15:32:21.753' AS DateTime), 2, 150000, NULL, CAST(N'2024-12-12T13:29:21.000' AS DateTime))
GO
INSERT [dbo].[Advertisements] ([adID], [ownerID], [adTitle], [adDescription], [adPicture], [urlClick], [startDate], [endDate], [statusAd], [totalClick], [createdDate], [updatedDate], [placement], [cost], [reasonReject], [timePayment]) VALUES (56, N'd1291e9a-31d4-414c-bcae-ee7441682162', N'Kỳ Nghỉ Lý Tưởng - Giá Rẻ Bất Ngờ', N'Homestay giá rẻ nhưng không gian và dịch vụ đều vượt mong đợi. Liên hệ ngay để không bỏ lỡ!', N'/Images/20250529_153157_3889575_.jpg', N'http://localhost:3000/detail-homestay?id=8', CAST(N'2025-05-28T17:00:00.000' AS DateTime), CAST(N'2025-12-12T03:50:13.000' AS DateTime), 3, 0, CAST(N'2024-12-12T10:54:27.000' AS DateTime), CAST(N'2025-05-29T15:31:57.600' AS DateTime), 2, 150000, NULL, CAST(N'2024-12-12T13:29:21.000' AS DateTime))
GO
INSERT [dbo].[Advertisements] ([adID], [ownerID], [adTitle], [adDescription], [adPicture], [urlClick], [startDate], [endDate], [statusAd], [totalClick], [createdDate], [updatedDate], [placement], [cost], [reasonReject], [timePayment]) VALUES (57, N'd1291e9a-31d4-414c-bcae-ee7441682162', N'Kỳ Nghỉ Lý Tưởng - Giá Rẻ Bất Ngờ', N'Homestay giá rẻ nhưng không gian và dịch vụ đều vượt mong đợi. Liên hệ ngay để không bỏ lỡ!', N'/Images/20250529_153128_926777_.jpg', N'http://localhost:3000/detail-homestay?id=8', CAST(N'2025-05-28T17:00:00.000' AS DateTime), CAST(N'2025-12-12T03:50:13.000' AS DateTime), 3, 0, CAST(N'2024-12-12T10:54:50.000' AS DateTime), CAST(N'2025-05-29T15:31:28.447' AS DateTime), 3, 100000, NULL, CAST(N'2024-12-12T13:29:21.000' AS DateTime))
GO
INSERT [dbo].[Advertisements] ([adID], [ownerID], [adTitle], [adDescription], [adPicture], [urlClick], [startDate], [endDate], [statusAd], [totalClick], [createdDate], [updatedDate], [placement], [cost], [reasonReject], [timePayment]) VALUES (58, N'd1291e9a-31d4-414c-bcae-ee7441682162', N'Thức Giấc Giữa Mây Trời – Homestay Cực Chill', N'Căn phòng nhỏ xinh với tầm nhìn bao quát núi rừng, mang đến trải nghiệm hòa mình vào thiên nhiên kỳ thú.', N'/Images/20250529_153107_2781028_.jpg', N'http://localhost:3000/detail-homestay?id=8', CAST(N'2025-05-28T17:00:00.000' AS DateTime), CAST(N'2025-12-12T03:50:13.000' AS DateTime), 3, 1, CAST(N'2024-12-12T10:55:53.000' AS DateTime), CAST(N'2025-05-29T15:31:07.743' AS DateTime), 3, 100000, NULL, CAST(N'2024-12-12T13:29:21.000' AS DateTime))
GO
INSERT [dbo].[Advertisements] ([adID], [ownerID], [adTitle], [adDescription], [adPicture], [urlClick], [startDate], [endDate], [statusAd], [totalClick], [createdDate], [updatedDate], [placement], [cost], [reasonReject], [timePayment]) VALUES (59, N'd1291e9a-31d4-414c-bcae-ee7441682162', N'Homestay Với Hồ Bơi Riêng – Thỏa Sức Tung Tăng', N'Chìm đắm trong làn nước xanh mát ngay tại homestay mà không cần đi đâu xa. Đặt phòng ngay hôm nay!', N'/Images/20250529_152854_8945755_.jpg', N'http://localhost:3000/detail-homestay?id=9', CAST(N'2025-05-28T17:00:00.000' AS DateTime), CAST(N'2025-12-12T03:50:13.000' AS DateTime), 3, 0, CAST(N'2024-12-12T10:56:30.000' AS DateTime), CAST(N'2025-05-29T15:28:54.633' AS DateTime), 3, 100000, NULL, CAST(N'2024-12-12T12:52:49.000' AS DateTime))
GO
INSERT [dbo].[Advertisements] ([adID], [ownerID], [adTitle], [adDescription], [adPicture], [urlClick], [startDate], [endDate], [statusAd], [totalClick], [createdDate], [updatedDate], [placement], [cost], [reasonReject], [timePayment]) VALUES (1045, N'd1291e9a-31d4-414c-bcae-ee7441682162', N'Homestay Với Hồ Bơi Riêng – Thỏa Sức Tung Tăng', N'Chìm đắm trong làn nước xanh mát ngay tại homestay mà không cần đi đâu xa. Đặt phòng ngay hôm nay!', N'/Images/20250529_152943_1773966_.jpg', N'http://localhost:3000/detail-homestay?id=9', CAST(N'2025-05-28T17:00:00.000' AS DateTime), CAST(N'2025-12-12T03:50:13.000' AS DateTime), 3, 2, CAST(N'2024-12-12T10:56:30.000' AS DateTime), CAST(N'2025-05-29T15:29:43.800' AS DateTime), 3, 100000, NULL, CAST(N'2024-12-12T12:52:49.000' AS DateTime))
GO
INSERT [dbo].[Advertisements] ([adID], [ownerID], [adTitle], [adDescription], [adPicture], [urlClick], [startDate], [endDate], [statusAd], [totalClick], [createdDate], [updatedDate], [placement], [cost], [reasonReject], [timePayment]) VALUES (1046, N'd1291e9a-31d4-414c-bcae-ee7441682162', N'Homestay Với Hồ Bơi Riêng – Thỏa Sức Tung Tăng', N'Chìm đắm trong làn nước xanh mát ngay tại homestay mà không cần đi đâu xa. Đặt phòng ngay hôm nay!', N'/Images/20250529_153045_1650364_.jpg', N'http://localhost:3000/detail-homestay?id=9', CAST(N'2025-05-28T17:00:00.000' AS DateTime), CAST(N'2025-12-12T03:50:13.000' AS DateTime), 0, 0, CAST(N'2024-12-12T10:56:30.000' AS DateTime), CAST(N'2025-05-29T15:30:45.810' AS DateTime), 3, 100000, NULL, CAST(N'2024-12-12T12:52:49.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Advertisements] OFF
GO
SET IDENTITY_INSERT [dbo].[Amenities] ON 
GO
INSERT [dbo].[Amenities] ([amenityID], [name], [icon]) VALUES (1, N'Có Wifi', N'fa fa-wifi')
GO
INSERT [dbo].[Amenities] ([amenityID], [name], [icon]) VALUES (2, N'Máy lọc không khí', N'fa fa-wind')
GO
INSERT [dbo].[Amenities] ([amenityID], [name], [icon]) VALUES (3, N'Điều hòa', N'fas fa-snowflake')
GO
INSERT [dbo].[Amenities] ([amenityID], [name], [icon]) VALUES (22, N'Hồ bơi', N'fas fa-swimmer')
GO
INSERT [dbo].[Amenities] ([amenityID], [name], [icon]) VALUES (23, N'Quầy bar BBQ', N'fas fa-fire')
GO
INSERT [dbo].[Amenities] ([amenityID], [name], [icon]) VALUES (24, N'Tivi', N'fas fa-tv')
GO
INSERT [dbo].[Amenities] ([amenityID], [name], [icon]) VALUES (25, N'Khu vực đỗ xe', N'fas fa-parking')
GO
INSERT [dbo].[Amenities] ([amenityID], [name], [icon]) VALUES (26, N'Thú cưng được chào đón', N'fas fa-paw')
GO
INSERT [dbo].[Amenities] ([amenityID], [name], [icon]) VALUES (27, N'Khu vực thư giãn ngoài trời', N'fas fa-tree')
GO
INSERT [dbo].[Amenities] ([amenityID], [name], [icon]) VALUES (28, N'Máy pha cà phê', N'fas fa-coffee')
GO
INSERT [dbo].[Amenities] ([amenityID], [name], [icon]) VALUES (29, N'Hệ thống an ninh (camera)', N'fas fa-camera')
GO
INSERT [dbo].[Amenities] ([amenityID], [name], [icon]) VALUES (30, N'Khăn tắm, dầu gội, sữa tắm', N'fas fa-bath')
GO
INSERT [dbo].[Amenities] ([amenityID], [name], [icon]) VALUES (31, N'Bàn bi-a', N'fas fa-gamepad')
GO
INSERT [dbo].[Amenities] ([amenityID], [name], [icon]) VALUES (32, N'Bàn ăn ngoài trời', N'fas fa-utensils')
GO
INSERT [dbo].[Amenities] ([amenityID], [name], [icon]) VALUES (33, N'Phòng ngủ lớn', N'fas fa-bed')
GO
INSERT [dbo].[Amenities] ([amenityID], [name], [icon]) VALUES (34, N'Sân chơi trẻ em', N'fas fa-child')
GO
INSERT [dbo].[Amenities] ([amenityID], [name], [icon]) VALUES (35, N'Hệ thống chiếu sáng hiện đại', N'fas fa-lightbulb')
GO
INSERT [dbo].[Amenities] ([amenityID], [name], [icon]) VALUES (36, N'Thang máy', N'fas fa-elevator')
GO
SET IDENTITY_INSERT [dbo].[Amenities] OFF
GO
SET IDENTITY_INSERT [dbo].[Articles] ON 
GO
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (5, N'Tổng hợp những món ăn đặc sản Quảng Trị đậm chất miền Trung dân dã', N'<blockquote><figure class="media"><oembed url="https://www.youtube.com/watch?v=N1yO6dafJAg"></oembed></figure></blockquote><p><i>Hãy cùng HuyStay khám phá những món ăn đặc sản độc đáo, có 1-0-2 tại Quảng Trị bạn nhé!</i></p><h2><strong>Nem lụi</strong></h2><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/1570/nem-lui-cho-sai.jpeg" alt="Nem lụi chợ Sãi" width="1239" height="823"></p><p><i>Nem lụi chợ Sãi thơm ngon khó cưỡng</i></p><p>Nguyên liệu để làm món nem lụi, đặc sản tại chợ Sãi của Quảng Trị phải là thịt heo tươi roi rói cùng phần bì có độ đàn hồi tốt và các loại gia vị phổ thông như: đường, tiêu, bột ngọt,...</p><p>Tất cả các nguyên liệu được tẩm ướp và trộn lẫn với nhau tạo nên một tổng thể hỗn hợp mềm ẩm, dẻo dai.</p><p>Nem được ăn cùng bánh tráng và các loại rau sống tươi ngon, rau củ như: dưa chuột, chuối xanh, xoài xanh, đu đủ. Phần nước chấm được làm từ gan heo băm nhỏ với lạc, mè trắng, đậu tương và dứa chín.</p><h2><strong>Bún hến</strong></h2><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/1570/bun-hen-mai-xa.jpg" alt="Bún hến Mai Xá" width="2048" height="1536"></p><p><i>Món ăn dân dã của người dân Quảng Trị</i></p><p>Món ăn thứ hai trong danh sách đặc sản Quảng Trị mà chúng tôi muốn gửi đến bạn đó chính là bún hến Mai Xá.</p><p>Nguyên liệu không thể thiếu trong những bát bún hến đó chính con chắt chắt, một loại thuộc họ hến nhưng có hình dáng nhỏ hơn và phần màu đen đậm, vị ngọt khi ăn.</p><p>Một tô bún hến hoàn hảo sẽ bao gồm phần bún tươi, hến xào đậm đà và rau thơm ăn kèm. Nếu như khách hàng nào thích ăn những món có nước thì sẽ chan thêm nước dùng ninh xương thanh thanh.</p><h2><strong>Cháo cá vạt giường</strong></h2><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/1570/chao-ca-vat-giuong.jpg" alt="Món cháo phải ăn bằng đũa" width="720" height="540"></p><p><i>Món cháo phải ăn bằng đũa</i></p><p>Là người dân Quảng Trị thì chắc chắn bạn đã từng thưởng thức cháo cá vạt giường. Từ “vạt giường” ở đây có nghĩa là những sợi bột của cháo cá, phần hình khối dài giống chiếc vạt giường.&nbsp;</p><p>Người dân Quảng Trị thường có câu: “Người Quảng Trị ăn bánh canh giống như người Hà Nội ăn phở”.&nbsp;</p><p>Bánh canh được nấu bằng bột gạo, bột lọc hoặc thẩm chí là bột mì. Phần thịt cá nấu cùng được chọn từ những con cá lóc đồng to, săn chắc, thịt thơm, ngọt. Để cháo dậy vị, du khách khi thưởng thức có thể dùng cùng ớt và tiêu.</p><h2><strong>Thịt trâu lá trơng</strong></h2><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/1570/thit-trau-la-trong.jpeg" alt="Thịt trâu lá trơng" width="1280" height="720"></p><p><i>Thịt trâu lá trơng - Món ăn được nhiều khách du lịch săn đón</i></p><p>Lá trơng là một loại lá rừng phổ biến, đặc trưng, thường được người dân miền Trung sử dụng trong nhiều món ăn. Là có màu xanh đậm, hương vị hơi chát nhưng nếu ăn quen thì lại vô cùng cuốn hút và đưa miệng.</p><p>Thịt trâu nếu biết chế biến đúng cách thì sẽ rất mềm, đậm vị mà không bị dai. Du khách có thể chọn kiểu thịt trâu nướng, ăn chung cùng rau cải, tiêu, ớt xanh và nước tương.&nbsp;</p><h2><strong>Lòng sả</strong></h2><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/1570/long-sa-quang-tri.jpg" alt="Món lòng sả quảng trị" width="1200" height="860"></p><p><i>Một món ăn quen thuộc nhưng được chế biến theo cách vô cùng độc đáo của người Quảng Trị</i></p><p>Đặc sản của Quảng Trị khi nhắc tới đó chính là lòng sả. Không giống với món lòng tại Hà Nội, lòng sả Quảng Trị được chế biến rất cầu kỳ. Món ăn bao gồm nhiều ớt, thậm chí nếu không quen ăn cay thì bạn sẽ cảm thấy đến mức tê cả lưỡi.</p><p>Món ăn phù hợp để thưởng thức vào những ngày mưa mang lại cảm giác ấm bụng.</p><h2><strong>Bánh khoái</strong></h2><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/1570/banh-khoai-quang-tri.jpg" alt="Đặc sản ngon hết nấc tại Quảng TRị" width="512" height="342"></p><p><i>Đặc sản ngon hết nấc tại Quảng Trị</i></p><p>Món bánh khoái Quảng Trị có hình thức khá giống với bánh bèo Nam Bộ. Món ăn không chỉ đạt sự hoàn hảo về hương vị mà còn đáp ứng yêu cầu về thẩm mỹ khi kết hợp hài hòa giữa những màu sắc sặc sỡ, bắt mắt.</p><p>Điểm nhấn của món ăn chính là phần nước lèo “thần thánh” ăn cùng. Nước lèo được pha chế theo công thức đặc biệt, không đâu có được từ ruốc, gan và thịt nạc xay nhuyễn. Không những vậy nước còn được thêm chút lạc vừng giã nhỏ, tỏi, bột ớt,...cho trọn vị hơn.</p><h2><strong>Bánh ướt</strong></h2><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/1570/banh-uot-phuong-lang-quang-tri.jpg" alt="Đậm đà bánh ướt Quảng Trị" width="680" height="482"></p><p><i>Đậm đà bánh ướt Quảng Trị</i></p><p>Nhắc đến Phương Lang, Quảng Trị thì món ăn đầu tiên mà người ta nghĩ đến đó chính là bánh ướt. Tuy có cách làm khá đơn giản nhưng món ăn này yêu cầu người chế biến phải thật kéo tay để bánh không quá dày hay quá mỏng.</p><p>Ăn cùng bánh ướt là thịt heo luộc và phần rau sống tươi ngon, chấm thêm nước mắm pha đường và ớt cay, đậm đà.</p><h2><strong>Cà phê Khe Sanh</strong></h2><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/1570/ca-phe-khe-sanh.jpeg" alt="Cà phê Khe Sanh" width="680" height="453"></p><p><i>Cà phê Khe Sanh nức tiếng cả nước</i></p><p>Thị trấn Khe Sanh, tỉnh Quảng Trị được biết đến là địa phương đặc trưng với những ngọn đồi đất đỏ bazan. Nơi đây chính là xứ sở của những hạt cà phê thơm ngon. Cà phê sau khi được thu hoạch sẽ chế biến hoàn toàn thủ công để giữ được trọn vẹn hương vị.</p><p>Đây cũng chính là món quà phù hợp với những người du khách muốn mua quà về cho gia đình và bạn bè khi đi du lịch.&nbsp;</p><p>Với những món ăn đặc sản mà GoStay giới thiệu trong bài viết ở trên, hy vọng rằng mỗi người sẽ có cho mình được những kỷ niệm thật tuyệt vời tại mảnh đất “lửa” Quảng Trị nhé!</p>', N'/Images/20250530_120141.jpg', N'2b69edce-0836-485c-a5c0-126b11831c19', CAST(N'2025-05-30' AS Date), 1, N'Nếu như có một đám cưới nào mà nhà trai không cần phải đón dâu thì đó chính là lễ cưới của người')
GO
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (6, N'Nhà gái tự đưa dâu về nhà chồng - Phong tục truyền thống của người', N'<p><i>Trong bài viết ngày hôm nay, HuyStay sẽ mời bạn cùng chúng tôi khám phá và trải nghiệm làng nghề bánh đa Thổ Hà, Bắc Giang - một trong những làm nghề truyền thống nổi tiếng từ xưa tới nay.</i></p><h2><strong>Nguồn gốc làng nghề bánh đa Thổ Hà</strong></h2><p>Những người con Thổ Hà không chỉ tự hào rằng ngôi làng của mình như một “nhân chứng lịch sử”, trải qua bao thăng trầm của đất nước mà còn là nơi để lưu giữ bí quyết làm nghề, lưu truyền qua nhiều thế hệ.&nbsp;</p><p>Làng nghề Thổ Hà nằm tại xã Vân Hà, huyện Việt Yên, tỉnh Bắc Giang. Ngôi làng cổ nhỏ bé này từng nổi danh với nghề gốm Bắc. Sau đó, khi nghề gốm “lùi” về sau thì làng lại nổi tiếng với một món ăn vô cùng dân dã - đó chính là bánh đa và đa nem.</p><p>Từ những năm thập niên 90 đến nay, người ta đã truyền tai nhau về món bánh đa, bánh đa nem Thổ Hà với hương vị, màu sắc không thể lẫn vào đâu được.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/354/banh-da-nem-lang-nghe-co-tho-ha.jpg" alt="Bánh đa nem được phơi dưới những nếp nhà cổ" width="1500" height="1000"></p><p><i>Bánh đa nem được phơi dưới những nếp nhà cổ</i></p><p>Đường vào làng Thổ Hà quanh co, cùng những mái nhà đơn sơ, mộc mạc, nhuốm màu thời gian. Dưới ánh hoàng hôn ngọt lịm, khói bếp xám ngút cuốn theo chiều gió, mang hương gạo nếp rang lan tỏa khắp không gian.&nbsp;</p><p>Tiếng nổ lách tách của những mẻ bánh đa vàng rụm, đang hơ “mình” trên than hồng mới thật bình dị, chân chất biết bao.</p><h2><strong>Bí quyết của làng nghề bánh đa Thổ Hà</strong></h2><p>Làng có nhiều gia đình đã làm bánh đa, đa nem qua nhiều đời. Những người con Thổ Hà gắn liền với từng mẻ bánh thơm, giòn từ thuở thiếu thời.</p><p>Nghề đồng hành cùng họ, chứng kiến qua bao đổi thay, thăng trầm của làng.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/354/lang-nghe-banh-da-tho-ha.jpg" alt="Từng chiếc bánh đa giòn rụm, thơm phức" width="1600" height="1200"></p><p><i>Từng chiếc bánh đa giòn rụm, thơm phức</i></p><p>Nghề làm bánh đa không hề đơn giản, đòi hỏi người làm bánh phải tỉ mỉ, tinh tế trong từng công đoạn. Để một mẻ bánh mới có thể ra lò, những người con của làng nghề bánh đa Thổ Hà phải dậy từ sáng sớm tinh mơ để chuẩn bị nguyên liệu.</p><p>Từ việc chọn gạo, vo gạo, xay bột, tráng bánh, phơi bánh hay đóng gói đều đòi hỏi sự chăm chút, tập trung và cái tâm với nghề. Có như vậy thì từng chiếc bánh khi hoàn thiện xong mới có chất lượng đồng đều.</p><p>Gạo nếp làm bánh phải là loại ngon nhất, được vo sạch, sau đó xay thành bột thật mịn. Khó nhất để cho một chiếc bánh ra lò chính là công đoạn tráng.&nbsp;</p><p>Mặc cho đôi tay chai sần của người nghệ nhân làng nghề, từng tầm bánh mỏng tang, đều đặn vẫn được thoăn thoắt trải ra.&nbsp;</p><p>Miếng bánh tráng đều, không phải chỗ dày chỗ mỏng, đem ra nắng phơi khô nhưng vẫn giữ được độ dẻo dai nhất định.&nbsp;</p><p>Tấm bánh được phơi đạt yêu cầu, đem cắt thành miếng vuông vắn chính là sản phẩm bánh đa nem Thổ Hà.&nbsp;</p><p>Những chiếc bánh đa thì sẽ được tráng bột dày hơn, rắc thêm vừng, lạc và dừa ở bên trên. Sau khi phơi khô, bánh được đem nướng bếp củi thơm phức rồi mới bán.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/354/phoi-banh-da-tho-ha.jpg" alt="Phơi bánh đa làng Thổ Hà" width="2721" height="1814"></p><p><i>Công đoạn phơi bánh đa</i></p><h2><strong>Làng nghề bánh đa Thổ Hà truyền lửa cho thế hệ trẻ</strong></h2><p>Nghề truyền thống trân quý là vậy nhưng những người trẻ ngày nay lại ít mặn mà với nghề thủ công của làng. Các nghệ nhân lớn tuổi trong làng cho biết rằng, lý do thanh niên thường không lựa chọn theo nghề là vì làm bánh vất vả, thu nhập lại không cao.</p><p>Nhiều người lo lắng nếu cứ tiếp tục tình trạng như thế này thì làng nghề bánh đa Thổ Hà sẽ chỉ còn là một cái tên trong tiến trình lịch sử.&nbsp;</p><p>Những người nghệ nhân vô cùng trăn trở và muốn truyền lại nghề cho thế hệ trẻ để làng có thể tiếp tục được lưu truyền, giữ gìn và phát triển.&nbsp;</p><p>Rất may mắn rằng, nhờ sự tâm huyết của những người lớn tuổi trong làng, nhiều thanh niên đã nối tiếp truyền thống của ông cha, trở thành thợ làm bánh tiềm năng.</p><p>Hiện nay, làng nghề bánh đa, bánh đa nem Thổ Hà vẫn được lưu giữ đến tận bây giờ, trở thành biểu tượng và niềm tự hào của người dân địa phương.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/354/nguoi-tre-giu-gin-lang-nghe-banh-da-tho-ha.jpg" alt="Những người trẻ với khát khao muốn gìn giữ nghề truyền thống của quê hương" width="1000" height="1343"></p><p><i>Những người trẻ với khát khao muốn gìn giữ nghề truyền thống của quê hương</i></p><p>Cùng với sự chung tay của các cấp chính quyền, các tổ chức chính trị xã hội sẽ tiếp tục quan tâm và đồng hành cùng người dân trong việc sản xuất, kinh doanh bánh đa, bánh đa nem.</p><p>Đồng thời, làng nghề cũng có thể xây dựng và quảng bá hình ảnh của mình ra thị trường trong nước và quốc tế thông qua những sản phẩm du lịch trải nghiệm ngay tại địa phương.</p><p>Có như vậy thì lửa nghề mới được lưu truyền qua nhiều đời mà vẫn đảm bảo cho dân làng có được nguồn thu nhập ổn định và bền vững.</p><p>Nếu các bạn chưa được thử cảm giác miếng bánh đa thơm bùi, giòn rụm cùng chút ngậy của dừa và vừng làng Thổ Hà thì sau khi đọc xong bài viết này hãy trải nghiệm ngay nhé!</p>', N'/Images/20250530_120158.jpg', N'2b69edce-0836-485c-a5c0-126b11831c19', CAST(N'2025-05-30' AS Date), 1, N'Nếu như có một đám cưới nào mà nhà trai không cần phải đón dâu thì đó chính là lễ cưới của người')
GO
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (7, N'Nhà gái tự đưa dâu về nhà chồng - Phong tục truyền thống của người', N'<p><i>Trong bài viết ngày hôm nay, GoStay sẽ mời bạn cùng chúng tôi khám phá và trải nghiệm làng nghề bánh đa Thổ Hà, Bắc Giang - một trong những làm nghề truyền thống nổi tiếng từ xưa tới nay.</i></p><h2><strong>Nguồn gốc làng nghề bánh đa Thổ Hà</strong></h2><p>Những người con Thổ Hà không chỉ tự hào rằng ngôi làng của mình như một “nhân chứng lịch sử”, trải qua bao thăng trầm của đất nước mà còn là nơi để lưu giữ bí quyết làm nghề, lưu truyền qua nhiều thế hệ.&nbsp;</p><p>Làng nghề Thổ Hà nằm tại xã Vân Hà, huyện Việt Yên, tỉnh Bắc Giang. Ngôi làng cổ nhỏ bé này từng nổi danh với nghề gốm Bắc. Sau đó, khi nghề gốm “lùi” về sau thì làng lại nổi tiếng với một món ăn vô cùng dân dã - đó chính là bánh đa và đa nem.</p><p>Từ những năm thập niên 90 đến nay, người ta đã truyền tai nhau về món bánh đa, bánh đa nem Thổ Hà với hương vị, màu sắc không thể lẫn vào đâu được.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/354/banh-da-nem-lang-nghe-co-tho-ha.jpg" alt="Bánh đa nem được phơi dưới những nếp nhà cổ" width="1500" height="1000"></p><p><i>Bánh đa nem được phơi dưới những nếp nhà cổ</i></p><p>Đường vào làng Thổ Hà quanh co, cùng những mái nhà đơn sơ, mộc mạc, nhuốm màu thời gian. Dưới ánh hoàng hôn ngọt lịm, khói bếp xám ngút cuốn theo chiều gió, mang hương gạo nếp rang lan tỏa khắp không gian.&nbsp;</p><p>Tiếng nổ lách tách của những mẻ bánh đa vàng rụm, đang hơ “mình” trên than hồng mới thật bình dị, chân chất biết bao.</p><h2><strong>Bí quyết của làng nghề bánh đa Thổ Hà</strong></h2><p>Làng có nhiều gia đình đã làm bánh đa, đa nem qua nhiều đời. Những người con Thổ Hà gắn liền với từng mẻ bánh thơm, giòn từ thuở thiếu thời.</p><p>Nghề đồng hành cùng họ, chứng kiến qua bao đổi thay, thăng trầm của làng.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/354/lang-nghe-banh-da-tho-ha.jpg" alt="Từng chiếc bánh đa giòn rụm, thơm phức" width="1600" height="1200"></p><p><i>Từng chiếc bánh đa giòn rụm, thơm phức</i></p><p>Nghề làm bánh đa không hề đơn giản, đòi hỏi người làm bánh phải tỉ mỉ, tinh tế trong từng công đoạn. Để một mẻ bánh mới có thể ra lò, những người con của làng nghề bánh đa Thổ Hà phải dậy từ sáng sớm tinh mơ để chuẩn bị nguyên liệu.</p><p>Từ việc chọn gạo, vo gạo, xay bột, tráng bánh, phơi bánh hay đóng gói đều đòi hỏi sự chăm chút, tập trung và cái tâm với nghề. Có như vậy thì từng chiếc bánh khi hoàn thiện xong mới có chất lượng đồng đều.</p><p>Gạo nếp làm bánh phải là loại ngon nhất, được vo sạch, sau đó xay thành bột thật mịn. Khó nhất để cho một chiếc bánh ra lò chính là công đoạn tráng.&nbsp;</p><p>Mặc cho đôi tay chai sần của người nghệ nhân làng nghề, từng tầm bánh mỏng tang, đều đặn vẫn được thoăn thoắt trải ra.&nbsp;</p><p>Miếng bánh tráng đều, không phải chỗ dày chỗ mỏng, đem ra nắng phơi khô nhưng vẫn giữ được độ dẻo dai nhất định.&nbsp;</p><p>Tấm bánh được phơi đạt yêu cầu, đem cắt thành miếng vuông vắn chính là sản phẩm bánh đa nem Thổ Hà.&nbsp;</p><p>Những chiếc bánh đa thì sẽ được tráng bột dày hơn, rắc thêm vừng, lạc và dừa ở bên trên. Sau khi phơi khô, bánh được đem nướng bếp củi thơm phức rồi mới bán.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/354/phoi-banh-da-tho-ha.jpg" alt="Phơi bánh đa làng Thổ Hà" width="2721" height="1814"></p><p><i>Công đoạn phơi bánh đa</i></p><h2><strong>Làng nghề bánh đa Thổ Hà truyền lửa cho thế hệ trẻ</strong></h2><p>Nghề truyền thống trân quý là vậy nhưng những người trẻ ngày nay lại ít mặn mà với nghề thủ công của làng. Các nghệ nhân lớn tuổi trong làng cho biết rằng, lý do thanh niên thường không lựa chọn theo nghề là vì làm bánh vất vả, thu nhập lại không cao.</p><p>Nhiều người lo lắng nếu cứ tiếp tục tình trạng như thế này thì làng nghề bánh đa Thổ Hà sẽ chỉ còn là một cái tên trong tiến trình lịch sử.&nbsp;</p><p>Những người nghệ nhân vô cùng trăn trở và muốn truyền lại nghề cho thế hệ trẻ để làng có thể tiếp tục được lưu truyền, giữ gìn và phát triển.&nbsp;</p><p>Rất may mắn rằng, nhờ sự tâm huyết của những người lớn tuổi trong làng, nhiều thanh niên đã nối tiếp truyền thống của ông cha, trở thành thợ làm bánh tiềm năng.</p><p>Hiện nay, làng nghề bánh đa, bánh đa nem Thổ Hà vẫn được lưu giữ đến tận bây giờ, trở thành biểu tượng và niềm tự hào của người dân địa phương.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/354/nguoi-tre-giu-gin-lang-nghe-banh-da-tho-ha.jpg" alt="Những người trẻ với khát khao muốn gìn giữ nghề truyền thống của quê hương" width="1000" height="1343"></p><p><i>Những người trẻ với khát khao muốn gìn giữ nghề truyền thống của quê hương</i></p><p>Cùng với sự chung tay của các cấp chính quyền, các tổ chức chính trị xã hội sẽ tiếp tục quan tâm và đồng hành cùng người dân trong việc sản xuất, kinh doanh bánh đa, bánh đa nem.</p><p>Đồng thời, làng nghề cũng có thể xây dựng và quảng bá hình ảnh của mình ra thị trường trong nước và quốc tế thông qua những sản phẩm du lịch trải nghiệm ngay tại địa phương.</p><p>Có như vậy thì lửa nghề mới được lưu truyền qua nhiều đời mà vẫn đảm bảo cho dân làng có được nguồn thu nhập ổn định và bền vững.</p><p>Nếu các bạn chưa được thử cảm giác miếng bánh đa thơm bùi, giòn rụm cùng chút ngậy của dừa và vừng làng Thổ Hà thì sau khi đọc xong bài viết này hãy trải nghiệm ngay nhé!</p>', N'/Images/20250530_120213.jpg', N'2b69edce-0836-485c-a5c0-126b11831c19', CAST(N'2025-05-30' AS Date), 1, N'Nếu như có một đám cưới nào mà nhà trai không cần phải đón dâu thì đó chính là lễ cưới của người')
GO
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (8, N'Nét đẹp cố đô: Nông dân chèo thuyền gặt lúa giữa miền di sản', N'<p><i>Nếu có dịp ghé thăm Ninh Bình vào mùa hè này thì bạn đừng bỏ qua nét đẹp cố đô độc đáo khi ngắm nhìn những người nông dân chèo thuyền tại Tam Cốc Bích Động để gặt những mẻ lúa vàng xuộm, thích mắt nhé!</i></p><h2><strong>Tam Cốc Bích Động - Địa điểm du lịch nổi tiếng của Ninh Bình</strong></h2><p>Nổi tiếng nhất trong những nét đẹp cố đô Ninh Bình với danh xưng “nam thiên đệ nhị động” chính là động Tam Cốc. Nơi đây sở hữu cảnh sắc thiên nhiên làng quê yên bình với hệ thống hang động núi đá vôi đồ sộ.</p><p>Khu Tam Cốc Bích Động thì là một phần danh lam, nằm trong quần thể danh thắng Tràng An, Ninh Bình. Đây là địa điểm hoàn hảo cho những ai yêu thích vẻ đẹp thiên nhiên hoang sơ, gần gũi, kết hợp cùng với nhịp sống thường nhật, bình dị của người dân.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/358/net-dep-co-do.jpg" alt="Địa danh không thể bỏ qua khi tới Ninh Bình" width="1200" height="720"></p><p><i>Địa danh không thể bỏ qua khi tới Ninh Bình</i></p><p>Thời gian đẹp nhất để đến với Tam Cốc Bích Động là vào tháng 1 đến tháng 3 âm. Khi ấy thì khí hậu tương đối dễ chịu, thoáng mát và không có mưa nhiều. Điều này sẽ giúp cho chuyến đi của bạn trở nên toàn vẹn hơn.</p><p>Một trong những khoảng thời gian khác mà bạn cũng có thể cân nhắc tới thăm Tam Cốc Bích Động đó chính là vào cuối tháng 5, đầu tháng 6. Tới đây, bạn chắc chắn sẽ choáng ngợp trước cảnh sắc sặc sỡ của những cánh đồng lúa trổ đòng đòng với những bông lúa trĩu nặng.</p><h2><strong>Chiêm ngưỡng nét đẹp cố đô vào mùa lúa chín</strong></h2><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/358/net-dep-co-do-mua-lua-chin.jpg" alt="Nét đẹp cố đô mùa lúa chín" width="1200" height="801"></p><p><i>Nét đẹp cố đô mùa lúa chín</i></p><p>Chắc chắn bạn sẽ không thể nào quên được hình ảnh những con thuyền mộc mạc, chở khách muôn phương về nơi đây để vãn cảnh. Con thuyền lững lờ trôi trên dòng sông Ngô Đồng hiền hòa, thơ mộng.</p><p>Hai bên dòng sông là cánh đồng lúa đang mùa trổ bông, lay nhẹ theo từng cơn gió như những tấm thảm vàng lóng lánh. Tấm thảm khổng lồ uốn lượn theo từng cơn sóng nước.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/358/canh-dong-tam-coc-1.jpg" alt="Khung cảnh yên bình của vùng cố đô" width="1280" height="934"></p><p><i>Khung cảnh yên bình của vùng cố đô</i></p><p>Bảo quanh là núi non hùng vĩ, đứng sừng sững như tạc vào trời xanh.&nbsp;</p><p>Nơi đây cũng từng được chuyên trang du lịch quốc tế Business Insider bình chọn là một trong 5 cánh đồng lúa đẹp nhất Việt Nam.</p><p>Với mỗi người dân ta thì từ bao đời nay, lúa nước không chỉ được sử dụng làm lương thực, mà nó còn trở thành một biểu tượng văn hóa, du lịch, đại diện cho nền văn minh lúa nước lâu đời của người Việt cổ.&nbsp;</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/358/canh-dong-tam-coc.jpg" alt="Nụ cười của những người nông dân thu hoạch mùa lúa chín" width="2000" height="1334"></p><p><i>Nụ cười của những người nông dân thu hoạch mùa lúa chín</i></p><p>Để có thể thu hoạch được vụ mùa, từ sáng sớm, những người nông dân đã dậy từ sớm, chuẩn bị thuyền để chở lúa về bên sông, nơi chiếc máy tuốt lúa đã sẵn sàng hoạt động. Từng hạt thóc tròn mẩy, vàng xuộm báo hiệu cho một mùa vàng bội thu, ấm no.&nbsp;</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/358/tam-coc-bich-dong.jpg" alt="Những chiếc thuyền chở đầy ắp lúa chín" width="1848" height="1294"></p><p><i>Những chiếc thuyền chở đầy ắp lúa chín</i></p><p>Thế nhưng, để có được thành quả như vậy thì người dân nơi đây đã phải vất vả, chăm chỉ, chịu khó hơn rất nhiều lần so với việc canh tác trên cánh đồng thông thường. Mọi giai đoạn đều được làm thủ công.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/358/tam-coc-bich-dong-1.jpg" alt="Nụ cười hồn hậu của người nông dân " width="986" height="720"></p><p><i>Nụ cười hồn hậu của người nông dân&nbsp;</i></p><p>Toàn bộ khu vực cánh đồng Tam Cốc có diện tích lên tới hơn 18ha. Năm nào thời tiết mưa thuận gió hòa, “trời thương” thì sẽ đạt sản lượng từ 1.5 - 2 tạ/sào. Và mỗi năm thì người dân chỉ cấy duy nhất một vụ mùa.</p><p>Những thời gian khác trong năm, người dân sẽ chèo đò, chở khách du lịch tham quan Tam Cốc Bích Động. Trong một vài năm trở lại đây, người dân còn sáng tạo, nuôi cấy những cánh đồng của mình thành các bức tranh khổng lồ để thu hút khách tham quan.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/358/net-dep-co-do-1.jpeg" alt="Nét đẹp cố đô từ góc nhìn từ trên cao xuống" width="960" height="540"></p><p><i>Nét đẹp cố đô từ góc nhìn từ trên cao xuống</i></p><p>Điều này không chỉ cho thấy sự quyết tâm của người dân mà còn cho thấy sự tài tình, khéo léo và sáng tạo của những người nông dân.</p><p>Nổi bật nhất trong năm nay là bức tranh “Mục đồng thổi sáo” được triển khai trên diện tích rộng hơn 10.000m2. Du lịch vào mùa này, khách tham quan không những được chiêm ngưỡng cảnh sắc thiên nhiên tươi đẹp mà còn được làm quen, giao lưu với con người nơi đây.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/358/buc-tranh-muc-dong-thoi-sao.jpg" alt="Bức tranh " width="2560" height="1520"></p><p><i>Bức tranh "Mục đồng thổi sáo"</i></p><p>Sau khi đọc xong bài viết của chúng tôi, chắc hẳn các bạn đang rất muốn tham quan và trải nghiệm khu du lịch này rồi phải không nào? Vậy thì còn chần chờ gì nữa mà không xách balo lên và đi thôi!</p>', N'/Images/20250530_120230.jpg', N'2b69edce-0836-485c-a5c0-126b11831c19', CAST(N'2025-05-30' AS Date), 1, N'Nếu như có một đám cưới nào mà nhà trai không cần phải đón dâu thì đó chính là lễ cưới của người')
GO
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (1006, N'Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái', N'<h3><strong>Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái</strong></h3><p>05/07/2024 - Admin Gostay</p><p><i>Nhắc đến Mù Cang Chải, nhiều người sẽ nghĩ ngay tới những thửa ruộng bậc thang mênh mông tít tắp, trải dài khắp nơi. Thế nhưng, Mù Cang Chải còn được gắn liền với một loài hoa có tên vô cùng đặc biệt - hoa tớ dày. Hãy cùng chúng tôi ngắm nhìn sắc đẹp của loài hoa độc đáo này trong bài viết dưới đây nhé!</i></p><h2><strong>Sắc hoa tớ dày miền di sản</strong></h2><p>Tớ dày "uống sương", "ngậm gió" lạnh những ngày mùa đông rét buốt của vùng cao Mù Cang Chải để rồi khi xuân về, từng bông hoa hồng rực bung nở "mạnh mẽ" cũng giống như sức sống của người nới đây.</p><p>Hoa nở hồng của nương đồi, sườn non cao, dọc con đường ngoằn nghèo vào bản hay bên hiên những mái nhà tranh phảng phất khói sương. Tất cả tạo nên một bức tranh vừa hùng vĩ nhưng cũng vô cùng lãng mạn, mềm mại làm say đắm trái tim người du khách.</p><p>Đây là loài hoa thuộc họ đào, được người Mông gọi bằng tên "Pằng Tớ dày", theo tiếng việt có nghĩa là "hoa đào rừng".</p><p>Cây thuộc giống thân gỗ, có phần tán mọc xòe rộng, trải khắp sườn đồi, triền núi. Bông hoa bản dày, có 5 cánh, màu hồng sắc. Khi nở hoa kết chùm lại, nhị hoa dài có màu đỏ rực rỡ.&nbsp;</p><p>Loài hoa này có gắn bó mật thiết với cuộc sống của đồng bào người Mông nơi đây. Họ quan niệm rằng mùa Xuân là thời khắc đất trời chuyển mình, sau một năm lao động vất vả, mùa vàng bội thu, thóc lúa đầy nhà nên người dân sẽ cùng nhau ăn mừng.</p><p>Khi những cây tớ dày nở hoa hồng rực rỡ cả một góc trời cũng là lúc các&nbsp;chàng trai, cô gái Mông xúng xính trong bộ váy mới, luyện khèn, chuẩn bị quả Pao để chơi Tết, du xuân.</p><p>Loài hoa Tớ dày gắn liền với đời sống nhiều thế hệ người Mông vùng cao Mù Cang Chải. Loại hoa có sức sống mãnh liệt, tượng trưng cho sức sống của con người nơi đây.&nbsp;</p><p>Sau khoảng thời gian đó tuy chưa tàn hết nhưng màu sắc cũng sẽ phai nhưng vẫn giữ được vẻ đẹp e lệ, cuốn hút.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-5.jpg" alt="Hoa tớ dày bên những cung đường quanh co" width="1920" height="1493"></p><p><i>Hoa tớ dày và bản làng Mù Cang Chải cùng những con đường quanh co, uốn lượn</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-1.jpg" alt="Khoảnh khắc đáng yêu của đồng bào dân tộc" width="1920" height="1280"></i></p><p><i>Cô gái và chàng trai bản thổi nhau nghe khúc nhạc tình lãng mạn với cành hoa thớ dày sau lưng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-2.jpg" alt="Nụ cười hồn hậu của người dân tộc" width="1920" height="1280"></i></p><p><i>Những đứa trẻ lớn lên tại vùng cao nghèo khó nhưng sức sống mãnh liệt hệt như bông hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-yen-bai.jpg" alt="Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng" width="1920" height="1280"></i></p><p><i>Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day.jpg" alt="Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn" width="1920" height="1280"></i></p><p><i>Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn nhưng lúc nào cũng ngập tràn niềm vui</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/sac-hoa-to-day.jpg" alt="Vẻ đẹp của hoa thớ dày từ trên cao xuống" width="1920" height="1280"></i></p><p><i>Vẻ đẹp của hoa thớ dày từ trên cao xuống</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/tinh-yeu-doi-lua-duoi-hoa-to-day.jpg" alt="Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng" width="1920" height="1280"></i></p><p><i>Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day-mu-cang-chai.jpg" alt="Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày" width="1920" height="1363"></i></p><p><i>Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day.jpg" alt="Vẻ đẹp xao xuyến của từng bông hoa" width="1920" height="1271"></i></p><p><i>Vẻ đẹp xao xuyến của từng bông hoa</i></p><p>Còn chần chờ gì nữa mà không lên lịch ngay cho mình để ngắm sắc đẹp thướt tha, yêu kiều, dịu dàng của loài hoa này trên rẻo cao Mù Cang Chải thôi nào bạn ơi!</p>', N'/Images/20241216_133203.jpg', N'2b69edce-0836-485c-a5c0-126b11831c19', CAST(N'2024-12-16' AS Date), 2, N'Ẩm thực ba miền')
GO
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (1007, N'Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái', N'<h3><strong>Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái</strong></h3><p>05/07/2024 - Admin Gostay</p><p><i>Nhắc đến Mù Cang Chải, nhiều người sẽ nghĩ ngay tới những thửa ruộng bậc thang mênh mông tít tắp, trải dài khắp nơi. Thế nhưng, Mù Cang Chải còn được gắn liền với một loài hoa có tên vô cùng đặc biệt - hoa tớ dày. Hãy cùng chúng tôi ngắm nhìn sắc đẹp của loài hoa độc đáo này trong bài viết dưới đây nhé!</i></p><h2><strong>Sắc hoa tớ dày miền di sản</strong></h2><p>Tớ dày "uống sương", "ngậm gió" lạnh những ngày mùa đông rét buốt của vùng cao Mù Cang Chải để rồi khi xuân về, từng bông hoa hồng rực bung nở "mạnh mẽ" cũng giống như sức sống của người nới đây.</p><p>Hoa nở hồng của nương đồi, sườn non cao, dọc con đường ngoằn nghèo vào bản hay bên hiên những mái nhà tranh phảng phất khói sương. Tất cả tạo nên một bức tranh vừa hùng vĩ nhưng cũng vô cùng lãng mạn, mềm mại làm say đắm trái tim người du khách.</p><p>Đây là loài hoa thuộc họ đào, được người Mông gọi bằng tên "Pằng Tớ dày", theo tiếng việt có nghĩa là "hoa đào rừng".</p><p>Cây thuộc giống thân gỗ, có phần tán mọc xòe rộng, trải khắp sườn đồi, triền núi. Bông hoa bản dày, có 5 cánh, màu hồng sắc. Khi nở hoa kết chùm lại, nhị hoa dài có màu đỏ rực rỡ.&nbsp;</p><p>Loài hoa này có gắn bó mật thiết với cuộc sống của đồng bào người Mông nơi đây. Họ quan niệm rằng mùa Xuân là thời khắc đất trời chuyển mình, sau một năm lao động vất vả, mùa vàng bội thu, thóc lúa đầy nhà nên người dân sẽ cùng nhau ăn mừng.</p><p>Khi những cây tớ dày nở hoa hồng rực rỡ cả một góc trời cũng là lúc các&nbsp;chàng trai, cô gái Mông xúng xính trong bộ váy mới, luyện khèn, chuẩn bị quả Pao để chơi Tết, du xuân.</p><p>Loài hoa Tớ dày gắn liền với đời sống nhiều thế hệ người Mông vùng cao Mù Cang Chải. Loại hoa có sức sống mãnh liệt, tượng trưng cho sức sống của con người nơi đây.&nbsp;</p><p>Sau khoảng thời gian đó tuy chưa tàn hết nhưng màu sắc cũng sẽ phai nhưng vẫn giữ được vẻ đẹp e lệ, cuốn hút.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-5.jpg" alt="Hoa tớ dày bên những cung đường quanh co" width="1920" height="1493"></p><p><i>Hoa tớ dày và bản làng Mù Cang Chải cùng những con đường quanh co, uốn lượn</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-1.jpg" alt="Khoảnh khắc đáng yêu của đồng bào dân tộc" width="1920" height="1280"></i></p><p><i>Cô gái và chàng trai bản thổi nhau nghe khúc nhạc tình lãng mạn với cành hoa thớ dày sau lưng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-2.jpg" alt="Nụ cười hồn hậu của người dân tộc" width="1920" height="1280"></i></p><p><i>Những đứa trẻ lớn lên tại vùng cao nghèo khó nhưng sức sống mãnh liệt hệt như bông hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-yen-bai.jpg" alt="Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng" width="1920" height="1280"></i></p><p><i>Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day.jpg" alt="Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn" width="1920" height="1280"></i></p><p><i>Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn nhưng lúc nào cũng ngập tràn niềm vui</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/sac-hoa-to-day.jpg" alt="Vẻ đẹp của hoa thớ dày từ trên cao xuống" width="1920" height="1280"></i></p><p><i>Vẻ đẹp của hoa thớ dày từ trên cao xuống</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/tinh-yeu-doi-lua-duoi-hoa-to-day.jpg" alt="Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng" width="1920" height="1280"></i></p><p><i>Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day-mu-cang-chai.jpg" alt="Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày" width="1920" height="1363"></i></p><p><i>Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day.jpg" alt="Vẻ đẹp xao xuyến của từng bông hoa" width="1920" height="1271"></i></p><p><i>Vẻ đẹp xao xuyến của từng bông hoa</i></p><p>Còn chần chờ gì nữa mà không lên lịch ngay cho mình để ngắm sắc đẹp thướt tha, yêu kiều, dịu dàng của loài hoa này trên rẻo cao Mù Cang Chải thôi nào bạn ơi!</p>', N'/Images/20241216_132654.png', N'2b69edce-0836-485c-a5c0-126b11831c19', CAST(N'2024-12-16' AS Date), 2, N'Ẩm thực ba miền')
GO
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (1008, N'Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái', N'<h3><strong>Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái</strong></h3><p>05/07/2024 - Admin Gostay</p><p><i>Nhắc đến Mù Cang Chải, nhiều người sẽ nghĩ ngay tới những thửa ruộng bậc thang mênh mông tít tắp, trải dài khắp nơi. Thế nhưng, Mù Cang Chải còn được gắn liền với một loài hoa có tên vô cùng đặc biệt - hoa tớ dày. Hãy cùng chúng tôi ngắm nhìn sắc đẹp của loài hoa độc đáo này trong bài viết dưới đây nhé!</i></p><h2><strong>Sắc hoa tớ dày miền di sản</strong></h2><p>Tớ dày "uống sương", "ngậm gió" lạnh những ngày mùa đông rét buốt của vùng cao Mù Cang Chải để rồi khi xuân về, từng bông hoa hồng rực bung nở "mạnh mẽ" cũng giống như sức sống của người nới đây.</p><p>Hoa nở hồng của nương đồi, sườn non cao, dọc con đường ngoằn nghèo vào bản hay bên hiên những mái nhà tranh phảng phất khói sương. Tất cả tạo nên một bức tranh vừa hùng vĩ nhưng cũng vô cùng lãng mạn, mềm mại làm say đắm trái tim người du khách.</p><p>Đây là loài hoa thuộc họ đào, được người Mông gọi bằng tên "Pằng Tớ dày", theo tiếng việt có nghĩa là "hoa đào rừng".</p><p>Cây thuộc giống thân gỗ, có phần tán mọc xòe rộng, trải khắp sườn đồi, triền núi. Bông hoa bản dày, có 5 cánh, màu hồng sắc. Khi nở hoa kết chùm lại, nhị hoa dài có màu đỏ rực rỡ.&nbsp;</p><p>Loài hoa này có gắn bó mật thiết với cuộc sống của đồng bào người Mông nơi đây. Họ quan niệm rằng mùa Xuân là thời khắc đất trời chuyển mình, sau một năm lao động vất vả, mùa vàng bội thu, thóc lúa đầy nhà nên người dân sẽ cùng nhau ăn mừng.</p><p>Khi những cây tớ dày nở hoa hồng rực rỡ cả một góc trời cũng là lúc các&nbsp;chàng trai, cô gái Mông xúng xính trong bộ váy mới, luyện khèn, chuẩn bị quả Pao để chơi Tết, du xuân.</p><p>Loài hoa Tớ dày gắn liền với đời sống nhiều thế hệ người Mông vùng cao Mù Cang Chải. Loại hoa có sức sống mãnh liệt, tượng trưng cho sức sống của con người nơi đây.&nbsp;</p><p>Sau khoảng thời gian đó tuy chưa tàn hết nhưng màu sắc cũng sẽ phai nhưng vẫn giữ được vẻ đẹp e lệ, cuốn hút.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-5.jpg" alt="Hoa tớ dày bên những cung đường quanh co" width="1920" height="1493"></p><p><i>Hoa tớ dày và bản làng Mù Cang Chải cùng những con đường quanh co, uốn lượn</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-1.jpg" alt="Khoảnh khắc đáng yêu của đồng bào dân tộc" width="1920" height="1280"></i></p><p><i>Cô gái và chàng trai bản thổi nhau nghe khúc nhạc tình lãng mạn với cành hoa thớ dày sau lưng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-2.jpg" alt="Nụ cười hồn hậu của người dân tộc" width="1920" height="1280"></i></p><p><i>Những đứa trẻ lớn lên tại vùng cao nghèo khó nhưng sức sống mãnh liệt hệt như bông hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-yen-bai.jpg" alt="Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng" width="1920" height="1280"></i></p><p><i>Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day.jpg" alt="Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn" width="1920" height="1280"></i></p><p><i>Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn nhưng lúc nào cũng ngập tràn niềm vui</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/sac-hoa-to-day.jpg" alt="Vẻ đẹp của hoa thớ dày từ trên cao xuống" width="1920" height="1280"></i></p><p><i>Vẻ đẹp của hoa thớ dày từ trên cao xuống</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/tinh-yeu-doi-lua-duoi-hoa-to-day.jpg" alt="Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng" width="1920" height="1280"></i></p><p><i>Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day-mu-cang-chai.jpg" alt="Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày" width="1920" height="1363"></i></p><p><i>Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day.jpg" alt="Vẻ đẹp xao xuyến của từng bông hoa" width="1920" height="1271"></i></p><p><i>Vẻ đẹp xao xuyến của từng bông hoa</i></p><p>Còn chần chờ gì nữa mà không lên lịch ngay cho mình để ngắm sắc đẹp thướt tha, yêu kiều, dịu dàng của loài hoa này trên rẻo cao Mù Cang Chải thôi nào bạn ơi!</p>', N'/Images/20241216_132248.jpg', N'2b69edce-0836-485c-a5c0-126b11831c19', CAST(N'2024-12-16' AS Date), 1, N'Ẩm thực ba miền')
GO
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (1009, N'Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái', N'<h3><strong>Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái</strong></h3><p>05/07/2024 - Admin Gostay</p><p><i>Nhắc đến Mù Cang Chải, nhiều người sẽ nghĩ ngay tới những thửa ruộng bậc thang mênh mông tít tắp, trải dài khắp nơi. Thế nhưng, Mù Cang Chải còn được gắn liền với một loài hoa có tên vô cùng đặc biệt - hoa tớ dày. Hãy cùng chúng tôi ngắm nhìn sắc đẹp của loài hoa độc đáo này trong bài viết dưới đây nhé!</i></p><h2><strong>Sắc hoa tớ dày miền di sản</strong></h2><p>Tớ dày "uống sương", "ngậm gió" lạnh những ngày mùa đông rét buốt của vùng cao Mù Cang Chải để rồi khi xuân về, từng bông hoa hồng rực bung nở "mạnh mẽ" cũng giống như sức sống của người nới đây.</p><p>Hoa nở hồng của nương đồi, sườn non cao, dọc con đường ngoằn nghèo vào bản hay bên hiên những mái nhà tranh phảng phất khói sương. Tất cả tạo nên một bức tranh vừa hùng vĩ nhưng cũng vô cùng lãng mạn, mềm mại làm say đắm trái tim người du khách.</p><p>Đây là loài hoa thuộc họ đào, được người Mông gọi bằng tên "Pằng Tớ dày", theo tiếng việt có nghĩa là "hoa đào rừng".</p><p>Cây thuộc giống thân gỗ, có phần tán mọc xòe rộng, trải khắp sườn đồi, triền núi. Bông hoa bản dày, có 5 cánh, màu hồng sắc. Khi nở hoa kết chùm lại, nhị hoa dài có màu đỏ rực rỡ.&nbsp;</p><p>Loài hoa này có gắn bó mật thiết với cuộc sống của đồng bào người Mông nơi đây. Họ quan niệm rằng mùa Xuân là thời khắc đất trời chuyển mình, sau một năm lao động vất vả, mùa vàng bội thu, thóc lúa đầy nhà nên người dân sẽ cùng nhau ăn mừng.</p><p>Khi những cây tớ dày nở hoa hồng rực rỡ cả một góc trời cũng là lúc các&nbsp;chàng trai, cô gái Mông xúng xính trong bộ váy mới, luyện khèn, chuẩn bị quả Pao để chơi Tết, du xuân.</p><p>Loài hoa Tớ dày gắn liền với đời sống nhiều thế hệ người Mông vùng cao Mù Cang Chải. Loại hoa có sức sống mãnh liệt, tượng trưng cho sức sống của con người nơi đây.&nbsp;</p><p>Sau khoảng thời gian đó tuy chưa tàn hết nhưng màu sắc cũng sẽ phai nhưng vẫn giữ được vẻ đẹp e lệ, cuốn hút.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-5.jpg" alt="Hoa tớ dày bên những cung đường quanh co" width="1920" height="1493"></p><p><i>Hoa tớ dày và bản làng Mù Cang Chải cùng những con đường quanh co, uốn lượn</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-1.jpg" alt="Khoảnh khắc đáng yêu của đồng bào dân tộc" width="1920" height="1280"></i></p><p><i>Cô gái và chàng trai bản thổi nhau nghe khúc nhạc tình lãng mạn với cành hoa thớ dày sau lưng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-2.jpg" alt="Nụ cười hồn hậu của người dân tộc" width="1920" height="1280"></i></p><p><i>Những đứa trẻ lớn lên tại vùng cao nghèo khó nhưng sức sống mãnh liệt hệt như bông hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-yen-bai.jpg" alt="Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng" width="1920" height="1280"></i></p><p><i>Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day.jpg" alt="Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn" width="1920" height="1280"></i></p><p><i>Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn nhưng lúc nào cũng ngập tràn niềm vui</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/sac-hoa-to-day.jpg" alt="Vẻ đẹp của hoa thớ dày từ trên cao xuống" width="1920" height="1280"></i></p><p><i>Vẻ đẹp của hoa thớ dày từ trên cao xuống</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/tinh-yeu-doi-lua-duoi-hoa-to-day.jpg" alt="Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng" width="1920" height="1280"></i></p><p><i>Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day-mu-cang-chai.jpg" alt="Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày" width="1920" height="1363"></i></p><p><i>Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day.jpg" alt="Vẻ đẹp xao xuyến của từng bông hoa" width="1920" height="1271"></i></p><p><i>Vẻ đẹp xao xuyến của từng bông hoa</i></p><p>Còn chần chờ gì nữa mà không lên lịch ngay cho mình để ngắm sắc đẹp thướt tha, yêu kiều, dịu dàng của loài hoa này trên rẻo cao Mù Cang Chải thôi nào bạn ơi!</p>', N'/Images/20241216_132300.jpg', N'2b69edce-0836-485c-a5c0-126b11831c19', CAST(N'2024-12-16' AS Date), 1, N'Ẩm thực ba miền')
GO
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (1015, N'Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái', N'<h3><strong>Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái</strong></h3><p>05/07/2024 - Admin Gostay</p><p><i>Nhắc đến Mù Cang Chải, nhiều người sẽ nghĩ ngay tới những thửa ruộng bậc thang mênh mông tít tắp, trải dài khắp nơi. Thế nhưng, Mù Cang Chải còn được gắn liền với một loài hoa có tên vô cùng đặc biệt - hoa tớ dày. Hãy cùng chúng tôi ngắm nhìn sắc đẹp của loài hoa độc đáo này trong bài viết dưới đây nhé!</i></p><h2><strong>Sắc hoa tớ dày miền di sản</strong></h2><p>Tớ dày "uống sương", "ngậm gió" lạnh những ngày mùa đông rét buốt của vùng cao Mù Cang Chải để rồi khi xuân về, từng bông hoa hồng rực bung nở "mạnh mẽ" cũng giống như sức sống của người nới đây.</p><p>Hoa nở hồng của nương đồi, sườn non cao, dọc con đường ngoằn nghèo vào bản hay bên hiên những mái nhà tranh phảng phất khói sương. Tất cả tạo nên một bức tranh vừa hùng vĩ nhưng cũng vô cùng lãng mạn, mềm mại làm say đắm trái tim người du khách.</p><p>Đây là loài hoa thuộc họ đào, được người Mông gọi bằng tên "Pằng Tớ dày", theo tiếng việt có nghĩa là "hoa đào rừng".</p><p>Cây thuộc giống thân gỗ, có phần tán mọc xòe rộng, trải khắp sườn đồi, triền núi. Bông hoa bản dày, có 5 cánh, màu hồng sắc. Khi nở hoa kết chùm lại, nhị hoa dài có màu đỏ rực rỡ.&nbsp;</p><p>Loài hoa này có gắn bó mật thiết với cuộc sống của đồng bào người Mông nơi đây. Họ quan niệm rằng mùa Xuân là thời khắc đất trời chuyển mình, sau một năm lao động vất vả, mùa vàng bội thu, thóc lúa đầy nhà nên người dân sẽ cùng nhau ăn mừng.</p><p>Khi những cây tớ dày nở hoa hồng rực rỡ cả một góc trời cũng là lúc các&nbsp;chàng trai, cô gái Mông xúng xính trong bộ váy mới, luyện khèn, chuẩn bị quả Pao để chơi Tết, du xuân.</p><p>Loài hoa Tớ dày gắn liền với đời sống nhiều thế hệ người Mông vùng cao Mù Cang Chải. Loại hoa có sức sống mãnh liệt, tượng trưng cho sức sống của con người nơi đây.&nbsp;</p><p>Sau khoảng thời gian đó tuy chưa tàn hết nhưng màu sắc cũng sẽ phai nhưng vẫn giữ được vẻ đẹp e lệ, cuốn hút.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-5.jpg" alt="Hoa tớ dày bên những cung đường quanh co" width="1920" height="1493"></p><p><i>Hoa tớ dày và bản làng Mù Cang Chải cùng những con đường quanh co, uốn lượn</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-1.jpg" alt="Khoảnh khắc đáng yêu của đồng bào dân tộc" width="1920" height="1280"></i></p><p><i>Cô gái và chàng trai bản thổi nhau nghe khúc nhạc tình lãng mạn với cành hoa thớ dày sau lưng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-2.jpg" alt="Nụ cười hồn hậu của người dân tộc" width="1920" height="1280"></i></p><p><i>Những đứa trẻ lớn lên tại vùng cao nghèo khó nhưng sức sống mãnh liệt hệt như bông hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-yen-bai.jpg" alt="Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng" width="1920" height="1280"></i></p><p><i>Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day.jpg" alt="Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn" width="1920" height="1280"></i></p><p><i>Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn nhưng lúc nào cũng ngập tràn niềm vui</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/sac-hoa-to-day.jpg" alt="Vẻ đẹp của hoa thớ dày từ trên cao xuống" width="1920" height="1280"></i></p><p><i>Vẻ đẹp của hoa thớ dày từ trên cao xuống</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/tinh-yeu-doi-lua-duoi-hoa-to-day.jpg" alt="Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng" width="1920" height="1280"></i></p><p><i>Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day-mu-cang-chai.jpg" alt="Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày" width="1920" height="1363"></i></p><p><i>Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day.jpg" alt="Vẻ đẹp xao xuyến của từng bông hoa" width="1920" height="1271"></i></p><p><i>Vẻ đẹp xao xuyến của từng bông hoa</i></p><p>Còn chần chờ gì nữa mà không lên lịch ngay cho mình để ngắm sắc đẹp thướt tha, yêu kiều, dịu dàng của loài hoa này trên rẻo cao Mù Cang Chải thôi nào bạn ơi!</p>', N'/Images/20241216_133221.jpg', N'2b69edce-0836-485c-a5c0-126b11831c19', CAST(N'2024-12-16' AS Date), 2, N'Ẩm thực ba miền')
GO
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (1016, N'Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái', N'<h3><strong>Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái</strong></h3><p>05/07/2024 - Admin Gostay</p><p><i>Nhắc đến Mù Cang Chải, nhiều người sẽ nghĩ ngay tới những thửa ruộng bậc thang mênh mông tít tắp, trải dài khắp nơi. Thế nhưng, Mù Cang Chải còn được gắn liền với một loài hoa có tên vô cùng đặc biệt - hoa tớ dày. Hãy cùng chúng tôi ngắm nhìn sắc đẹp của loài hoa độc đáo này trong bài viết dưới đây nhé!</i></p><h2><strong>Sắc hoa tớ dày miền di sản</strong></h2><p>Tớ dày "uống sương", "ngậm gió" lạnh những ngày mùa đông rét buốt của vùng cao Mù Cang Chải để rồi khi xuân về, từng bông hoa hồng rực bung nở "mạnh mẽ" cũng giống như sức sống của người nới đây.</p><p>Hoa nở hồng của nương đồi, sườn non cao, dọc con đường ngoằn nghèo vào bản hay bên hiên những mái nhà tranh phảng phất khói sương. Tất cả tạo nên một bức tranh vừa hùng vĩ nhưng cũng vô cùng lãng mạn, mềm mại làm say đắm trái tim người du khách.</p><p>Đây là loài hoa thuộc họ đào, được người Mông gọi bằng tên "Pằng Tớ dày", theo tiếng việt có nghĩa là "hoa đào rừng".</p><p>Cây thuộc giống thân gỗ, có phần tán mọc xòe rộng, trải khắp sườn đồi, triền núi. Bông hoa bản dày, có 5 cánh, màu hồng sắc. Khi nở hoa kết chùm lại, nhị hoa dài có màu đỏ rực rỡ.&nbsp;</p><p>Loài hoa này có gắn bó mật thiết với cuộc sống của đồng bào người Mông nơi đây. Họ quan niệm rằng mùa Xuân là thời khắc đất trời chuyển mình, sau một năm lao động vất vả, mùa vàng bội thu, thóc lúa đầy nhà nên người dân sẽ cùng nhau ăn mừng.</p><p>Khi những cây tớ dày nở hoa hồng rực rỡ cả một góc trời cũng là lúc các&nbsp;chàng trai, cô gái Mông xúng xính trong bộ váy mới, luyện khèn, chuẩn bị quả Pao để chơi Tết, du xuân.</p><p>Loài hoa Tớ dày gắn liền với đời sống nhiều thế hệ người Mông vùng cao Mù Cang Chải. Loại hoa có sức sống mãnh liệt, tượng trưng cho sức sống của con người nơi đây.&nbsp;</p><p>Sau khoảng thời gian đó tuy chưa tàn hết nhưng màu sắc cũng sẽ phai nhưng vẫn giữ được vẻ đẹp e lệ, cuốn hút.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-5.jpg" alt="Hoa tớ dày bên những cung đường quanh co" width="1920" height="1493"></p><p><i>Hoa tớ dày và bản làng Mù Cang Chải cùng những con đường quanh co, uốn lượn</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-1.jpg" alt="Khoảnh khắc đáng yêu của đồng bào dân tộc" width="1920" height="1280"></i></p><p><i>Cô gái và chàng trai bản thổi nhau nghe khúc nhạc tình lãng mạn với cành hoa thớ dày sau lưng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-2.jpg" alt="Nụ cười hồn hậu của người dân tộc" width="1920" height="1280"></i></p><p><i>Những đứa trẻ lớn lên tại vùng cao nghèo khó nhưng sức sống mãnh liệt hệt như bông hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-yen-bai.jpg" alt="Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng" width="1920" height="1280"></i></p><p><i>Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day.jpg" alt="Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn" width="1920" height="1280"></i></p><p><i>Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn nhưng lúc nào cũng ngập tràn niềm vui</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/sac-hoa-to-day.jpg" alt="Vẻ đẹp của hoa thớ dày từ trên cao xuống" width="1920" height="1280"></i></p><p><i>Vẻ đẹp của hoa thớ dày từ trên cao xuống</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/tinh-yeu-doi-lua-duoi-hoa-to-day.jpg" alt="Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng" width="1920" height="1280"></i></p><p><i>Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day-mu-cang-chai.jpg" alt="Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày" width="1920" height="1363"></i></p><p><i>Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day.jpg" alt="Vẻ đẹp xao xuyến của từng bông hoa" width="1920" height="1271"></i></p><p><i>Vẻ đẹp xao xuyến của từng bông hoa</i></p><p>Còn chần chờ gì nữa mà không lên lịch ngay cho mình để ngắm sắc đẹp thướt tha, yêu kiều, dịu dàng của loài hoa này trên rẻo cao Mù Cang Chải thôi nào bạn ơi!</p>', N'/Images/20241216_133620.jpeg', N'2b69edce-0836-485c-a5c0-126b11831c19', CAST(N'2024-12-16' AS Date), 3, N'Nếu như có một đám cưới nào mà nhà trai không cần phải đón dâu thì đó chính là lễ cưới của người')
GO
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (1017, N'Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái', N'<h3><strong>Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái</strong></h3><p>05/07/2024 - Admin Gostay</p><p><i>Nhắc đến Mù Cang Chải, nhiều người sẽ nghĩ ngay tới những thửa ruộng bậc thang mênh mông tít tắp, trải dài khắp nơi. Thế nhưng, Mù Cang Chải còn được gắn liền với một loài hoa có tên vô cùng đặc biệt - hoa tớ dày. Hãy cùng chúng tôi ngắm nhìn sắc đẹp của loài hoa độc đáo này trong bài viết dưới đây nhé!</i></p><h2><strong>Sắc hoa tớ dày miền di sản</strong></h2><p>Tớ dày "uống sương", "ngậm gió" lạnh những ngày mùa đông rét buốt của vùng cao Mù Cang Chải để rồi khi xuân về, từng bông hoa hồng rực bung nở "mạnh mẽ" cũng giống như sức sống của người nới đây.</p><p>Hoa nở hồng của nương đồi, sườn non cao, dọc con đường ngoằn nghèo vào bản hay bên hiên những mái nhà tranh phảng phất khói sương. Tất cả tạo nên một bức tranh vừa hùng vĩ nhưng cũng vô cùng lãng mạn, mềm mại làm say đắm trái tim người du khách.</p><p>Đây là loài hoa thuộc họ đào, được người Mông gọi bằng tên "Pằng Tớ dày", theo tiếng việt có nghĩa là "hoa đào rừng".</p><p>Cây thuộc giống thân gỗ, có phần tán mọc xòe rộng, trải khắp sườn đồi, triền núi. Bông hoa bản dày, có 5 cánh, màu hồng sắc. Khi nở hoa kết chùm lại, nhị hoa dài có màu đỏ rực rỡ.&nbsp;</p><p>Loài hoa này có gắn bó mật thiết với cuộc sống của đồng bào người Mông nơi đây. Họ quan niệm rằng mùa Xuân là thời khắc đất trời chuyển mình, sau một năm lao động vất vả, mùa vàng bội thu, thóc lúa đầy nhà nên người dân sẽ cùng nhau ăn mừng.</p><p>Khi những cây tớ dày nở hoa hồng rực rỡ cả một góc trời cũng là lúc các&nbsp;chàng trai, cô gái Mông xúng xính trong bộ váy mới, luyện khèn, chuẩn bị quả Pao để chơi Tết, du xuân.</p><p>Loài hoa Tớ dày gắn liền với đời sống nhiều thế hệ người Mông vùng cao Mù Cang Chải. Loại hoa có sức sống mãnh liệt, tượng trưng cho sức sống của con người nơi đây.&nbsp;</p><p>Sau khoảng thời gian đó tuy chưa tàn hết nhưng màu sắc cũng sẽ phai nhưng vẫn giữ được vẻ đẹp e lệ, cuốn hút.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-5.jpg" alt="Hoa tớ dày bên những cung đường quanh co" width="1920" height="1493"></p><p><i>Hoa tớ dày và bản làng Mù Cang Chải cùng những con đường quanh co, uốn lượn</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-1.jpg" alt="Khoảnh khắc đáng yêu của đồng bào dân tộc" width="1920" height="1280"></i></p><p><i>Cô gái và chàng trai bản thổi nhau nghe khúc nhạc tình lãng mạn với cành hoa thớ dày sau lưng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-2.jpg" alt="Nụ cười hồn hậu của người dân tộc" width="1920" height="1280"></i></p><p><i>Những đứa trẻ lớn lên tại vùng cao nghèo khó nhưng sức sống mãnh liệt hệt như bông hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-yen-bai.jpg" alt="Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng" width="1920" height="1280"></i></p><p><i>Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day.jpg" alt="Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn" width="1920" height="1280"></i></p><p><i>Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn nhưng lúc nào cũng ngập tràn niềm vui</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/sac-hoa-to-day.jpg" alt="Vẻ đẹp của hoa thớ dày từ trên cao xuống" width="1920" height="1280"></i></p><p><i>Vẻ đẹp của hoa thớ dày từ trên cao xuống</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/tinh-yeu-doi-lua-duoi-hoa-to-day.jpg" alt="Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng" width="1920" height="1280"></i></p><p><i>Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day-mu-cang-chai.jpg" alt="Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày" width="1920" height="1363"></i></p><p><i>Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day.jpg" alt="Vẻ đẹp xao xuyến của từng bông hoa" width="1920" height="1271"></i></p><p><i>Vẻ đẹp xao xuyến của từng bông hoa</i></p><p>Còn chần chờ gì nữa mà không lên lịch ngay cho mình để ngắm sắc đẹp thướt tha, yêu kiều, dịu dàng của loài hoa này trên rẻo cao Mù Cang Chải thôi nào bạn ơi!</p>', N'/Images/20241216_133701.jpg', N'2b69edce-0836-485c-a5c0-126b11831c19', CAST(N'2024-12-16' AS Date), 3, N'Nếu như có một đám cưới nào mà nhà trai không cần phải đón dâu thì đó chính là lễ cưới của người')
GO
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (1018, N'Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái', N'<h3><strong>Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái</strong></h3><p>05/07/2024 - Admin Gostay</p><p><i>Nhắc đến Mù Cang Chải, nhiều người sẽ nghĩ ngay tới những thửa ruộng bậc thang mênh mông tít tắp, trải dài khắp nơi. Thế nhưng, Mù Cang Chải còn được gắn liền với một loài hoa có tên vô cùng đặc biệt - hoa tớ dày. Hãy cùng chúng tôi ngắm nhìn sắc đẹp của loài hoa độc đáo này trong bài viết dưới đây nhé!</i></p><h2><strong>Sắc hoa tớ dày miền di sản</strong></h2><p>Tớ dày "uống sương", "ngậm gió" lạnh những ngày mùa đông rét buốt của vùng cao Mù Cang Chải để rồi khi xuân về, từng bông hoa hồng rực bung nở "mạnh mẽ" cũng giống như sức sống của người nới đây.</p><p>Hoa nở hồng của nương đồi, sườn non cao, dọc con đường ngoằn nghèo vào bản hay bên hiên những mái nhà tranh phảng phất khói sương. Tất cả tạo nên một bức tranh vừa hùng vĩ nhưng cũng vô cùng lãng mạn, mềm mại làm say đắm trái tim người du khách.</p><p>Đây là loài hoa thuộc họ đào, được người Mông gọi bằng tên "Pằng Tớ dày", theo tiếng việt có nghĩa là "hoa đào rừng".</p><p>Cây thuộc giống thân gỗ, có phần tán mọc xòe rộng, trải khắp sườn đồi, triền núi. Bông hoa bản dày, có 5 cánh, màu hồng sắc. Khi nở hoa kết chùm lại, nhị hoa dài có màu đỏ rực rỡ.&nbsp;</p><p>Loài hoa này có gắn bó mật thiết với cuộc sống của đồng bào người Mông nơi đây. Họ quan niệm rằng mùa Xuân là thời khắc đất trời chuyển mình, sau một năm lao động vất vả, mùa vàng bội thu, thóc lúa đầy nhà nên người dân sẽ cùng nhau ăn mừng.</p><p>Khi những cây tớ dày nở hoa hồng rực rỡ cả một góc trời cũng là lúc các&nbsp;chàng trai, cô gái Mông xúng xính trong bộ váy mới, luyện khèn, chuẩn bị quả Pao để chơi Tết, du xuân.</p><p>Loài hoa Tớ dày gắn liền với đời sống nhiều thế hệ người Mông vùng cao Mù Cang Chải. Loại hoa có sức sống mãnh liệt, tượng trưng cho sức sống của con người nơi đây.&nbsp;</p><p>Sau khoảng thời gian đó tuy chưa tàn hết nhưng màu sắc cũng sẽ phai nhưng vẫn giữ được vẻ đẹp e lệ, cuốn hút.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-5.jpg" alt="Hoa tớ dày bên những cung đường quanh co" width="1920" height="1493"></p><p><i>Hoa tớ dày và bản làng Mù Cang Chải cùng những con đường quanh co, uốn lượn</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-1.jpg" alt="Khoảnh khắc đáng yêu của đồng bào dân tộc" width="1920" height="1280"></i></p><p><i>Cô gái và chàng trai bản thổi nhau nghe khúc nhạc tình lãng mạn với cành hoa thớ dày sau lưng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-2.jpg" alt="Nụ cười hồn hậu của người dân tộc" width="1920" height="1280"></i></p><p><i>Những đứa trẻ lớn lên tại vùng cao nghèo khó nhưng sức sống mãnh liệt hệt như bông hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-yen-bai.jpg" alt="Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng" width="1920" height="1280"></i></p><p><i>Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day.jpg" alt="Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn" width="1920" height="1280"></i></p><p><i>Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn nhưng lúc nào cũng ngập tràn niềm vui</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/sac-hoa-to-day.jpg" alt="Vẻ đẹp của hoa thớ dày từ trên cao xuống" width="1920" height="1280"></i></p><p><i>Vẻ đẹp của hoa thớ dày từ trên cao xuống</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/tinh-yeu-doi-lua-duoi-hoa-to-day.jpg" alt="Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng" width="1920" height="1280"></i></p><p><i>Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day-mu-cang-chai.jpg" alt="Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày" width="1920" height="1363"></i></p><p><i>Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day.jpg" alt="Vẻ đẹp xao xuyến của từng bông hoa" width="1920" height="1271"></i></p><p><i>Vẻ đẹp xao xuyến của từng bông hoa</i></p><p>Còn chần chờ gì nữa mà không lên lịch ngay cho mình để ngắm sắc đẹp thướt tha, yêu kiều, dịu dàng của loài hoa này trên rẻo cao Mù Cang Chải thôi nào bạn ơi!</p>', N'/Images/20250530_120250.jpg', N'2b69edce-0836-485c-a5c0-126b11831c19', CAST(N'2025-05-30' AS Date), 3, N'Nếu như có một đám cưới nào mà nhà trai không cần phải đón dâu thì đó chính là lễ cưới của người')
GO
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (1019, N'Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái', N'<h3><strong>Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái</strong></h3><p>05/07/2024 - Admin Gostay</p><p><i>Nhắc đến Mù Cang Chải, nhiều người sẽ nghĩ ngay tới những thửa ruộng bậc thang mênh mông tít tắp, trải dài khắp nơi. Thế nhưng, Mù Cang Chải còn được gắn liền với một loài hoa có tên vô cùng đặc biệt - hoa tớ dày. Hãy cùng chúng tôi ngắm nhìn sắc đẹp của loài hoa độc đáo này trong bài viết dưới đây nhé!</i></p><h2><strong>Sắc hoa tớ dày miền di sản</strong></h2><p>Tớ dày "uống sương", "ngậm gió" lạnh những ngày mùa đông rét buốt của vùng cao Mù Cang Chải để rồi khi xuân về, từng bông hoa hồng rực bung nở "mạnh mẽ" cũng giống như sức sống của người nới đây.</p><p>Hoa nở hồng của nương đồi, sườn non cao, dọc con đường ngoằn nghèo vào bản hay bên hiên những mái nhà tranh phảng phất khói sương. Tất cả tạo nên một bức tranh vừa hùng vĩ nhưng cũng vô cùng lãng mạn, mềm mại làm say đắm trái tim người du khách.</p><p>Đây là loài hoa thuộc họ đào, được người Mông gọi bằng tên "Pằng Tớ dày", theo tiếng việt có nghĩa là "hoa đào rừng".</p><p>Cây thuộc giống thân gỗ, có phần tán mọc xòe rộng, trải khắp sườn đồi, triền núi. Bông hoa bản dày, có 5 cánh, màu hồng sắc. Khi nở hoa kết chùm lại, nhị hoa dài có màu đỏ rực rỡ.&nbsp;</p><p>Loài hoa này có gắn bó mật thiết với cuộc sống của đồng bào người Mông nơi đây. Họ quan niệm rằng mùa Xuân là thời khắc đất trời chuyển mình, sau một năm lao động vất vả, mùa vàng bội thu, thóc lúa đầy nhà nên người dân sẽ cùng nhau ăn mừng.</p><p>Khi những cây tớ dày nở hoa hồng rực rỡ cả một góc trời cũng là lúc các&nbsp;chàng trai, cô gái Mông xúng xính trong bộ váy mới, luyện khèn, chuẩn bị quả Pao để chơi Tết, du xuân.</p><p>Loài hoa Tớ dày gắn liền với đời sống nhiều thế hệ người Mông vùng cao Mù Cang Chải. Loại hoa có sức sống mãnh liệt, tượng trưng cho sức sống của con người nơi đây.&nbsp;</p><p>Sau khoảng thời gian đó tuy chưa tàn hết nhưng màu sắc cũng sẽ phai nhưng vẫn giữ được vẻ đẹp e lệ, cuốn hút.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-5.jpg" alt="Hoa tớ dày bên những cung đường quanh co" width="1920" height="1493"></p><p><i>Hoa tớ dày và bản làng Mù Cang Chải cùng những con đường quanh co, uốn lượn</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-1.jpg" alt="Khoảnh khắc đáng yêu của đồng bào dân tộc" width="1920" height="1280"></i></p><p><i>Cô gái và chàng trai bản thổi nhau nghe khúc nhạc tình lãng mạn với cành hoa thớ dày sau lưng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-2.jpg" alt="Nụ cười hồn hậu của người dân tộc" width="1920" height="1280"></i></p><p><i>Những đứa trẻ lớn lên tại vùng cao nghèo khó nhưng sức sống mãnh liệt hệt như bông hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-yen-bai.jpg" alt="Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng" width="1920" height="1280"></i></p><p><i>Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day.jpg" alt="Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn" width="1920" height="1280"></i></p><p><i>Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn nhưng lúc nào cũng ngập tràn niềm vui</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/sac-hoa-to-day.jpg" alt="Vẻ đẹp của hoa thớ dày từ trên cao xuống" width="1920" height="1280"></i></p><p><i>Vẻ đẹp của hoa thớ dày từ trên cao xuống</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/tinh-yeu-doi-lua-duoi-hoa-to-day.jpg" alt="Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng" width="1920" height="1280"></i></p><p><i>Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day-mu-cang-chai.jpg" alt="Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày" width="1920" height="1363"></i></p><p><i>Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day.jpg" alt="Vẻ đẹp xao xuyến của từng bông hoa" width="1920" height="1271"></i></p><p><i>Vẻ đẹp xao xuyến của từng bông hoa</i></p><p>Còn chần chờ gì nữa mà không lên lịch ngay cho mình để ngắm sắc đẹp thướt tha, yêu kiều, dịu dàng của loài hoa này trên rẻo cao Mù Cang Chải thôi nào bạn ơi!</p>', N'/Images/20241216_133715.jpg', N'2b69edce-0836-485c-a5c0-126b11831c19', CAST(N'2024-12-16' AS Date), 3, N'Nếu như có một đám cưới nào mà nhà trai không cần phải đón dâu thì đó chính là lễ cưới của người')
GO
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (1020, N'Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái', N'<h3><strong>Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái</strong></h3><p>05/07/2024 - Admin Gostay</p><p><i>Nhắc đến Mù Cang Chải, nhiều người sẽ nghĩ ngay tới những thửa ruộng bậc thang mênh mông tít tắp, trải dài khắp nơi. Thế nhưng, Mù Cang Chải còn được gắn liền với một loài hoa có tên vô cùng đặc biệt - hoa tớ dày. Hãy cùng chúng tôi ngắm nhìn sắc đẹp của loài hoa độc đáo này trong bài viết dưới đây nhé!</i></p><h2><strong>Sắc hoa tớ dày miền di sản</strong></h2><p>Tớ dày "uống sương", "ngậm gió" lạnh những ngày mùa đông rét buốt của vùng cao Mù Cang Chải để rồi khi xuân về, từng bông hoa hồng rực bung nở "mạnh mẽ" cũng giống như sức sống của người nới đây.</p><p>Hoa nở hồng của nương đồi, sườn non cao, dọc con đường ngoằn nghèo vào bản hay bên hiên những mái nhà tranh phảng phất khói sương. Tất cả tạo nên một bức tranh vừa hùng vĩ nhưng cũng vô cùng lãng mạn, mềm mại làm say đắm trái tim người du khách.</p><p>Đây là loài hoa thuộc họ đào, được người Mông gọi bằng tên "Pằng Tớ dày", theo tiếng việt có nghĩa là "hoa đào rừng".</p><p>Cây thuộc giống thân gỗ, có phần tán mọc xòe rộng, trải khắp sườn đồi, triền núi. Bông hoa bản dày, có 5 cánh, màu hồng sắc. Khi nở hoa kết chùm lại, nhị hoa dài có màu đỏ rực rỡ.&nbsp;</p><p>Loài hoa này có gắn bó mật thiết với cuộc sống của đồng bào người Mông nơi đây. Họ quan niệm rằng mùa Xuân là thời khắc đất trời chuyển mình, sau một năm lao động vất vả, mùa vàng bội thu, thóc lúa đầy nhà nên người dân sẽ cùng nhau ăn mừng.</p><p>Khi những cây tớ dày nở hoa hồng rực rỡ cả một góc trời cũng là lúc các&nbsp;chàng trai, cô gái Mông xúng xính trong bộ váy mới, luyện khèn, chuẩn bị quả Pao để chơi Tết, du xuân.</p><p>Loài hoa Tớ dày gắn liền với đời sống nhiều thế hệ người Mông vùng cao Mù Cang Chải. Loại hoa có sức sống mãnh liệt, tượng trưng cho sức sống của con người nơi đây.&nbsp;</p><p>Sau khoảng thời gian đó tuy chưa tàn hết nhưng màu sắc cũng sẽ phai nhưng vẫn giữ được vẻ đẹp e lệ, cuốn hút.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-5.jpg" alt="Hoa tớ dày bên những cung đường quanh co" width="1920" height="1493"></p><p><i>Hoa tớ dày và bản làng Mù Cang Chải cùng những con đường quanh co, uốn lượn</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-1.jpg" alt="Khoảnh khắc đáng yêu của đồng bào dân tộc" width="1920" height="1280"></i></p><p><i>Cô gái và chàng trai bản thổi nhau nghe khúc nhạc tình lãng mạn với cành hoa thớ dày sau lưng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-2.jpg" alt="Nụ cười hồn hậu của người dân tộc" width="1920" height="1280"></i></p><p><i>Những đứa trẻ lớn lên tại vùng cao nghèo khó nhưng sức sống mãnh liệt hệt như bông hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-yen-bai.jpg" alt="Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng" width="1920" height="1280"></i></p><p><i>Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day.jpg" alt="Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn" width="1920" height="1280"></i></p><p><i>Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn nhưng lúc nào cũng ngập tràn niềm vui</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/sac-hoa-to-day.jpg" alt="Vẻ đẹp của hoa thớ dày từ trên cao xuống" width="1920" height="1280"></i></p><p><i>Vẻ đẹp của hoa thớ dày từ trên cao xuống</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/tinh-yeu-doi-lua-duoi-hoa-to-day.jpg" alt="Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng" width="1920" height="1280"></i></p><p><i>Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day-mu-cang-chai.jpg" alt="Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày" width="1920" height="1363"></i></p><p><i>Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day.jpg" alt="Vẻ đẹp xao xuyến của từng bông hoa" width="1920" height="1271"></i></p><p><i>Vẻ đẹp xao xuyến của từng bông hoa</i></p><p>Còn chần chờ gì nữa mà không lên lịch ngay cho mình để ngắm sắc đẹp thướt tha, yêu kiều, dịu dàng của loài hoa này trên rẻo cao Mù Cang Chải thôi nào bạn ơi!</p>', N'/Images/20241216_133745.jpg', N'2b69edce-0836-485c-a5c0-126b11831c19', CAST(N'2024-12-16' AS Date), 3, N'Nếu như có một đám cưới nào mà nhà trai không cần phải đón dâu thì đó chính là lễ cưới của người')
GO
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (1021, N'Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái', N'<h3><strong>Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái</strong></h3><p>05/07/2024 - Admin Gostay</p><p><i>Nhắc đến Mù Cang Chải, nhiều người sẽ nghĩ ngay tới những thửa ruộng bậc thang mênh mông tít tắp, trải dài khắp nơi. Thế nhưng, Mù Cang Chải còn được gắn liền với một loài hoa có tên vô cùng đặc biệt - hoa tớ dày. Hãy cùng chúng tôi ngắm nhìn sắc đẹp của loài hoa độc đáo này trong bài viết dưới đây nhé!</i></p><h2><strong>Sắc hoa tớ dày miền di sản</strong></h2><p>Tớ dày "uống sương", "ngậm gió" lạnh những ngày mùa đông rét buốt của vùng cao Mù Cang Chải để rồi khi xuân về, từng bông hoa hồng rực bung nở "mạnh mẽ" cũng giống như sức sống của người nới đây.</p><p>Hoa nở hồng của nương đồi, sườn non cao, dọc con đường ngoằn nghèo vào bản hay bên hiên những mái nhà tranh phảng phất khói sương. Tất cả tạo nên một bức tranh vừa hùng vĩ nhưng cũng vô cùng lãng mạn, mềm mại làm say đắm trái tim người du khách.</p><p>Đây là loài hoa thuộc họ đào, được người Mông gọi bằng tên "Pằng Tớ dày", theo tiếng việt có nghĩa là "hoa đào rừng".</p><p>Cây thuộc giống thân gỗ, có phần tán mọc xòe rộng, trải khắp sườn đồi, triền núi. Bông hoa bản dày, có 5 cánh, màu hồng sắc. Khi nở hoa kết chùm lại, nhị hoa dài có màu đỏ rực rỡ.&nbsp;</p><p>Loài hoa này có gắn bó mật thiết với cuộc sống của đồng bào người Mông nơi đây. Họ quan niệm rằng mùa Xuân là thời khắc đất trời chuyển mình, sau một năm lao động vất vả, mùa vàng bội thu, thóc lúa đầy nhà nên người dân sẽ cùng nhau ăn mừng.</p><p>Khi những cây tớ dày nở hoa hồng rực rỡ cả một góc trời cũng là lúc các&nbsp;chàng trai, cô gái Mông xúng xính trong bộ váy mới, luyện khèn, chuẩn bị quả Pao để chơi Tết, du xuân.</p><p>Loài hoa Tớ dày gắn liền với đời sống nhiều thế hệ người Mông vùng cao Mù Cang Chải. Loại hoa có sức sống mãnh liệt, tượng trưng cho sức sống của con người nơi đây.&nbsp;</p><p>Sau khoảng thời gian đó tuy chưa tàn hết nhưng màu sắc cũng sẽ phai nhưng vẫn giữ được vẻ đẹp e lệ, cuốn hút.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-5.jpg" alt="Hoa tớ dày bên những cung đường quanh co" width="1920" height="1493"></p><p><i>Hoa tớ dày và bản làng Mù Cang Chải cùng những con đường quanh co, uốn lượn</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-1.jpg" alt="Khoảnh khắc đáng yêu của đồng bào dân tộc" width="1920" height="1280"></i></p><p><i>Cô gái và chàng trai bản thổi nhau nghe khúc nhạc tình lãng mạn với cành hoa thớ dày sau lưng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-2.jpg" alt="Nụ cười hồn hậu của người dân tộc" width="1920" height="1280"></i></p><p><i>Những đứa trẻ lớn lên tại vùng cao nghèo khó nhưng sức sống mãnh liệt hệt như bông hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-yen-bai.jpg" alt="Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng" width="1920" height="1280"></i></p><p><i>Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day.jpg" alt="Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn" width="1920" height="1280"></i></p><p><i>Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn nhưng lúc nào cũng ngập tràn niềm vui</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/sac-hoa-to-day.jpg" alt="Vẻ đẹp của hoa thớ dày từ trên cao xuống" width="1920" height="1280"></i></p><p><i>Vẻ đẹp của hoa thớ dày từ trên cao xuống</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/tinh-yeu-doi-lua-duoi-hoa-to-day.jpg" alt="Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng" width="1920" height="1280"></i></p><p><i>Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day-mu-cang-chai.jpg" alt="Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày" width="1920" height="1363"></i></p><p><i>Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day.jpg" alt="Vẻ đẹp xao xuyến của từng bông hoa" width="1920" height="1271"></i></p><p><i>Vẻ đẹp xao xuyến của từng bông hoa</i></p><p>Còn chần chờ gì nữa mà không lên lịch ngay cho mình để ngắm sắc đẹp thướt tha, yêu kiều, dịu dàng của loài hoa này trên rẻo cao Mù Cang Chải thôi nào bạn ơi!</p>', N'/Images/20250530_120324.jpg', N'2b69edce-0836-485c-a5c0-126b11831c19', CAST(N'2025-05-30' AS Date), 3, N'Nếu như có một đám cưới nào mà nhà trai không cần phải đón dâu thì đó chính là lễ cưới của người')
GO
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (1022, N'Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái', N'<h3><strong>Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái</strong></h3><p>05/07/2024 - Admin Gostay</p><p><i>Nhắc đến Mù Cang Chải, nhiều người sẽ nghĩ ngay tới những thửa ruộng bậc thang mênh mông tít tắp, trải dài khắp nơi. Thế nhưng, Mù Cang Chải còn được gắn liền với một loài hoa có tên vô cùng đặc biệt - hoa tớ dày. Hãy cùng chúng tôi ngắm nhìn sắc đẹp của loài hoa độc đáo này trong bài viết dưới đây nhé!</i></p><h2><strong>Sắc hoa tớ dày miền di sản</strong></h2><p>Tớ dày "uống sương", "ngậm gió" lạnh những ngày mùa đông rét buốt của vùng cao Mù Cang Chải để rồi khi xuân về, từng bông hoa hồng rực bung nở "mạnh mẽ" cũng giống như sức sống của người nới đây.</p><p>Hoa nở hồng của nương đồi, sườn non cao, dọc con đường ngoằn nghèo vào bản hay bên hiên những mái nhà tranh phảng phất khói sương. Tất cả tạo nên một bức tranh vừa hùng vĩ nhưng cũng vô cùng lãng mạn, mềm mại làm say đắm trái tim người du khách.</p><p>Đây là loài hoa thuộc họ đào, được người Mông gọi bằng tên "Pằng Tớ dày", theo tiếng việt có nghĩa là "hoa đào rừng".</p><p>Cây thuộc giống thân gỗ, có phần tán mọc xòe rộng, trải khắp sườn đồi, triền núi. Bông hoa bản dày, có 5 cánh, màu hồng sắc. Khi nở hoa kết chùm lại, nhị hoa dài có màu đỏ rực rỡ.&nbsp;</p><p>Loài hoa này có gắn bó mật thiết với cuộc sống của đồng bào người Mông nơi đây. Họ quan niệm rằng mùa Xuân là thời khắc đất trời chuyển mình, sau một năm lao động vất vả, mùa vàng bội thu, thóc lúa đầy nhà nên người dân sẽ cùng nhau ăn mừng.</p><p>Khi những cây tớ dày nở hoa hồng rực rỡ cả một góc trời cũng là lúc các&nbsp;chàng trai, cô gái Mông xúng xính trong bộ váy mới, luyện khèn, chuẩn bị quả Pao để chơi Tết, du xuân.</p><p>Loài hoa Tớ dày gắn liền với đời sống nhiều thế hệ người Mông vùng cao Mù Cang Chải. Loại hoa có sức sống mãnh liệt, tượng trưng cho sức sống của con người nơi đây.&nbsp;</p><p>Sau khoảng thời gian đó tuy chưa tàn hết nhưng màu sắc cũng sẽ phai nhưng vẫn giữ được vẻ đẹp e lệ, cuốn hút.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-5.jpg" alt="Hoa tớ dày bên những cung đường quanh co" width="1920" height="1493"></p><p><i>Hoa tớ dày và bản làng Mù Cang Chải cùng những con đường quanh co, uốn lượn</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-1.jpg" alt="Khoảnh khắc đáng yêu của đồng bào dân tộc" width="1920" height="1280"></i></p><p><i>Cô gái và chàng trai bản thổi nhau nghe khúc nhạc tình lãng mạn với cành hoa thớ dày sau lưng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-2.jpg" alt="Nụ cười hồn hậu của người dân tộc" width="1920" height="1280"></i></p><p><i>Những đứa trẻ lớn lên tại vùng cao nghèo khó nhưng sức sống mãnh liệt hệt như bông hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-yen-bai.jpg" alt="Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng" width="1920" height="1280"></i></p><p><i>Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day.jpg" alt="Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn" width="1920" height="1280"></i></p><p><i>Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn nhưng lúc nào cũng ngập tràn niềm vui</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/sac-hoa-to-day.jpg" alt="Vẻ đẹp của hoa thớ dày từ trên cao xuống" width="1920" height="1280"></i></p><p><i>Vẻ đẹp của hoa thớ dày từ trên cao xuống</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/tinh-yeu-doi-lua-duoi-hoa-to-day.jpg" alt="Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng" width="1920" height="1280"></i></p><p><i>Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day-mu-cang-chai.jpg" alt="Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày" width="1920" height="1363"></i></p><p><i>Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day.jpg" alt="Vẻ đẹp xao xuyến của từng bông hoa" width="1920" height="1271"></i></p><p><i>Vẻ đẹp xao xuyến của từng bông hoa</i></p><p>Còn chần chờ gì nữa mà không lên lịch ngay cho mình để ngắm sắc đẹp thướt tha, yêu kiều, dịu dàng của loài hoa này trên rẻo cao Mù Cang Chải thôi nào bạn ơi!</p>', N'/Images/20241216_132122.jpg', N'2b69edce-0836-485c-a5c0-126b11831c19', CAST(N'2024-12-16' AS Date), 1, N'Ẩm thực ba miền')
GO
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (1025, N'Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái', N'<h3><strong>Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái</strong></h3><p>05/07/2024 - Admin Gostay</p><p><i>Nhắc đến Mù Cang Chải, nhiều người sẽ nghĩ ngay tới những thửa ruộng bậc thang mênh mông tít tắp, trải dài khắp nơi. Thế nhưng, Mù Cang Chải còn được gắn liền với một loài hoa có tên vô cùng đặc biệt - hoa tớ dày. Hãy cùng chúng tôi ngắm nhìn sắc đẹp của loài hoa độc đáo này trong bài viết dưới đây nhé!</i></p><h2><strong>Sắc hoa tớ dày miền di sản</strong></h2><p>Tớ dày "uống sương", "ngậm gió" lạnh những ngày mùa đông rét buốt của vùng cao Mù Cang Chải để rồi khi xuân về, từng bông hoa hồng rực bung nở "mạnh mẽ" cũng giống như sức sống của người nới đây.</p><p>Hoa nở hồng của nương đồi, sườn non cao, dọc con đường ngoằn nghèo vào bản hay bên hiên những mái nhà tranh phảng phất khói sương. Tất cả tạo nên một bức tranh vừa hùng vĩ nhưng cũng vô cùng lãng mạn, mềm mại làm say đắm trái tim người du khách.</p><p>Đây là loài hoa thuộc họ đào, được người Mông gọi bằng tên "Pằng Tớ dày", theo tiếng việt có nghĩa là "hoa đào rừng".</p><p>Cây thuộc giống thân gỗ, có phần tán mọc xòe rộng, trải khắp sườn đồi, triền núi. Bông hoa bản dày, có 5 cánh, màu hồng sắc. Khi nở hoa kết chùm lại, nhị hoa dài có màu đỏ rực rỡ.&nbsp;</p><p>Loài hoa này có gắn bó mật thiết với cuộc sống của đồng bào người Mông nơi đây. Họ quan niệm rằng mùa Xuân là thời khắc đất trời chuyển mình, sau một năm lao động vất vả, mùa vàng bội thu, thóc lúa đầy nhà nên người dân sẽ cùng nhau ăn mừng.</p><p>Khi những cây tớ dày nở hoa hồng rực rỡ cả một góc trời cũng là lúc các&nbsp;chàng trai, cô gái Mông xúng xính trong bộ váy mới, luyện khèn, chuẩn bị quả Pao để chơi Tết, du xuân.</p><p>Loài hoa Tớ dày gắn liền với đời sống nhiều thế hệ người Mông vùng cao Mù Cang Chải. Loại hoa có sức sống mãnh liệt, tượng trưng cho sức sống của con người nơi đây.&nbsp;</p><p>Sau khoảng thời gian đó tuy chưa tàn hết nhưng màu sắc cũng sẽ phai nhưng vẫn giữ được vẻ đẹp e lệ, cuốn hút.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-5.jpg" alt="Hoa tớ dày bên những cung đường quanh co" width="1920" height="1493"></p><p><i>Hoa tớ dày và bản làng Mù Cang Chải cùng những con đường quanh co, uốn lượn</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-1.jpg" alt="Khoảnh khắc đáng yêu của đồng bào dân tộc" width="1920" height="1280"></i></p><p><i>Cô gái và chàng trai bản thổi nhau nghe khúc nhạc tình lãng mạn với cành hoa thớ dày sau lưng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-2.jpg" alt="Nụ cười hồn hậu của người dân tộc" width="1920" height="1280"></i></p><p><i>Những đứa trẻ lớn lên tại vùng cao nghèo khó nhưng sức sống mãnh liệt hệt như bông hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-yen-bai.jpg" alt="Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng" width="1920" height="1280"></i></p><p><i>Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day.jpg" alt="Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn" width="1920" height="1280"></i></p><p><i>Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn nhưng lúc nào cũng ngập tràn niềm vui</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/sac-hoa-to-day.jpg" alt="Vẻ đẹp của hoa thớ dày từ trên cao xuống" width="1920" height="1280"></i></p><p><i>Vẻ đẹp của hoa thớ dày từ trên cao xuống</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/tinh-yeu-doi-lua-duoi-hoa-to-day.jpg" alt="Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng" width="1920" height="1280"></i></p><p><i>Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day-mu-cang-chai.jpg" alt="Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày" width="1920" height="1363"></i></p><p><i>Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day.jpg" alt="Vẻ đẹp xao xuyến của từng bông hoa" width="1920" height="1271"></i></p><p><i>Vẻ đẹp xao xuyến của từng bông hoa</i></p><p>Còn chần chờ gì nữa mà không lên lịch ngay cho mình để ngắm sắc đẹp thướt tha, yêu kiều, dịu dàng của loài hoa này trên rẻo cao Mù Cang Chải thôi nào bạn ơi!</p>', N'/Images/20250530_120310.jpg', N'2b69edce-0836-485c-a5c0-126b11831c19', CAST(N'2025-05-30' AS Date), 3, N'Nếu như có một đám cưới nào mà nhà trai không cần phải đón dâu thì đó chính là lễ cưới của người')
GO
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (1026, N'Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái', N'<h3><strong>Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái</strong></h3><p>05/07/2024 - Admin Gostay</p><p><i>Nhắc đến Mù Cang Chải, nhiều người sẽ nghĩ ngay tới những thửa ruộng bậc thang mênh mông tít tắp, trải dài khắp nơi. Thế nhưng, Mù Cang Chải còn được gắn liền với một loài hoa có tên vô cùng đặc biệt - hoa tớ dày. Hãy cùng chúng tôi ngắm nhìn sắc đẹp của loài hoa độc đáo này trong bài viết dưới đây nhé!</i></p><h2><strong>Sắc hoa tớ dày miền di sản</strong></h2><p>Tớ dày "uống sương", "ngậm gió" lạnh những ngày mùa đông rét buốt của vùng cao Mù Cang Chải để rồi khi xuân về, từng bông hoa hồng rực bung nở "mạnh mẽ" cũng giống như sức sống của người nới đây.</p><p>Hoa nở hồng của nương đồi, sườn non cao, dọc con đường ngoằn nghèo vào bản hay bên hiên những mái nhà tranh phảng phất khói sương. Tất cả tạo nên một bức tranh vừa hùng vĩ nhưng cũng vô cùng lãng mạn, mềm mại làm say đắm trái tim người du khách.</p><p>Đây là loài hoa thuộc họ đào, được người Mông gọi bằng tên "Pằng Tớ dày", theo tiếng việt có nghĩa là "hoa đào rừng".</p><p>Cây thuộc giống thân gỗ, có phần tán mọc xòe rộng, trải khắp sườn đồi, triền núi. Bông hoa bản dày, có 5 cánh, màu hồng sắc. Khi nở hoa kết chùm lại, nhị hoa dài có màu đỏ rực rỡ.&nbsp;</p><p>Loài hoa này có gắn bó mật thiết với cuộc sống của đồng bào người Mông nơi đây. Họ quan niệm rằng mùa Xuân là thời khắc đất trời chuyển mình, sau một năm lao động vất vả, mùa vàng bội thu, thóc lúa đầy nhà nên người dân sẽ cùng nhau ăn mừng.</p><p>Khi những cây tớ dày nở hoa hồng rực rỡ cả một góc trời cũng là lúc các&nbsp;chàng trai, cô gái Mông xúng xính trong bộ váy mới, luyện khèn, chuẩn bị quả Pao để chơi Tết, du xuân.</p><p>Loài hoa Tớ dày gắn liền với đời sống nhiều thế hệ người Mông vùng cao Mù Cang Chải. Loại hoa có sức sống mãnh liệt, tượng trưng cho sức sống của con người nơi đây.&nbsp;</p><p>Sau khoảng thời gian đó tuy chưa tàn hết nhưng màu sắc cũng sẽ phai nhưng vẫn giữ được vẻ đẹp e lệ, cuốn hút.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-5.jpg" alt="Hoa tớ dày bên những cung đường quanh co" width="1920" height="1493"></p><p><i>Hoa tớ dày và bản làng Mù Cang Chải cùng những con đường quanh co, uốn lượn</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-1.jpg" alt="Khoảnh khắc đáng yêu của đồng bào dân tộc" width="1920" height="1280"></i></p><p><i>Cô gái và chàng trai bản thổi nhau nghe khúc nhạc tình lãng mạn với cành hoa thớ dày sau lưng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-2.jpg" alt="Nụ cười hồn hậu của người dân tộc" width="1920" height="1280"></i></p><p><i>Những đứa trẻ lớn lên tại vùng cao nghèo khó nhưng sức sống mãnh liệt hệt như bông hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-yen-bai.jpg" alt="Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng" width="1920" height="1280"></i></p><p><i>Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day.jpg" alt="Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn" width="1920" height="1280"></i></p><p><i>Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn nhưng lúc nào cũng ngập tràn niềm vui</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/sac-hoa-to-day.jpg" alt="Vẻ đẹp của hoa thớ dày từ trên cao xuống" width="1920" height="1280"></i></p><p><i>Vẻ đẹp của hoa thớ dày từ trên cao xuống</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/tinh-yeu-doi-lua-duoi-hoa-to-day.jpg" alt="Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng" width="1920" height="1280"></i></p><p><i>Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day-mu-cang-chai.jpg" alt="Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày" width="1920" height="1363"></i></p><p><i>Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day.jpg" alt="Vẻ đẹp xao xuyến của từng bông hoa" width="1920" height="1271"></i></p><p><i>Vẻ đẹp xao xuyến của từng bông hoa</i></p><p>Còn chần chờ gì nữa mà không lên lịch ngay cho mình để ngắm sắc đẹp thướt tha, yêu kiều, dịu dàng của loài hoa này trên rẻo cao Mù Cang Chải thôi nào bạn ơi!</p>', N'/Images/20241216_132139.jpg', N'2b69edce-0836-485c-a5c0-126b11831c19', CAST(N'2024-12-16' AS Date), 2, N'Ẩm thực ba miền')
GO
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (1027, N'Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái', N'<h3><strong>Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái</strong></h3><p>05/07/2024 - Admin Gostay</p><p><i>Nhắc đến Mù Cang Chải, nhiều người sẽ nghĩ ngay tới những thửa ruộng bậc thang mênh mông tít tắp, trải dài khắp nơi. Thế nhưng, Mù Cang Chải còn được gắn liền với một loài hoa có tên vô cùng đặc biệt - hoa tớ dày. Hãy cùng chúng tôi ngắm nhìn sắc đẹp của loài hoa độc đáo này trong bài viết dưới đây nhé!</i></p><h2><strong>Sắc hoa tớ dày miền di sản</strong></h2><p>Tớ dày "uống sương", "ngậm gió" lạnh những ngày mùa đông rét buốt của vùng cao Mù Cang Chải để rồi khi xuân về, từng bông hoa hồng rực bung nở "mạnh mẽ" cũng giống như sức sống của người nới đây.</p><p>Hoa nở hồng của nương đồi, sườn non cao, dọc con đường ngoằn nghèo vào bản hay bên hiên những mái nhà tranh phảng phất khói sương. Tất cả tạo nên một bức tranh vừa hùng vĩ nhưng cũng vô cùng lãng mạn, mềm mại làm say đắm trái tim người du khách.</p><p>Đây là loài hoa thuộc họ đào, được người Mông gọi bằng tên "Pằng Tớ dày", theo tiếng việt có nghĩa là "hoa đào rừng".</p><p>Cây thuộc giống thân gỗ, có phần tán mọc xòe rộng, trải khắp sườn đồi, triền núi. Bông hoa bản dày, có 5 cánh, màu hồng sắc. Khi nở hoa kết chùm lại, nhị hoa dài có màu đỏ rực rỡ.&nbsp;</p><p>Loài hoa này có gắn bó mật thiết với cuộc sống của đồng bào người Mông nơi đây. Họ quan niệm rằng mùa Xuân là thời khắc đất trời chuyển mình, sau một năm lao động vất vả, mùa vàng bội thu, thóc lúa đầy nhà nên người dân sẽ cùng nhau ăn mừng.</p><p>Khi những cây tớ dày nở hoa hồng rực rỡ cả một góc trời cũng là lúc các&nbsp;chàng trai, cô gái Mông xúng xính trong bộ váy mới, luyện khèn, chuẩn bị quả Pao để chơi Tết, du xuân.</p><p>Loài hoa Tớ dày gắn liền với đời sống nhiều thế hệ người Mông vùng cao Mù Cang Chải. Loại hoa có sức sống mãnh liệt, tượng trưng cho sức sống của con người nơi đây.&nbsp;</p><p>Sau khoảng thời gian đó tuy chưa tàn hết nhưng màu sắc cũng sẽ phai nhưng vẫn giữ được vẻ đẹp e lệ, cuốn hút.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-5.jpg" alt="Hoa tớ dày bên những cung đường quanh co" width="1920" height="1493"></p><p><i>Hoa tớ dày và bản làng Mù Cang Chải cùng những con đường quanh co, uốn lượn</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-1.jpg" alt="Khoảnh khắc đáng yêu của đồng bào dân tộc" width="1920" height="1280"></i></p><p><i>Cô gái và chàng trai bản thổi nhau nghe khúc nhạc tình lãng mạn với cành hoa thớ dày sau lưng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-2.jpg" alt="Nụ cười hồn hậu của người dân tộc" width="1920" height="1280"></i></p><p><i>Những đứa trẻ lớn lên tại vùng cao nghèo khó nhưng sức sống mãnh liệt hệt như bông hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-yen-bai.jpg" alt="Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng" width="1920" height="1280"></i></p><p><i>Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day.jpg" alt="Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn" width="1920" height="1280"></i></p><p><i>Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn nhưng lúc nào cũng ngập tràn niềm vui</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/sac-hoa-to-day.jpg" alt="Vẻ đẹp của hoa thớ dày từ trên cao xuống" width="1920" height="1280"></i></p><p><i>Vẻ đẹp của hoa thớ dày từ trên cao xuống</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/tinh-yeu-doi-lua-duoi-hoa-to-day.jpg" alt="Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng" width="1920" height="1280"></i></p><p><i>Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day-mu-cang-chai.jpg" alt="Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày" width="1920" height="1363"></i></p><p><i>Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day.jpg" alt="Vẻ đẹp xao xuyến của từng bông hoa" width="1920" height="1271"></i></p><p><i>Vẻ đẹp xao xuyến của từng bông hoa</i></p><p>Còn chần chờ gì nữa mà không lên lịch ngay cho mình để ngắm sắc đẹp thướt tha, yêu kiều, dịu dàng của loài hoa này trên rẻo cao Mù Cang Chải thôi nào bạn ơi!</p>', N'/Images/20241216_133818.jpg', N'2b69edce-0836-485c-a5c0-126b11831c19', CAST(N'2024-12-16' AS Date), 2, N'Nếu như có một đám cưới nào mà nhà trai không cần phải đón dâu thì đó chính là lễ cưới của người')
GO
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (1028, N'Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái', N'<h3><strong>Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái</strong></h3><p>05/07/2024 - Admin Gostay</p><p><i>Nhắc đến Mù Cang Chải, nhiều người sẽ nghĩ ngay tới những thửa ruộng bậc thang mênh mông tít tắp, trải dài khắp nơi. Thế nhưng, Mù Cang Chải còn được gắn liền với một loài hoa có tên vô cùng đặc biệt - hoa tớ dày. Hãy cùng chúng tôi ngắm nhìn sắc đẹp của loài hoa độc đáo này trong bài viết dưới đây nhé!</i></p><h2><strong>Sắc hoa tớ dày miền di sản</strong></h2><p>Tớ dày "uống sương", "ngậm gió" lạnh những ngày mùa đông rét buốt của vùng cao Mù Cang Chải để rồi khi xuân về, từng bông hoa hồng rực bung nở "mạnh mẽ" cũng giống như sức sống của người nới đây.</p><p>Hoa nở hồng của nương đồi, sườn non cao, dọc con đường ngoằn nghèo vào bản hay bên hiên những mái nhà tranh phảng phất khói sương. Tất cả tạo nên một bức tranh vừa hùng vĩ nhưng cũng vô cùng lãng mạn, mềm mại làm say đắm trái tim người du khách.</p><p>Đây là loài hoa thuộc họ đào, được người Mông gọi bằng tên "Pằng Tớ dày", theo tiếng việt có nghĩa là "hoa đào rừng".</p><p>Cây thuộc giống thân gỗ, có phần tán mọc xòe rộng, trải khắp sườn đồi, triền núi. Bông hoa bản dày, có 5 cánh, màu hồng sắc. Khi nở hoa kết chùm lại, nhị hoa dài có màu đỏ rực rỡ.&nbsp;</p><p>Loài hoa này có gắn bó mật thiết với cuộc sống của đồng bào người Mông nơi đây. Họ quan niệm rằng mùa Xuân là thời khắc đất trời chuyển mình, sau một năm lao động vất vả, mùa vàng bội thu, thóc lúa đầy nhà nên người dân sẽ cùng nhau ăn mừng.</p><p>Khi những cây tớ dày nở hoa hồng rực rỡ cả một góc trời cũng là lúc các&nbsp;chàng trai, cô gái Mông xúng xính trong bộ váy mới, luyện khèn, chuẩn bị quả Pao để chơi Tết, du xuân.</p><p>Loài hoa Tớ dày gắn liền với đời sống nhiều thế hệ người Mông vùng cao Mù Cang Chải. Loại hoa có sức sống mãnh liệt, tượng trưng cho sức sống của con người nơi đây.&nbsp;</p><p>Sau khoảng thời gian đó tuy chưa tàn hết nhưng màu sắc cũng sẽ phai nhưng vẫn giữ được vẻ đẹp e lệ, cuốn hút.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-5.jpg" alt="Hoa tớ dày bên những cung đường quanh co" width="1920" height="1493"></p><p><i>Hoa tớ dày và bản làng Mù Cang Chải cùng những con đường quanh co, uốn lượn</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-1.jpg" alt="Khoảnh khắc đáng yêu của đồng bào dân tộc" width="1920" height="1280"></i></p><p><i>Cô gái và chàng trai bản thổi nhau nghe khúc nhạc tình lãng mạn với cành hoa thớ dày sau lưng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-2.jpg" alt="Nụ cười hồn hậu của người dân tộc" width="1920" height="1280"></i></p><p><i>Những đứa trẻ lớn lên tại vùng cao nghèo khó nhưng sức sống mãnh liệt hệt như bông hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-yen-bai.jpg" alt="Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng" width="1920" height="1280"></i></p><p><i>Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day.jpg" alt="Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn" width="1920" height="1280"></i></p><p><i>Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn nhưng lúc nào cũng ngập tràn niềm vui</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/sac-hoa-to-day.jpg" alt="Vẻ đẹp của hoa thớ dày từ trên cao xuống" width="1920" height="1280"></i></p><p><i>Vẻ đẹp của hoa thớ dày từ trên cao xuống</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/tinh-yeu-doi-lua-duoi-hoa-to-day.jpg" alt="Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng" width="1920" height="1280"></i></p><p><i>Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day-mu-cang-chai.jpg" alt="Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày" width="1920" height="1363"></i></p><p><i>Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day.jpg" alt="Vẻ đẹp xao xuyến của từng bông hoa" width="1920" height="1271"></i></p><p><i>Vẻ đẹp xao xuyến của từng bông hoa</i></p><p>Còn chần chờ gì nữa mà không lên lịch ngay cho mình để ngắm sắc đẹp thướt tha, yêu kiều, dịu dàng của loài hoa này trên rẻo cao Mù Cang Chải thôi nào bạn ơi!</p>', N'/Images/20241216_133852.jpeg', N'2b69edce-0836-485c-a5c0-126b11831c19', CAST(N'2024-12-16' AS Date), 2, N'Nếu như có một đám cưới nào mà nhà trai không cần phải đón dâu thì đó chính là lễ cưới của người')
GO
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (1032, N'Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái', N'<h3><strong>Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái</strong></h3><p>05/07/2024 - Admin Gostay</p><p><i>Nhắc đến Mù Cang Chải, nhiều người sẽ nghĩ ngay tới những thửa ruộng bậc thang mênh mông tít tắp, trải dài khắp nơi. Thế nhưng, Mù Cang Chải còn được gắn liền với một loài hoa có tên vô cùng đặc biệt - hoa tớ dày. Hãy cùng chúng tôi ngắm nhìn sắc đẹp của loài hoa độc đáo này trong bài viết dưới đây nhé!</i></p><h2><strong>Sắc hoa tớ dày miền di sản</strong></h2><p>Tớ dày "uống sương", "ngậm gió" lạnh những ngày mùa đông rét buốt của vùng cao Mù Cang Chải để rồi khi xuân về, từng bông hoa hồng rực bung nở "mạnh mẽ" cũng giống như sức sống của người nới đây.</p><p>Hoa nở hồng của nương đồi, sườn non cao, dọc con đường ngoằn nghèo vào bản hay bên hiên những mái nhà tranh phảng phất khói sương. Tất cả tạo nên một bức tranh vừa hùng vĩ nhưng cũng vô cùng lãng mạn, mềm mại làm say đắm trái tim người du khách.</p><p>Đây là loài hoa thuộc họ đào, được người Mông gọi bằng tên "Pằng Tớ dày", theo tiếng việt có nghĩa là "hoa đào rừng".</p><p>Cây thuộc giống thân gỗ, có phần tán mọc xòe rộng, trải khắp sườn đồi, triền núi. Bông hoa bản dày, có 5 cánh, màu hồng sắc. Khi nở hoa kết chùm lại, nhị hoa dài có màu đỏ rực rỡ.&nbsp;</p><p>Loài hoa này có gắn bó mật thiết với cuộc sống của đồng bào người Mông nơi đây. Họ quan niệm rằng mùa Xuân là thời khắc đất trời chuyển mình, sau một năm lao động vất vả, mùa vàng bội thu, thóc lúa đầy nhà nên người dân sẽ cùng nhau ăn mừng.</p><p>Khi những cây tớ dày nở hoa hồng rực rỡ cả một góc trời cũng là lúc các&nbsp;chàng trai, cô gái Mông xúng xính trong bộ váy mới, luyện khèn, chuẩn bị quả Pao để chơi Tết, du xuân.</p><p>Loài hoa Tớ dày gắn liền với đời sống nhiều thế hệ người Mông vùng cao Mù Cang Chải. Loại hoa có sức sống mãnh liệt, tượng trưng cho sức sống của con người nơi đây.&nbsp;</p><p>Sau khoảng thời gian đó tuy chưa tàn hết nhưng màu sắc cũng sẽ phai nhưng vẫn giữ được vẻ đẹp e lệ, cuốn hút.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-5.jpg" alt="Hoa tớ dày bên những cung đường quanh co" width="1920" height="1493"></p><p><i>Hoa tớ dày và bản làng Mù Cang Chải cùng những con đường quanh co, uốn lượn</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-1.jpg" alt="Khoảnh khắc đáng yêu của đồng bào dân tộc" width="1920" height="1280"></i></p><p><i>Cô gái và chàng trai bản thổi nhau nghe khúc nhạc tình lãng mạn với cành hoa thớ dày sau lưng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-2.jpg" alt="Nụ cười hồn hậu của người dân tộc" width="1920" height="1280"></i></p><p><i>Những đứa trẻ lớn lên tại vùng cao nghèo khó nhưng sức sống mãnh liệt hệt như bông hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-yen-bai.jpg" alt="Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng" width="1920" height="1280"></i></p><p><i>Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day.jpg" alt="Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn" width="1920" height="1280"></i></p><p><i>Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn nhưng lúc nào cũng ngập tràn niềm vui</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/sac-hoa-to-day.jpg" alt="Vẻ đẹp của hoa thớ dày từ trên cao xuống" width="1920" height="1280"></i></p><p><i>Vẻ đẹp của hoa thớ dày từ trên cao xuống</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/tinh-yeu-doi-lua-duoi-hoa-to-day.jpg" alt="Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng" width="1920" height="1280"></i></p><p><i>Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day-mu-cang-chai.jpg" alt="Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày" width="1920" height="1363"></i></p><p><i>Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day.jpg" alt="Vẻ đẹp xao xuyến của từng bông hoa" width="1920" height="1271"></i></p><p><i>Vẻ đẹp xao xuyến của từng bông hoa</i></p><p>Còn chần chờ gì nữa mà không lên lịch ngay cho mình để ngắm sắc đẹp thướt tha, yêu kiều, dịu dàng của loài hoa này trên rẻo cao Mù Cang Chải thôi nào bạn ơi!</p>', N'/Images/20241216_133903.jpg', N'2b69edce-0836-485c-a5c0-126b11831c19', CAST(N'2024-12-16' AS Date), 2, N'Nếu như có một đám cưới nào mà nhà trai không cần phải đón dâu thì đó chính là lễ cưới của người')
GO
SET IDENTITY_INSERT [dbo].[Articles] OFF
GO
SET IDENTITY_INSERT [dbo].[BookingProcess] ON 
GO
INSERT [dbo].[BookingProcess] ([processID], [bookingID], [paymentTime], [checkInTime], [checkOutTime], [stepOrder], [createdAt], [updatedAt], [completeStatus]) VALUES (1002, 1652968812, CAST(N'2025-05-30T12:19:47.567' AS DateTime), CAST(N'2025-05-30T12:21:58.843' AS DateTime), CAST(N'2025-05-30T12:22:51.880' AS DateTime), 4, CAST(N'2025-05-30T12:13:00.447' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[BookingProcess] ([processID], [bookingID], [paymentTime], [checkInTime], [checkOutTime], [stepOrder], [createdAt], [updatedAt], [completeStatus]) VALUES (1003, 1911591112, NULL, NULL, NULL, 0, CAST(N'2025-05-30T15:19:57.367' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[BookingProcess] ([processID], [bookingID], [paymentTime], [checkInTime], [checkOutTime], [stepOrder], [createdAt], [updatedAt], [completeStatus]) VALUES (1004, 1615588197, NULL, NULL, NULL, 0, CAST(N'2025-06-01T09:44:13.500' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[BookingProcess] ([processID], [bookingID], [paymentTime], [checkInTime], [checkOutTime], [stepOrder], [createdAt], [updatedAt], [completeStatus]) VALUES (1012, 1116161828, NULL, NULL, NULL, 0, CAST(N'2025-06-01T15:54:50.453' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[BookingProcess] OFF
GO
INSERT [dbo].[Bookings] ([bookingID], [cusID], [ownerID], [homestayID], [roomID], [checkInDate], [checkOutDate], [numberAdults], [numberChildren], [numberBaby], [totalPrice], [paymentMethod], [discountPrice], [discountCode], [originalPrice], [guestList], [description], [bookingTime], [email], [phone], [name], [isConfirm], [isCancel], [reasonCancel], [isSuccess], [statusBK], [timeConfirm], [timeReviewRating], [CMND], [extraCost], [detailExtraCost]) VALUES (353661873, N'0ee4b802-58c7-44f9-ba9b-2b6995551e3b', N'e79e7056-62d9-4e0d-8b74-036f11c8ed00', 48, 50, CAST(N'2025-05-30' AS Date), CAST(N'2025-06-18' AS Date), 5, 3, 3, 26550000, NULL, 0, N'', 26550000, NULL, NULL, CAST(N'2025-05-30T11:52:54.543' AS DateTime), N'huymuahanglzd019@gmail.com', N'0364174636', N'Nguyễn Mỹ Hạnh', 0, 1, N'Tôi có việc đột xuất', 0, -1, NULL, NULL, N'033203006716', NULL, NULL)
GO
INSERT [dbo].[Bookings] ([bookingID], [cusID], [ownerID], [homestayID], [roomID], [checkInDate], [checkOutDate], [numberAdults], [numberChildren], [numberBaby], [totalPrice], [paymentMethod], [discountPrice], [discountCode], [originalPrice], [guestList], [description], [bookingTime], [email], [phone], [name], [isConfirm], [isCancel], [reasonCancel], [isSuccess], [statusBK], [timeConfirm], [timeReviewRating], [CMND], [extraCost], [detailExtraCost]) VALUES (770312163, N'0ee4b802-58c7-44f9-ba9b-2b6995551e3b', N'247e4e0b-9587-4c2f-93d3-60e62f6b47a2', 7, 13, CAST(N'2025-06-18' AS Date), CAST(N'2025-06-26' AS Date), 5, 3, 3, 29050000, NULL, 0, N'', 29050000, NULL, NULL, CAST(N'2025-05-30T14:13:11.457' AS DateTime), N'huymuahangsp012@gmail.com', N'0364174636', N'Nguyễn Thị Mỹ Linh', 0, 0, NULL, 0, 1, NULL, NULL, N'033203006716', NULL, NULL)
GO
INSERT [dbo].[Bookings] ([bookingID], [cusID], [ownerID], [homestayID], [roomID], [checkInDate], [checkOutDate], [numberAdults], [numberChildren], [numberBaby], [totalPrice], [paymentMethod], [discountPrice], [discountCode], [originalPrice], [guestList], [description], [bookingTime], [email], [phone], [name], [isConfirm], [isCancel], [reasonCancel], [isSuccess], [statusBK], [timeConfirm], [timeReviewRating], [CMND], [extraCost], [detailExtraCost]) VALUES (1116161828, N'3791eed3-2a44-43b5-bdc6-eafcfafae82c', N'02d8b227-e52d-4e3f-aede-416db69cfad3', 6, 12, CAST(N'2025-06-10' AS Date), CAST(N'2025-06-15' AS Date), 5, 4, 3, 17350000, NULL, 0, N'', 17350000, NULL, NULL, CAST(N'2025-06-01T15:26:34.767' AS DateTime), N'huymuahangsp022@gmail.com', N'0349575773', N'Vũ Đình Côn', 1, 0, NULL, 0, 2, CAST(N'2025-06-01T15:54:50.453' AS DateTime), NULL, N'033203006716', NULL, NULL)
GO
INSERT [dbo].[Bookings] ([bookingID], [cusID], [ownerID], [homestayID], [roomID], [checkInDate], [checkOutDate], [numberAdults], [numberChildren], [numberBaby], [totalPrice], [paymentMethod], [discountPrice], [discountCode], [originalPrice], [guestList], [description], [bookingTime], [email], [phone], [name], [isConfirm], [isCancel], [reasonCancel], [isSuccess], [statusBK], [timeConfirm], [timeReviewRating], [CMND], [extraCost], [detailExtraCost]) VALUES (1615588197, NULL, N'02d8b227-e52d-4e3f-aede-416db69cfad3', 6, 12, CAST(N'2025-06-10' AS Date), CAST(N'2025-06-15' AS Date), 5, 4, 3, 17350000, NULL, 0, N'', 17350000, NULL, NULL, CAST(N'2025-06-01T09:33:03.297' AS DateTime), N'huymuahanglzd05@gmail.com', N'0349575773', N'Đào Quang Huy', 1, 1, N'Không còn nhu cầu', 0, -1, CAST(N'2025-06-01T09:44:13.497' AS DateTime), NULL, N'033203006716', NULL, NULL)
GO
INSERT [dbo].[Bookings] ([bookingID], [cusID], [ownerID], [homestayID], [roomID], [checkInDate], [checkOutDate], [numberAdults], [numberChildren], [numberBaby], [totalPrice], [paymentMethod], [discountPrice], [discountCode], [originalPrice], [guestList], [description], [bookingTime], [email], [phone], [name], [isConfirm], [isCancel], [reasonCancel], [isSuccess], [statusBK], [timeConfirm], [timeReviewRating], [CMND], [extraCost], [detailExtraCost]) VALUES (1652968812, N'0ee4b802-58c7-44f9-ba9b-2b6995551e3b', N'247e4e0b-9587-4c2f-93d3-60e62f6b47a2', 7, 13, CAST(N'2025-05-30' AS Date), CAST(N'2025-06-13' AS Date), 5, 3, 3, 10300000, NULL, 0, N'', 10300000, NULL, NULL, CAST(N'2025-05-30T11:51:29.740' AS DateTime), N'huymuahanglzd019@gmail.com', N'0364174636', N'Đào Quang Huy', 1, 0, NULL, 1, 6, NULL, CAST(N'2025-05-30T23:10:50.757' AS DateTime), N'033203006716', 1820000, N'{"extraPersonCost":{"extraAdult":{"count":3,"fee":440000.0,"total":1320000.0},"extraChild":{"count":0,"fee":0.0,"total":0.0},"extraBaby":{"count":0,"fee":0.0,"total":0.0}},"serviceCost":[],"otherCost":[{"name":"Làm Hỏng Tủ Lạnh","amount":500000.0}],"totalExtraCost":1820000.0}')
GO
INSERT [dbo].[Bookings] ([bookingID], [cusID], [ownerID], [homestayID], [roomID], [checkInDate], [checkOutDate], [numberAdults], [numberChildren], [numberBaby], [totalPrice], [paymentMethod], [discountPrice], [discountCode], [originalPrice], [guestList], [description], [bookingTime], [email], [phone], [name], [isConfirm], [isCancel], [reasonCancel], [isSuccess], [statusBK], [timeConfirm], [timeReviewRating], [CMND], [extraCost], [detailExtraCost]) VALUES (1911591112, N'0ee4b802-58c7-44f9-ba9b-2b6995551e3b', N'247e4e0b-9587-4c2f-93d3-60e62f6b47a2', 7, 13, CAST(N'2025-06-27' AS Date), CAST(N'2025-06-30' AS Date), 5, 3, 3, 10300000, NULL, 0, N'', 10300000, NULL, NULL, CAST(N'2025-05-30T15:19:31.047' AS DateTime), N'huymuahanglzd04@gmail.com', N'0364174636', N'Đào Quang Huy', 1, 0, NULL, 0, 2, CAST(N'2025-05-30T15:19:57.363' AS DateTime), NULL, N'033203006716', NULL, NULL)
GO
INSERT [dbo].[Bookings] ([bookingID], [cusID], [ownerID], [homestayID], [roomID], [checkInDate], [checkOutDate], [numberAdults], [numberChildren], [numberBaby], [totalPrice], [paymentMethod], [discountPrice], [discountCode], [originalPrice], [guestList], [description], [bookingTime], [email], [phone], [name], [isConfirm], [isCancel], [reasonCancel], [isSuccess], [statusBK], [timeConfirm], [timeReviewRating], [CMND], [extraCost], [detailExtraCost]) VALUES (2144029695, N'0ee4b802-58c7-44f9-ba9b-2b6995551e3b', N'247e4e0b-9587-4c2f-93d3-60e62f6b47a2', 7, 13, CAST(N'2025-07-01' AS Date), CAST(N'2025-07-05' AS Date), 5, 3, 3, 14050000, NULL, 0, N'', 14050000, NULL, NULL, CAST(N'2025-05-30T15:23:29.030' AS DateTime), N'huymuahanglzd04@gmail.com', N'0364174636', N'Đào Quang Huy', 0, 0, NULL, 0, 1, NULL, NULL, N'033203006716', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[CategoryArticles] ON 
GO
INSERT [dbo].[CategoryArticles] ([cateID], [cateName], [description]) VALUES (1, N'Ẩm thực ba miền', N'Bài viết về Ẩm thực ba miền')
GO
INSERT [dbo].[CategoryArticles] ([cateID], [cateName], [description]) VALUES (2, N'Văn Hóa Lễ Hội', N'Văn Hóa Lễ Hội')
GO
INSERT [dbo].[CategoryArticles] ([cateID], [cateName], [description]) VALUES (3, N'Văn Hóa Phong Tục', N'Văn Hóa Phong Tục')
GO
SET IDENTITY_INSERT [dbo].[CategoryArticles] OFF
GO
SET IDENTITY_INSERT [dbo].[Conversations] ON 
GO
INSERT [dbo].[Conversations] ([conversationID], [idUser1], [idUser2], [createdAt], [lastMessageAt], [userName1], [userName2]) VALUES (1002, N'502ca239-9edc-4eb3-8449-f0fe25ada778', N'1e2d609c-1b9a-4328-ab3c-cef8fe05db0e', CAST(N'2025-05-30T11:49:25.000' AS DateTime), CAST(N'2025-05-30T11:49:25.000' AS DateTime), N'kh1', N'owner5')
GO
INSERT [dbo].[Conversations] ([conversationID], [idUser1], [idUser2], [createdAt], [lastMessageAt], [userName1], [userName2]) VALUES (1003, N'd6c66368-dc56-4bff-9b58-3f9f08e152b0', N'1e2d609c-1b9a-4328-ab3c-cef8fe05db0e', CAST(N'2025-06-01T10:48:21.000' AS DateTime), CAST(N'2025-06-01T10:48:21.000' AS DateTime), N'kh2', N'owner5')
GO
SET IDENTITY_INSERT [dbo].[Conversations] OFF
GO
INSERT [dbo].[Customers] ([cusID], [userID], [rentedRoomsTotal], [totalAmountPaID]) VALUES (N'0ee4b802-58c7-44f9-ba9b-2b6995551e3b', N'502ca239-9edc-4eb3-8449-f0fe25ada778', NULL, NULL)
GO
INSERT [dbo].[Customers] ([cusID], [userID], [rentedRoomsTotal], [totalAmountPaID]) VALUES (N'21007c6f-1c1d-43ad-9dec-2a1387ecfb9e', N'f011b014-e977-434e-9b7a-f835f83d2e98', NULL, NULL)
GO
INSERT [dbo].[Customers] ([cusID], [userID], [rentedRoomsTotal], [totalAmountPaID]) VALUES (N'2342345345', N'bafa7f55-8d66-45f4-83b7-e6a9e6e93a3f', NULL, NULL)
GO
INSERT [dbo].[Customers] ([cusID], [userID], [rentedRoomsTotal], [totalAmountPaID]) VALUES (N'3791eed3-2a44-43b5-bdc6-eafcfafae82c', N'fc877f75-1098-4d9d-b852-580e9dbc4e88', NULL, NULL)
GO
INSERT [dbo].[Customers] ([cusID], [userID], [rentedRoomsTotal], [totalAmountPaID]) VALUES (N'5bef5331-a4bc-4efc-906b-379227500361', N'1d59e1df-f8ad-4032-a1a8-ab9fb0b8a183', NULL, NULL)
GO
INSERT [dbo].[Customers] ([cusID], [userID], [rentedRoomsTotal], [totalAmountPaID]) VALUES (N'7615923b-6cb9-4e40-8e93-54df898ec262', N'717494c1-a769-48fa-b502-483d6e8f579f', NULL, NULL)
GO
INSERT [dbo].[Customers] ([cusID], [userID], [rentedRoomsTotal], [totalAmountPaID]) VALUES (N'861c81fc-b227-49ae-af08-c6ef21586997', N'9efd1f08-441f-4651-be48-2084e296532c', NULL, NULL)
GO
INSERT [dbo].[Customers] ([cusID], [userID], [rentedRoomsTotal], [totalAmountPaID]) VALUES (N'ba393c58-e0c9-40a1-891b-59d14e754825', N'cac4a853-71e5-436d-8ec6-7ac99c8390ec', NULL, NULL)
GO
INSERT [dbo].[Customers] ([cusID], [userID], [rentedRoomsTotal], [totalAmountPaID]) VALUES (N'cb39bc39-ecd8-4f66-9e61-361ce45d41cf', N'b29cacf9-8820-4be3-9515-89da7c990ee7', NULL, NULL)
GO
INSERT [dbo].[Customers] ([cusID], [userID], [rentedRoomsTotal], [totalAmountPaID]) VALUES (N'cf8361f3-b52c-4c7a-a6a2-b54b71da32e6', N'1e2d609c-1b9a-4328-ab3c-cef8fe05db0e', NULL, NULL)
GO
INSERT [dbo].[Customers] ([cusID], [userID], [rentedRoomsTotal], [totalAmountPaID]) VALUES (N'd1c1cc53-6a43-4f3c-8c4e-057d3a11e3ae', N'89fceba7-32c8-4bf2-8d91-ccab31ef7d82', NULL, NULL)
GO
INSERT [dbo].[Customers] ([cusID], [userID], [rentedRoomsTotal], [totalAmountPaID]) VALUES (N'd6e0ffda-0a75-4aea-86ff-c0574332b636', N'ebd26f34-092c-415d-b73e-5cbacf06175a', NULL, NULL)
GO
INSERT [dbo].[Customers] ([cusID], [userID], [rentedRoomsTotal], [totalAmountPaID]) VALUES (N'f1f5977c-560b-4609-afb1-6e925014a8ba', N'd6c66368-dc56-4bff-9b58-3f9f08e152b0', NULL, NULL)
GO
INSERT [dbo].[Customers] ([cusID], [userID], [rentedRoomsTotal], [totalAmountPaID]) VALUES (N'fb18fd0d-75e9-422f-8dee-0f6b057cbe4d', N'c7ce3346-3e14-4ab6-9841-ece3517f4a94', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[DetailHomeStays] ON 
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (6, 6, N'<p><i><strong>Lối Về Miền Hoa</strong></i> là một homestay ấm cúng nằm giữa thung lũng Mai, bao quanh bởi những thửa ruộng bậc thang xanh mướt và dãy núi Hoàng Liên Sơn hùng vĩ. Homestay được thiết kế theo phong cách truyền thống của người Tày, với nhà sàn gỗ mộc mạc, mái lá cọ và nội thất thủ công tinh xảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.<ul><li>Tôn trọng phong tục của người Tày, không mặc đồ hở hang khi tham gia hoạt động bản làng 🙏.</li></ul></li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li><li>Hạn chế sử dụng đồ nhựa, sử dụng chai nước tái sử dụng 🥤.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà sàn để tránh nguy cơ cháy 🚭.</li><li>Sử dụng lò sưởi hoặc bếp BBQ dưới sự hướng dẫn của nhân viên 🧑‍🔧.</li></ul></li><li><i><strong>Hoạt động chung</strong> 🎉</i><ul><li>Đăng ký trước cho các tour trekking 🥾 hoặc lớp học nấu ăn 🍲 (ít nhất 1 ngày).</li><li>Giữ gìn vệ sinh khu vực bếp chung và khu vực lửa trại sau khi sử dụng 🧹.</li></ul></li><li><i><strong>Thú cưng</strong> 🐶</i><ul><li>Thú cưng được phép lưu trú nhưng phải báo trước và giữ vệ sinh cho thú cưng 🧼.</li></ul></li></ul>', 1, 1, 0, 0, 1, 1, 0, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng (nếu có) thường được cung cấp miễn phí hoặc tính phí riêng, phục vụ trong khung giờ cố định (thường 7:00-9:00) 🥞.</li><li>Các dịch vụ như tour khám phá 🚶‍♂️, thuê xe đạp 🚲, hoặc tổ chức BBQ 🍖 cần đặt trước ít nhất 12-24 giờ.</li><li>Một số homestay cung cấp dịch vụ đưa đón sân bay hoặc bến xe với chi phí riêng 🚌.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️, hạn chế sử dụng đồ nhựa dùng một lần ♻️.</li><li>Không hái hoa, bẻ cây 🌸 hoặc làm hư hại cảnh quan xung quanh homestay.</li></ul></li><li><strong>Chính sách an toàn và tài sản</strong> 🛡️<ul><li>Khách chịu trách nhiệm tự bảo quản tài sản cá nhân; homestay không chịu trách nhiệm nếu xảy ra mất mát, trừ trường hợp có két an toàn 🔒.</li><li>Tuân thủ quy định an toàn khi sử dụng bếp, lò sưởi 🔥 hoặc các thiết bị điện trong homestay.</li><li>Không hút thuốc trong khu vực phòng ngủ hoặc nhà sàn để tránh nguy cơ cháy 🚭.</li></ul></li><li><strong>Chính sách tôn trọng văn hóa địa phương</strong> 🤝<ul><li>Khách được khuyến khích tôn trọng phong tục, tập quán của cộng đồng địa phương 🙏.</li><li>Giữ gìn không gian yên tĩnh, đặc biệt sau 22:00 để tránh làm phiền khách khác và dân bản 🌙.</li></ul></li><li><strong>Chính sách thanh toán</strong> 💳<ul><li>Chấp nhận thanh toán bằng tiền mặt, chuyển khoản ngân hàng hoặc ứng dụng thanh toán (Momo, ZaloPay, v.v.) 💸.</li><li>Toàn bộ chi phí phải được thanh toán trước khi trả phòng, trừ trường hợp có thỏa thuận khác.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (7, 7, N'<p><strong>Lối Về Miền Hoa</strong> là một homestay ấm cúng nằm giữa thung lũng Mai, bao quanh bởi những thửa ruộng bậc thang xanh mướt và dãy núi Hoàng Liên Sơn hùng vĩ. Homestay được thiết kế theo phong cách truyền thống của người Tày, với nhà sàn gỗ mộc mạc, mái lá cọ và nội thất thủ công tinh xảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.<ul><li>Tôn trọng phong tục của người Tày, không mặc đồ hở hang khi tham gia hoạt động bản làng 🙏.</li></ul></li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li><li>Hạn chế sử dụng đồ nhựa, sử dụng chai nước tái sử dụng 🥤.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà sàn để tránh nguy cơ cháy 🚭.</li><li>Sử dụng lò sưởi hoặc bếp BBQ dưới sự hướng dẫn của nhân viên 🧑‍🔧.</li></ul></li><li><i><strong>Hoạt động chung</strong> 🎉</i><ul><li>Đăng ký trước cho các tour trekking 🥾 hoặc lớp học nấu ăn 🍲 (ít nhất 1 ngày).</li><li>Giữ gìn vệ sinh khu vực bếp chung và khu vực lửa trại sau khi sử dụng 🧹.</li></ul></li><li><i><strong>Thú cưng</strong> 🐶</i><ul><li>Thú cưng được phép lưu trú nhưng phải báo trước và giữ vệ sinh cho thú cưng 🧼.</li></ul></li></ul>', 1, 1, 1, 1, 1, 1, 1, 1, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng (nếu có) thường được cung cấp miễn phí hoặc tính phí riêng, phục vụ trong khung giờ cố định (thường 7:00-9:00) 🥞.</li><li>Các dịch vụ như tour khám phá 🚶‍♂️, thuê xe đạp 🚲, hoặc tổ chức BBQ 🍖 cần đặt trước ít nhất 12-24 giờ.</li><li>Một số homestay cung cấp dịch vụ đưa đón sân bay hoặc bến xe với chi phí riêng 🚌.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️, hạn chế sử dụng đồ nhựa dùng một lần ♻️.</li><li>Không hái hoa, bẻ cây 🌸 hoặc làm hư hại cảnh quan xung quanh homestay.</li></ul></li><li><strong>Chính sách an toàn và tài sản</strong> 🛡️<ul><li>Khách chịu trách nhiệm tự bảo quản tài sản cá nhân; homestay không chịu trách nhiệm nếu xảy ra mất mát, trừ trường hợp có két an toàn 🔒.</li><li>Tuân thủ quy định an toàn khi sử dụng bếp, lò sưởi 🔥 hoặc các thiết bị điện trong homestay.</li><li>Không hút thuốc trong khu vực phòng ngủ hoặc nhà sàn để tránh nguy cơ cháy 🚭.</li></ul></li><li><strong>Chính sách tôn trọng văn hóa địa phương</strong> 🤝<ul><li>Khách được khuyến khích tôn trọng phong tục, tập quán của cộng đồng địa phương 🙏.</li><li>Giữ gìn không gian yên tĩnh, đặc biệt sau 22:00 để tránh làm phiền khách khác và dân bản 🌙.</li></ul></li><li><strong>Chính sách thanh toán</strong> 💳<ul><li>Chấp nhận thanh toán bằng tiền mặt, chuyển khoản ngân hàng hoặc ứng dụng thanh toán (Momo, ZaloPay, v.v.) 💸.</li><li>Toàn bộ chi phí phải được thanh toán trước khi trả phòng, trừ trường hợp có thỏa thuận khác.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (8, 8, N'<p>Homestay có khu vườn hoa tam giác mạch nở rộ vào tháng 10-11 🌸, là nơi lý tưởng để chụp ảnh 📸 và tận hưởng không khí trong lành 🌬️.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.<ul><li>Tôn trọng phong tục của người Tày, không mặc đồ hở hang khi tham gia hoạt động bản làng 🙏.</li></ul></li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li><li>Hạn chế sử dụng đồ nhựa, sử dụng chai nước tái sử dụng 🥤.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà sàn để tránh nguy cơ cháy 🚭.</li><li>Sử dụng lò sưởi hoặc bếp BBQ dưới sự hướng dẫn của nhân viên 🧑‍🔧.</li></ul></li><li><i><strong>Hoạt động chung</strong> 🎉</i><ul><li>Đăng ký trước cho các tour trekking 🥾 hoặc lớp học nấu ăn 🍲 (ít nhất 1 ngày).</li><li>Giữ gìn vệ sinh khu vực bếp chung và khu vực lửa trại sau khi sử dụng 🧹.</li></ul></li><li><i><strong>Thú cưng</strong> 🐶</i><ul><li>Thú cưng được phép lưu trú nhưng phải báo trước và giữ vệ sinh cho thú cưng 🧼.</li></ul></li></ul>', 1, 1, 1, 1, 1, 1, 1, 1, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng (nếu có) thường được cung cấp miễn phí hoặc tính phí riêng, phục vụ trong khung giờ cố định (thường 7:00-9:00) 🥞.</li><li>Các dịch vụ như tour khám phá 🚶‍♂️, thuê xe đạp 🚲, hoặc tổ chức BBQ 🍖 cần đặt trước ít nhất 12-24 giờ.</li><li>Một số homestay cung cấp dịch vụ đưa đón sân bay hoặc bến xe với chi phí riêng 🚌.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️, hạn chế sử dụng đồ nhựa dùng một lần ♻️.</li><li>Không hái hoa, bẻ cây 🌸 hoặc làm hư hại cảnh quan xung quanh homestay.</li></ul></li><li><strong>Chính sách an toàn và tài sản</strong> 🛡️<ul><li>Khách chịu trách nhiệm tự bảo quản tài sản cá nhân; homestay không chịu trách nhiệm nếu xảy ra mất mát, trừ trường hợp có két an toàn 🔒.</li><li>Tuân thủ quy định an toàn khi sử dụng bếp, lò sưởi 🔥 hoặc các thiết bị điện trong homestay.</li><li>Không hút thuốc trong khu vực phòng ngủ hoặc nhà sàn để tránh nguy cơ cháy 🚭.</li></ul></li><li><strong>Chính sách tôn trọng văn hóa địa phương</strong> 🤝<ul><li>Khách được khuyến khích tôn trọng phong tục, tập quán của cộng đồng địa phương 🙏.</li><li>Giữ gìn không gian yên tĩnh, đặc biệt sau 22:00 để tránh làm phiền khách khác và dân bản 🌙.</li></ul></li><li><strong>Chính sách thanh toán</strong> 💳<ul><li>Chấp nhận thanh toán bằng tiền mặt, chuyển khoản ngân hàng hoặc ứng dụng thanh toán (Momo, ZaloPay, v.v.) 💸.</li><li>Toàn bộ chi phí phải được thanh toán trước khi trả phòng, trừ trường hợp có thỏa thuận khác.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (9, 9, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (10, 10, N'<p><strong>Sapa Terrace View</strong> là homestay nằm giữa thung lũng Mường Hoa, với tầm nhìn tuyệt đẹp ra những thửa ruộng bậc thang và dãy núi Hoàng Liên Sơn hùng vĩ. Homestay được xây dựng theo phong cách truyền thống của người H''Mông.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 21:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Tiết kiệm nước và điện khi sử dụng.</li></ul></li></ul>', 0, 0, 1, 1, 0, 1, 0, 1, N'<ul><li><i><strong>Chính sách đặt tour</strong></i><ul><li>Đặt tour trekking trước 1 ngày 🥾.</li></ul></li><li><strong>Chính sách thanh toán</strong> 💳<ul><li>Chấp nhận thanh toán bằng tiền mặt hoặc chuyển khoản 💸.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (11, 11, N'<p><strong>Hội An Ancient House</strong> là ngôi nhà cổ hơn 200 năm tuổi được cải tạo thành homestay, giữ nguyên kiến trúc truyền thống của phố cổ Hội An với mái ngói âm dương, cột gỗ và sân trong truyền thống.</p>', N'<ul><li><i><strong>Giữ gìn di sản</strong> 🏛️</i></li><li>Không hút thuốc trong nhà 🚭.</li><li>Giữ gìn yên tĩnh sau 22:00 🌙.</li></ul>', 0, 0, 1, 1, 0, 0, 0, 0, N'<ul><li><i><strong>Chính sách văn hóa</strong></i><ul><li>Khách được mời tham gia các hoạt động văn hóa truyền thống 🏮.</li></ul></li><li><strong>Chính sách thanh toán</strong> 💳<ul><li>Thanh toán trước 50% khi đặt phòng 💸.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (12, 12, N'<p><strong>Mekong Delta Riverside</strong> là homestay nằm bên bờ sông Hàm Luông, được xây dựng theo kiến trúc nhà vườn Nam Bộ với vườn cây ăn trái xum xuê và hệ thống kênh rạch bao quanh.</p>', N'<ul><li><i><strong>An toàn khi ở gần sông</strong> 🚣</i></li><li>Trẻ em phải có người lớn đi kèm khi ra khu vực sông 👶.</li><li>Không xả rác xuống sông 🌿.</li></ul>', 0, 0, 1, 1, 1, 0, 0, 1, N'<ul><li><i><strong>Chính sách tour</strong></i><ul><li>Cung cấp tour chèo xuồng ba lá và tham quan vườn trái cây 🚣.</li></ul></li><li><strong>Chính sách ẩm thực</strong> 🍲<ul><li>Phục vụ các món ăn đặc sản miền Tây Nam Bộ.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (13, 13, N'<p><strong>Đà Lạt Pine Hill</strong> là homestay nằm trên đồi thông, với kiến trúc kiểu Pháp pha trộn hiện đại. Từ homestay có thể ngắm toàn cảnh thành phố Đà Lạt và hồ Xuân Hương.</p>', N'<ul><li><i><strong>Giữ gìn không gian yên tĩnh</strong> 🤫</i></li><li>Không làm ồn sau 22:00 🌙.</li><li>Không hút thuốc trong nhà 🚭.</li></ul>', 1, 1, 1, 1, 1, 1, 0, 0, N'<ul><li><i><strong>Chính sách đặc biệt</strong></i><ul><li>Phục vụ trà chiều miễn phí hàng ngày từ 15:00-17:00 🍵.</li></ul></li><li><strong>Chính sách tour</strong> 🚲<ul><li>Cung cấp dịch vụ thuê xe đạp và tour tham quan thành phố.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (14, 14, N'<p><strong>Hội An Ancient House</strong> là ngôi nhà cổ hơn 200 năm tuổi được trùng tu và chuyển đổi thành homestay. Giữ nguyên kiến trúc gỗ truyền thống với sân trong và giếng trời đặc trưng của nhà cổ Hội An.</p>', N'<ul><li><i><strong>Bảo vệ di sản</strong> 🏮</i></li><li>Cẩn thận với các đồ vật cổ trong nhà.</li><li>Tắt đèn khi ra ngoài để tiết kiệm năng lượng 💡.</li></ul>', 0, 0, 1, 1, 0, 0, 0, 0, N'<ul><li><i><strong>Chính sách văn hóa</strong></i><ul><li>Tổ chức lớp học nấu ăn truyền thống mỗi tối 🍲.</li></ul></li><li><strong>Chính sách đặc biệt</strong> 🏮<ul><li>Tặng vé tham quan phố cổ cho khách lưu trú từ 2 đêm.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (15, 15, N'<p><strong>Phú Quốc Ocean View</strong> là homestay nằm sát biển với kiến trúc mở, tối đa hóa tầm nhìn ra biển. Thiết kế theo phong cách nhiệt đới hiện đại với nhiều không gian mở và vật liệu tự nhiên.</p>', N'<ul><li><i><strong>An toàn khi tắm biển</strong> 🌊</i></li><li>Không tắm biển sau 18:00 và khi có cờ đỏ.</li><li>Bảo vệ môi trường biển, không xả rác 🌿.</li></ul>', 1, 0, 1, 1, 0, 0, 1, 0, N'<ul><li><i><strong>Chính sách tour</strong></i><ul><li>Tổ chức tour câu mực đêm và lặn ngắm san hô 🐙.</li></ul></li><li><strong>Chính sách ẩm thực</strong> 🦞<ul><li>Phục vụ hải sản tươi sống đánh bắt trong ngày.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (16, 16, N'<p><strong>Ninh Bình Tam Cốc Lodge</strong> là homestay được xây dựng từ đá vôi địa phương, nằm giữa cánh đồng lúa và núi đá vôi hùng vĩ của Tam Cốc. Thiết kế kết hợp giữa kiến trúc truyền thống Việt Nam và tiện nghi hiện đại.</p>', N'<ul><li><i><strong>Tôn trọng thiên nhiên</strong> 🌿</i></li><li>Không làm ồn để không làm phiền động vật hoang dã.</li><li>Tiết kiệm nước và điện 💧.</li></ul>', 0, 0, 1, 1, 0, 1, 0, 1, N'<ul><li><i><strong>Chính sách tour</strong></i><ul><li>Tổ chức tour đạp xe khám phá làng quê và chèo thuyền Tam Cốc 🚲.</li></ul></li><li><strong>Chính sách đặc biệt</strong> 🍚<ul><li>Phục vụ bữa sáng truyền thống miễn phí với nguyên liệu từ vườn nhà.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (17, 17, N'<p><strong>Mộc Châu Highland Retreat</strong> là homestay được xây dựng theo phong cách nhà sàn Thái kết hợp với kiến trúc hiện đại, nằm giữa đồi chè xanh mướt và vườn hoa mận, hoa đào của cao nguyên Mộc Châu.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa dân tộc</strong> 🏮</i></li><li>Tham gia các hoạt động văn hóa với tinh thần tôn trọng.</li><li>Giữ gìn vệ sinh chung 🌿.</li></ul>', 0, 0, 1, 1, 0, 1, 0, 1, N'<ul><li><i><strong>Chính sách trải nghiệm</strong></i><ul><li>Tổ chức tour hái chè và làm sữa chua Mộc Châu 🍵.</li></ul></li><li><strong>Chính sách ẩm thực</strong> 🍲<ul><li>Phục vụ các món đặc sản dân tộc Thái và Mông.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (18, 19, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (19, 22, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (20, 24, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (21, 25, N'<p><strong>Sapa Bamboo Retreat</strong> là một homestay yên bình nằm giữa thung lũng Mường Hoa, với khung cảnh ruộng bậc thang tuyệt đẹp. Được xây dựng từ tre và gỗ tự nhiên, homestay mang đến trải nghiệm gần gũi với thiên nhiên và văn hóa dân tộc vùng cao.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 21:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Tiết kiệm nước và điện năng 💧.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Cẩn thận khi sử dụng lò sưởi trong phòng 🔥.</li></ul></li></ul>', 0, 0, 1, 1, 0, 1, 0, 1, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Tour trekking có phí từ 300.000đ/người 🥾.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Sử dụng sản phẩm tái chế và thân thiện với môi trường 🌱.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (22, 26, N'<p><strong>Hội An River Lodge</strong> là một homestay xinh đẹp nằm bên bờ sông Thu Bồn, cách phố cổ Hội An chỉ vài phút đi bộ. Homestay được thiết kế theo kiến trúc truyền thống Hội An với những mảng tường vàng đặc trưng và đèn lồng rực rỡ.</p>', N'<ul><li><i><strong>Tôn trọng di sản văn hóa</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:30 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Hạn chế sử dụng túi nilon và đồ nhựa dùng một lần 🚯.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Chú ý an toàn khi đi thuyền trên sông 🚣.</li></ul></li></ul>', 1, 0, 1, 1, 0, 0, 0, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Lớp học nấu ăn truyền thống: 400.000đ/người 👨‍🍳.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Sử dụng năng lượng mặt trời cho nước nóng ☀️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (23, 27, N'<p><strong>Mekong Delta Eco House</strong> là một homestay sinh thái nằm giữa vườn dừa xanh mát bên dòng sông Tiền. Được xây dựng từ vật liệu tự nhiên như tre, lá dừa và gỗ, homestay mang đến trải nghiệm sống gần gũi với thiên nhiên miền Tây sông nước.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 21:30 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Sử dụng tiết kiệm nước ngọt 💧.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Cẩn thận khi đi lại trên cầu khỉ và đường mòn 🚶.</li></ul></li></ul>', 0, 0, 1, 1, 0, 0, 0, 1, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Tour chèo xuồng ba lá: 200.000đ/người 🚣.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Sử dụng xà phòng và dầu gội hữu cơ thân thiện với môi trường 🌱.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (24, 28, N'<p><strong>Đà Lạt Pine Valley</strong> là một homestay lãng mạn nằm giữa rừng thông Đà Lạt, cách trung tâm thành phố khoảng 3km. Homestay được thiết kế theo phong cách châu Âu với những khu vườn hoa đẹp mắt và không gian ấm cúng.</p>', N'<ul><li><i><strong>Tôn trọng không gian chung</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không hái hoa, bẻ cành trong khuôn viên 🌸.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Sử dụng lò sưởi đúng cách và tắt khi ra ngoài 🔥.</li></ul></li></ul>', 0, 1, 1, 1, 0, 1, 0, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Tiệc BBQ trong vườn: 350.000đ/người 🍖.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Sử dụng hệ thống sưởi bằng năng lượng mặt trời ☀️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (25, 29, N'<p><strong>Hội An Ancient House</strong> là một ngôi nhà cổ hơn 200 năm tuổi được cải tạo thành homestay, nằm trong khu phố cổ Hội An. Với kiến trúc gỗ truyền thống và nội thất cổ kính, homestay mang đến trải nghiệm sống trong không gian văn hóa đặc trưng của phố cổ.</p>', N'<ul><li><i><strong>Tôn trọng di sản văn hóa</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Tiết kiệm điện nước trong khu vực phố cổ 💧.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Cẩn thận với các vật dụng cổ trong nhà 🏺.</li></ul></li></ul>', 0, 0, 1, 1, 0, 0, 0, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Lớp học nấu ăn truyền thống: 400.000đ/người 🍲.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Sử dụng túi vải thay túi nilon khi đi chợ 🛍️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (26, 30, N'<p><strong>Phú Quốc Ocean View</strong> là một homestay hiện đại nằm trên bãi biển Ông Lang, với tầm nhìn tuyệt đẹp ra biển. Được thiết kế theo phong cách nhiệt đới với nhiều không gian mở, homestay mang đến trải nghiệm nghỉ dưỡng thư giãn giữa thiên nhiên.</p>', N'<ul><li><i><strong>Tôn trọng môi trường biển</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 23:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác ra biển và bãi biển 🏖️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Cẩn thận khi tắm biển, tuân thủ các cảnh báo an toàn 🌊.</li></ul></li></ul>', 1, 0, 1, 1, 0, 0, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Tour câu mực đêm: 500.000đ/người 🦑.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Sử dụng ống hút tre thay ống hút nhựa 🥤.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (27, 31, N'<p><strong>Ninh Bình Tam Cốc Lodge</strong> là một homestay yên bình nằm giữa cánh đồng lúa và núi đá vôi Tam Cốc. Được xây dựng theo kiến trúc nhà sàn truyền thống kết hợp với tiện nghi hiện đại, homestay mang đến trải nghiệm gần gũi với thiên nhiên.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác xuống sông và kênh rạch 🚣.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Cẩn thận khi đi lại trên cầu tre và đường mòn 🚶.</li></ul></li></ul>', 0, 0, 1, 1, 1, 1, 0, 1, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Tour chèo thuyền Tam Cốc: 300.000đ/người 🚣.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Sử dụng năng lượng mặt trời cho nước nóng ☀️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (28, 32, N'<p><strong>Hội An Ancient House</strong> là một homestay truyền thống nằm trong khu phố cổ Hội An. Ngôi nhà hơn 200 năm tuổi được trùng tu cẩn thận, giữ nguyên kiến trúc gỗ cổ kính với những đèn lồng đầy màu sắc và sân trong thoáng đãng.</p>', N'<ul><li><i><strong>Tôn trọng di sản văn hóa</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Tiết kiệm điện nước, tắt điều hòa khi ra ngoài 💧.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Cẩn thận với các vật dụng cổ trong nhà 🏺.</li></ul></li></ul>', 0, 0, 1, 1, 0, 0, 0, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Lớp học nấu ăn truyền thống: 350.000đ/người 🍲.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Sử dụng ống hút tre thay ống hút nhựa 🥤.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (29, 33, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (30, 34, N'<p><strong>Sapa Mây Ngủ Homestay</strong> là một không gian nghỉ dưỡng yên bình giữa núi rừng Tây Bắc. Homestay được xây dựng theo kiến trúc truyền thống của người H''Mông với mái nhà gỗ và những chi tiết thủ công tinh tế.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 21:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Tiết kiệm nước và điện khi sử dụng 💧.</li></ul></li></ul>', 0, 0, 1, 1, 0, 1, 0, 1, N'<ul><li><i><strong>Chính sách hủy phòng</strong> 📅</i><ul><li>Miễn phí hủy phòng trước 7 ngày.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Sử dụng các sản phẩm thân thiện với môi trường 🌱.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (31, 35, N'<p><strong>Hội An Riverside Cottage</strong> là một ngôi nhà cổ được cải tạo nằm bên bờ sông Thu Bồn thơ mộng. Homestay mang đậm nét kiến trúc truyền thống Hội An với những mảng tường vàng, đèn lồng rực rỡ và nội thất gỗ tinh xảo.</p>', N'<ul><li><i><strong>Giữ gìn di sản</strong> 🏮</i></li><li>Không hút thuốc trong nhà 🚭.</li><li><i><strong>Giờ yên lặng</strong> 🌙</i><ul><li>Từ 22:00 đến 6:00 sáng.</li></ul></li></ul>', 1, 0, 1, 1, 0, 0, 0, 0, N'<ul><li><i><strong>Chính sách đặt phòng</strong> 📝</i><ul><li>Đặt cọc 30% giá trị đơn hàng.</li></ul></li><li><strong>Chính sách trẻ em</strong> 👶<ul><li>Miễn phí cho trẻ dưới 5 tuổi.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (32, 36, N'<p><strong>Mekong Delta Green House</strong> là một homestay sinh thái nằm giữa vườn cây ăn trái xanh mát của miền Tây sông nước. Homestay được xây dựng từ vật liệu tự nhiên như tre, gỗ và lá dừa, tạo nên không gian gần gũi với thiên nhiên.</p>', N'<ul><li><i><strong>Tôn trọng môi trường</strong> 🌱</i></li><li>Không sử dụng túi nilon và đồ nhựa dùng một lần 🚫.</li><li><i><strong>Hoạt động ngoài trời</strong> 🛶</i><ul><li>Tuân thủ hướng dẫn an toàn khi tham gia các hoạt động trên sông.</li></ul></li></ul>', 0, 0, 1, 1, 1, 0, 0, 1, N'<ul><li><i><strong>Chính sách ẩm thực</strong> 🍲</i><ul><li>Bữa sáng miễn phí với trái cây địa phương.</li></ul></li><li><strong>Chính sách tour</strong> 🚣‍♀️<ul><li>Đặt tour khám phá sông nước trước 1 ngày.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (33, 37, N'<p><strong>Hội An Ancient House</strong> là một ngôi nhà cổ hơn 200 năm tuổi được trùng tu thành homestay. Giữ nguyên kiến trúc gỗ truyền thống với mái ngói âm dương, cửa gỗ chạm trổ tinh xảo và sân trong thoáng đãng.</p>', N'<ul><li><i><strong>Bảo vệ di sản</strong> 🏮</i></li><li>Không hút thuốc trong nhà để bảo vệ kết cấu gỗ cổ 🚭.</li><li><i><strong>Giờ yên lặng</strong> 🌙</i><ul><li>Giữ không gian yên tĩnh sau 22:00.</li></ul></li></ul>', 0, 0, 1, 1, 0, 0, 0, 0, N'<ul><li><i><strong>Chính sách văn hóa</strong> 🎭</i><ul><li>Tham gia lớp học nấu ăn truyền thống miễn phí mỗi tối.</li></ul></li><li><strong>Chính sách đặc biệt</strong> 🧵<ul><li>Tặng quà lưu niệm thủ công cho khách lưu trú từ 3 đêm.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (34, 38, N'<p><strong>Sapa Mountain Retreat</strong> là homestay của người dân tộc H''Mông nằm giữa thung lũng Mường Hoa. Từ đây, du khách có thể ngắm nhìn những thửa ruộng bậc thang tuyệt đẹp và dãy núi Hoàng Liên Sơn hùng vĩ.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🏔️</i></li><li>Ăn mặc lịch sự khi tham gia các hoạt động cộng đồng 👘.</li><li><i><strong>Tiết kiệm năng lượng</strong> 💡</i><ul><li>Tắt đèn và thiết bị điện khi không sử dụng.</li></ul></li></ul>', 0, 0, 1, 1, 0, 1, 0, 1, N'<ul><li><i><strong>Chính sách ẩm thực</strong> 🍚</i><ul><li>Bữa tối truyền thống với gia đình người H''Mông.</li></ul></li><li><strong>Chính sách trekking</strong> 🥾<ul><li>Cung cấp hướng dẫn viên địa phương cho các tour trekking.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (35, 39, N'<p><strong>Phú Quốc Beach House</strong> là homestay nằm sát biển với kiến trúc mở, hòa mình vào thiên nhiên. Từ ban công, du khách có thể ngắm hoàng hôn tuyệt đẹp trên biển và tận hưởng không khí trong lành của đảo ngọc.</p>', N'<ul><li><i><strong>Bảo vệ môi trường biển</strong> 🌊</i></li><li>Không sử dụng đồ nhựa dùng một lần và không xả rác ra biển 🚯.</li><li><i><strong>An toàn khi tắm biển</strong> 🏊‍♂️</i><ul><li>Tuân thủ các quy định an toàn khi tắm biển.</li></ul></li></ul>', 1, 0, 1, 1, 0, 0, 1, 0, N'<ul><li><i><strong>Chính sách ẩm thực</strong> 🦞</i><ul><li>Bữa tối hải sản tươi sống đánh bắt trong ngày.</li></ul></li><li><strong>Chính sách hoạt động</strong> 🏄‍♂️<ul><li>Miễn phí sử dụng kayak và ván chèo đứng.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (36, 40, N'<p><strong>Đà Lạt Pine Valley</strong> là homestay mang phong cách châu Âu nằm giữa rừng thông. Với kiến trúc gỗ ấm cúng, homestay mang đến không gian lãng mạn và yên bình đặc trưng của thành phố ngàn hoa.</p>', N'<ul><li><i><strong>Giữ gìn không gian yên tĩnh</strong> 🌲</i></li><li>Không gây ồn ào sau 22:00 🔇.</li><li><i><strong>An toàn phòng cháy</strong> 🔥</i><ul><li>Không đốt lửa trại tự phát trong khuôn viên.</li></ul></li></ul>', 0, 1, 1, 1, 0, 1, 0, 0, N'<ul><li><i><strong>Chính sách đặc biệt</strong> 🌹</i><ul><li>Tặng một bó hoa tươi Đà Lạt cho khách lưu trú dịp kỷ niệm.</li></ul></li><li><strong>Chính sách ẩm thực</strong> 🍵<ul><li>Phục vụ trà chiều miễn phí với bánh ngọt từ 15:00-17:00.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (37, 41, N'<p><strong>Hà Giang Rock Plateau</strong> là homestay của người H''Mông nằm trên cao nguyên đá Đồng Văn. Từ đây, du khách có thể chiêm ngưỡng khung cảnh hùng vĩ của núi đá tai mèo và thung lũng sâu thẳm.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa bản địa</strong> 🏞️</i></li><li>Tham gia các hoạt động cộng đồng với tinh thần học hỏi 🧠.</li><li><i><strong>Tiết kiệm nước</strong> 💧</i><ul><li>Sử dụng nước tiết kiệm vì đây là vùng khan hiếm nước.</li></ul></li></ul>', 0, 0, 1, 0, 0, 1, 0, 1, N'<ul><li><i><strong>Chính sách ẩm thực</strong> 🍶</i><ul><li>Bữa tối với rượu ngô truyền thống và thịt trâu gác bếp.</li></ul></li><li><strong>Chính sách tour</strong> 🏍️<ul><li>Cho thuê xe máy và cung cấp bản đồ khám phá cao nguyên đá.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (38, 42, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (39, 43, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (40, 44, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (41, 45, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (42, 46, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (43, 47, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (44, 48, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (45, 49, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (46, 50, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (47, 51, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (48, 52, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (49, 53, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (50, 54, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (51, 55, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (52, 56, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (53, 57, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (54, 58, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (55, 59, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (56, 60, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (57, 61, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (58, 62, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (59, 63, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (60, 64, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (61, 65, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (62, 66, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (63, 67, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (64, 68, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (65, 69, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (66, 70, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (67, 71, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (68, 72, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (69, 73, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (70, 74, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (71, 75, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (72, 76, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (73, 77, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (74, 78, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (75, 79, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (76, 80, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (77, 81, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (78, 82, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (79, 83, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (80, 84, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (81, 85, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (82, 86, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (83, 87, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (84, 88, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (85, 89, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (86, 90, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (87, 91, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (88, 92, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (89, 93, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (90, 94, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (91, 95, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (92, 96, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (93, 97, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (94, 98, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (95, 99, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (96, 100, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (97, 101, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (98, 102, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (99, 103, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (100, 104, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (101, 105, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (102, 106, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (103, 107, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (104, 108, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (105, 109, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (106, 110, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (107, 111, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (108, 112, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (109, 113, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (110, 114, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (111, 115, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (112, 116, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (113, 117, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (114, 118, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (115, 119, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (116, 120, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (117, 121, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (118, 122, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (119, 123, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (120, 124, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (121, 125, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (122, 126, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [noteHomestay], [stayRules], [hasSwimmingPool], [hasBilliardTable], [manyActivities], [spaciousGarden], [lakeView], [mountainView], [seaView], [riceFieldView], [policies]) VALUES (123, 127, N'<p><strong>Cát Bà Manaka House</strong> là một homestay ấm cúng nằm tại thị trấn Cát Bà, bao quanh bởi vịnh biển xanh ngát và núi đá vôi hùng vĩ. Homestay được thiết kế theo phong cách hiện đại pha trộn với nét truyền thống của vùng biển đảo.</p>', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.</li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà để tránh nguy cơ cháy 🚭.</li></ul></li></ul>', 1, 1, 1, 1, 0, 1, 1, 0, N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng phục vụ từ 7:00-9:00 🥞.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️.</li></ul></li></ul>')
GO
SET IDENTITY_INSERT [dbo].[DetailHomeStays] OFF
GO
SET IDENTITY_INSERT [dbo].[FAQs] ON 
GO
INSERT [dbo].[FAQs] ([faqID], [question], [answer], [createdDate], [updatedDate], [authorID]) VALUES (1, N'Hợp tác với công ty thì Chủ Homestay phải chịu phí bao nhiêu ?', N'Khi hợp tác với công ty, Chủ Homestay có thể phải chịu một mức phí dao động từ 10% đến 15% trên tổng doanh thu, tùy vào loại hình dịch vụ mà công ty cung cấp.', NULL, NULL, N'2b69edce-0836-485c-a5c0-126b11831c19')
GO
INSERT [dbo].[FAQs] ([faqID], [question], [answer], [createdDate], [updatedDate], [authorID]) VALUES (2, N'Tôi có thể thay đổi hoặc hủy đặt phòng không? Phí hủy phòng như thế nào?', N'Bạn có thể thay đổi hoặc hủy đặt phòng trong phần "Quản lý đặt phòng". Phí hủy sẽ phụ thuộc vào chính sách của từng homestay và thời điểm bạn hủy phòng.', NULL, NULL, N'2b69edce-0836-485c-a5c0-126b11831c19')
GO
INSERT [dbo].[FAQs] ([faqID], [question], [answer], [createdDate], [updatedDate], [authorID]) VALUES (3, N'Làm sao để biết phòng đã được xác nhận thành công?', N'Sau khi hoàn tất thanh toán, bạn sẽ nhận được email xác nhận đặt phòng và thông tin chi tiết từ hệ thống.', NULL, NULL, N'2b69edce-0836-485c-a5c0-126b11831c19')
GO
INSERT [dbo].[FAQs] ([faqID], [question], [answer], [createdDate], [updatedDate], [authorID]) VALUES (4, N'Tôi có thể đặt phòng cho người khác không?', N'Có, bạn chỉ cần điền thông tin của người nhận phòng khi đặt phòng trên hệ thống.', NULL, NULL, N'2b69edce-0836-485c-a5c0-126b11831c19')
GO
INSERT [dbo].[FAQs] ([faqID], [question], [answer], [createdDate], [updatedDate], [authorID]) VALUES (5, N'Làm sao để biết phòng đã được xác nhận thành công?', N'Sau khi hoàn tất thanh toán, bạn sẽ nhận được email xác nhận đặt phòng và thông tin chi tiết từ hệ thống.', NULL, NULL, N'2b69edce-0836-485c-a5c0-126b11831c19')
GO
INSERT [dbo].[FAQs] ([faqID], [question], [answer], [createdDate], [updatedDate], [authorID]) VALUES (6, N'Có chính sách hoàn tiền trong trường hợp hủy phòng không?', N'Chính sách hoàn tiền sẽ phụ thuộc vào thời gian hủy và điều khoản của homestay bạn đã đặt.', NULL, NULL, N'2b69edce-0836-485c-a5c0-126b11831c19')
GO
INSERT [dbo].[FAQs] ([faqID], [question], [answer], [createdDate], [updatedDate], [authorID]) VALUES (7, N' Tôi phải làm gì khi gặp sự cố trong quá trình thanh toán?', N'Vui lòng liên hệ bộ phận chăm sóc khách hàng qua hotline hoặc email hỗ trợ để được giải quyết kịp thời.', NULL, NULL, N'2b69edce-0836-485c-a5c0-126b11831c19')
GO
INSERT [dbo].[FAQs] ([faqID], [question], [answer], [createdDate], [updatedDate], [authorID]) VALUES (9, N'Làm thế nào để liên hệ với chủ nhà hoặc dịch vụ khách hàng?', N'Thông tin liên hệ sẽ có trong email xác nhận đặt phòng hoặc mục "Chi tiết đặt phòng".', NULL, NULL, N'2b69edce-0836-485c-a5c0-126b11831c19')
GO
SET IDENTITY_INSERT [dbo].[FAQs] OFF
GO
SET IDENTITY_INSERT [dbo].[Favorites] ON 
GO
INSERT [dbo].[Favorites] ([favID], [cusID], [homestayID], [createdAt]) VALUES (1, N'0ee4b802-58c7-44f9-ba9b-2b6995551e3b', 7, NULL)
GO
INSERT [dbo].[Favorites] ([favID], [cusID], [homestayID], [createdAt]) VALUES (3, N'f1f5977c-560b-4609-afb1-6e925014a8ba', 7, NULL)
GO
SET IDENTITY_INSERT [dbo].[Favorites] OFF
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (405777361, 6, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (405777377, 6, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (405777374, 6, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (405777375, 6, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1231016758, 7, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1231016757, 7, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1231016755, 7, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1231016760, 7, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1231016756, 7, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1231016707, 7, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1231016753, 7, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1231016764, 7, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1231016763, 7, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1231016762, 7, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1231016761, 7, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1231016765, 7, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1231016766, 7, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1604885843, 8, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1700654535, 9, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1700653042, 9, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1700654544, 9, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1700654546, 9, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1700654548, 9, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1700654550, 9, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1700654552, 9, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1700654554, 9, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (973520768, 10, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (973520749, 10, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (973520769, 10, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (973520783, 10, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (973520784, 10, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (973520786, 10, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (973520788, 10, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (973520789, 10, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (772476461, 11, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (772476445, 11, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (772476463, 11, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (772476471, 11, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (772476472, 11, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (772476474, 11, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (772476475, 11, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (772476476, 11, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (543143974, 12, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (543143958, 12, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (543143975, 12, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (543143977, 12, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (543143979, 12, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (543143980, 12, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (543143982, 12, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (543144081, 12, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (185322315, 13, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (185322290, 13, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (185322320, 13, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (185322321, 13, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (185322323, 13, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (185322324, 13, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (185322326, 13, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (185322329, 13, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1988690798, 14, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1988690783, 14, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1988690801, 14, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1988690805, 14, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1988690808, 14, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1988690812, 14, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1988690830, 14, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1988690834, 14, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1731170824, 15, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1731170800, 15, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1731170833, 15, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1731170837, 15, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1731170840, 15, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1731170843, 15, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1731170852, 15, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1731170854, 15, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1372679174, 16, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1372679152, 16, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1372679176, 16, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1372679177, 16, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1372679179, 16, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1372679180, 16, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1372679181, 16, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1372679183, 16, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (927963904, 17, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (927963835, 17, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (927963905, 17, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (927963906, 17, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (927963908, 17, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (927963910, 17, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (927963911, 17, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (927963912, 17, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1080226711, 19, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1080226722, 19, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1080226725, 19, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1080226729, 19, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1080226742, 19, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1080226745, 19, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1080226747, 19, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1080226748, 19, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1080226750, 19, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1080226751, 19, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1080226753, 19, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1080226756, 19, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1080226759, 19, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1080226761, 19, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1080226762, 19, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1080226763, 19, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1080226766, 19, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1080226770, 19, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (684061251, 22, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (684061270, 22, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (684061271, 22, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (684061273, 22, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (684061274, 22, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (684061275, 22, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (684061277, 22, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (684061278, 22, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (684061279, 22, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (684061281, 22, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (684061282, 22, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (684061284, 22, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (684061285, 22, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (684061287, 22, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (684061288, 22, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (684061289, 22, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (684061294, 22, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (684061296, 22, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (269057824, 24, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (269057836, 24, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (269057838, 24, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (269057839, 24, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (269057840, 24, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (269057841, 24, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (269057842, 24, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (269057855, 24, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (269057856, 24, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (269057857, 24, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (269057859, 24, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (269057860, 24, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (269057861, 24, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (269057863, 24, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (269057864, 24, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (269057865, 24, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (269057866, 24, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (269057878, 24, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (62062796, 25, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (62062816, 25, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (62062827, 25, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (62062829, 25, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (62062830, 25, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (62062831, 25, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (62062847, 25, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (62062852, 25, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (62062853, 25, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (62062855, 25, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (62062856, 25, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (62062857, 25, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (62062858, 25, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (62062860, 25, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (62062861, 25, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (62062862, 25, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (62062863, 25, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (62062864, 25, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1951444739, 26, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1951444751, 26, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1951444753, 26, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1951444754, 26, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1951444755, 26, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1951444757, 26, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1951444760, 26, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1951444763, 26, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1951444765, 26, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1951444768, 26, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1951444771, 26, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1951444773, 26, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1951444776, 26, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1951444779, 26, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1951444781, 26, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1951444784, 26, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1951444786, 26, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1951444788, 26, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1788254030, 27, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1788254049, 27, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1788254052, 27, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1788254054, 27, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1788254055, 27, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1788254056, 27, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1788254058, 27, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1788254059, 27, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1788254061, 27, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1788254062, 27, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1788254064, 27, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1788254067, 27, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1788254069, 27, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1788254072, 27, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1788254074, 27, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1788254077, 27, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1788254080, 27, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1788254082, 27, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1654425430, 28, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1654425463, 28, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1654425467, 28, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1654425470, 28, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1654425475, 28, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1654425478, 28, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1654425481, 28, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1654425484, 28, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1654425488, 28, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1654425491, 28, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1654425494, 28, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1654425497, 28, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1654425500, 28, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1654425503, 28, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1654425506, 28, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1654425509, 28, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1654425512, 28, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1654425516, 28, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1488629522, 29, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1488629537, 29, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1488629539, 29, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1488629540, 29, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1488629541, 29, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1488629543, 29, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1488629544, 29, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1488629545, 29, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1488629547, 29, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1488629549, 29, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1488629550, 29, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1488629552, 29, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1488629553, 29, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1488629555, 29, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1488629556, 29, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1488629558, 29, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1488629559, 29, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1488629560, 29, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1287347811, 30, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1287347836, 30, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1287347840, 30, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1287347843, 30, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1287347845, 30, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1287347848, 30, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1287347851, 30, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1287347853, 30, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1287347856, 30, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1287347944, 30, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1287347967, 30, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1287347968, 30, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1287347969, 30, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1287347971, 30, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1287347972, 30, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1287347973, 30, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1287347974, 30, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1287347975, 30, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1082045221, 31, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1082045234, 31, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1082045249, 31, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1082045251, 31, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1082045252, 31, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1082045254, 31, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1082045255, 31, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1082045256, 31, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1082045258, 31, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1082045259, 31, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1082045261, 31, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1082045262, 31, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1082045263, 31, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1082045264, 31, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1082045266, 31, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1082045267, 31, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1082045268, 31, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1082045270, 31, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (872808247, 32, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (872808262, 32, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (872808263, 32, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (872808265, 32, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (872808266, 32, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (872808267, 32, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (872808268, 32, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (872808270, 32, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (872808271, 32, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (872808272, 32, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (872808274, 32, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (872808275, 32, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (872808276, 32, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (872808277, 32, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (872808278, 32, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (872808279, 32, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (872808281, 32, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (872808282, 32, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1622800252, 33, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1622800270, 33, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1622800274, 33, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1622800296, 33, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1622800300, 33, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1622800304, 33, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1622800308, 33, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1622800313, 33, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1622800317, 33, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1622800321, 33, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1622800325, 33, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1622800329, 33, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1622800333, 33, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1622800337, 33, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1622800342, 33, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1622800346, 33, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1622800351, 33, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1622800355, 33, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643272829, 34, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643272848, 34, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643274740, 34, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643274781, 34, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643275470, 34, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643275480, 34, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643275485, 34, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643275488, 34, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643275491, 34, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643275494, 34, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643275498, 34, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643275502, 34, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643275505, 34, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643275509, 34, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643275513, 34, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643275516, 34, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643275520, 34, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643275523, 34, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (426642634, 35, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (426642651, 35, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (426642655, 35, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (426642658, 35, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (426642661, 35, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (426642664, 35, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (426642667, 35, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (426642670, 35, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (426642673, 35, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (426642676, 35, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (426642679, 35, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (426642682, 35, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (426642685, 35, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (426642689, 35, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (426642692, 35, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (426642695, 35, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (426642698, 35, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (426642701, 35, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (150896991, 36, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (150897006, 36, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (150897274, 36, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (150897286, 36, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (150897291, 36, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (150897295, 36, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (150897299, 36, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (150897301, 36, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (150897303, 36, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (150897304, 36, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (150897306, 36, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (150897308, 36, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (150897310, 36, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (150897311, 36, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (150897313, 36, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (150897314, 36, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (150897316, 36, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (150897318, 36, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2122708941, 37, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2122709340, 37, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2122709348, 37, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2122709349, 37, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2122709351, 37, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2122709352, 37, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2122709354, 37, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2122709355, 37, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2122709356, 37, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2122709358, 37, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2122709359, 37, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2122709360, 37, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2122709361, 37, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2122709810, 37, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2122709816, 37, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2122709820, 37, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2122709823, 37, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2122709826, 37, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1896300125, 38, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1896300139, 38, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1896300142, 38, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1896300154, 38, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1896300155, 38, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1896300157, 38, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1896300158, 38, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1896300161, 38, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1896300163, 38, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1896300167, 38, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1896300169, 38, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1896300170, 38, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1896300171, 38, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1896300173, 38, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1896300174, 38, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1896300175, 38, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1896300176, 38, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1896300177, 38, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1671043168, 39, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1671043189, 39, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1671043191, 39, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1671043193, 39, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1671043195, 39, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1671043197, 39, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1671043198, 39, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1671043200, 39, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1671043201, 39, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1671043203, 39, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1671043205, 39, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1671043207, 39, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1671043209, 39, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1671043210, 39, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1671043212, 39, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1671043214, 39, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1671043216, 39, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1671043218, 39, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1519886078, 40, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1519886091, 40, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1519886110, 40, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1519886111, 40, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1519886113, 40, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1519886114, 40, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1519886115, 40, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1519886117, 40, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1519886118, 40, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1519886119, 40, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1519886121, 40, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1519886122, 40, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1519886124, 40, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1519886125, 40, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1519886126, 40, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1519886128, 40, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1519886129, 40, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1519886130, 40, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1317557985, 41, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1317558022, 41, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1317558034, 41, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1317558035, 41, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1317558037, 41, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1317558038, 41, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1317558039, 41, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1317558040, 41, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1317558041, 41, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1317558043, 41, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1317558044, 41, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1317558045, 41, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1317558046, 41, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1317558047, 41, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1317558048, 41, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1317558050, 41, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1317558051, 41, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1317558052, 41, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (593097997, 42, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (593099053, 42, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (593099059, 42, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (593099080, 42, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (593099083, 42, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (593099085, 42, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (593099087, 42, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (593099089, 42, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (593099092, 42, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (593099094, 42, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (593099096, 42, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (593099098, 42, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (593099100, 42, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (593099103, 42, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (593099105, 42, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (593099107, 42, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (593099109, 42, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (593099111, 42, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (594770251, 43, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (594770267, 43, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (594770270, 43, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (594770292, 43, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (594770295, 43, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (594770298, 43, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (594770301, 43, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (594770304, 43, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (594770307, 43, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (594770310, 43, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (594770314, 43, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (594770340, 43, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (594770357, 43, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (594770360, 43, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (594770363, 43, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (594770366, 43, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (594770369, 43, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (594770372, 43, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (594952389, 44, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (594952412, 44, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (594952415, 44, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (594952436, 44, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (594952439, 44, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (594952442, 44, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (594952445, 44, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (594952447, 44, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (594952450, 44, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (594952454, 44, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (594952456, 44, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (594952459, 44, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (594952463, 44, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (594952466, 44, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (594952469, 44, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (594952472, 44, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (594952475, 44, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (594952478, 44, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595164948, 45, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595164962, 45, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595164967, 45, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595164988, 45, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595165001, 45, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595165006, 45, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595165010, 45, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595165015, 45, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595165019, 45, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595165041, 45, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595165046, 45, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595165049, 45, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595165051, 45, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595165054, 45, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595165057, 45, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595165060, 45, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595165063, 45, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595165066, 45, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595321879, 46, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595321902, 46, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595321906, 46, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595321927, 46, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595321930, 46, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595321933, 46, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595321936, 46, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595321939, 46, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595321942, 46, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595321945, 46, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595321948, 46, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595321951, 46, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595321954, 46, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595321957, 46, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595321960, 46, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595321963, 46, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595321966, 46, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595321969, 46, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595487822, 47, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595487836, 47, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595487840, 47, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595487861, 47, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595487863, 47, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595487866, 47, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595487869, 47, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595487872, 47, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595487877, 47, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595487881, 47, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595487884, 47, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595487889, 47, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595487894, 47, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595487915, 47, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595487921, 47, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595487924, 47, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595487927, 47, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595487931, 47, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595677509, 48, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595677538, 48, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595677544, 48, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595677568, 48, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595677573, 48, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595677579, 48, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595677584, 48, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595677590, 48, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595677596, 48, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595677602, 48, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595677608, 48, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595677613, 48, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595677619, 48, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595677624, 48, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595677630, 48, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595677635, 48, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595677641, 48, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (595677646, 48, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (596154368, 49, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (596154383, 49, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (596154388, 49, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (596154412, 49, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (596154417, 49, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (596154422, 49, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (596154427, 49, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (596154433, 49, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (596154438, 49, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (596154443, 49, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (596154449, 49, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (596154455, 49, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (596154460, 49, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (596154466, 49, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (596154471, 49, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (596154476, 49, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (596154482, 49, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (596154487, 49, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (596607033, 50, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (596607046, 50, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (596607050, 50, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (596607071, 50, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (596607074, 50, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (596607077, 50, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (596607080, 50, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (596607083, 50, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (596607086, 50, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (596607089, 50, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (596607092, 50, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (596607096, 50, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (596607099, 50, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (596607102, 50, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (596607105, 50, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (596607108, 50, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (596607111, 50, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (596607114, 50, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (598563251, 51, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (598563281, 51, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (598563286, 51, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (598563310, 51, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (598563315, 51, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (598563321, 51, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (598563327, 51, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (598563332, 51, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (598563337, 51, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (598563342, 51, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (598563347, 51, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (598563352, 51, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (598563358, 51, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (598563363, 51, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (598563369, 51, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (598563374, 51, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (598563379, 51, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (598563385, 51, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (599325328, 52, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (599325345, 52, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (599325349, 52, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (599325371, 52, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (599325374, 52, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (599325377, 52, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (599325380, 52, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (599325384, 52, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (599325387, 52, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (599325391, 52, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (599325394, 52, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (599325397, 52, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (599325400, 52, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (599325403, 52, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (599325405, 52, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (599325408, 52, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (599325411, 52, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (599325414, 52, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (599916323, 53, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (599916344, 53, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (599916348, 53, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (599916370, 53, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (599916372, 53, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (599916375, 53, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (599916378, 53, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (599916381, 53, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (599916384, 53, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (599916388, 53, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (599916391, 53, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (599916394, 53, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (599916398, 53, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (599916401, 53, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (599916404, 53, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (599916407, 53, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (599916410, 53, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (599916413, 53, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (600580975, 54, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (600580992, 54, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (600580995, 54, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (600581017, 54, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (600581020, 54, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (600581023, 54, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (600581026, 54, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (600581029, 54, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (600581032, 54, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (600581036, 54, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (600581039, 54, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (600581042, 54, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (600581045, 54, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (600581049, 54, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (600581052, 54, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (600581055, 54, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (600581058, 54, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (600581061, 54, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (601258970, 55, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (601258995, 55, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (601258998, 55, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (601259019, 55, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (601259025, 55, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (601259029, 55, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (601259035, 55, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (601259040, 55, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (601259043, 55, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (601259202, 55, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (601259206, 55, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (601259209, 55, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (601259213, 55, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (601259216, 55, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (601259218, 55, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (601259224, 55, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (601259228, 55, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (601259233, 55, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (601756360, 56, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (601770820, 56, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (601770836, 56, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (601770862, 56, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (601770866, 56, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (601770872, 56, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (601770876, 56, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (601770881, 56, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (601770885, 56, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (601770890, 56, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (601770892, 56, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (601770898, 56, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (601770905, 56, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (601770909, 56, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (601770913, 56, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (601770918, 56, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (601770923, 56, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (601770927, 56, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (602576222, 57, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (602576239, 57, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (602576242, 57, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (602576263, 57, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (602576267, 57, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (602576270, 57, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (602576274, 57, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (602576277, 57, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (602576280, 57, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (602576283, 57, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (602576286, 57, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (602576290, 57, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (602576293, 57, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (602576296, 57, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (602576300, 57, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (602576303, 57, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (602576307, 57, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (602576310, 57, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (603240119, 58, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (603240136, 58, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (603240140, 58, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (603240162, 58, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (603240165, 58, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (603240168, 58, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (603240171, 58, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (603240174, 58, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (603240177, 58, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (603240180, 58, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (603240183, 58, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (603240187, 58, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (603240191, 58, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (603240194, 58, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (603240197, 58, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (603240201, 58, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (603240204, 58, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (603240207, 58, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (603995799, 59, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (603995815, 59, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (603995821, 59, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (603995845, 59, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (603995851, 59, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (603995857, 59, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (603995863, 59, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (603995868, 59, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (603995874, 59, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (603995879, 59, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (603995885, 59, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (603995891, 59, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (603995896, 59, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (603995902, 59, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (603995907, 59, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (603995912, 59, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (603995917, 59, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (603995923, 59, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (250076206, 60, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (250076227, 60, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (250076228, 60, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (250076229, 60, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (250076230, 60, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (250076231, 60, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (250076232, 60, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (250076233, 60, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (250076234, 60, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (250076235, 60, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (250076236, 60, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (250076237, 60, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (250076238, 60, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (250076240, 60, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (250076255, 60, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (250076256, 60, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (250076257, 60, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (250076258, 60, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (50430876, 61, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (50430892, 61, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (50430893, 61, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (50430895, 61, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (50430896, 61, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (50430897, 61, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (50430898, 61, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (50430900, 61, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (50430901, 61, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (50430902, 61, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (50430903, 61, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (50430904, 61, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (50430905, 61, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (50430907, 61, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (50430908, 61, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (50430909, 61, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (50430910, 61, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (50430911, 61, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1944303513, 62, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1944303546, 62, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1944303548, 62, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1944303549, 62, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1944303550, 62, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1944303551, 62, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1944303553, 62, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1944303554, 62, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1944303557, 62, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1944303559, 62, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1944303562, 62, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1944303564, 62, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1944303565, 62, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1944303566, 62, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1944303567, 62, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1944303568, 62, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1944303569, 62, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1944303572, 62, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1752329877, 63, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1752329897, 63, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1752329899, 63, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1752329900, 63, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1752329901, 63, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1752329902, 63, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1752329903, 63, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1752329905, 63, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1752329906, 63, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1752329907, 63, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1752329908, 63, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1752329909, 63, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1752329911, 63, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1752329912, 63, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1752329913, 63, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1752329914, 63, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1752329916, 63, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1752329917, 63, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1609426493, 64, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1609426509, 64, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1609426511, 64, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1609426512, 64, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1609426513, 64, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1609426515, 64, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1609426518, 64, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1609426520, 64, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1609426523, 64, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1609426526, 64, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1609426528, 64, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1609426531, 64, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1609426534, 64, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1609426639, 64, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1609426644, 64, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1609426646, 64, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1609426647, 64, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1609426648, 64, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1463131644, 65, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1463131679, 65, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1463131683, 65, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1463131686, 65, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1463131689, 65, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1463131692, 65, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1463131695, 65, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1463131698, 65, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1463131700, 65, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1463131703, 65, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1463131706, 65, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1463131709, 65, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1463131712, 65, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1463131715, 65, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1463131718, 65, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1463131721, 65, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1463131868, 65, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1463131874, 65, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1317649461, 66, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1317649479, 66, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1317649481, 66, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1317649482, 66, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1317649483, 66, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1317649485, 66, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1317649486, 66, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1317649487, 66, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1317649488, 66, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1317649490, 66, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1317649491, 66, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1317649492, 66, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1317649493, 66, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1317649546, 66, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1317649547, 66, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1317649549, 66, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1317649550, 66, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1317649551, 66, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1161107545, 67, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1161107564, 67, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1161107566, 67, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1161107567, 67, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1161107568, 67, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1161107569, 67, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1161107570, 67, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1161107572, 67, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1161107573, 67, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1161107574, 67, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1161107575, 67, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1161107576, 67, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1161107577, 67, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1161107579, 67, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1161107580, 67, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1161107581, 67, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1161107582, 67, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1161107584, 67, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (920661778, 68, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (920661795, 68, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (920661796, 68, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (920661797, 68, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (920661798, 68, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (920661799, 68, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (920661800, 68, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (920661801, 68, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (920661802, 68, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (920661803, 68, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (920661805, 68, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (920661806, 68, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (920661807, 68, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (920661808, 68, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (920661809, 68, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (920661810, 68, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (920661811, 68, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (920661812, 68, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (704715248, 69, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (704715265, 69, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (704715266, 69, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (704715267, 69, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (704715269, 69, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (704715270, 69, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (704715271, 69, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (704715273, 69, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (704715274, 69, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (704715275, 69, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (704715276, 69, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (704715277, 69, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (704715279, 69, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (704715280, 69, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (704715281, 69, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (704715282, 69, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (704715283, 69, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (704715284, 69, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1975070528, 70, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1975070550, 70, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1975070552, 70, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1975070553, 70, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1975070554, 70, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1975070555, 70, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1975070556, 70, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1975070557, 70, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1975070558, 70, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1975070559, 70, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1975070560, 70, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1975070561, 70, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1975070562, 70, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1975070563, 70, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1975070565, 70, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1975070566, 70, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1975070567, 70, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1975070568, 70, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1727560388, 71, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1727560435, 71, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1727560437, 71, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1727560438, 71, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1727560440, 71, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1727560441, 71, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1727560443, 71, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1727560444, 71, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1727560445, 71, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1727560447, 71, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1727560448, 71, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1727560450, 71, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1727560452, 71, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1727560454, 71, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1727560456, 71, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1727560458, 71, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1727560459, 71, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1727560461, 71, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1476636079, 72, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1476636097, 72, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1476636099, 72, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1476636100, 72, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1476636101, 72, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1476636102, 72, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1476636104, 72, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1476636105, 72, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1476636106, 72, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1476636107, 72, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1476636108, 72, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1476636109, 72, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1476636111, 72, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1476636112, 72, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1476636113, 72, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1476636114, 72, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1476636115, 72, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1476636116, 72, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1287714551, 73, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1287714572, 73, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1287714573, 73, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1287714574, 73, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1287714576, 73, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1287714577, 73, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1287714578, 73, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1287714579, 73, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1287714580, 73, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1287714581, 73, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1287714582, 73, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1287714583, 73, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1287714584, 73, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1287714587, 73, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1287714590, 73, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1287714592, 73, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1287714594, 73, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1287714596, 73, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1073130994, 74, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1073131010, 74, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1073131011, 74, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1073131012, 74, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1073131013, 74, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1073131014, 74, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1073131015, 74, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1073131016, 74, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1073131017, 74, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1073131018, 74, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1073131019, 74, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1073131020, 74, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1073131021, 74, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1073131022, 74, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1073131023, 74, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1073131024, 74, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1073131025, 74, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1073131026, 74, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (864139452, 75, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (864139469, 75, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (864139472, 75, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (864139473, 75, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (864139474, 75, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (864139475, 75, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (864139477, 75, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (864139478, 75, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (864139479, 75, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (864139481, 75, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (864139482, 75, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (864139483, 75, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (864139484, 75, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (864139485, 75, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (864139486, 75, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (864139488, 75, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (864139489, 75, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (864139490, 75, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644526279, 76, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644526301, 76, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644526303, 76, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644526304, 76, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644526305, 76, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644526306, 76, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644526308, 76, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644526309, 76, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644526310, 76, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644526311, 76, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644526312, 76, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644526313, 76, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644526315, 76, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644526316, 76, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644526317, 76, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644526318, 76, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644526320, 76, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644526321, 76, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (616431033, 77, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (616431058, 77, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (616431063, 77, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (616431084, 77, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (616431088, 77, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (616431094, 77, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (616431098, 77, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (616431101, 77, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (616431105, 77, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (616431109, 77, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (616431112, 77, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (616431116, 77, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (616431119, 77, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (616431123, 77, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (616431127, 77, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (616431130, 77, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (616431134, 77, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (616431138, 77, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (492954341, 78, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (492954356, 78, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (492954358, 78, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (492954359, 78, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (492954360, 78, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (492954361, 78, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (492954362, 78, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (492954364, 78, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (492954365, 78, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (492954366, 78, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (492954367, 78, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (492954368, 78, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (492954370, 78, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (492954371, 78, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (492954372, 78, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (492954373, 78, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (492954374, 78, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (492954376, 78, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (187335487, 79, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (187335503, 79, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (187335504, 79, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (187335505, 79, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (187335508, 79, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (187335509, 79, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (187335510, 79, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (187335512, 79, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (187335513, 79, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (187335514, 79, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (187335515, 79, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (187335516, 79, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (187335517, 79, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (187335518, 79, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (187335519, 79, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (187335520, 79, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (187335521, 79, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (187335522, 79, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2074696284, 80, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2074696300, 80, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2074696303, 80, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2074696306, 80, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2074696310, 80, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2074696313, 80, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2074696422, 80, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2074696425, 80, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2074696426, 80, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2074696427, 80, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2074696428, 80, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2074696430, 80, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2074696431, 80, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2074696432, 80, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2074696433, 80, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2074696434, 80, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2074696435, 80, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2074696436, 80, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1854242543, 81, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1854242557, 81, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1854242558, 81, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1854242559, 81, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1854242561, 81, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1854242562, 81, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1854242563, 81, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1854242564, 81, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1854242565, 81, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1854242566, 81, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1854242567, 81, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1854242568, 81, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1854242569, 81, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1854242570, 81, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1854242571, 81, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1854242572, 81, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1854242573, 81, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1854242574, 81, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1624754616, 82, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1624754633, 82, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1624754635, 82, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1624754636, 82, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1624754637, 82, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1624754639, 82, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1624754640, 82, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1624754641, 82, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1624754643, 82, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1624754644, 82, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1624754646, 82, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1624754647, 82, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1624754649, 82, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1624754650, 82, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1624754651, 82, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1624754653, 82, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1624754654, 82, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1624754656, 82, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1286568307, 83, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1286568326, 83, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1286568327, 83, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1286568328, 83, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1286568330, 83, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1286568331, 83, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1286568332, 83, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1286568333, 83, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1286568334, 83, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1286568335, 83, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1286568336, 83, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1286568338, 83, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1286568352, 83, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1286568353, 83, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1286568355, 83, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1286568356, 83, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1286568357, 83, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1286568358, 83, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2137190726, 84, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2137190744, 84, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2137190746, 84, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2137190747, 84, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2137190748, 84, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2137190750, 84, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2137190751, 84, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2137190752, 84, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2137190753, 84, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2137190754, 84, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2137190756, 84, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2137190757, 84, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2137190758, 84, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2137190760, 84, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2137190761, 84, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2137190762, 84, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2137190763, 84, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2137190765, 84, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1771958440, 85, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1771958461, 85, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1771958464, 85, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1771958465, 85, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1771958466, 85, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1771958468, 85, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1771958469, 85, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1771958470, 85, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1771958471, 85, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1771958472, 85, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1771958474, 85, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1771958475, 85, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1771958476, 85, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1771958477, 85, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1771958478, 85, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1771958480, 85, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1771958481, 85, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1771958482, 85, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1192570079, 86, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1192570091, 86, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1192570094, 86, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1192570097, 86, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1192570098, 86, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1192570101, 86, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1192570102, 86, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1192570103, 86, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1192570104, 86, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1192570105, 86, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1192570106, 86, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1192570107, 86, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1192570108, 86, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1192570109, 86, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1192570110, 86, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1192570111, 86, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1192570112, 86, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1192570113, 86, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (119474799, 87, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (119474818, 87, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (119474820, 87, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (119474822, 87, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (119474823, 87, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (119474824, 87, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (119474825, 87, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (119474826, 87, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (119474827, 87, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (119474828, 87, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (119474830, 87, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (119474831, 87, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (119474832, 87, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (119474833, 87, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (119474834, 87, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (119474835, 87, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (119474836, 87, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (119474837, 87, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (622182441, 88, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (622182465, 88, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (622182469, 88, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (622182490, 88, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (622182492, 88, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (622182495, 88, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (622182498, 88, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (622182501, 88, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (622182504, 88, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (622182507, 88, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (622182509, 88, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (622182512, 88, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (622182515, 88, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (622182518, 88, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (622182520, 88, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (622182523, 88, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (622182526, 88, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (622182528, 88, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1987182737, 89, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1987182755, 89, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1987182756, 89, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1987182758, 89, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1987182759, 89, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1987182760, 89, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1987182761, 89, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1987182762, 89, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1987182763, 89, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1987182764, 89, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1987182765, 89, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1987182766, 89, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1987182767, 89, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1987182769, 89, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1987182770, 89, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1987182771, 89, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1987182772, 89, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1987182773, 89, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1757465055, 90, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1757465072, 90, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1757465073, 90, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1757465074, 90, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1757465075, 90, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1757465077, 90, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1757465078, 90, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1757465079, 90, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1757465080, 90, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1757465081, 90, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1757465082, 90, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1757465083, 90, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1757465084, 90, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1757465085, 90, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1757465086, 90, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1757465088, 90, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1757465089, 90, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1757465090, 90, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1461212392, 91, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1461212406, 91, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1461212409, 91, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1461212412, 91, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1461212413, 91, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1461212414, 91, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1461212415, 91, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1461212416, 91, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1461212417, 91, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1461212418, 91, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1461212419, 91, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1461212420, 91, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1461212421, 91, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1461212422, 91, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1461212423, 91, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1461212424, 91, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1461212425, 91, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1461212426, 91, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1263461640, 92, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1263461659, 92, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1263461661, 92, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1263461662, 92, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1263461663, 92, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1263461664, 92, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1263461665, 92, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1263461667, 92, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1263461670, 92, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1263461673, 92, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1263461676, 92, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1263461677, 92, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1263461678, 92, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1263461679, 92, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1263461680, 92, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1263461683, 92, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1263461685, 92, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1263461688, 92, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1066538076, 93, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1066538096, 93, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1066538098, 93, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1066538099, 93, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1066538100, 93, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1066538101, 93, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1066538102, 93, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1066538103, 93, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1066538104, 93, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1066538105, 93, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1066538106, 93, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1066538107, 93, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1066538108, 93, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1066538109, 93, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1066538110, 93, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1066538111, 93, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1066538112, 93, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1066538113, 93, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (529184502, 94, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (529184595, 94, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (529184621, 94, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (529184624, 94, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (529184626, 94, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (529184627, 94, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (529184628, 94, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (529184629, 94, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (529184630, 94, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (529184631, 94, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (529184633, 94, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (529184634, 94, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (529184635, 94, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (529184636, 94, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (529184637, 94, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (529184638, 94, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (529184639, 94, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (529184640, 94, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (466986432, 95, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (466986455, 95, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (466986468, 95, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (466986470, 95, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (466986471, 95, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (466986473, 95, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (466986474, 95, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (466986476, 95, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (466986477, 95, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (466986479, 95, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (466986480, 95, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (466986482, 95, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (466986483, 95, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (466986484, 95, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (466986486, 95, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (466986487, 95, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (466986488, 95, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (466986489, 95, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (253956848, 96, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (253956873, 96, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (253956874, 96, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (253956876, 96, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (253956877, 96, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (253956879, 96, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (253956880, 96, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (253956881, 96, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (253956883, 96, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (253956884, 96, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (253956885, 96, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (253956887, 96, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (253956888, 96, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (253956889, 96, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (253956891, 96, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (253956892, 96, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (253956894, 96, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (253956895, 96, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (52849717, 97, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (52849732, 97, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (52849737, 97, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (52849739, 97, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (52849740, 97, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (52849741, 97, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (52849742, 97, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (52849744, 97, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (52849746, 97, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (52849747, 97, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (52849749, 97, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (52849750, 97, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (52849751, 97, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (52849752, 97, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (52849753, 97, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (52849754, 97, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (52849756, 97, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (52849757, 97, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2017372053, 98, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2017372076, 98, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2017372080, 98, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2017372083, 98, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2017372086, 98, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2017372090, 98, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2017372093, 98, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2017372096, 98, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2017372099, 98, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2017372102, 98, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2017372106, 98, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2017372109, 98, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2017372112, 98, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2017372114, 98, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2017372117, 98, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2017372120, 98, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2017372123, 98, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2017372179, 98, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1864877778, 99, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1864877831, 99, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1864878176, 99, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1864878188, 99, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1864878193, 99, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1864878196, 99, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1864878198, 99, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1864878201, 99, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1864878204, 99, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1864878206, 99, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1864878209, 99, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1864878213, 99, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1864878217, 99, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1864878220, 99, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1864878223, 99, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1864878225, 99, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1864878228, 99, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1864878231, 99, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1693977989, 100, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1693978004, 100, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1693978006, 100, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1693978009, 100, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1693978011, 100, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1693978015, 100, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1693978017, 100, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1693978020, 100, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1693978023, 100, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1693978026, 100, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1693978027, 100, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1693978028, 100, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1693978029, 100, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1693978032, 100, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1693978035, 100, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1693978038, 100, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1693978040, 100, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1693978043, 100, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1560807972, 101, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1560807989, 101, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1560807992, 101, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1560808005, 101, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1560808007, 101, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1560808010, 101, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1560808013, 101, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1560808016, 101, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1560808019, 101, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1560808022, 101, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1560808025, 101, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1560808028, 101, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1560808031, 101, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1560808033, 101, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1560808036, 101, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1560808039, 101, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1560808042, 101, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1560808045, 101, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1095590488, 102, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1095590535, 102, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1095590537, 102, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1095590539, 102, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1095590541, 102, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1095590542, 102, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1095590544, 102, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1095590545, 102, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1095590547, 102, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1095590548, 102, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1095590551, 102, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1095590553, 102, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1095590554, 102, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1095590556, 102, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1095590557, 102, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1095590558, 102, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1095590560, 102, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1095590561, 102, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (889401881, 103, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (889401897, 103, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (889401900, 103, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (889401903, 103, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (889401906, 103, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (889401909, 103, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (889401912, 103, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (889401915, 103, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (889401917, 103, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (889401920, 103, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (889401923, 103, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (889401926, 103, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (889402342, 103, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (889402365, 103, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (889402368, 103, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (889402371, 103, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (889402373, 103, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (889402377, 103, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (743221809, 104, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (743221827, 104, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (743221834, 104, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (743221837, 104, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (743221839, 104, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (743221842, 104, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (743221844, 104, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (743221847, 104, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (743221848, 104, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (743221850, 104, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (743221852, 104, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (743222566, 104, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (743222567, 104, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (743222578, 104, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (743222579, 104, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (743222581, 104, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (743222584, 104, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (743222585, 104, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (118244105, 105, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (118244122, 105, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (118244124, 105, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (118244125, 105, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (118244126, 105, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (118244128, 105, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (118244129, 105, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (118244131, 105, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (118244132, 105, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (118244134, 105, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (118244135, 105, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (118244137, 105, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (118244138, 105, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (118244139, 105, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (118244141, 105, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (118244142, 105, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (118244144, 105, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (118244145, 105, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2047336621, 106, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2047336635, 106, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2047336638, 106, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2047336642, 106, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2047339352, 106, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2047340472, 106, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2047340475, 106, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2047340481, 106, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2047340482, 106, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2047340484, 106, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2047340486, 106, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2047340487, 106, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2047340489, 106, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2047340490, 106, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2047340492, 106, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2047340494, 106, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2047340496, 106, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (2047340497, 106, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1816365286, 107, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1816365321, 107, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1816365323, 107, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1816365325, 107, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1816365326, 107, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1816365327, 107, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1816365328, 107, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1816365329, 107, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1816365331, 107, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1816365332, 107, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1816365334, 107, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1816365335, 107, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1816365336, 107, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1816365338, 107, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1816365339, 107, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1816365341, 107, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1816365342, 107, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1816365343, 107, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (634196598, 108, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (634196618, 108, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (634196621, 108, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (634196642, 108, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (634196646, 108, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (634196649, 108, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (634196652, 108, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (634196655, 108, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (634196658, 108, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (634196662, 108, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (634196667, 108, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (634196672, 108, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (634196676, 108, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (634196681, 108, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (634196685, 108, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (634196690, 108, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (634196694, 108, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (634196699, 108, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (634698279, 109, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (634698333, 109, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (634698338, 109, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (634698360, 109, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (634698363, 109, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (634698366, 109, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (634698368, 109, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (634698371, 109, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (634698374, 109, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (634698377, 109, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (634698380, 109, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (634698383, 109, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (634698386, 109, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (634698388, 109, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (634698391, 109, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (634698394, 109, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (634698396, 109, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (634698399, 109, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (635166963, 110, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (635166977, 110, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (635166983, 110, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (635167007, 110, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (635167012, 110, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (635167018, 110, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (635167023, 110, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (635167029, 110, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (635167034, 110, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (635167040, 110, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (635167045, 110, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (635167051, 110, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (635167057, 110, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (635167062, 110, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (635167068, 110, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (635167073, 110, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (635167079, 110, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (635167084, 110, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (635730126, 111, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (635730146, 111, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (635730149, 111, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (635730171, 111, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (635730174, 111, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (635730177, 111, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (635730180, 111, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (635730184, 111, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (635730187, 111, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (635730190, 111, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (635730193, 111, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (635730196, 111, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (635730199, 111, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (635730203, 111, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (635730206, 111, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (635730209, 111, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (635730212, 111, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (635730215, 111, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (636506828, 112, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (636506841, 112, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (636506845, 112, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (636506867, 112, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (636506869, 112, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (636506874, 112, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (636506877, 112, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (636506880, 112, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (636506882, 112, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (636506885, 112, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (636506888, 112, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (636506891, 112, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (636506895, 112, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (636506897, 112, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (636506900, 112, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (636506904, 112, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (636506906, 112, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (636506909, 112, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (637306003, 113, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (637306031, 113, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (637306034, 113, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (637306056, 113, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (637306059, 113, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (637306063, 113, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (637306066, 113, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (637306069, 113, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (637306072, 113, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (637306075, 113, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (637306078, 113, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (637306080, 113, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (637306083, 113, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (637306086, 113, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (637306089, 113, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (637306092, 113, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (637306095, 113, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (637306098, 113, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (637824304, 114, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (637824321, 114, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (637824324, 114, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (637824346, 114, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (637824349, 114, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (637824352, 114, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (637824355, 114, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (637824358, 114, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (637824361, 114, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (637824364, 114, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (637824367, 114, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (637824370, 114, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (637824373, 114, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (637824376, 114, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (637824379, 114, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (637824382, 114, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (637824384, 114, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (637824387, 114, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (638418663, 115, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (638418677, 115, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (638418689, 115, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (638418711, 115, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (638418714, 115, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (638418717, 115, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (638418720, 115, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (638418724, 115, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (638418726, 115, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (638418730, 115, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (638418733, 115, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (638418736, 115, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (638418739, 115, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (638418742, 115, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (638418745, 115, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (638418748, 115, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (638418752, 115, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (638418755, 115, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (638983313, 116, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (638983334, 116, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (638983337, 116, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (638983358, 116, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (638983362, 116, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (638983365, 116, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (638983368, 116, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (638983371, 116, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (638983374, 116, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (638983378, 116, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (638983381, 116, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (638983384, 116, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (638983387, 116, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (638983390, 116, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (638983393, 116, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (638983396, 116, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (638983399, 116, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (638983401, 116, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (639561347, 117, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (639561361, 117, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (639561365, 117, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (639561386, 117, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (639561389, 117, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (639561392, 117, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (639561395, 117, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (639561398, 117, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (639561401, 117, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (639561404, 117, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (639561407, 117, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (639561410, 117, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (639561412, 117, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (639561415, 117, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (639561417, 117, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (639561420, 117, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (639561423, 117, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (639561426, 117, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (640151680, 118, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (640151705, 118, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (640151711, 118, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (640151735, 118, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (640151740, 118, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (640151745, 118, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (640151751, 118, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (640151756, 118, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (640151761, 118, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (640151766, 118, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (640151771, 118, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (640151777, 118, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (640151781, 118, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (640151787, 118, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (640151792, 118, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (640151798, 118, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (640151803, 118, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (640151808, 118, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (641005808, 119, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (641005823, 119, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (641005827, 119, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (641005848, 119, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (641005851, 119, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (641005854, 119, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (641005857, 119, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (641005860, 119, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (641005863, 119, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (641005866, 119, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (641005869, 119, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (641005872, 119, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (641005875, 119, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (641005877, 119, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (641005880, 119, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (641005883, 119, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (641005885, 119, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (641005888, 119, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (641578221, 120, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (641578236, 120, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (641578242, 120, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (641578266, 120, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (641578271, 120, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (641578277, 120, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (641578282, 120, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (641578287, 120, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (641578293, 120, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (641578298, 120, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (641578304, 120, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (641578309, 120, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (641578314, 120, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (641578320, 120, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (641578325, 120, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (641578331, 120, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (641578337, 120, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (641578342, 120, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (642151798, 121, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (642151813, 121, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (642151817, 121, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (642151838, 121, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (642151841, 121, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (642151844, 121, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (642151847, 121, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (642151850, 121, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (642151853, 121, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (642151857, 121, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (642151860, 121, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (642151863, 121, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (642151866, 121, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (642151869, 121, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (642151872, 121, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (642151875, 121, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (642151878, 121, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (642151881, 121, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (642665243, 122, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (642665258, 122, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (642665261, 122, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (642665283, 122, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (642665286, 122, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (642665289, 122, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (642665292, 122, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (642665295, 122, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (642665297, 122, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (642665300, 122, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (642665303, 122, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (642665306, 122, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (642665309, 122, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (642665311, 122, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (642665314, 122, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (642665317, 122, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (642665319, 122, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (642665322, 122, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643166450, 123, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643166478, 123, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643166481, 123, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643166502, 123, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643166505, 123, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643166507, 123, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643166510, 123, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643166513, 123, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643166516, 123, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643166519, 123, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643166522, 123, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643166525, 123, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643166528, 123, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643166531, 123, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643166535, 123, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643166537, 123, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643166541, 123, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643166543, 123, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643753190, 124, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643753206, 124, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643753209, 124, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643753231, 124, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643753233, 124, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643753236, 124, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643753239, 124, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643753242, 124, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643753245, 124, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643753248, 124, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643753251, 124, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643753254, 124, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643753257, 124, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643753260, 124, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643753263, 124, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643753266, 124, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643753269, 124, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (643753272, 124, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644182451, 125, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644182478, 125, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644182502, 125, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644182525, 125, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644182531, 125, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644182536, 125, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644182541, 125, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644182546, 125, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644182551, 125, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644182557, 125, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644182562, 125, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644182567, 125, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644182572, 125, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644182578, 125, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644182583, 125, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644182588, 125, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644182594, 125, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644182599, 125, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644652777, 126, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644652796, 126, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644652802, 126, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644652825, 126, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644652831, 126, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644652836, 126, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644652842, 126, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644652847, 126, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644652852, 126, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644652857, 126, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644652863, 126, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644652868, 126, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644652873, 126, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644652879, 126, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644652884, 126, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644652889, 126, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644652895, 126, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644652900, 126, 36)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644986674, 127, 1)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644986691, 127, 2)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644986694, 127, 3)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644986715, 127, 22)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644986727, 127, 23)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644986731, 127, 24)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644986734, 127, 25)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644986737, 127, 26)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644986740, 127, 27)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644986743, 127, 28)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644986746, 127, 29)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644986750, 127, 30)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644986753, 127, 31)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644986756, 127, 32)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644986759, 127, 33)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644986762, 127, 34)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644986766, 127, 35)
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (644986768, 127, 36)
GO
SET IDENTITY_INSERT [dbo].[HomeStays] ON 
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (6, N'02d8b227-e52d-4e3f-aede-416db69cfad3', N'Cao Bằng Analist Stay', N'Việt Nam', N'Tỉnh Cao Bằng', N'Huyện Hạ Lang', N'Xã Kim Loan', N'123 Đường Hồ Xuân Hương', N'/Images/20250528_220618_3844026_.png,/Images/20250528_220618_9364906_.jpg,/Images/20250528_220618_6824778_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'11:00', N'10:25', 0, 12, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (7, N'247e4e0b-9587-4c2f-93d3-60e62f6b47a2', N'Cát Bà Manaka House', N'Việt Nam', N'Tỉnh Hà Giang', N'Huyện Bắc Quang', N'Xã Tả Sìn Thàng', N'Số 423 , đường Lê Thánh Tông xóm bà Trưng bà Triệu', N'/Images/20250528_220511_3454233_.jpg,/Images/20250528_220511_5644144_.webp,/Images/20250528_220511_361725_.webp,/Images/20250528_220511_3119359_.webp,/Images/20250528_220511_1202019_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'11:00', N'10:25', 5, 42, 1, 5, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (8, N'4159e118-8be3-4b79-b860-cdf05334f61b', N'Homestay Nhà Núi Bát Bộ , 27 Ngô Đình Niêm', N'Việt Nam', N'Thành phố Hải Phòng', N'Quận Đồ Sơn', N'Phường Vạn Hương', N'Số 423 , đường Lê Thánh Tông xóm bà Trưng bà Triệu', N'/Images/20250528_220213_4538117_.webp,/Images/20250528_220213_8956285_.webp,/Images/20250528_220213_9505072_.webp,/Images/20250528_220213_9229923_.webp,/Images/20250528_220213_7556435_.webp,/Images/20250528_220213_2358013_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'11:00', N'10:25', 0, 31, 0, 0, 1, 0, CAST(N'2025-05-28T22:02:13.820' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (9, N'45759fde-89e7-4ab7-b3cc-cc5c9219bc65', N'Cát Bà Manaka House', N'Việt Nam', N'Thành phố Hải Phòng', N'Huyện Cát Hải', N'Thị trấn Cát Bà', N'Số 423, đường Lê Thánh Tông xóm bà Trưng bà Triệu', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'11:00', N'10:25', 0, 0, 0, 0, 1, 0, CAST(N'2025-05-28T22:13:07.723' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (10, N'583a7632-df01-4491-9aff-e623c85c7907', N'Sapa Terrace View', N'Việt Nam', N'Tỉnh Lào Cai', N'Thị xã Sa Pa', N'Xã Tả Van', N'Thôn Lao Chải, xã Tả Van', N'/Images/20250528_221904_6696142_.webp,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'12:00', 0, 1, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (11, N'974b26d6-8fbf-4003-97bb-94a0945d0403', N'Hội An Ancient House', N'Việt Nam', N'Tỉnh Quảng Nam', N'Thành phố Hội An', N'Phường Minh An', N'Số 15 Nguyễn Thái Học, Phố cổ Hội An', N'/Images/20250528_221844_3441328_.webp,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'12:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (12, N'cac660fd-268c-47be-a4a3-3a0ce953d835', N'Mekong Delta Riverside', N'Việt Nam', N'Tỉnh Bến Tre', N'Huyện Châu Thành', N'Xã Tân Thạch', N'Ấp 5, xã Tân Thạch, bên sông Hàm Luông', N'/Images/20250528_221821_4240722_.webp,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'13:00', N'11:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (13, N'd1291e9a-31d4-414c-bcae-ee7441682162', N'Đà Lạt Pine Hill', N'Việt Nam', N'Tỉnh Lâm Đồng', N'Thành phố Đà Lạt', N'Phường 4', N'Số 25 đường Trần Hưng Đạo, phường 4', N'/Images/20250528_221746_7652207_.webp,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'12:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (14, N'e79e7056-62d9-4e0d-8b74-036f11c8ed00', N'Hội An Ancient House', N'Việt Nam', N'Tỉnh Quảng Nam', N'Thành phố Hội An', N'Phường Minh An', N'Số 15 đường Nguyễn Thái Học, phường Minh An', N'/Images/20250528_221711_8689014_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'13:00', N'11:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (15, N'f3108004-a912-42b5-b98f-c6a42be8903f', N'Phú Quốc Ocean View', N'Việt Nam', N'Tỉnh Kiên Giang', N'Thành phố Phú Quốc', N'Xã Dương Tơ', N'Bãi Ông Lang, xã Dương Tơ', N'/Images/20250528_221645_7553237_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'12:00', 0, 1, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (16, N'02d8b227-e52d-4e3f-aede-416db69cfad3', N'Ninh Bình Tam Cốc Lodge', N'Việt Nam', N'Tỉnh Ninh Bình', N'Huyện Hoa Lư', N'Xã Ninh Hải', N'Thôn Khả Lưu, xã Ninh Hải', N'/Images/20250528_221610_4172562_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'12:00', 0, 1, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (17, N'247e4e0b-9587-4c2f-93d3-60e62f6b47a2', N'Mộc Châu Highland Retreat', N'Việt Nam', N'Tỉnh Sơn La', N'Huyện Mộc Châu', N'Thị trấn Mộc Châu', N'Bản Áng, thị trấn Mộc Châu', N'/Images/20250528_221525_5133465_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'13:00', N'11:00', 0, 74, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (19, N'4159e118-8be3-4b79-b860-cdf05334f61b', N'Cát Bà Manaka House', N'Việt Nam', N'Thành phố Hải Phòng', N'Huyện Cát Hải', N'Thị trấn Cát Bà', N'Số 423, đường Lê Thánh Tông xóm bà Trưng bà Triệu', N'/Images/20250528_235219_3125495_.webp,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'11:00', N'10:25', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (22, N'45759fde-89e7-4ab7-b3cc-cc5c9219bc65', N'Cát Bà Manaka House', N'Việt Nam', N'Thành phố Hải Phòng', N'Huyện Cát Hải', N'Thị trấn Cát Bà', N'Số 423, đường Lê Thánh Tông xóm bà Trưng bà Triệu', N'/Images/20250528_235139_4150133_.webp,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'11:00', N'10:25', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (24, N'583a7632-df01-4491-9aff-e623c85c7907', N'Cát Bà Manaka House', N'Việt Nam', N'Thành phố Hải Phòng', N'Huyện Cát Hải', N'Thị trấn Cát Bà', N'Số 423, đường Lê Thánh Tông xóm bà Trưng bà Triệu', N'/Images/20250528_235057_6171374_.png,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'11:00', N'10:25', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (25, N'974b26d6-8fbf-4003-97bb-94a0945d0403', N'Sapa Bamboo Retreat', N'Việt Nam', N'Tỉnh Lào Cai', N'Thị xã Sa Pa', N'Phường Sa Pa', N'Thôn Tả Van, xã Tả Van, huyện Sa Pa', N'/Images/20250528_235037_1926119_.webp,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'12:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (26, N'cac660fd-268c-47be-a4a3-3a0ce953d835', N'Hội An River Lodge', N'Việt Nam', N'Tỉnh Quảng Nam', N'Thành phố Hội An', N'Phường Cẩm Phô', N'118 Nguyễn Thái Học, Phố cổ Hội An', N'/Images/20250528_235011_6304276_.webp,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'11:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (27, N'd1291e9a-31d4-414c-bcae-ee7441682162', N'Mekong Delta Eco House', N'Việt Nam', N'Tỉnh Bến Tre', N'Huyện Châu Thành', N'Xã Tân Thạch', N'Ấp 5, xã Tân Thạch, huyện Châu Thành', N'/Images/20250528_234955_6979259_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'13:00', N'11:30', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (28, N'e79e7056-62d9-4e0d-8b74-036f11c8ed00', N'Đà Lạt Pine Valley', N'Việt Nam', N'Tỉnh Lâm Đồng', N'Thành phố Đà Lạt', N'Phường 4', N'42 Đường Trần Hưng Đạo, Phường 4', N'/Images/20250528_234941_696278_.webp,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'12:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (29, N'f3108004-a912-42b5-b98f-c6a42be8903f', N'Hội An Ancient House', N'Việt Nam', N'Tỉnh Quảng Nam', N'Thành phố Hội An', N'Phường Minh An', N'15 Nguyễn Thái Học, Phường Minh An', N'/Images/20250528_234925_5510173_.webp,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'11:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (30, N'02d8b227-e52d-4e3f-aede-416db69cfad3', N'Phú Quốc Ocean View', N'Việt Nam', N'Tỉnh Kiên Giang', N'Thành phố Phú Quốc', N'Xã Dương Tơ', N'Bãi Ông Lang, Xã Dương Tơ', N'/Images/20250528_234904_929796_.webp,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'15:00', N'12:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (31, N'247e4e0b-9587-4c2f-93d3-60e62f6b47a2', N'Ninh Bình Tam Cốc Lodge', N'Việt Nam', N'Tỉnh Ninh Bình', N'Huyện Hoa Lư', N'Xã Ninh Hải', N'Thôn Khả Lưu, Xã Ninh Hải', N'/Images/20250528_234844_4265337_.webp,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'12:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (32, N'4159e118-8be3-4b79-b860-cdf05334f61b', N'Hội An Ancient House', N'Việt Nam', N'Tỉnh Quảng Nam', N'Thành phố Hội An', N'Phường Minh An', N'15 Nguyễn Thái Học, Phường Minh An, Hội An', N'/Images/20250528_234823_8891839_.webp,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'12:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (33, N'45759fde-89e7-4ab7-b3cc-cc5c9219bc65', N'Cát Bà Manaka House', N'Việt Nam', N'Thành phố Hải Phòng', N'Huyện Cát Hải', N'Thị trấn Cát Bà', N'Số 423, đường Lê Thánh Tông xóm bà Trưng bà Triệu', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'11:00', N'10:25', 0, 0, 0, 0, 1, 0, CAST(N'2025-05-28T23:42:29.163' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (34, N'583a7632-df01-4491-9aff-e623c85c7907', N'Sapa Mây Ngủ Homestay', N'Việt Nam', N'Tỉnh Lào Cai', N'Thị xã Sa Pa', N'Phường Sa Pa', N'Số 56, đường Thác Bạc, thôn Cát Cát', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'12:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (35, N'974b26d6-8fbf-4003-97bb-94a0945d0403', N'Hội An Riverside Cottage', N'Việt Nam', N'Tỉnh Quảng Nam', N'Thành phố Hội An', N'Phường Cẩm Phô', N'Số 28, đường Bạch Đằng, ven sông Thu Bồn', N'/Images/20250528_234738_9232134_.webp,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'13:00', N'11:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (36, N'cac660fd-268c-47be-a4a3-3a0ce953d835', N'Mekong Delta Green House', N'Việt Nam', N'Tỉnh Bến Tre', N'Huyện Châu Thành', N'Xã Tân Thạch', N'Ấp 5, xã Tân Thạch, bên cạnh kênh Cái Sơn', N'/Images/20250528_234711_5326603_.webp,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'12:00', N'11:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (37, N'd1291e9a-31d4-414c-bcae-ee7441682162', N'Hội An Ancient House', N'Việt Nam', N'Tỉnh Quảng Nam', N'Thành phố Hội An', N'Phường Minh An', N'Số 27, đường Nguyễn Thái Học, Phố cổ Hội An', N'/Images/20250528_234653_2382645_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'12:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (38, N'e79e7056-62d9-4e0d-8b74-036f11c8ed00', N'Sapa Mountain Retreat', N'Việt Nam', N'Tỉnh Lào Cai', N'Thị xã Sapa', N'Xã Tả Van', N'Thôn Tả Van Giáy, Xã Tả Van, Sapa', N'/Images/20250528_234631_3588040_.webp,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'13:00', N'11:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (39, N'f3108004-a912-42b5-b98f-c6a42be8903f', N'Phú Quốc Beach House', N'Việt Nam', N'Tỉnh Kiên Giang', N'Thành phố Phú Quốc', N'Xã Gành Dầu', N'Bãi Dài, Xã Gành Dầu, Phú Quốc', N'/Images/20250528_234608_2570222_.png,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'15:00', N'12:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (40, N'02d8b227-e52d-4e3f-aede-416db69cfad3', N'Đà Lạt Pine Valley', N'Việt Nam', N'Tỉnh Lâm Đồng', N'Thành phố Đà Lạt', N'Phường 4', N'42 Đường Hồ Tùng Mậu, Phường 4, Đà Lạt', N'/Images/20250528_234553_2394251_.webp,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'12:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (41, N'247e4e0b-9587-4c2f-93d3-60e62f6b47a2', N'Hà Giang Rock Plateau', N'Việt Nam', N'Tỉnh Hà Giang', N'Huyện Đồng Văn', N'Thị trấn Đồng Văn', N'Thôn Lũng Cẩm, Thị trấn Đồng Văn, Hà Giang', N'/Images/20250528_234533_6285516_.webp,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'13:00', N'11:00', 0, 4, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (42, N'4159e118-8be3-4b79-b860-cdf05334f61b', N'Cát Bà Manaka House', N'Việt Nam', N'Thành phố Hải Phòng', N'Huyện Cát Hải', N'Thị trấn Cát Bà', N'Số 423, đường Lê Thánh Tông xóm bà Trưng bà Triệu', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'12:00', 45, 1, 15, 4.5, 1, 0, CAST(N'2025-05-29T08:59:06.680' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (43, N'45759fde-89e7-4ab7-b3cc-cc5c9219bc65', N'Hạ Long Bay View', N'Việt Nam', N'Quảng Ninh', N'Thành phố Hạ Long', N'Phường Bãi Cháy', N'86 Đường Hạ Long, Bãi Cháy', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'15:00', N'11:00', 78, 0, 26, 4.8, 1, 0, CAST(N'2025-05-29T08:59:07.123' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (44, N'583a7632-df01-4491-9aff-e623c85c7907', N'Sapa Mountain Retreat', N'Việt Nam', N'Lào Cai', N'Thị xã Sapa', N'Phường Sapa', N'25 Đường Fansipan, Sapa', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'13:00', N'11:30', 56, 0, 19, 4.2, 1, 0, CAST(N'2025-05-29T08:59:07.140' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (45, N'974b26d6-8fbf-4003-97bb-94a0945d0403', N'Hội An River House', N'Việt Nam', N'Quảng Nam', N'Thành phố Hội An', N'Phường Minh An', N'15 Bạch Đằng, Phố cổ Hội An', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:30', N'11:00', 92, 0, 43, 4.9, 1, 0, CAST(N'2025-05-29T08:59:07.163' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (46, N'cac660fd-268c-47be-a4a3-3a0ce953d835', N'Phú Quốc Beach House', N'Việt Nam', N'Kiên Giang', N'Thành phố Phú Quốc', N'Xã Dương Tơ', N'78 Đường Trần Hưng Đạo, Bãi Trường', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'15:00', N'12:00', 85, 0, 32, 4.7, 1, 0, CAST(N'2025-05-29T08:59:07.177' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (47, N'd1291e9a-31d4-414c-bcae-ee7441682162', N'Đà Lạt Pine Hill', N'Việt Nam', N'Lâm Đồng', N'Thành phố Đà Lạt', N'Phường 10', N'45 Đường Triệu Việt Vương, Đà Lạt', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'11:30', 75, 0, 28, 4.6, 1, 0, CAST(N'2025-05-29T08:59:07.193' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (48, N'e79e7056-62d9-4e0d-8b74-036f11c8ed00', N'Ninh Bình Panorama', N'Việt Nam', N'Ninh Bình', N'Huyện Hoa Lư', N'Xã Trường Yên', N'23 Đường Tràng An, Ninh Bình', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'13:30', N'11:00', 68, 2, 24, 4.3, 1, 0, CAST(N'2025-05-29T08:59:07.213' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (49, N'f3108004-a912-42b5-b98f-c6a42be8903f', N'Mũi Né Ocean View', N'Việt Nam', N'Bình Thuận', N'Thành phố Phan Thiết', N'Phường Mũi Né', N'112 Đường Nguyễn Đình Chiểu, Mũi Né', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'15:00', N'12:00', 82, 0, 29, 4.7, 1, 0, CAST(N'2025-05-29T08:59:07.257' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (50, N'02d8b227-e52d-4e3f-aede-416db69cfad3', N'Huế Royal House', N'Việt Nam', N'Thừa Thiên Huế', N'Thành phố Huế', N'Phường Phú Hậu', N'56 Đường Lê Lợi, Huế', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'11:00', 70, 0, 25, 4.4, 1, 0, CAST(N'2025-05-29T08:59:07.303' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (51, N'247e4e0b-9587-4c2f-93d3-60e62f6b47a2', N'Nha Trang Beach Villa', N'Việt Nam', N'Khánh Hòa', N'Thành phố Nha Trang', N'Phường Lộc Thọ', N'78 Trần Phú, Nha Trang', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'15:00', N'12:00', 88, 0, 35, 4.8, 1, 0, CAST(N'2025-05-29T08:59:07.437' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (52, N'4159e118-8be3-4b79-b860-cdf05334f61b', N'Mekong Delta Homestay', N'Việt Nam', N'Cần Thơ', N'Quận Ninh Kiều', N'Phường Tân An', N'34 Đường Hùng Vương, Cần Thơ', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'11:30', 65, 0, 22, 4.3, 1, 0, CAST(N'2025-05-29T08:59:07.570' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (53, N'45759fde-89e7-4ab7-b3cc-cc5c9219bc65', N'Tam Đảo Mountain Lodge', N'Việt Nam', N'Vĩnh Phúc', N'Huyện Tam Đảo', N'Thị trấn Tam Đảo', N'18 Đường Thác Bạc, Tam Đảo', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:30', N'11:00', 72, 0, 24, 4.5, 1, 0, CAST(N'2025-05-29T08:59:07.633' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (54, N'583a7632-df01-4491-9aff-e623c85c7907', N'Côn Đảo Sea View', N'Việt Nam', N'Bà Rịa - Vũng Tàu', N'Huyện Côn Đảo', N'Thị trấn Côn Đảo', N'45 Đường Phạm Văn Đồng, Côn Đảo', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'15:00', N'12:00', 80, 0, 27, 4.6, 1, 0, CAST(N'2025-05-29T08:59:07.700' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (55, N'974b26d6-8fbf-4003-97bb-94a0945d0403', N'Hà Giang Mountain View', N'Việt Nam', N'Hà Giang', N'Thành phố Hà Giang', N'Phường Quang Trung', N'29 Đường Nguyễn Thái Học, Hà Giang', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'13:30', N'11:00', 67, 0, 23, 4.4, 1, 0, CAST(N'2025-05-29T08:59:07.760' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (56, N'cac660fd-268c-47be-a4a3-3a0ce953d835', N'Mai Châu Valley House', N'Việt Nam', N'Hòa Bình', N'Huyện Mai Châu', N'Xã Poom Cọong', N'Bản Lác, Mai Châu', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'12:00', 72, 0, 25, 4.5, 1, 0, CAST(N'2025-05-29T08:59:07.807' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (57, N'd1291e9a-31d4-414c-bcae-ee7441682162', N'Ninh Bình Tam Cốc Retreat', N'Việt Nam', N'Ninh Bình', N'Huyện Hoa Lư', N'Xã Ninh Hải', N'Thôn Khả Lương, Tam Cốc', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'15:00', N'11:30', 88, 0, 34, 4.7, 1, 0, CAST(N'2025-05-29T08:59:07.887' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (58, N'e79e7056-62d9-4e0d-8b74-036f11c8ed00', N'Mũi Né Ocean Villa', N'Việt Nam', N'Bình Thuận', N'Thành phố Phan Thiết', N'Phường Mũi Né', N'156 Đường Nguyễn Đình Chiểu, Mũi Né', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4f105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'12:00', 82, 0, 31, 4.6, 1, 0, CAST(N'2025-05-29T08:59:07.940' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (59, N'f3108004-a912-42b5-b98f-c6a42be8903f', N'Huế Imperial Homestay', N'Việt Nam', N'Thừa Thiên Huế', N'Thành phố Huế', N'Phường Phú Hội', N'28 Đường Lê Lợi, Phú Hội', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'13:00', N'11:00', 76, 0, 28, 4.5, 1, 0, CAST(N'2025-05-29T08:59:08.037' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (60, N'02d8b227-e52d-4e3f-aede-416db69cfad3', N'Quy Nhơn Beach House', N'Việt Nam', N'Bình Định', N'Thành phố Quy Nhơn', N'Phường Ghềnh Ráng', N'79 Đường An Dương Vương, Quy Nhơn', N'/Images/20250529_095923_2659133_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:30', N'12:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (61, N'247e4e0b-9587-4c2f-93d3-60e62f6b47a2', N'Vĩnh Long Mekong Homestay', N'Việt Nam', N'Vĩnh Long', N'Thành phố Vĩnh Long', N'Phường 1', N'45 Đường Phạm Hùng, Vĩnh Long', N'/Images/20250529_095903_1544870_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'11:30', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (62, N'4159e118-8be3-4b79-b860-cdf05334f61b', N'Buôn Ma Thuột Coffee House', N'Việt Nam', N'Đắk Lắk', N'Thành phố Buôn Ma Thuột', N'Phường Tân Lợi', N'156 Đường Lê Duẩn, Buôn Ma Thuột', N'/Images/20250529_095837_4248353_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'13:30', N'11:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (63, N'45759fde-89e7-4ab7-b3cc-cc5c9219bc65', N'Hà Nội Old Quarter House', N'Việt Nam', N'Hà Nội', N'Quận Hoàn Kiếm', N'Phường Hàng Bạc', N'25 Hàng Nón, Hoàn Kiếm', N'/Images/20250529_095818_6098224_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'12:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (64, N'583a7632-df01-4491-9aff-e623c85c7907', N'Cần Thơ Riverside House', N'Việt Nam', N'Cần Thơ', N'Quận Ninh Kiều', N'Phường Tân An', N'78 Đường Hai Bà Trưng, Ninh Kiều', N'/Images/20250529_095804_56930_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'15:00', N'11:30', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (65, N'974b26d6-8fbf-4003-97bb-94a0945d0403', N'Nha Trang Sea View', N'Việt Nam', N'Khánh Hòa', N'Thành phố Nha Trang', N'Phường Lộc Thọ', N'35 Đường Trần Phú, Nha Trang', N'/Images/20250529_095749_1538865_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'12:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (66, N'cac660fd-268c-47be-a4a3-3a0ce953d835', N'Huế Imperial Garden', N'Việt Nam', N'Thừa Thiên Huế', N'Thành phố Huế', N'Phường Phú Hội', N'42 Đường Lê Lợi, Huế', N'/Images/20250529_095735_5665261_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'13:30', N'11:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (67, N'd1291e9a-31d4-414c-bcae-ee7441682162', N'Quy Nhơn Beach Retreat', N'Việt Nam', N'Bình Định', N'Thành phố Quy Nhơn', N'Phường Ghềnh Ráng', N'27 Đường An Dương Vương, Quy Nhơn', N'/Images/20250529_095719_9718262_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:30', N'11:30', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (68, N'e79e7056-62d9-4e0d-8b74-036f11c8ed00', N'Mỹ Tho Mekong House', N'Việt Nam', N'Tiền Giang', N'Thành phố Mỹ Tho', N'Phường 5', N'56 Đường Nguyễn Trãi, Mỹ Tho', N'/Images/20250529_095655_157826_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'15:00', N'12:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (69, N'f3108004-a912-42b5-b98f-c6a42be8903f', N'Vũng Tàu Ocean Breeze', N'Việt Nam', N'Bà Rịa - Vũng Tàu', N'Thành phố Vũng Tàu', N'Phường 2', N'89 Đường Thùy Vân, Vũng Tàu', N'/Images/20250529_095633_8281753_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'15:30', N'11:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (70, N'02d8b227-e52d-4e3f-aede-416db69cfad3', N'Phan Thiết Palm Villa', N'Việt Nam', N'Bình Thuận', N'Thành phố Phan Thiết', N'Phường Phú Hài', N'34 Đường Nguyễn Đình Chiểu, Phan Thiết', N'/Images/20250529_095506_7529332_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'12:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (71, N'247e4e0b-9587-4c2f-93d3-60e62f6b47a2', N'Buôn Ma Thuột Highland Retreat', N'Việt Nam', N'Đắk Lắk', N'Thành phố Buôn Ma Thuột', N'Phường Tân Lợi', N'67 Đường Y Jut, Buôn Ma Thuột', N'/Images/20250529_095441_6383000_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:30', N'11:30', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (72, N'4159e118-8be3-4b79-b860-cdf05334f61b', N'Pleiku Mountain Lodge', N'Việt Nam', N'Gia Lai', N'Thành phố Pleiku', N'Phường Hoa Lư', N'23 Đường Phan Đình Phùng, Pleiku', N'/Images/20250529_095416_2211331_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'13:00', N'11:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (73, N'45759fde-89e7-4ab7-b3cc-cc5c9219bc65', N'Long Xuyên Mekong Delta House', N'Việt Nam', N'An Giang', N'Thành phố Long Xuyên', N'Phường Mỹ Xuyên', N'45 Đường Trần Hưng Đạo, Long Xuyên', N'/Images/20250529_095357_3726674_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'12:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (74, N'583a7632-df01-4491-9aff-e623c85c7907', N'Rạch Giá Seaside Retreat', N'Việt Nam', N'Kiên Giang', N'Thành phố Rạch Giá', N'Phường Vĩnh Thanh', N'32 Đường Nguyễn Trung Trực, Rạch Giá', N'/Images/20250529_095335_2281690_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'15:00', N'11:30', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (75, N'974b26d6-8fbf-4003-97bb-94a0945d0403', N'Vĩnh Long River House', N'Việt Nam', N'Vĩnh Long', N'Thành phố Vĩnh Long', N'Phường 1', N'56 Đường Phạm Hùng, Vĩnh Long', N'/Images/20250529_095315_4972788_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:30', N'11:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (76, N'cac660fd-268c-47be-a4a3-3a0ce953d835', N'Bến Tre Coconut Village', N'Việt Nam', N'Bến Tre', N'Thành phố Bến Tre', N'Phường Phú Khương', N'78 Đường Đồng Khởi, Bến Tre', N'/Images/20250529_095253_1454858_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'12:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (77, N'd1291e9a-31d4-414c-bcae-ee7441682162', N'Sóc Trăng Mekong Homestay', N'Việt Nam', N'Sóc Trăng', N'Thành phố Sóc Trăng', N'Phường 2', N'45 Đường Trần Hưng Đạo, Sóc Trăng', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'15:00', N'11:00', 68, 0, 22, 4.3, 1, 0, CAST(N'2025-05-29T08:59:09.277' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (78, N'e79e7056-62d9-4e0d-8b74-036f11c8ed00', N'Bạc Liêu Heritage House', N'Việt Nam', N'Bạc Liêu', N'Thành phố Bạc Liêu', N'Phường 3', N'23 Đường Hùng Vương, Bạc Liêu', N'/Images/20250529_095237_1745026_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:30', N'12:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (79, N'f3108004-a912-42b5-b98f-c6a42be8903f', N'Đà Lạt Pine Valley', N'Việt Nam', N'Lâm Đồng', N'Thành phố Đà Lạt', N'Phường 4', N'17 Đường Trần Quốc Toản, Đà Lạt', N'/Images/20250529_095207_6869844_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'15:00', N'11:30', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (80, N'02d8b227-e52d-4e3f-aede-416db69cfad3', N'Hội An Ancient House', N'Việt Nam', N'Quảng Nam', N'Thành phố Hội An', N'Phường Minh An', N'56 Đường Bạch Đằng, Hội An', N'/Images/20250529_095141_1656538_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'12:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (81, N'247e4e0b-9587-4c2f-93d3-60e62f6b47a2', N'Phú Quốc Island Retreat', N'Việt Nam', N'Kiên Giang', N'Thành phố Phú Quốc', N'Phường Dương Đông', N'89 Đường Trần Hưng Đạo, Phú Quốc', N'/Images/20250529_095119_167095_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'15:30', N'11:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (82, N'4159e118-8be3-4b79-b860-cdf05334f61b', N'Sapa Mountain Lodge', N'Việt Nam', N'Lào Cai', N'Thị xã Sa Pa', N'Phường Sa Pa', N'34 Đường Điện Biên Phủ, Sa Pa', N'/Images/20250529_095056_567313_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'12:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (83, N'45759fde-89e7-4ab7-b3cc-cc5c9219bc65', N'Hạ Long Bay View', N'Việt Nam', N'Quảng Ninh', N'Thành phố Hạ Long', N'Phường Bãi Cháy', N'67 Đường Hạ Long, Hạ Long', N'/Images/20250529_095022_815688_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'15:00', N'11:30', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (84, N'583a7632-df01-4491-9aff-e623c85c7907', N'Đà Nẵng Beach House', N'Việt Nam', N'Đà Nẵng', N'Quận Sơn Trà', N'Phường Mỹ An', N'28 Đường Võ Nguyên Giáp, Đà Nẵng', N'/Images/20250529_094812_9114917_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:30', N'12:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (85, N'974b26d6-8fbf-4003-97bb-94a0945d0403', N'Huế Imperial Retreat', N'Việt Nam', N'Thừa Thiên Huế', N'Thành phố Huế', N'Phường Phú Nhuận', N'42 Đường Nguyễn Huệ, Huế', N'/Images/20250529_094736_1848937_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'11:30', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (86, N'cac660fd-268c-47be-a4a3-3a0ce953d835', N'Vũng Tàu Seaview Villa', N'Việt Nam', N'Bà Rịa - Vũng Tàu', N'Thành phố Vũng Tàu', N'Phường Thắng Tam', N'56 Đường Thùy Vân, Vũng Tàu', N'/Images/20250529_094542_1143172_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'15:00', N'12:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (87, N'd1291e9a-31d4-414c-bcae-ee7441682162', N'Ninh Bình Rice Field View', N'Việt Nam', N'Ninh Bình', N'Thành phố Ninh Bình', N'Phường Đông Thành', N'22 Đường Trần Hưng Đạo, Ninh Bình', N'/Images/20250529_094451_4635398_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'11:30', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (88, N'e79e7056-62d9-4e0d-8b74-036f11c8ed00', N'Mũi Né Coastal Retreat', N'Việt Nam', N'Bình Thuận', N'Thành phố Phan Thiết', N'Phường Mũi Né', N'78 Đường Nguyễn Đình Chiểu, Mũi Né', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'15:00', N'11:00', 81, 0, 43, 4.6, 1, 0, CAST(N'2025-05-29T08:59:09.853' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (89, N'f3108004-a912-42b5-b98f-c6a42be8903f', N'Cần Thơ Riverside Haven', N'Việt Nam', N'Cần Thơ', N'Quận Ninh Kiều', N'Phường Tân An', N'35 Đường Hai Bà Trưng, Cần Thơ', N'/Images/20250529_094423_1865586_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'12:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (90, N'02d8b227-e52d-4e3f-aede-416db69cfad3', N'Nha Trang Ocean View', N'Việt Nam', N'Khánh Hòa', N'Thành phố Nha Trang', N'Phường Lộc Thọ', N'45 Đường Trần Phú, Nha Trang', N'/Images/20250529_094400_3592779_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'15:00', N'11:30', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (91, N'247e4e0b-9587-4c2f-93d3-60e62f6b47a2', N'Hà Nội Old Quarter Charm', N'Việt Nam', N'Hà Nội', N'Quận Hoàn Kiếm', N'Phường Hàng Gai', N'15 Hàng Bông, Hoàn Kiếm', N'/Images/20250529_094330_2311481_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'12:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (92, N'4159e118-8be3-4b79-b860-cdf05334f61b', N'Sapa Mountain Retreat', N'Việt Nam', N'Lào Cai', N'Thị xã Sapa', N'Phường Cầu Mây', N'42 Đường Fansipan, Sapa', N'/Images/20250529_094310_4124029_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'15:00', N'11:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (93, N'45759fde-89e7-4ab7-b3cc-cc5c9219bc65', N'Hạ Long Bay View', N'Việt Nam', N'Quảng Ninh', N'Thành phố Hạ Long', N'Phường Bãi Cháy', N'28 Đường Hạ Long, TP Hạ Long', N'/Images/20250529_094251_6789362_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:30', N'12:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (94, N'583a7632-df01-4491-9aff-e623c85c7907', N'Phú Quốc Island Paradise', N'Việt Nam', N'Kiên Giang', N'Thành phố Phú Quốc', N'Phường Dương Đông', N'67 Trần Hưng Đạo, Phú Quốc', N'/Images/20250529_094157_1527242_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'15:00', N'11:30', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (95, N'974b26d6-8fbf-4003-97bb-94a0945d0403', N'Huế Imperial Retreat', N'Việt Nam', N'Thừa Thiên Huế', N'Thành phố Huế', N'Phường Phú Hội', N'19 Đường Lê Lợi, Huế', N'/Images/20250529_093816_7821036_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'11:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (96, N'cac660fd-268c-47be-a4a3-3a0ce953d835', N'Hội An Ancient Villa', N'Việt Nam', N'Quảng Nam', N'Thành phố Hội An', N'Phường Minh An', N'35 Trần Phú, Hội An', N'/Images/20250529_093755_4258646_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'15:00', N'12:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (97, N'd1291e9a-31d4-414c-bcae-ee7441682162', N'Đà Lạt Highland Retreat', N'Việt Nam', N'Lâm Đồng', N'Thành phố Đà Lạt', N'Phường 3', N'52 Đường Phan Đình Phùng, Đà Lạt', N'/Images/20250529_093734_9596800_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:30', N'11:30', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (98, N'e79e7056-62d9-4e0d-8b74-036f11c8ed00', N'Mekong Delta House', N'Việt Nam', N'Tiền Giang', N'Thành phố Mỹ Tho', N'Phường 1', N'47 Đường Lê Lợi, Mỹ Tho', N'/Images/20250529_093716_3843524_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'12:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (99, N'f3108004-a912-42b5-b98f-c6a42be8903f', N'Vũng Tàu Beach House', N'Việt Nam', N'Bà Rịa - Vũng Tàu', N'Thành phố Vũng Tàu', N'Phường Thắng Tam', N'23 Đường Thùy Vân, Vũng Tàu', N'/Images/20250529_093701_6497182_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'15:00', N'11:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (100, N'02d8b227-e52d-4e3f-aede-416db69cfad3', N'Bắc Ninh Traditional House', N'Việt Nam', N'Bắc Ninh', N'Thành phố Bắc Ninh', N'Phường Đại Phúc', N'15 Đường Nguyễn Gia Thiều, Bắc Ninh', N'/Images/20250529_093644_9146325_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'12:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (101, N'247e4e0b-9587-4c2f-93d3-60e62f6b47a2', N'Ninh Bình Limestone Haven', N'Việt Nam', N'Ninh Bình', N'Thành phố Ninh Bình', N'Phường Đông Thành', N'39 Đường Trần Hưng Đạo, Ninh Bình', N'/Images/20250529_093631_3371250_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:30', N'11:30', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (102, N'4159e118-8be3-4b79-b860-cdf05334f61b', N'Quy Nhơn Coastal Retreat', N'Việt Nam', N'Bình Định', N'Thành phố Quy Nhơn', N'Phường Ghềnh Ráng', N'27 Đường An Dương Vương, Quy Nhơn', N'/Images/20250529_093544_7234486_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'15:00', N'12:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (103, N'45759fde-89e7-4ab7-b3cc-cc5c9219bc65', N'Buôn Ma Thuột Highland House', N'Việt Nam', N'Đắk Lắk', N'Thành phố Buôn Ma Thuột', N'Phường Tân Lợi', N'18 Đường Y Jut, Buôn Ma Thuột', N'/Images/20250529_093523_3758848_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'11:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (104, N'583a7632-df01-4491-9aff-e623c85c7907', N'Đà Lạt Pine Valley', N'Việt Nam', N'Tỉnh Lâm Đồng', N'Thành phố Đà Lạt', N'Phường 7', N'42 Đường Trần Hưng Đạo, Đà Lạt', N'/Images/20250529_093509_8012540_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'15:30', N'12:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (105, N'974b26d6-8fbf-4003-97bb-94a0945d0403', N'Huế Imperial Garden', N'Việt Nam', N'Thừa Thiên Huế', N'Thành phố Huế', N'Phường Phú Hội', N'15 Đường Lê Lợi, Huế', N'/Images/20250529_093406_7686609_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'11:30', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (106, N'cac660fd-268c-47be-a4a3-3a0ce953d835', N'Mộc Châu Mountain View', N'Việt Nam', N'Sơn La', N'Huyện Mộc Châu', N'Thị trấn Mộc Châu', N'28 Đường Trần Huy Liệu, Mộc Châu', N'/Images/20250529_093344_765644_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'13:30', N'11:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (107, N'd1291e9a-31d4-414c-bcae-ee7441682162', N'Phú Quốc Beach Bungalow', N'Việt Nam', N'Kiên Giang', N'Thành phố Phú Quốc', N'Phường Dương Đông', N'52 Đường Trần Hưng Đạo, Phú Quốc', N'/Images/20250529_093321_5282398_.jpg,/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'15:00', N'12:00', 0, 0, 0, 0, 1, 0, NULL, NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (108, N'e79e7056-62d9-4e0d-8b74-036f11c8ed00', N'Hội An Old Town House', N'Việt Nam', N'Quảng Nam', N'Thành phố Hội An', N'Phường Minh An', N'19 Đường Trần Phú, Hội An', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'11:30', 88, 0, 62, 4.7, 0, 0, CAST(N'2025-05-29T08:59:11.053' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (109, N'f3108004-a912-42b5-b98f-c6a42be8903f', N'Hà Nội Old Quarter Retreat', N'Việt Nam', N'Hà Nội', N'Quận Hoàn Kiếm', N'Phường Hàng Gai', N'25 Đường Hàng Bạc, Hà Nội', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:30', N'12:00', 86, 0, 58, 4.7, 0, 0, CAST(N'2025-05-29T08:59:11.100' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (110, N'02d8b227-e52d-4e3f-aede-416db69cfad3', N'Sa Pa Mountain Lodge', N'Việt Nam', N'Lào Cai', N'Thị xã Sa Pa', N'Phường Sa Pa', N'38 Đường Thạch Sơn, Sa Pa', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'15:00', N'11:00', 83, 0, 49, 4.6, 0, 0, CAST(N'2025-05-29T08:59:11.143' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (111, N'247e4e0b-9587-4c2f-93d3-60e62f6b47a2', N'Bắc Hà Highland Cottage', N'Việt Nam', N'Lào Cai', N'Huyện Bắc Hà', N'Thị trấn Bắc Hà', N'12 Đường Nguyễn Huệ, Bắc Hà', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'12:00', 75, 0, 35, 4.4, 0, 0, CAST(N'2025-05-29T08:59:11.193' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (112, N'4159e118-8be3-4b79-b860-cdf05334f61b', N'Hà Giang Rock Plateau', N'Việt Nam', N'Hà Giang', N'Thành phố Hà Giang', N'Phường Trần Phú', N'32 Đường Nguyễn Trãi, Hà Giang', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'13:30', N'11:30', 79, 0, 44, 4.5, 0, 0, CAST(N'2025-05-29T08:59:11.277' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (113, N'45759fde-89e7-4ab7-b3cc-cc5c9219bc65', N'Đồng Văn Heritage House', N'Việt Nam', N'Hà Giang', N'Huyện Đồng Văn', N'Thị trấn Đồng Văn', N'15 Đường Phố Cổ, Đồng Văn', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'11:00', 81, 0, 42, 4.6, 0, 0, CAST(N'2025-05-29T08:59:11.357' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (114, N'583a7632-df01-4491-9aff-e623c85c7907', N'Mù Cang Chải Rice Terrace View', N'Việt Nam', N'Yên Bái', N'Huyện Mù Cang Chải', N'Thị trấn Mù Cang Chải', N'8 Đường Nguyễn Tất Thành, Mù Cang Chải', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'15:00', N'12:00', 84, 0, 46, 4.7, 0, 0, CAST(N'2025-05-29T08:59:11.410' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (115, N'974b26d6-8fbf-4003-97bb-94a0945d0403', N'Tam Đảo Mountain Retreat', N'Việt Nam', N'Vĩnh Phúc', N'Huyện Tam Đảo', N'Thị trấn Tam Đảo', N'22 Đường Hoàng Hoa Thám, Tam Đảo', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:30', N'11:30', 80, 0, 40, 4.5, 0, 0, CAST(N'2025-05-29T08:59:11.467' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (116, N'cac660fd-268c-47be-a4a3-3a0ce953d835', N'Phú Quốc Island Paradise', N'Việt Nam', N'Kiên Giang', N'Thành phố Phú Quốc', N'Phường Dương Đông', N'56 Đường Trần Hưng Đạo, Phú Quốc', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'15:00', N'12:00', 92, 0, 68, 4.9, 0, 0, CAST(N'2025-05-29T08:59:11.523' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (117, N'd1291e9a-31d4-414c-bcae-ee7441682162', N'Cô Tô Beach House', N'Việt Nam', N'Quảng Ninh', N'Huyện Cô Tô', N'Thị trấn Cô Tô', N'15 Đường Hải Sản, Cô Tô', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'11:00', 83, 0, 45, 4.7, 0, 0, CAST(N'2025-05-29T08:59:11.580' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (118, N'e79e7056-62d9-4e0d-8b74-036f11c8ed00', N'Vũng Tàu Ocean Breeze', N'Việt Nam', N'Bà Rịa - Vũng Tàu', N'Thành phố Vũng Tàu', N'Phường Thắng Tam', N'35 Đường Thùy Vân, Vũng Tàu', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'15:00', N'12:00', 85, 0, 52, 4.6, 0, 0, CAST(N'2025-05-29T08:59:11.640' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (119, N'f3108004-a912-42b5-b98f-c6a42be8903f', N'Bắc Kạn Forest Lodge', N'Việt Nam', N'Bắc Kạn', N'Thành phố Bắc Kạn', N'Phường Đức Xuân', N'28 Đường Trường Chinh, Bắc Kạn', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'11:30', 76, 0, 38, 4.3, 0, 0, CAST(N'2025-05-29T08:59:11.727' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (120, N'02d8b227-e52d-4e3f-aede-416db69cfad3', N'Phong Nha Cave House', N'Việt Nam', N'Quảng Bình', N'Huyện Bố Trạch', N'Xã Sơn Trạch', N'15 Đường Phong Nha, Bố Trạch', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:30', N'12:00', 88, 0, 49, 4.8, 0, 0, CAST(N'2025-05-29T08:59:11.783' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (121, N'247e4e0b-9587-4c2f-93d3-60e62f6b47a2', N'Mỹ Tho Mekong Getaway', N'Việt Nam', N'Tiền Giang', N'Thành phố Mỹ Tho', N'Phường 5', N'45 Đường Lê Lợi, Mỹ Tho', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'15:00', N'11:00', 81, 0, 42, 4.5, 0, 0, CAST(N'2025-05-29T08:59:11.840' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (122, N'4159e118-8be3-4b79-b860-cdf05334f61b', N'Bình Thuận Beach Bungalow', N'Việt Nam', N'Bình Thuận', N'Thành phố Phan Thiết', N'Phường Mũi Né', N'78 Đường Nguyễn Đình Chiểu, Mũi Né', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'12:00', 87, 0, 58, 4.7, 0, 0, CAST(N'2025-05-29T08:59:11.897' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (123, N'45759fde-89e7-4ab7-b3cc-cc5c9219bc65', N'Kon Tum Highland Retreat', N'Việt Nam', N'Kon Tum', N'Thành phố Kon Tum', N'Phường Thống Nhất', N'32 Đường Phan Đình Phùng, Kon Tum', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:30', N'11:30', 79, 0, 39, 4.4, 0, 0, CAST(N'2025-05-29T08:59:11.943' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (124, N'583a7632-df01-4491-9aff-e623c85c7907', N'Cao Bằng Borderland Lodge', N'Việt Nam', N'Cao Bằng', N'Thành phố Cao Bằng', N'Phường Hợp Giang', N'19 Đường Hoàng Đình Giong, Cao Bằng', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'11:00', 78, 0, 36, 4.3, 0, 0, CAST(N'2025-05-29T08:59:12.000' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (125, N'974b26d6-8fbf-4003-97bb-94a0945d0403', N'Tây Ninh Nui Ba Den View', N'Việt Nam', N'Tây Ninh', N'Thành phố Tây Ninh', N'Phường 3', N'42 Đường Cách Mạng Tháng 8, Tây Ninh', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'15:00', N'12:00', 82, 0, 43, 4.6, 0, 0, CAST(N'2025-05-29T08:59:12.053' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (126, N'cac660fd-268c-47be-a4a3-3a0ce953d835', N'Hòa Bình Lakeside Retreat', N'Việt Nam', N'Hòa Bình', N'Thành phố Hòa Bình', N'Phường Thịnh Lang', N'56 Đường Cù Chính Lan, Hòa Bình', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'14:00', N'11:30', 84, 0, 45, 4.7, 0, 0, CAST(N'2025-05-29T08:59:12.097' AS DateTime), NULL)
GO
INSERT [dbo].[HomeStays] ([homestayID], [ownerID], [homestayName], [country], [province], [district], [wardOrCommune], [addressDetail], [imageHomestay], [linkGoogleMap], [timeCheckIn], [timeCheckOut], [totalScore], [viewCount], [reviewCount], [averageRating], [statusHomestay], [isLocked], [createdAt], [updatedAt]) VALUES (127, N'd1291e9a-31d4-414c-bcae-ee7441682162', N'Bến Tre Coconut Garden', N'Việt Nam', N'Bến Tre', N'Thành phố Bến Tre', N'Phường 3', N'27 Đường Đồng Khởi, Bến Tre', N'/Images/20250528_215325_6882920_.webp,/Images/20250528_215325_6014787_.webp,/Images/20250528_215325_5528831_.webp,/Images/20250528_215325_292927_.webp,/Images/20250528_215325_8538331_.webp', N'https://www.google.com/maps/embed/place/Homestay+suối+Cửa+Tử/@21.6109679,105.5548724,17z/data=!4m7!3m6!1s0x3134c57c5dc7d557:0x178081ece37910d3!4b1!8m2!3d21.6109679!4d105.5574473!16s%2Fg%2F11l2y_lq0h?entry=tts&g_ep=EgoyMDI1MDUyMS4wIPu8ASoASAFQAw%3D%3D&skid=2ddb842a-9e71-4424-a1da-162d7af2bb62', N'15:00', N'12:00', 83, 0, 44, 4.6, 0, 0, CAST(N'2025-05-29T08:59:12.137' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[HomeStays] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 
GO
INSERT [dbo].[Menu] ([MenuID], [Name], [Icon], [Url], [ParentMenuID]) VALUES (25, N'Thống kê', N'fa fa-dashboard', N'/admin/dashboard-overview', NULL)
GO
INSERT [dbo].[Menu] ([MenuID], [Name], [Icon], [Url], [ParentMenuID]) VALUES (26, N'Quản lý người dùng', N'fa fa-user', N'/admin/user-manager', NULL)
GO
INSERT [dbo].[Menu] ([MenuID], [Name], [Icon], [Url], [ParentMenuID]) VALUES (27, N'Quản lý đối tác', N'fa fa-compass', N'/admin/owner-manager', NULL)
GO
INSERT [dbo].[Menu] ([MenuID], [Name], [Icon], [Url], [ParentMenuID]) VALUES (28, N'Quản lý nhân sự', N'fa fa-user-group', N'/admin/adminstrator-manager', NULL)
GO
INSERT [dbo].[Menu] ([MenuID], [Name], [Icon], [Url], [ParentMenuID]) VALUES (29, N'Quản lý chức vụ', N'fa fa-shield-alt', N'/admin/role-manager', NULL)
GO
INSERT [dbo].[Menu] ([MenuID], [Name], [Icon], [Url], [ParentMenuID]) VALUES (30, N'Đăng kí hợp tác', N'fa-solid fa-book', N'/admin/partnership-manager', NULL)
GO
INSERT [dbo].[Menu] ([MenuID], [Name], [Icon], [Url], [ParentMenuID]) VALUES (31, N'Quản lý quảng cáo', N'fa fa-video-camera', N'/admin/advertisement-manager', NULL)
GO
INSERT [dbo].[Menu] ([MenuID], [Name], [Icon], [Url], [ParentMenuID]) VALUES (32, N'Tiện nghi HomeStay', N'fa-solid fa-camera-retro', N'/admin/amenities-manager', NULL)
GO
INSERT [dbo].[Menu] ([MenuID], [Name], [Icon], [Url], [ParentMenuID]) VALUES (33, N'Danh mục bài viết', N'fa fa-book', N'/admin/category-article-manager', NULL)
GO
INSERT [dbo].[Menu] ([MenuID], [Name], [Icon], [Url], [ParentMenuID]) VALUES (34, N'Quản lý câu hỏi FAQ', N'fa fa-question-circle', N'/admin/FAQ-manager', NULL)
GO
INSERT [dbo].[Menu] ([MenuID], [Name], [Icon], [Url], [ParentMenuID]) VALUES (35, N'Quản lý bài viết', N'fa fa-file-alt', N'/admin/article-manager', NULL)
GO
INSERT [dbo].[Menu] ([MenuID], [Name], [Icon], [Url], [ParentMenuID]) VALUES (36, N'Kết toán doanh thu', N'fa fa-calculator', N'/admin/revenue-manager', NULL)
GO
INSERT [dbo].[Menu] ([MenuID], [Name], [Icon], [Url], [ParentMenuID]) VALUES (37, N'Kiểm duyệt HomeStay', N'fa fa-tasks', NULL, NULL)
GO
INSERT [dbo].[Menu] ([MenuID], [Name], [Icon], [Url], [ParentMenuID]) VALUES (38, N'Đang chờ kiểm duyệt', N'fa fa-clock', N'/admin/homestay-censor-pending', 37)
GO
INSERT [dbo].[Menu] ([MenuID], [Name], [Icon], [Url], [ParentMenuID]) VALUES (39, N'Đang hiện hành', N'fa fa-check-circle', N'/admin/homestay-censor-current', 37)
GO
INSERT [dbo].[Menu] ([MenuID], [Name], [Icon], [Url], [ParentMenuID]) VALUES (40, N'Không đạt yêu cầu', N'fa fa-times-circle', N'/admin/homestay-censor-reject', 37)
GO
INSERT [dbo].[Menu] ([MenuID], [Name], [Icon], [Url], [ParentMenuID]) VALUES (41, N'Giao dịch hệ thống', N'fa fa-exchange-alt', NULL, NULL)
GO
INSERT [dbo].[Menu] ([MenuID], [Name], [Icon], [Url], [ParentMenuID]) VALUES (42, N'Thanh toán tiền phòng', N'fa fa-money-check-alt', N'/admin/transaction-management-booking', 41)
GO
INSERT [dbo].[Menu] ([MenuID], [Name], [Icon], [Url], [ParentMenuID]) VALUES (43, N'Thanh toán tiền quảng cáo', N'fa fa-ad', N'/admin/transaction-management-advertisement', 41)
GO
INSERT [dbo].[Menu] ([MenuID], [Name], [Icon], [Url], [ParentMenuID]) VALUES (44, N'Đang bảo trì', N'fa fa-tools', N'/admin/homestay-censor-maintenance', 37)
GO
INSERT [dbo].[Menu] ([MenuID], [Name], [Icon], [Url], [ParentMenuID]) VALUES (45, N'Thiết lập Website', N'fa fa-cog', N'/admin/settings-manager', NULL)
GO
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[Messages] ON 
GO
INSERT [dbo].[Messages] ([msgID], [conversationID], [content], [idUserSend], [isView], [timestamp]) VALUES (1002, 1002, N'Xin chào', N'502ca239-9edc-4eb3-8449-f0fe25ada778', 0, CAST(N'2025-05-30T11:49:29.000' AS DateTime))
GO
INSERT [dbo].[Messages] ([msgID], [conversationID], [content], [idUserSend], [isView], [timestamp]) VALUES (1003, 1002, N'tôi cần trao đổi về phòng Homestay ', N'502ca239-9edc-4eb3-8449-f0fe25ada778', 0, CAST(N'2025-05-30T11:49:46.000' AS DateTime))
GO
INSERT [dbo].[Messages] ([msgID], [conversationID], [content], [idUserSend], [isView], [timestamp]) VALUES (1004, 1002, N'Cát Bà Manaka House ⚡ Số 423 , đường Lê Thánh Tông xóm bà Trưng bà Triệu - Tỉnh Hà Giang - Huyện Bắc Quang', N'502ca239-9edc-4eb3-8449-f0fe25ada778', 0, CAST(N'2025-05-30T11:49:55.000' AS DateTime))
GO
INSERT [dbo].[Messages] ([msgID], [conversationID], [content], [idUserSend], [isView], [timestamp]) VALUES (1005, 1003, N'Xin chào', N'd6c66368-dc56-4bff-9b58-3f9f08e152b0', 0, CAST(N'2025-06-01T10:48:26.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Messages] OFF
GO
SET IDENTITY_INSERT [dbo].[Notification] ON 
GO
INSERT [dbo].[Notification] ([Id], [UserID], [Title], [Message], [Type], [CreatedAt], [IsRead]) VALUES (1002, N'1e2d609c-1b9a-4328-ab3c-cef8fe05db0e', N'Thông báo đơn đặt phòng mới', N'Homestay có mã #7 vừa có khách hàng mới đã đặt phòng vào 30/05/2025 11:51:29', N'success', CAST(N'2025-05-30T11:51:29.877' AS DateTime), 0)
GO
INSERT [dbo].[Notification] ([Id], [UserID], [Title], [Message], [Type], [CreatedAt], [IsRead]) VALUES (1003, N'ebd26f34-092c-415d-b73e-5cbacf06175a', N'Thông báo đơn đặt phòng mới', N'Homestay có mã #48 vừa có khách hàng mới đã đặt phòng vào 30/05/2025 11:52:54', N'success', CAST(N'2025-05-30T11:52:54.673' AS DateTime), 0)
GO
INSERT [dbo].[Notification] ([Id], [UserID], [Title], [Message], [Type], [CreatedAt], [IsRead]) VALUES (1004, N'1e2d609c-1b9a-4328-ab3c-cef8fe05db0e', N'Thông báo đơn đặt phòng #1652968812 đã được thanh toán', N'Khách hàng có tên Đào Quang Huy với số điện thoại 0364174636 đã thanh toán tiền phòng ', N'success', CAST(N'2025-05-30T12:19:47.623' AS DateTime), 0)
GO
INSERT [dbo].[Notification] ([Id], [UserID], [Title], [Message], [Type], [CreatedAt], [IsRead]) VALUES (1005, N'1e2d609c-1b9a-4328-ab3c-cef8fe05db0e', N'Thông báo đơn đặt phòng mới', N'Homestay có mã #7 vừa có khách hàng mới đã đặt phòng vào 30/05/2025 14:13:11', N'success', CAST(N'2025-05-30T14:13:11.600' AS DateTime), 0)
GO
INSERT [dbo].[Notification] ([Id], [UserID], [Title], [Message], [Type], [CreatedAt], [IsRead]) VALUES (1006, N'1e2d609c-1b9a-4328-ab3c-cef8fe05db0e', N'Thông báo đơn đặt phòng mới', N'Homestay có mã #7 vừa có khách hàng mới đã đặt phòng vào 30/05/2025 15:19:31', N'success', CAST(N'2025-05-30T15:19:31.127' AS DateTime), 0)
GO
INSERT [dbo].[Notification] ([Id], [UserID], [Title], [Message], [Type], [CreatedAt], [IsRead]) VALUES (1007, N'1e2d609c-1b9a-4328-ab3c-cef8fe05db0e', N'Thông báo đơn đặt phòng mới', N'Homestay có mã #7 vừa có khách hàng mới đã đặt phòng vào 30/05/2025 15:23:29', N'success', CAST(N'2025-05-30T15:23:29.117' AS DateTime), 0)
GO
INSERT [dbo].[Notification] ([Id], [UserID], [Title], [Message], [Type], [CreatedAt], [IsRead]) VALUES (1008, N'89fceba7-32c8-4bf2-8d91-ccab31ef7d82', N'Thông báo đơn đặt phòng mới', N'Homestay có mã #6 vừa có khách hàng mới đã đặt phòng vào 01/06/2025 09:33:03', N'success', CAST(N'2025-06-01T09:33:03.527' AS DateTime), 0)
GO
INSERT [dbo].[Notification] ([Id], [UserID], [Title], [Message], [Type], [CreatedAt], [IsRead]) VALUES (1009, N'89fceba7-32c8-4bf2-8d91-ccab31ef7d82', N'Thông báo đơn đặt phòng mới', N'Homestay có mã #6 vừa có khách hàng mới đã đặt phòng vào 01/06/2025 15:26:34', N'success', CAST(N'2025-06-01T15:26:35.223' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[Notification] OFF
GO
INSERT [dbo].[OwnerStays] ([ownerID], [userID], [bannerImage], [defaultCheckinTime], [defaultCheckoutTime], [description], [nameBank], [numberBank], [defaultRules], [defaultPolicies]) VALUES (N'02d8b227-e52d-4e3f-aede-416db69cfad3', N'89fceba7-32c8-4bf2-8d91-ccab31ef7d82', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OwnerStays] ([ownerID], [userID], [bannerImage], [defaultCheckinTime], [defaultCheckoutTime], [description], [nameBank], [numberBank], [defaultRules], [defaultPolicies]) VALUES (N'247e4e0b-9587-4c2f-93d3-60e62f6b47a2', N'1e2d609c-1b9a-4328-ab3c-cef8fe05db0e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OwnerStays] ([ownerID], [userID], [bannerImage], [defaultCheckinTime], [defaultCheckoutTime], [description], [nameBank], [numberBank], [defaultRules], [defaultPolicies]) VALUES (N'4159e118-8be3-4b79-b860-cdf05334f61b', N'f011b014-e977-434e-9b7a-f835f83d2e98', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OwnerStays] ([ownerID], [userID], [bannerImage], [defaultCheckinTime], [defaultCheckoutTime], [description], [nameBank], [numberBank], [defaultRules], [defaultPolicies]) VALUES (N'45759fde-89e7-4ab7-b3cc-cc5c9219bc65', N'b29cacf9-8820-4be3-9515-89da7c990ee7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OwnerStays] ([ownerID], [userID], [bannerImage], [defaultCheckinTime], [defaultCheckoutTime], [description], [nameBank], [numberBank], [defaultRules], [defaultPolicies]) VALUES (N'583a7632-df01-4491-9aff-e623c85c7907', N'717494c1-a769-48fa-b502-483d6e8f579f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OwnerStays] ([ownerID], [userID], [bannerImage], [defaultCheckinTime], [defaultCheckoutTime], [description], [nameBank], [numberBank], [defaultRules], [defaultPolicies]) VALUES (N'974b26d6-8fbf-4003-97bb-94a0945d0403', N'c7ce3346-3e14-4ab6-9841-ece3517f4a94', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OwnerStays] ([ownerID], [userID], [bannerImage], [defaultCheckinTime], [defaultCheckoutTime], [description], [nameBank], [numberBank], [defaultRules], [defaultPolicies]) VALUES (N'cac660fd-268c-47be-a4a3-3a0ce953d835', N'9efd1f08-441f-4651-be48-2084e296532c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OwnerStays] ([ownerID], [userID], [bannerImage], [defaultCheckinTime], [defaultCheckoutTime], [description], [nameBank], [numberBank], [defaultRules], [defaultPolicies]) VALUES (N'd1291e9a-31d4-414c-bcae-ee7441682162', N'bafa7f55-8d66-45f4-83b7-e6a9e6e93a3f', NULL, N'11:00', N'10:25', N'<p><strong>Lối Về Miền Hoa </strong>là một homestay ấm cúng nằm giữa thung lũng Mai, bao quanh bởi những thửa ruộng bậc thang xanh mướt 🌾 và dãy núi Hoàng Liên Sơn hùng vĩ ⛰️.</p><p><i>Homestay</i> được thiết kế theo phong cách truyền thống của người Tày, với nhà sàn gỗ mộc mạc, mái lá cọ và nội thất thủ công tinh xảo .</p><ul><li><strong>Hoạt động nổi bật</strong>: Tham gia phiên chợ đêm Sa Pa 🎇, học dệt thổ cẩm 🧵, hoặc đốt lửa trại cùng dân bản 🔥.</li></ul><p><strong>Điểm đặc biệt</strong>: Homestay có khu vườn hoa tam giác mạch nở rộ vào tháng 10-11 🌸, là nơi lý tưởng để chụp ảnh 📸 và tận hưởng không khí trong lành 🌬️.</p><p>Chủ homestay thân thiện, luôn sẵn sàng chia sẻ câu chuyện về văn hóa bản địa 🤝, mang đến trải nghiệm gần gũi và khó quên!</p>', N'ViettinBank', N'0364174636', N'<ul><li><i><strong>Tôn trọng văn hóa địa phương</strong> 🤝</i></li><li>Giữ gìn không gian yên tĩnh, tránh làm ồn sau 22:00 🌙.<ul><li>Tôn trọng phong tục của người Tày, không mặc đồ hở hang khi tham gia hoạt động bản làng 🙏.</li></ul></li><li><i><strong>Bảo vệ môi trường</strong> 🌿</i><ul><li>Không xả rác bừa bãi, phân loại rác trước khi bỏ vào thùng 🗑️.</li><li>Hạn chế sử dụng đồ nhựa, sử dụng chai nước tái sử dụng 🥤.</li></ul></li><li><i><strong>An toàn và tiện nghi</strong> 🔥</i><ul><li>Không hút thuốc trong nhà sàn để tránh nguy cơ cháy 🚭.</li><li>Sử dụng lò sưởi hoặc bếp BBQ dưới sự hướng dẫn của nhân viên 🧑‍🔧.</li></ul></li><li><i><strong>Hoạt động chung</strong> 🎉</i><ul><li>Đăng ký trước cho các tour trekking 🥾 hoặc lớp học nấu ăn 🍲 (ít nhất 1 ngày).</li><li>Giữ gìn vệ sinh khu vực bếp chung và khu vực lửa trại sau khi sử dụng 🧹.</li></ul></li><li><i><strong>Thú cưng</strong> 🐶</i><ul><li>Thú cưng được phép lưu trú nhưng phải báo trước và giữ vệ sinh cho thú cưng 🧼.</li></ul></li></ul>', N'<ul><li><i><strong>Chính sách sử dụng dịch vụ bổ sung 🍴</strong></i><ul><li>Bữa sáng (nếu có) thường được cung cấp miễn phí hoặc tính phí riêng, phục vụ trong khung giờ cố định (thường 7:00-9:00) 🥞.</li><li>Các dịch vụ như tour khám phá 🚶‍♂️, thuê xe đạp 🚲, hoặc tổ chức BBQ 🍖 cần đặt trước ít nhất 12-24 giờ.</li><li>Một số homestay cung cấp dịch vụ đưa đón sân bay hoặc bến xe với chi phí riêng 🚌.</li></ul></li><li><strong>Chính sách bảo vệ môi trường</strong> 🌍<ul><li>Khách được khuyến khích phân loại rác 🗑️, hạn chế sử dụng đồ nhựa dùng một lần ♻️.</li><li>Không hái hoa, bẻ cây 🌸 hoặc làm hư hại cảnh quan xung quanh homestay.</li></ul></li><li><strong>Chính sách an toàn và tài sản</strong> 🛡️<ul><li>Khách chịu trách nhiệm tự bảo quản tài sản cá nhân; homestay không chịu trách nhiệm nếu xảy ra mất mát, trừ trường hợp có két an toàn 🔒.</li><li>Tuân thủ quy định an toàn khi sử dụng bếp, lò sưởi 🔥 hoặc các thiết bị điện trong homestay.</li><li>Không hút thuốc trong khu vực phòng ngủ hoặc nhà sàn để tránh nguy cơ cháy 🚭.</li></ul></li><li><strong>Chính sách tôn trọng văn hóa địa phương</strong> 🤝<ul><li>Khách được khuyến khích tôn trọng phong tục, tập quán của cộng đồng địa phương 🙏.</li><li>Giữ gìn không gian yên tĩnh, đặc biệt sau 22:00 để tránh làm phiền khách khác và dân bản 🌙.</li></ul></li><li><strong>Chính sách thanh toán</strong> 💳<ul><li>Chấp nhận thanh toán bằng tiền mặt, chuyển khoản ngân hàng hoặc ứng dụng thanh toán (Momo, ZaloPay, v.v.) 💸.</li><li>Toàn bộ chi phí phải được thanh toán trước khi trả phòng, trừ trường hợp có thỏa thuận khác.</li></ul></li></ul>')
GO
INSERT [dbo].[OwnerStays] ([ownerID], [userID], [bannerImage], [defaultCheckinTime], [defaultCheckoutTime], [description], [nameBank], [numberBank], [defaultRules], [defaultPolicies]) VALUES (N'e79e7056-62d9-4e0d-8b74-036f11c8ed00', N'ebd26f34-092c-415d-b73e-5cbacf06175a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OwnerStays] ([ownerID], [userID], [bannerImage], [defaultCheckinTime], [defaultCheckoutTime], [description], [nameBank], [numberBank], [defaultRules], [defaultPolicies]) VALUES (N'f3108004-a912-42b5-b98f-c6a42be8903f', N'cac4a853-71e5-436d-8ec6-7ac99c8390ec', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[PartnershipReg] ON 
GO
INSERT [dbo].[PartnershipReg] ([id], [customerID], [companyName], [fullName], [address], [phoneNumber], [email], [totalHomeStay], [imgPreview], [partnershipAgreement], [businessLicense], [note], [bankAccount], [status], [rejectionReason], [createdAt], [updatedAt]) VALUES (3, N'2342345345', N'Công ty trách nghiệm hữu hạn Homestay', N'Phan Thùy Dung', N'Hà Nội', N'0349575773', N'huymuahanglzd04@gmail.com', 5, N'["/Images/20250528_102904_4885463_.webp","/Images/20250528_102904_571257_.webp","/Images/20250528_102904_6232658_.webp","/Images/20250528_102904_6530113_.jpeg"]', NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2025-05-28T10:29:04.247' AS DateTime), NULL)
GO
INSERT [dbo].[PartnershipReg] ([id], [customerID], [companyName], [fullName], [address], [phoneNumber], [email], [totalHomeStay], [imgPreview], [partnershipAgreement], [businessLicense], [note], [bankAccount], [status], [rejectionReason], [createdAt], [updatedAt]) VALUES (1002, N'd6e0ffda-0a75-4aea-86ff-c0574332b636', N'Công ty trách nghiệm hữu hạn Homestay', N'Phan Thùy Dung', N'Hà Nội', N'0349575773', N'huymuahanglzd04@gmail.com', 7, N'["/Images/20250529_111613_6570655_.jpg","/Images/20250529_111613_6973170_.jpg","/Images/20250529_111613_304358_.jpg","/Images/20250529_111613_544676_.jpg"]', NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2025-05-29T11:16:13.737' AS DateTime), NULL)
GO
INSERT [dbo].[PartnershipReg] ([id], [customerID], [companyName], [fullName], [address], [phoneNumber], [email], [totalHomeStay], [imgPreview], [partnershipAgreement], [businessLicense], [note], [bankAccount], [status], [rejectionReason], [createdAt], [updatedAt]) VALUES (1003, N'fb18fd0d-75e9-422f-8dee-0f6b057cbe4d', N'Công ty trách nghiệm hữu hạn Homestay', N'Phan Thùy Dung', N'Hà Nội', N'0349575773', N'huymuahanglzd04@gmail.com', 5, N'["/Images/20250529_111650_7533504_.jpg","/Images/20250529_111650_3328873_.jpg","/Images/20250529_111650_3114283_.jpg","/Images/20250529_111650_3167238_.jpg"]', NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2025-05-29T11:16:50.153' AS DateTime), NULL)
GO
INSERT [dbo].[PartnershipReg] ([id], [customerID], [companyName], [fullName], [address], [phoneNumber], [email], [totalHomeStay], [imgPreview], [partnershipAgreement], [businessLicense], [note], [bankAccount], [status], [rejectionReason], [createdAt], [updatedAt]) VALUES (1004, N'7615923b-6cb9-4e40-8e93-54df898ec262', N'Công ty trách nghiệm hữu hạn Homestay', N'Phan Thùy Dung', N'Hà Nội', N'0349575773', N'huymuahanglzd04@gmail.com', 7, N'["/Images/20250529_111735_6824892_.jpg","/Images/20250529_111735_873996_.jpg","/Images/20250529_111735_2619598_.jpg","/Images/20250529_111735_8618248_.jpg"]', NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2025-05-29T11:17:35.640' AS DateTime), NULL)
GO
INSERT [dbo].[PartnershipReg] ([id], [customerID], [companyName], [fullName], [address], [phoneNumber], [email], [totalHomeStay], [imgPreview], [partnershipAgreement], [businessLicense], [note], [bankAccount], [status], [rejectionReason], [createdAt], [updatedAt]) VALUES (1005, N'861c81fc-b227-49ae-af08-c6ef21586997', N'Công ty trách nghiệm hữu hạn Homestay', N'Phan Thùy Dung', N'Hà Nội', N'0349575773', N'huymuahanglzd04@gmail.com', 7, N'["/Images/20250529_111811_7170280_.jpg","/Images/20250529_111811_7271198_.jpg","/Images/20250529_111811_8048463_.jpg","/Images/20250529_111811_5034188_.jpg"]', NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2025-05-29T11:18:11.123' AS DateTime), NULL)
GO
INSERT [dbo].[PartnershipReg] ([id], [customerID], [companyName], [fullName], [address], [phoneNumber], [email], [totalHomeStay], [imgPreview], [partnershipAgreement], [businessLicense], [note], [bankAccount], [status], [rejectionReason], [createdAt], [updatedAt]) VALUES (1006, N'cf8361f3-b52c-4c7a-a6a2-b54b71da32e6', N'Vũ Đình Côn', N'Đào Quang Huy', N'Hưng Yên', N'0364174636', N'duongdatx2004@gmail.com', 4, N'["/Images/20250529_111848_6470558_.jpg","/Images/20250529_111848_1387446_.jpg","/Images/20250529_111848_5670559_.jpg","/Images/20250529_111848_6285493_.jpg"]', NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2025-05-29T11:18:48.693' AS DateTime), NULL)
GO
INSERT [dbo].[PartnershipReg] ([id], [customerID], [companyName], [fullName], [address], [phoneNumber], [email], [totalHomeStay], [imgPreview], [partnershipAgreement], [businessLicense], [note], [bankAccount], [status], [rejectionReason], [createdAt], [updatedAt]) VALUES (1007, N'd1c1cc53-6a43-4f3c-8c4e-057d3a11e3ae', N'Công ty trách nghiệm hữu hạn Homestay', N'Phan Thùy Dung', N'Hà Nội', N'0349575773', N'huymuahanglzd04@gmail.com', 8, N'["/Images/20250529_111921_1294368_.jpg","/Images/20250529_111921_351512_.jpg","/Images/20250529_111921_5166101_.jpg","/Images/20250529_111921_7017574_.jpg"]', NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2025-05-29T11:19:21.830' AS DateTime), NULL)
GO
INSERT [dbo].[PartnershipReg] ([id], [customerID], [companyName], [fullName], [address], [phoneNumber], [email], [totalHomeStay], [imgPreview], [partnershipAgreement], [businessLicense], [note], [bankAccount], [status], [rejectionReason], [createdAt], [updatedAt]) VALUES (1008, N'cb39bc39-ecd8-4f66-9e61-361ce45d41cf', N'Công ty trách nghiệm hữu hạn Homestay', N'Phan Thùy Dung', N'Hà Nội', N'0349575773', N'huymuahanglzd04@gmail.com', 66, N'["/Images/20250529_112024_9549461_.jpg","/Images/20250529_112024_2252059_.jpg","/Images/20250529_112024_6624119_.jpg","/Images/20250529_112025_105262_.jpg"]', NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2025-05-29T11:20:25.020' AS DateTime), NULL)
GO
INSERT [dbo].[PartnershipReg] ([id], [customerID], [companyName], [fullName], [address], [phoneNumber], [email], [totalHomeStay], [imgPreview], [partnershipAgreement], [businessLicense], [note], [bankAccount], [status], [rejectionReason], [createdAt], [updatedAt]) VALUES (1009, N'ba393c58-e0c9-40a1-891b-59d14e754825', N'Công ty trách nghiệm hữu hạn Homestay', N'Phan Thùy Dung', N'Hà Nội', N'0349575773', N'huymuahanglzd04@gmail.com', 66, N'["/Images/20250529_112120_2482267_.jpg","/Images/20250529_112120_4848218_.jpg","/Images/20250529_112120_4140988_.jpg","/Images/20250529_112120_8333174_.jpg"]', NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2025-05-29T11:21:20.840' AS DateTime), NULL)
GO
INSERT [dbo].[PartnershipReg] ([id], [customerID], [companyName], [fullName], [address], [phoneNumber], [email], [totalHomeStay], [imgPreview], [partnershipAgreement], [businessLicense], [note], [bankAccount], [status], [rejectionReason], [createdAt], [updatedAt]) VALUES (1010, N'21007c6f-1c1d-43ad-9dec-2a1387ecfb9e', N'Công ty trách nghiệm hữu hạn Homestay', N'Hoàng Ngọc Mụn', N'Hà Nội', N'0349575773', N'huymuahanglzd04@gmail.com', 13, N'["/Images/20250529_112319_8718284_.jpg","/Images/20250529_112319_2369702_.jpg","/Images/20250529_112319_4917563_.jpg","/Images/20250529_112319_7634238_.jpg"]', NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2025-05-29T11:23:19.160' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[PartnershipReg] OFF
GO
SET IDENTITY_INSERT [dbo].[Payments] ON 
GO
INSERT [dbo].[Payments] ([paymentID], [bookingID], [ownerID], [cusID], [paymentType], [amount], [paymentStatus], [paymentMethod], [paymentDate], [notePayment], [advertisementID], [userID]) VALUES (1002, NULL, N'd1291e9a-31d4-414c-bcae-ee7441682162', NULL, 1, 588000, 1, N'Thanh toán qua Momo', CAST(N'2025-05-29T14:50:29.940' AS DateTime), N'Thanh toán tiền quảng cáo cho mã #7', 7, N'bafa7f55-8d66-45f4-83b7-e6a9e6e93a3f')
GO
INSERT [dbo].[Payments] ([paymentID], [bookingID], [ownerID], [cusID], [paymentType], [amount], [paymentStatus], [paymentMethod], [paymentDate], [notePayment], [advertisementID], [userID]) VALUES (1003, NULL, N'd1291e9a-31d4-414c-bcae-ee7441682162', NULL, 1, 588000, 1, N'Thanh toán qua Momo', CAST(N'2025-05-29T14:51:58.597' AS DateTime), N'Thanh toán tiền quảng cáo cho mã #7', 7, N'bafa7f55-8d66-45f4-83b7-e6a9e6e93a3f')
GO
INSERT [dbo].[Payments] ([paymentID], [bookingID], [ownerID], [cusID], [paymentType], [amount], [paymentStatus], [paymentMethod], [paymentDate], [notePayment], [advertisementID], [userID]) VALUES (1004, NULL, N'd1291e9a-31d4-414c-bcae-ee7441682162', NULL, 1, 2520000, 1, N'Thanh toán qua Momo', CAST(N'2025-05-29T14:53:39.890' AS DateTime), N'Thanh toán tiền quảng cáo cho mã #6', 6, N'bafa7f55-8d66-45f4-83b7-e6a9e6e93a3f')
GO
INSERT [dbo].[Payments] ([paymentID], [bookingID], [ownerID], [cusID], [paymentType], [amount], [paymentStatus], [paymentMethod], [paymentDate], [notePayment], [advertisementID], [userID]) VALUES (1005, 1652968812, NULL, N'0ee4b802-58c7-44f9-ba9b-2b6995551e3b', 1, 10300000, 1, N'Thanh toán qua Momo', CAST(N'2025-05-30T12:19:47.573' AS DateTime), N'Thanh toán tiền phòng cho Booking #1652968812', NULL, N'502ca239-9edc-4eb3-8449-f0fe25ada778')
GO
SET IDENTITY_INSERT [dbo].[Payments] OFF
GO
INSERT [dbo].[ReviewAndRatings] ([reviewID], [cusID], [homestayID], [rating], [comment], [reviewDate], [bookingID]) VALUES (973378104, N'0ee4b802-58c7-44f9-ba9b-2b6995551e3b', 7, 5, N'Homestay này tuyệt vời đấy', CAST(N'2025-05-30' AS Date), 1652968812)
GO
INSERT [dbo].[Roles] ([roleID], [nameRole], [permission]) VALUES (N'ed204707-f559-4d7c-85ab-feb3d22af9a4', N'Quản trị viên', N'[25,26,27,28,29,30,31,32,33,34,35,36,42,43,41,40,39,38,37,44,45]')
GO
SET IDENTITY_INSERT [dbo].[Rooms] ON 
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (12, 6, N'Phòng VIP 201', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 2150000, 3800000, 290000, 390000, 90000, N'Homestay có khu vườn hoa tam giác mạch nở rộ vào tháng 10-11 🌸, là nơi lý tưởng để chụp ảnh 📸 và tận hưởng không khí trong lành 🌬️.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_220647_5150638_.webp,/Images/20250528_220647_6036300_.webp,/Images/20250528_220647_9661108_.webp,/Images/20250528_220647_5145241_.webp,/Images/20250528_220647_5250953_.webp', 1, CAST(N'2025-05-28T18:30:10.110' AS DateTime), CAST(N'2025-05-28T22:07:47.703' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (13, 7, N'Phòng VIP 201', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 2800000, 3750000, 250000, 440000, 180000, N'Phòng có khu vườn hoa tam giác mạch nở rộ vào tháng 10-11 🌸, là nơi lý tưởng để chụp ảnh 📸 và tận hưởng không khí trong lành 🌬️.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_220409_9826384_.webp,/Images/20250528_220409_7202000_.webp,/Images/20250528_220409_5465546_.webp,/Images/20250528_220409_2520320_.webp,/Images/20250528_220409_8446883_.jpg', 1, CAST(N'2025-05-28T18:55:06.813' AS DateTime), CAST(N'2025-05-28T22:08:07.230' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (14, 8, N'Phòng VIP Hải Tú', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 2750000, 1000000, 260000, 300000, 80000, N'Homestay có khu vườn hoa tam giác mạch nở rộ vào tháng 10-11 🌸, là nơi lý tưởng để chụp ảnh 📸 và tận hưởng không khí trong lành 🌬️.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_220213_8760652_.webp,/Images/20250528_220213_4531366_.webp,/Images/20250528_220213_1769013_.webp,/Images/20250528_220213_3662266_.webp,/Images/20250528_220213_7532573_.jpg', 1, CAST(N'2025-05-28T22:02:14.457' AS DateTime), CAST(N'2025-05-28T22:02:14.457' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (15, 9, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 3050000, 2600000, 100000, 460000, 90000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-28T22:13:08.277' AS DateTime), CAST(N'2025-05-28T22:13:08.277' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (16, 10, N'Phòng Núi Mây', N'Phòng đôi', 80, 2, 2, 1, 1, 1, 1000000, 3900000, 120000, 310000, 70000, N'Phòng với view ruộng bậc thang, được trang trí bằng các họa tiết thổ cẩm truyền thống.', 1, 1, 0, 0, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-28T22:13:08.453' AS DateTime), CAST(N'2025-05-28T22:13:08.453' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (17, 11, N'Phòng Đèn Lồng', N'Phòng đôi', 60, 2, 1, 1, 1, 1, 3000000, 1800000, 130000, 170000, 120000, N'Phòng được trang trí với đèn lồng Hội An truyền thống, cửa sổ gỗ nhìn ra sân trong xinh đẹp.', 0, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-28T22:13:08.460' AS DateTime), CAST(N'2025-05-28T22:13:08.460' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (18, 12, N'Phòng Dừa Xanh', N'Phòng gia đình', 90, 4, 2, 2, 2, 2, 3250000, 3750000, 150000, 340000, 200000, N'Phòng với view sông, được trang trí bằng các vật liệu tự nhiên như tre, dừa và lá dừa nước.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-28T22:13:08.470' AS DateTime), CAST(N'2025-05-28T22:13:08.470' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (19, 13, N'Phòng Mimosa', N'Phòng đôi', 70, 2, 1, 1, 1, 1, 1450000, 1550000, 120000, 400000, 60000, N'Phòng với ban công riêng nhìn ra vườn hoa, được trang trí với tông màu pastel nhẹ nhàng đặc trưng Đà Lạt.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-28T22:13:08.480' AS DateTime), CAST(N'2025-05-28T22:13:08.480' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (20, 14, N'Phòng Trăng Rằm', N'Phòng đôi', 45, 2, 1, 1, 1, 1, 2200000, 2300000, 200000, 460000, 60000, N'Phòng với nội thất gỗ truyền thống, cửa sổ nhìn ra sân trong với giếng trời và cây cảnh.', 0, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-28T22:13:08.490' AS DateTime), CAST(N'2025-05-28T22:13:08.490' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (21, 15, N'Phòng Sóng Biển', N'Phòng gia đình', 85, 4, 2, 2, 2, 2, 1100000, 2400000, 200000, 190000, 130000, N'Phòng rộng rãi với ban công lớn nhìn thẳng ra biển, trang trí với tông màu xanh biển và trắng.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-28T22:13:08.503' AS DateTime), CAST(N'2025-05-28T22:13:08.503' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (22, 16, N'Phòng Núi Đá', N'Phòng đôi', 55, 2, 1, 1, 1, 1, 3600000, 3900000, 100000, 190000, 120000, N'Phòng với tường đá tự nhiên, cửa sổ lớn nhìn ra cánh đồng lúa và dãy núi đá vôi.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-28T22:13:08.513' AS DateTime), CAST(N'2025-05-28T22:13:08.513' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (23, 17, N'Phòng Đồi Chè', N'Phòng đôi', 60, 2, 2, 1, 1, 1, 3850000, 3650000, 180000, 220000, 110000, N'Phòng với ban công nhìn ra đồi chè xanh mướt, được trang trí với các họa tiết thổ cẩm của người Thái.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-28T22:13:08.523' AS DateTime), CAST(N'2025-05-28T22:13:08.523' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (24, 19, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 2800000, 1500000, 220000, 440000, 160000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-28T22:57:18.470' AS DateTime), CAST(N'2025-05-28T22:57:18.470' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (25, 22, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 1300000, 1700000, 130000, 250000, 110000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-28T23:06:18.143' AS DateTime), CAST(N'2025-05-28T23:06:18.143' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (26, 24, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 2150000, 3300000, 140000, 230000, 110000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-28T23:10:32.657' AS DateTime), CAST(N'2025-05-28T23:10:32.657' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (27, 25, N'Phòng Mây Núi', N'Phòng đôi', 35, 2, 1, 1, 1, 1, 1700000, 1250000, 220000, 470000, 60000, N'Phòng với view núi tuyệt đẹp, được trang trí theo phong cách dân tộc H''Mông.', 1, 0, 0, 0, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-28T23:10:33.503' AS DateTime), CAST(N'2025-05-28T23:10:33.503' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (28, 26, N'Phòng Đèn Lồng', N'Phòng đôi', 40, 2, 2, 1, 1, 1, 2950000, 1900000, 100000, 320000, 160000, N'Phòng view sông Thu Bồn, trang trí với đèn lồng Hội An truyền thống và nội thất gỗ tự nhiên.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-28T23:10:33.873' AS DateTime), CAST(N'2025-05-28T23:10:33.873' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (29, 27, N'Phòng Dừa Xanh', N'Phòng đôi', 30, 2, 2, 1, 1, 1, 1000000, 3450000, 130000, 180000, 160000, N'Phòng nhìn ra vườn dừa và sông nước, được làm từ tre và lá dừa theo kiến trúc nhà sàn truyền thống.', 1, 0, 1, 0, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-28T23:10:34.870' AS DateTime), CAST(N'2025-05-28T23:10:34.870' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (30, 28, N'Phòng Hoa Hồng', N'Phòng đôi', 45, 2, 1, 1, 1, 1, 2700000, 1850000, 210000, 360000, 190000, N'Phòng view rừng thông, trang trí với hoa hồng Đà Lạt tươi và lò sưởi ấm cúng.', 1, 1, 0, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-28T23:10:36.893' AS DateTime), CAST(N'2025-05-28T23:10:36.893' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (31, 29, N'Phòng Đèn Lồng', N'Phòng đôi', 35, 2, 1, 1, 1, 1, 1800000, 2100000, 220000, 190000, 100000, N'Phòng với kiến trúc gỗ truyền thống, trang trí bằng đèn lồng Hội An và có ban công nhìn ra phố cổ.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-28T23:10:38.207' AS DateTime), CAST(N'2025-05-28T23:10:38.207' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (32, 30, N'Phòng Sóng Biển', N'Phòng gia đình', 60, 4, 2, 2, 2, 2, 2950000, 2200000, 190000, 210000, 90000, N'Phòng rộng rãi với ban công hướng biển, trang trí theo phong cách hải dương với tông màu xanh biển.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-28T23:10:40.043' AS DateTime), CAST(N'2025-05-28T23:10:40.043' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (33, 31, N'Phòng Núi Đá', N'Phòng đôi', 40, 2, 1, 1, 1, 1, 3700000, 3200000, 290000, 440000, 200000, N'Phòng với view núi đá vôi, được trang trí bằng đồ thủ công mỹ nghệ địa phương và có ban công riêng.', 1, 1, 1, 0, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-28T23:10:41.100' AS DateTime), CAST(N'2025-05-28T23:10:41.100' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (34, 32, N'Phòng Đèn Lồng', N'Phòng đôi', 35, 2, 1, 1, 1, 1, 3800000, 2800000, 140000, 420000, 180000, N'Phòng với kiến trúc gỗ truyền thống, trang trí bằng đèn lồng Hội An và có ban công nhìn ra phố cổ.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-28T23:10:42.077' AS DateTime), CAST(N'2025-05-28T23:10:42.077' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (35, 33, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 3400000, 1100000, 250000, 210000, 160000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-28T23:42:29.187' AS DateTime), CAST(N'2025-05-28T23:42:29.187' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (36, 34, N'Phòng Mây Núi', N'Phòng đôi', 25, 2, 1, 1, 1, 1, 2350000, 2350000, 190000, 280000, 120000, N'Phòng với view núi tuyệt đẹp, được trang trí theo phong cách dân tộc H''Mông.', 1, 1, 0, 0, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp', 1, CAST(N'2025-05-28T23:42:29.213' AS DateTime), CAST(N'2025-05-28T23:42:29.213' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (37, 35, N'Phòng Hoa Sen', N'Phòng gia đình', 45, 4, 2, 1, 2, 2, 1600000, 2600000, 110000, 440000, 150000, N'Phòng rộng rãi với ban công nhìn ra sông Thu Bồn, được trang trí với nội thất gỗ truyền thống.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp', 1, CAST(N'2025-05-28T23:42:29.223' AS DateTime), CAST(N'2025-05-28T23:42:29.223' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (38, 36, N'Nhà Sàn Dừa Nước', N'Nhà sàn', 35, 3, 2, 1, 1, 2, 2000000, 3300000, 260000, 250000, 80000, N'Nhà sàn truyền thống được xây dựng từ gỗ và lá dừa, nằm bên cạnh kênh rạch, mang đến trải nghiệm sống đậm chất miền Tây.', 1, 0, 0, 0, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp', 1, CAST(N'2025-05-28T23:42:29.237' AS DateTime), CAST(N'2025-05-28T23:42:29.237' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (39, 37, N'Phòng Đèn Lồng', N'Phòng đôi', 28, 2, 1, 1, 1, 1, 2250000, 2700000, 220000, 320000, 160000, N'Phòng với nội thất gỗ cổ, đèn lồng truyền thống và cửa sổ nhìn ra phố cổ Hội An.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp', 1, CAST(N'2025-05-28T23:42:29.243' AS DateTime), CAST(N'2025-05-28T23:42:29.243' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (40, 38, N'Phòng Mây Núi', N'Phòng gia đình', 32, 4, 2, 1, 1, 2, 2850000, 1800000, 110000, 320000, 60000, N'Phòng gỗ truyền thống với cửa sổ panorama nhìn ra thung lũng Mường Hoa và ruộng bậc thang.', 1, 0, 0, 0, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp', 1, CAST(N'2025-05-28T23:42:29.250' AS DateTime), CAST(N'2025-05-28T23:42:29.250' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (41, 39, N'Phòng Sóng Biển', N'Bungalow', 40, 2, 2, 1, 1, 1, 1700000, 3300000, 200000, 420000, 150000, N'Bungalow riêng biệt với ban công hướng biển, chỉ cách bờ biển 20m, trang bị đầy đủ tiện nghi hiện đại.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp', 1, CAST(N'2025-05-28T23:42:29.260' AS DateTime), CAST(N'2025-05-28T23:42:29.260' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (42, 40, N'Phòng Thông Reo', N'Phòng đôi', 30, 2, 1, 1, 1, 1, 1200000, 3150000, 250000, 400000, 100000, N'Phòng với cửa sổ kính lớn nhìn ra rừng thông, lò sưởi giả và ban công riêng để thưởng thức không khí trong lành của Đà Lạt.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp', 1, CAST(N'2025-05-28T23:42:29.273' AS DateTime), CAST(N'2025-05-28T23:42:29.273' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (43, 41, N'Phòng Đá Tai Mèo', N'Nhà đá truyền thống', 25, 2, 1, 1, 1, 1, 2350000, 3500000, 150000, 370000, 190000, N'Phòng trong nhà đá truyền thống của người H''Mông với cửa sổ nhìn ra thung lũng và dãy núi đá vôi.', 1, 0, 0, 0, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp', 1, CAST(N'2025-05-28T23:42:29.287' AS DateTime), CAST(N'2025-05-28T23:42:29.287' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (44, 42, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 3050000, 2050000, 110000, 450000, 100000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:06.977' AS DateTime), CAST(N'2025-05-29T08:59:06.977' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (45, 43, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 1850000, 3700000, 140000, 460000, 150000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:07.127' AS DateTime), CAST(N'2025-05-29T08:59:07.127' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (46, 44, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 1600000, 1550000, 220000, 480000, 130000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:07.147' AS DateTime), CAST(N'2025-05-29T08:59:07.147' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (47, 45, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 1650000, 2250000, 140000, 360000, 170000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:07.167' AS DateTime), CAST(N'2025-05-29T08:59:07.167' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (48, 46, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 1200000, 1950000, 110000, 290000, 90000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:07.183' AS DateTime), CAST(N'2025-05-29T08:59:07.183' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (49, 47, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 2150000, 2300000, 130000, 310000, 90000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:07.200' AS DateTime), CAST(N'2025-05-29T08:59:07.200' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (50, 48, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 1000000, 3650000, 110000, 440000, 50000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:07.220' AS DateTime), CAST(N'2025-05-29T08:59:07.220' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (51, 49, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 3350000, 2400000, 280000, 450000, 140000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:07.267' AS DateTime), CAST(N'2025-05-29T08:59:07.267' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (52, 50, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 1050000, 1500000, 110000, 150000, 170000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:07.310' AS DateTime), CAST(N'2025-05-29T08:59:07.310' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (53, 51, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 2650000, 1350000, 220000, 330000, 60000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:07.507' AS DateTime), CAST(N'2025-05-29T08:59:07.507' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (54, 52, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 3050000, 1850000, 180000, 410000, 170000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:07.583' AS DateTime), CAST(N'2025-05-29T08:59:07.583' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (55, 53, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 1550000, 1250000, 230000, 300000, 120000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:07.643' AS DateTime), CAST(N'2025-05-29T08:59:07.643' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (56, 54, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 1050000, 3800000, 150000, 330000, 140000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:07.710' AS DateTime), CAST(N'2025-05-29T08:59:07.710' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (57, 55, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 1900000, 1750000, 230000, 280000, 160000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:07.777' AS DateTime), CAST(N'2025-05-29T08:59:07.777' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (58, 56, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 2750000, 1700000, 190000, 440000, 80000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:07.830' AS DateTime), CAST(N'2025-05-29T08:59:07.830' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (59, 57, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 2150000, 2250000, 220000, 310000, 90000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:07.910' AS DateTime), CAST(N'2025-05-29T08:59:07.910' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (60, 58, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 2350000, 3500000, 280000, 250000, 70000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:07.977' AS DateTime), CAST(N'2025-05-29T08:59:07.977' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (61, 59, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 3600000, 2750000, 260000, 300000, 140000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:08.050' AS DateTime), CAST(N'2025-05-29T08:59:08.050' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (62, 60, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 1900000, 1450000, 260000, 280000, 120000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:08.110' AS DateTime), CAST(N'2025-05-29T08:59:08.110' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (63, 61, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 2450000, 3100000, 210000, 240000, 160000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:08.167' AS DateTime), CAST(N'2025-05-29T08:59:08.167' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (64, 62, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 3750000, 1100000, 280000, 380000, 80000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:08.233' AS DateTime), CAST(N'2025-05-29T08:59:08.233' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (65, 63, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 3550000, 3950000, 290000, 460000, 90000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:08.370' AS DateTime), CAST(N'2025-05-29T08:59:08.370' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (66, 64, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 1300000, 1150000, 140000, 260000, 100000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:08.497' AS DateTime), CAST(N'2025-05-29T08:59:08.497' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (67, 65, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 3500000, 3850000, 300000, 400000, 50000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:08.550' AS DateTime), CAST(N'2025-05-29T08:59:08.550' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (68, 66, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 1200000, 1850000, 200000, 420000, 90000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:08.603' AS DateTime), CAST(N'2025-05-29T08:59:08.603' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (69, 67, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 1150000, 1750000, 290000, 150000, 70000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:08.650' AS DateTime), CAST(N'2025-05-29T08:59:08.650' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (70, 68, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 3800000, 1550000, 120000, 490000, 150000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:08.733' AS DateTime), CAST(N'2025-05-29T08:59:08.733' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (71, 69, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 2300000, 2700000, 120000, 360000, 120000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:08.787' AS DateTime), CAST(N'2025-05-29T08:59:08.787' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (72, 70, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 2700000, 1700000, 170000, 260000, 150000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:08.857' AS DateTime), CAST(N'2025-05-29T08:59:08.857' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (73, 71, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 3650000, 1450000, 150000, 360000, 120000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:08.920' AS DateTime), CAST(N'2025-05-29T08:59:08.920' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (74, 72, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 2000000, 1400000, 160000, 280000, 160000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:09.010' AS DateTime), CAST(N'2025-05-29T08:59:09.010' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (75, 73, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 3800000, 2200000, 240000, 340000, 70000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:09.077' AS DateTime), CAST(N'2025-05-29T08:59:09.077' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (76, 74, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 1400000, 3900000, 210000, 460000, 120000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:09.130' AS DateTime), CAST(N'2025-05-29T08:59:09.130' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (77, 75, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 3900000, 2200000, 220000, 420000, 120000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:09.187' AS DateTime), CAST(N'2025-05-29T08:59:09.187' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (78, 76, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 3750000, 3950000, 240000, 280000, 140000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:09.243' AS DateTime), CAST(N'2025-05-29T08:59:09.243' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (79, 77, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 1450000, 4000000, 100000, 500000, 200000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:09.293' AS DateTime), CAST(N'2025-05-29T08:59:09.293' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (80, 78, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 2650000, 1900000, 150000, 180000, 70000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:09.353' AS DateTime), CAST(N'2025-05-29T08:59:09.353' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (81, 79, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 1250000, 3250000, 290000, 480000, 70000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:09.403' AS DateTime), CAST(N'2025-05-29T08:59:09.403' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (82, 80, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 2650000, 2250000, 140000, 420000, 190000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:09.453' AS DateTime), CAST(N'2025-05-29T08:59:09.453' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (83, 81, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 2450000, 1350000, 180000, 230000, 180000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:09.503' AS DateTime), CAST(N'2025-05-29T08:59:09.503' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (84, 82, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 3300000, 3600000, 130000, 410000, 180000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:09.553' AS DateTime), CAST(N'2025-05-29T08:59:09.553' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (85, 83, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 3600000, 1450000, 170000, 210000, 130000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:09.610' AS DateTime), CAST(N'2025-05-29T08:59:09.610' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (86, 84, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 2350000, 3350000, 190000, 460000, 60000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:09.660' AS DateTime), CAST(N'2025-05-29T08:59:09.660' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (87, 85, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 2650000, 2800000, 230000, 250000, 60000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:09.740' AS DateTime), CAST(N'2025-05-29T08:59:09.740' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (88, 86, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 2250000, 3850000, 150000, 240000, 70000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:09.787' AS DateTime), CAST(N'2025-05-29T08:59:09.787' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (89, 87, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 3700000, 2150000, 220000, 500000, 60000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:09.833' AS DateTime), CAST(N'2025-05-29T08:59:09.833' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (90, 88, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 3450000, 2600000, 290000, 400000, 120000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:09.870' AS DateTime), CAST(N'2025-05-29T08:59:09.870' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (91, 89, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 1350000, 3900000, 130000, 390000, 180000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:09.910' AS DateTime), CAST(N'2025-05-29T08:59:09.910' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (92, 90, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 1150000, 1650000, 290000, 170000, 70000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:09.953' AS DateTime), CAST(N'2025-05-29T08:59:09.953' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (93, 91, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 2000000, 2650000, 150000, 160000, 60000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:10.000' AS DateTime), CAST(N'2025-05-29T08:59:10.000' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (94, 92, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 2450000, 2300000, 280000, 250000, 160000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:10.070' AS DateTime), CAST(N'2025-05-29T08:59:10.070' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (95, 93, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 3350000, 2350000, 150000, 490000, 130000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:10.143' AS DateTime), CAST(N'2025-05-29T08:59:10.143' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (96, 94, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 2050000, 3150000, 120000, 460000, 120000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:10.233' AS DateTime), CAST(N'2025-05-29T08:59:10.233' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (97, 95, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 3100000, 3400000, 260000, 270000, 150000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:10.293' AS DateTime), CAST(N'2025-05-29T08:59:10.293' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (98, 96, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 3900000, 1150000, 190000, 150000, 90000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:10.353' AS DateTime), CAST(N'2025-05-29T08:59:10.353' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (99, 97, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 2850000, 2700000, 170000, 350000, 80000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:10.407' AS DateTime), CAST(N'2025-05-29T08:59:10.407' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (100, 98, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 2200000, 1800000, 250000, 260000, 120000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:10.463' AS DateTime), CAST(N'2025-05-29T08:59:10.463' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (101, 99, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 3400000, 1050000, 190000, 170000, 200000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:10.513' AS DateTime), CAST(N'2025-05-29T08:59:10.513' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (102, 100, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 2450000, 2850000, 160000, 370000, 110000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:10.567' AS DateTime), CAST(N'2025-05-29T08:59:10.567' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (103, 101, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 2100000, 2800000, 250000, 230000, 140000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:10.620' AS DateTime), CAST(N'2025-05-29T08:59:10.620' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (104, 102, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 3650000, 2150000, 280000, 240000, 160000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:10.673' AS DateTime), CAST(N'2025-05-29T08:59:10.673' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (105, 103, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 3250000, 1300000, 140000, 460000, 130000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:10.730' AS DateTime), CAST(N'2025-05-29T08:59:10.730' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (106, 104, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 3750000, 1400000, 130000, 340000, 110000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:10.783' AS DateTime), CAST(N'2025-05-29T08:59:10.783' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (107, 105, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 2150000, 1500000, 190000, 180000, 150000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:10.840' AS DateTime), CAST(N'2025-05-29T08:59:10.840' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (108, 106, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 1600000, 1150000, 300000, 440000, 140000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:10.893' AS DateTime), CAST(N'2025-05-29T08:59:10.893' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (109, 107, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 1800000, 2550000, 130000, 390000, 140000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:11.033' AS DateTime), CAST(N'2025-05-29T09:33:01.667' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (110, 108, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 3000000, 1850000, 190000, 480000, 50000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:11.070' AS DateTime), CAST(N'2025-05-29T08:59:11.070' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (111, 109, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 3850000, 2450000, 190000, 460000, 110000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:11.123' AS DateTime), CAST(N'2025-05-29T08:59:11.123' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (112, 110, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 2850000, 3000000, 140000, 280000, 120000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:11.167' AS DateTime), CAST(N'2025-05-29T08:59:11.167' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (113, 111, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 2200000, 1200000, 180000, 400000, 150000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:11.223' AS DateTime), CAST(N'2025-05-29T08:59:11.223' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (114, 112, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 1000000, 2050000, 190000, 190000, 60000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:11.300' AS DateTime), CAST(N'2025-05-29T08:59:11.300' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (115, 113, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 2100000, 2350000, 200000, 300000, 180000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:11.380' AS DateTime), CAST(N'2025-05-29T08:59:11.380' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (116, 114, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 1600000, 2350000, 230000, 260000, 200000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:11.433' AS DateTime), CAST(N'2025-05-29T08:59:11.433' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (117, 115, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 3950000, 2500000, 280000, 150000, 130000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:11.493' AS DateTime), CAST(N'2025-05-29T08:59:11.493' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (118, 116, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 1700000, 3050000, 140000, 440000, 110000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:11.550' AS DateTime), CAST(N'2025-05-29T08:59:11.550' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (119, 117, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 2650000, 2600000, 150000, 330000, 100000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:11.607' AS DateTime), CAST(N'2025-05-29T08:59:11.607' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (120, 118, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 1500000, 1700000, 140000, 310000, 50000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:11.667' AS DateTime), CAST(N'2025-05-29T08:59:11.667' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (121, 119, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 3800000, 2100000, 100000, 250000, 60000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:11.750' AS DateTime), CAST(N'2025-05-29T08:59:11.750' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (122, 120, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 2600000, 2750000, 180000, 380000, 140000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:11.810' AS DateTime), CAST(N'2025-05-29T08:59:11.810' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (123, 121, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 1200000, 1450000, 250000, 470000, 60000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:11.867' AS DateTime), CAST(N'2025-05-29T08:59:11.867' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (124, 122, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 2350000, 3550000, 180000, 380000, 60000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:11.917' AS DateTime), CAST(N'2025-05-29T08:59:11.917' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (125, 123, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 2450000, 3750000, 150000, 340000, 80000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:11.967' AS DateTime), CAST(N'2025-05-29T08:59:11.967' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (126, 124, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 3100000, 1850000, 170000, 180000, 70000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:12.027' AS DateTime), CAST(N'2025-05-29T08:59:12.027' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (127, 125, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 1200000, 2200000, 190000, 350000, 80000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:12.070' AS DateTime), CAST(N'2025-05-29T08:59:12.070' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (128, 126, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 1550000, 1500000, 290000, 180000, 190000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:12.117' AS DateTime), CAST(N'2025-05-29T08:59:12.117' AS DateTime))
GO
INSERT [dbo].[Rooms] ([roomId], [homestayId], [roomName], [roomType], [roomSize], [maxAdults], [maxChildren], [maxBaby], [bathroomCount], [bedCount], [pricePerNight], [priceFromSecondNight], [extraFeePerChild], [extraFeePerAdult], [extraFeePerBaby], [description], [hasBalcony], [hasTv], [hasAirConditioner], [hasRefrigerator], [hasWifi], [hasHotWater], [roomImage], [status], [createdAt], [updatedAt]) VALUES (129, 127, N'Phòng Biển Xanh', N'Phòng gia đình', 120, 6, 4, 4, 3, 4, 2400000, 3550000, 170000, 160000, 160000, N'Phòng với view biển tuyệt đẹp, không gian rộng rãi và đầy đủ tiện nghi cho gia đình.', 1, 1, 1, 1, 1, 1, N'/Images/20250528_215326_1262115_.webp,/Images/20250528_215326_7207638_.webp,/Images/20250528_215326_5519706_.webp,/Images/20250528_215326_2133920_.webp,/Images/20250528_215326_1077482_.webp,/Images/20250528_215326_707205_.jpg', 1, CAST(N'2025-05-29T08:59:12.150' AS DateTime), CAST(N'2025-05-29T08:59:12.150' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Rooms] OFF
GO
SET IDENTITY_INSERT [dbo].[Settings] ON 
GO
INSERT [dbo].[Settings] ([Id], [Key], [Value], [ValueType], [Description], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (1, N'nameCompany', N'Công ty cổ phần thương mại Huystay', N'string', N'Tên công ty', 1, CAST(N'2025-05-28T09:00:23.517' AS DateTime), NULL)
GO
INSERT [dbo].[Settings] ([Id], [Key], [Value], [ValueType], [Description], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (2, N'hotlineCompany', N'19001929', N'string', NULL, 1, CAST(N'2025-05-28T09:01:53.887' AS DateTime), NULL)
GO
INSERT [dbo].[Settings] ([Id], [Key], [Value], [ValueType], [Description], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (3, N'floorFee', N'12', N'number', N'Phần trăm phí sàn', 1, CAST(N'2025-05-28T09:03:25.430' AS DateTime), NULL)
GO
INSERT [dbo].[Settings] ([Id], [Key], [Value], [ValueType], [Description], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (4, N'companyAddress', N'Tầng 2, TTTM HPC Landmark 105, đường Tố Hữu, Q.Hà Đông, TP. Hà Nội', N'string', NULL, 1, CAST(N'2025-05-28T10:07:56.317' AS DateTime), NULL)
GO
INSERT [dbo].[Settings] ([Id], [Key], [Value], [ValueType], [Description], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (5, N'companyEmail', N'daohuy1692003@gmail.com', N'string', NULL, 1, CAST(N'2025-05-28T10:08:30.830' AS DateTime), NULL)
GO
INSERT [dbo].[Settings] ([Id], [Key], [Value], [ValueType], [Description], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (6, N'companyPhone', N'0364174636', N'string', NULL, 1, CAST(N'2025-05-28T10:08:58.757' AS DateTime), NULL)
GO
INSERT [dbo].[Settings] ([Id], [Key], [Value], [ValueType], [Description], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (7, N'adBannerPrice', N'30000', N'number', N'Giá đặt quảng cáo ở banner 30k / ngày', 1, CAST(N'2025-05-28T10:20:24.697' AS DateTime), NULL)
GO
INSERT [dbo].[Settings] ([Id], [Key], [Value], [ValueType], [Description], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (8, N'adSideBarLeftPrice', N'12000', N'number', N'Giá đặt quảng cáo ở banner 12k / ngày', 1, CAST(N'2025-05-28T10:31:13.517' AS DateTime), CAST(N'2025-05-28T10:31:13.520' AS DateTime))
GO
INSERT [dbo].[Settings] ([Id], [Key], [Value], [ValueType], [Description], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (9, N'adFooterPrice', N'7000', N'number', N'Giá đặt quảng cáo ở Footer 7k / ngày', 1, CAST(N'2025-05-28T10:22:04.647' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Settings] OFF
GO
INSERT [dbo].[Users] ([userID], [username], [fullName], [email], [phoneNumber], [password], [profilePicture], [dateOfBirth], [country], [address], [accountStatus], [createdAt], [status], [gender], [typeUser]) VALUES (N'1d59e1df-f8ad-4032-a1a8-ab9fb0b8a183', N'owner9', N'Đào Văn Hoàng', N'huymuahanglzd09@gmail.com', NULL, N'$2a$11$EMLBYNmJomj2FBe9W1Zd4uxH68msUUmm5u/J8qPy7TgMXomSXwK0u', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2)
GO
INSERT [dbo].[Users] ([userID], [username], [fullName], [email], [phoneNumber], [password], [profilePicture], [dateOfBirth], [country], [address], [accountStatus], [createdAt], [status], [gender], [typeUser]) VALUES (N'1e2d609c-1b9a-4328-ab3c-cef8fe05db0e', N'owner5', N'Đào Quang Huy', N'duongdatx2004@gmail.com', N'0364174636', N'$2a$11$8/O9UGoJKtr5U9NasQmGUug2WErBfLczWcIVEeOD2HF8IhQcPwLc6', NULL, NULL, NULL, N'Hưng Yên', NULL, NULL, 1, 1, 1)
GO
INSERT [dbo].[Users] ([userID], [username], [fullName], [email], [phoneNumber], [password], [profilePicture], [dateOfBirth], [country], [address], [accountStatus], [createdAt], [status], [gender], [typeUser]) VALUES (N'2f9c055e-1a95-41e4-b331-c863cebc9a73', N'admin', N'DAO QUANG HUY', N'huymuahanglzd019@gmail.com', N'0364174636', N'$2a$11$uhw1HRRgM4wE5vgZMa4G/u6lk63L7VWhpjRe.rcf1Q4QTvCh1oeCW', N'/Images/20250527_171454.jpg', NULL, NULL, N'Hưng Yên', NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Users] ([userID], [username], [fullName], [email], [phoneNumber], [password], [profilePicture], [dateOfBirth], [country], [address], [accountStatus], [createdAt], [status], [gender], [typeUser]) VALUES (N'502ca239-9edc-4eb3-8449-f0fe25ada778', N'kh1', N'Nguyễn Thế Mạnh', N'huymuahanglzd010@gmail.com', NULL, N'$2a$11$gaItzQ9x1ONA8aOmu9L7Qu2c0dj5CBKkR/YoupDqPmHErehN.VM3m', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2)
GO
INSERT [dbo].[Users] ([userID], [username], [fullName], [email], [phoneNumber], [password], [profilePicture], [dateOfBirth], [country], [address], [accountStatus], [createdAt], [status], [gender], [typeUser]) VALUES (N'717494c1-a769-48fa-b502-483d6e8f579f', N'owner3', N'Phan Thùy Dung', N'huymuahanglzd04@gmail.com', N'0349575773', N'$2a$11$Unj4u4b.DtzV1FXo3sbkXuNVYk8EonZO2DLPOgQhaLXrKXe9MsbKu', NULL, NULL, NULL, N'Hà Nội', NULL, NULL, 1, 1, 1)
GO
INSERT [dbo].[Users] ([userID], [username], [fullName], [email], [phoneNumber], [password], [profilePicture], [dateOfBirth], [country], [address], [accountStatus], [createdAt], [status], [gender], [typeUser]) VALUES (N'89fceba7-32c8-4bf2-8d91-ccab31ef7d82', N'owner6', N'Phan Thùy Dung', N'huymuahanglzd04@gmail.com', N'0349575773', N'$2a$11$Wt2gBgC5qw3uXv0JO2w/AeTtikewy0VxOlkZ09kjbmH2rqiwppSIS', NULL, NULL, NULL, N'Hà Nội', NULL, NULL, 1, 1, 1)
GO
INSERT [dbo].[Users] ([userID], [username], [fullName], [email], [phoneNumber], [password], [profilePicture], [dateOfBirth], [country], [address], [accountStatus], [createdAt], [status], [gender], [typeUser]) VALUES (N'9efd1f08-441f-4651-be48-2084e296532c', N'owner4', N'Phan Thùy Dung', N'huymuahanglzd04@gmail.com', N'0349575773', N'$2a$11$W/k/LFaGi8S4RnXrgfVGv.xyoZL6pCY6tO2MOppsZ/DRrK7KhO.PO', NULL, NULL, NULL, N'Hà Nội', NULL, NULL, 1, 1, 1)
GO
INSERT [dbo].[Users] ([userID], [username], [fullName], [email], [phoneNumber], [password], [profilePicture], [dateOfBirth], [country], [address], [accountStatus], [createdAt], [status], [gender], [typeUser]) VALUES (N'b29cacf9-8820-4be3-9515-89da7c990ee7', N'owner7', N'Phan Thùy Dung', N'huymuahanglzd04@gmail.com', N'0349575773', N'$2a$11$nHOKqeRj2FWonw5kBD6h4uEgC0GGDmApl8qzS83L1Gd6tTzev27V2', NULL, NULL, NULL, N'Hà Nội', NULL, NULL, 1, 1, 1)
GO
INSERT [dbo].[Users] ([userID], [username], [fullName], [email], [phoneNumber], [password], [profilePicture], [dateOfBirth], [country], [address], [accountStatus], [createdAt], [status], [gender], [typeUser]) VALUES (N'bafa7f55-8d66-45f4-83b7-e6a9e6e93a3f', N'doanh', N'Phan Thùy Dung', N'huymuahanglzd04@gmail.com', N'0349575773', N'$2a$11$46ufT4ZqcbcBI47fpkXp4ePVm/AWpsQnMJA1s2XZGA82F1eLI6yRa', N'/Images/20250527_232630.jpg', CAST(N'2025-05-17' AS Date), NULL, N'Hà Nội', NULL, NULL, 1, 0, 1)
GO
INSERT [dbo].[Users] ([userID], [username], [fullName], [email], [phoneNumber], [password], [profilePicture], [dateOfBirth], [country], [address], [accountStatus], [createdAt], [status], [gender], [typeUser]) VALUES (N'c7ce3346-3e14-4ab6-9841-ece3517f4a94', N'owner2', N'Phan Thùy Dung', N'huymuahanglzd04@gmail.com', N'0349575773', N'$2a$11$R.qdfC2Nkra3fDXdm8nTW.dEZiqZjh3o7Ytm51MDOe9xYZn8lT3hu', NULL, NULL, NULL, N'Hà Nội', NULL, NULL, 1, 1, 1)
GO
INSERT [dbo].[Users] ([userID], [username], [fullName], [email], [phoneNumber], [password], [profilePicture], [dateOfBirth], [country], [address], [accountStatus], [createdAt], [status], [gender], [typeUser]) VALUES (N'cac4a853-71e5-436d-8ec6-7ac99c8390ec', N'owner8', N'Phan Thùy Dung', N'huymuahanglzd04@gmail.com', N'0349575773', N'$2a$11$8PkX/n9I5oH1opDNN6kIwuIbCuHfjHdKd4Q54/Z0wvrLO.Jug6Kmi', NULL, NULL, NULL, N'Hà Nội', NULL, NULL, 1, 1, 1)
GO
INSERT [dbo].[Users] ([userID], [username], [fullName], [email], [phoneNumber], [password], [profilePicture], [dateOfBirth], [country], [address], [accountStatus], [createdAt], [status], [gender], [typeUser]) VALUES (N'd6c66368-dc56-4bff-9b58-3f9f08e152b0', N'kh2', N'Nguyễn Thế Mạnh', N'huymuahanglzd014@gmail.com', NULL, N'$2a$11$xokeB7Lej6ZM4W7h3COHKOWPNdePe4ECFIfzf2RYH4RAQUXV/QC62', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2)
GO
INSERT [dbo].[Users] ([userID], [username], [fullName], [email], [phoneNumber], [password], [profilePicture], [dateOfBirth], [country], [address], [accountStatus], [createdAt], [status], [gender], [typeUser]) VALUES (N'ebd26f34-092c-415d-b73e-5cbacf06175a', N'owner1', N'Phan Thùy Dung', N'huymuahanglzd04@gmail.com', N'0349575773', N'$2a$11$r634Ytif4h3rmkCMFcMyge1/2r.a8Qo2iQwrAdefxAafDtkE/IT4m', NULL, NULL, NULL, N'Hà Nội', NULL, NULL, 1, 1, 1)
GO
INSERT [dbo].[Users] ([userID], [username], [fullName], [email], [phoneNumber], [password], [profilePicture], [dateOfBirth], [country], [address], [accountStatus], [createdAt], [status], [gender], [typeUser]) VALUES (N'f011b014-e977-434e-9b7a-f835f83d2e98', N'owner10', N'Hoàng Ngọc Mụn', N'huymuahanglzd04@gmail.com', N'0349575773', N'$2a$11$wKTAMNQsNfEs4/2NrwXnouiH7PfJOsrpe/JE52gP3PFSYYUKnEAaO', NULL, NULL, NULL, N'Hà Nội', NULL, NULL, 1, 1, 1)
GO
INSERT [dbo].[Users] ([userID], [username], [fullName], [email], [phoneNumber], [password], [profilePicture], [dateOfBirth], [country], [address], [accountStatus], [createdAt], [status], [gender], [typeUser]) VALUES (N'fc877f75-1098-4d9d-b852-580e9dbc4e88', N'kh3', N'Vũ Đình Côn', N'huymuahangsp022@gmail.com', NULL, N'$2a$11$MFT4kwpvd4iBS5Th48nuJeAzXLWI8V11IFc16lN59JJzmMnzOpX4y', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Settings__C41E0289470101D3]    Script Date: 01/06/2025 16:08:13 ******/
ALTER TABLE [dbo].[Settings] ADD UNIQUE NONCLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Advertisements] ADD  DEFAULT ((0)) FOR [cost]
GO
ALTER TABLE [dbo].[BookingProcess] ADD  DEFAULT ((0)) FOR [paymentTime]
GO
ALTER TABLE [dbo].[BookingProcess] ADD  DEFAULT ((0)) FOR [checkInTime]
GO
ALTER TABLE [dbo].[BookingProcess] ADD  DEFAULT ((0)) FOR [checkOutTime]
GO
ALTER TABLE [dbo].[BookingProcess] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Bookings] ADD  DEFAULT (getdate()) FOR [bookingTime]
GO
ALTER TABLE [dbo].[Bookings] ADD  DEFAULT ((0)) FOR [isConfirm]
GO
ALTER TABLE [dbo].[Bookings] ADD  DEFAULT ((0)) FOR [isCancel]
GO
ALTER TABLE [dbo].[Bookings] ADD  DEFAULT ((0)) FOR [isSuccess]
GO
ALTER TABLE [dbo].[Conversations] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[FAQs] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[Homestay_Services] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Homestay_Services] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Homestay_Services] ADD  DEFAULT (getdate()) FOR [updatedAt]
GO
ALTER TABLE [dbo].[HomeStays] ADD  DEFAULT ((0)) FOR [totalScore]
GO
ALTER TABLE [dbo].[HomeStays] ADD  DEFAULT ((0)) FOR [viewCount]
GO
ALTER TABLE [dbo].[HomeStays] ADD  DEFAULT ((0)) FOR [reviewCount]
GO
ALTER TABLE [dbo].[HomeStays] ADD  DEFAULT ((0)) FOR [averageRating]
GO
ALTER TABLE [dbo].[HomeStays] ADD  DEFAULT ((0)) FOR [isLocked]
GO
ALTER TABLE [dbo].[Messages] ADD  DEFAULT (getdate()) FOR [timestamp]
GO
ALTER TABLE [dbo].[PartnershipReg] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT (getdate()) FOR [paymentDate]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT ((0)) FOR [maxAdults]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT ((0)) FOR [maxChildren]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT ((1)) FOR [bathroomCount]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT ((1)) FOR [bedCount]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT ((0)) FOR [hasBalcony]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT ((0)) FOR [hasTv]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT ((1)) FOR [hasAirConditioner]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT ((0)) FOR [hasRefrigerator]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT ((1)) FOR [hasWifi]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT ((1)) FOR [hasHotWater]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT (getdate()) FOR [updatedAt]
GO
ALTER TABLE [dbo].[Settings] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Settings] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Administrators]  WITH CHECK ADD FOREIGN KEY([roleID])
REFERENCES [dbo].[Roles] ([roleID])
GO
ALTER TABLE [dbo].[Administrators]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Advertisements]  WITH CHECK ADD FOREIGN KEY([ownerID])
REFERENCES [dbo].[OwnerStays] ([ownerID])
GO
ALTER TABLE [dbo].[Articles]  WITH CHECK ADD FOREIGN KEY([authorID])
REFERENCES [dbo].[Administrators] ([adminID])
GO
ALTER TABLE [dbo].[Articles]  WITH CHECK ADD FOREIGN KEY([cateArtID])
REFERENCES [dbo].[CategoryArticles] ([cateID])
GO
ALTER TABLE [dbo].[BookingProcess]  WITH CHECK ADD FOREIGN KEY([bookingID])
REFERENCES [dbo].[Bookings] ([bookingID])
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([cusID])
REFERENCES [dbo].[Customers] ([cusID])
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([homestayID])
REFERENCES [dbo].[HomeStays] ([homestayID])
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([ownerID])
REFERENCES [dbo].[OwnerStays] ([ownerID])
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([roomID])
REFERENCES [dbo].[Rooms] ([roomId])
GO
ALTER TABLE [dbo].[Conversations]  WITH CHECK ADD  CONSTRAINT [FK_Conversations_User] FOREIGN KEY([idUser1])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Conversations] CHECK CONSTRAINT [FK_Conversations_User]
GO
ALTER TABLE [dbo].[Conversations]  WITH CHECK ADD  CONSTRAINT [FK_Conversations_User2] FOREIGN KEY([idUser2])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Conversations] CHECK CONSTRAINT [FK_Conversations_User2]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[DetailHomeStays]  WITH CHECK ADD FOREIGN KEY([homestayID])
REFERENCES [dbo].[HomeStays] ([homestayID])
GO
ALTER TABLE [dbo].[FAQs]  WITH CHECK ADD FOREIGN KEY([authorID])
REFERENCES [dbo].[Administrators] ([adminID])
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD FOREIGN KEY([cusID])
REFERENCES [dbo].[Customers] ([cusID])
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD FOREIGN KEY([homestayID])
REFERENCES [dbo].[HomeStays] ([homestayID])
GO
ALTER TABLE [dbo].[Homestay_Services]  WITH CHECK ADD FOREIGN KEY([ownerID])
REFERENCES [dbo].[OwnerStays] ([ownerID])
GO
ALTER TABLE [dbo].[HomestayAmenities]  WITH CHECK ADD FOREIGN KEY([amenityID])
REFERENCES [dbo].[Amenities] ([amenityID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HomestayAmenities]  WITH CHECK ADD FOREIGN KEY([homestayID])
REFERENCES [dbo].[HomeStays] ([homestayID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HomeStays]  WITH CHECK ADD FOREIGN KEY([ownerID])
REFERENCES [dbo].[OwnerStays] ([ownerID])
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD FOREIGN KEY([conversationID])
REFERENCES [dbo].[Conversations] ([conversationID])
GO
ALTER TABLE [dbo].[PartnershipReg]  WITH CHECK ADD FOREIGN KEY([customerID])
REFERENCES [dbo].[Customers] ([cusID])
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD FOREIGN KEY([bookingID])
REFERENCES [dbo].[Bookings] ([bookingID])
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD FOREIGN KEY([cusID])
REFERENCES [dbo].[Customers] ([cusID])
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD FOREIGN KEY([ownerID])
REFERENCES [dbo].[OwnerStays] ([ownerID])
GO
ALTER TABLE [dbo].[Promotions]  WITH CHECK ADD FOREIGN KEY([ownerID])
REFERENCES [dbo].[OwnerStays] ([ownerID])
GO
ALTER TABLE [dbo].[ReviewAndRatings]  WITH CHECK ADD FOREIGN KEY([cusID])
REFERENCES [dbo].[Customers] ([cusID])
GO
ALTER TABLE [dbo].[ReviewAndRatings]  WITH CHECK ADD FOREIGN KEY([homestayID])
REFERENCES [dbo].[HomeStays] ([homestayID])
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD FOREIGN KEY([homestayId])
REFERENCES [dbo].[HomeStays] ([homestayID])
GO
USE [master]
GO
ALTER DATABASE [HomeStay_HUB_Ver1] SET  READ_WRITE 
GO
