USE [master]
GO
/****** Object:  Database [HomeStay_HUB]    Script Date: 18/12/2024 12:32:25 ******/
CREATE DATABASE [HomeStay_HUB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HomeStay_HUB', FILENAME = N'D:\app\SQL_SERVER\MSSQL16.MSSQLSERVER\MSSQL\DATA\HomeStay_HUB.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HomeStay_HUB_log', FILENAME = N'D:\app\SQL_SERVER\MSSQL16.MSSQLSERVER\MSSQL\DATA\HomeStay_HUB_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [HomeStay_HUB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HomeStay_HUB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HomeStay_HUB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HomeStay_HUB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HomeStay_HUB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HomeStay_HUB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HomeStay_HUB] SET ARITHABORT OFF 
GO
ALTER DATABASE [HomeStay_HUB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HomeStay_HUB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HomeStay_HUB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HomeStay_HUB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HomeStay_HUB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HomeStay_HUB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HomeStay_HUB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HomeStay_HUB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HomeStay_HUB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HomeStay_HUB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HomeStay_HUB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HomeStay_HUB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HomeStay_HUB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HomeStay_HUB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HomeStay_HUB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HomeStay_HUB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HomeStay_HUB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HomeStay_HUB] SET RECOVERY FULL 
GO
ALTER DATABASE [HomeStay_HUB] SET  MULTI_USER 
GO
ALTER DATABASE [HomeStay_HUB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HomeStay_HUB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HomeStay_HUB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HomeStay_HUB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HomeStay_HUB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HomeStay_HUB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'HomeStay_HUB', N'ON'
GO
ALTER DATABASE [HomeStay_HUB] SET QUERY_STORE = ON
GO
ALTER DATABASE [HomeStay_HUB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [HomeStay_HUB]
GO
/****** Object:  Table [dbo].[Administrators]    Script Date: 18/12/2024 12:32:25 ******/
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
/****** Object:  Table [dbo].[Advertisements]    Script Date: 18/12/2024 12:32:25 ******/
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
/****** Object:  Table [dbo].[Amenities]    Script Date: 18/12/2024 12:32:25 ******/
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
/****** Object:  Table [dbo].[Articles]    Script Date: 18/12/2024 12:32:25 ******/
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
/****** Object:  Table [dbo].[BookingProcess]    Script Date: 18/12/2024 12:32:25 ******/
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
/****** Object:  Table [dbo].[Bookings]    Script Date: 18/12/2024 12:32:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[bookingID] [int] NOT NULL,
	[cusID] [nvarchar](100) NULL,
	[ownerID] [nvarchar](100) NULL,
	[homestayID] [int] NULL,
	[checkInDate] [date] NULL,
	[checkOutDate] [date] NULL,
	[numberOfGuests] [int] NULL,
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
	[isConfirm] [int] NULL,
	[isCancel] [int] NULL,
	[reasonCancel] [nvarchar](max) NULL,
	[isSuccess] [int] NULL,
	[statusBK] [int] NULL,
	[timeConfirm] [datetime] NULL,
	[timeReviewRating] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[bookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryArticles]    Script Date: 18/12/2024 12:32:25 ******/
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
/****** Object:  Table [dbo].[Conversations]    Script Date: 18/12/2024 12:32:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conversations](
	[conversationID] [int] IDENTITY(1,1) NOT NULL,
	[customerID] [nvarchar](100) NOT NULL,
	[receiverID] [nvarchar](100) NOT NULL,
	[ownerID] [nvarchar](100) NULL,
	[typeConversation] [int] NULL,
	[createdAt] [datetime] NULL,
	[lastMessageAt] [datetime] NULL,
	[receivedStatus] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[conversationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 18/12/2024 12:32:25 ******/
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
/****** Object:  Table [dbo].[DetailHomeStays]    Script Date: 18/12/2024 12:32:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailHomeStays](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[homestayID] [int] NULL,
	[numberOfBedrooms] [int] NULL,
	[numberOfLivingRooms] [int] NULL,
	[numberOfBathrooms] [int] NULL,
	[numberOfKitchens] [int] NULL,
	[note] [nvarchar](max) NULL,
	[rules] [nvarchar](max) NULL,
	[utilities] [nvarchar](max) NULL,
	[regulation] [nvarchar](350) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FAQs]    Script Date: 18/12/2024 12:32:25 ******/
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
/****** Object:  Table [dbo].[Favorites]    Script Date: 18/12/2024 12:32:25 ******/
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
/****** Object:  Table [dbo].[HomestayAmenities]    Script Date: 18/12/2024 12:32:25 ******/
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
/****** Object:  Table [dbo].[HomeStays]    Script Date: 18/12/2024 12:32:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HomeStays](
	[homestayID] [int] IDENTITY(1,1) NOT NULL,
	[homestayName] [nvarchar](255) NOT NULL,
	[ownerID] [nvarchar](100) NOT NULL,
	[addressDetail] [nvarchar](355) NOT NULL,
	[country] [nvarchar](200) NOT NULL,
	[imagePreview] [nvarchar](max) NULL,
	[pricePerNight] [float] NOT NULL,
	[approvalStatus] [int] NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
	[province] [nvarchar](255) NULL,
	[district] [nvarchar](255) NULL,
	[wardOrCommune] [nvarchar](255) NULL,
	[discountSecondNight] [float] NULL,
	[minPerson] [int] NULL,
	[maxPerson] [int] NULL,
	[totalView] [int] NULL,
	[isLocked] [int] NULL,
	[linkGoogleMap] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[homestayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 18/12/2024 12:32:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[msgID] [int] IDENTITY(1,1) NOT NULL,
	[conversationID] [int] NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[senderID] [int] NOT NULL,
	[isView] [int] NULL,
	[timestamp] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[msgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OwnerStays]    Script Date: 18/12/2024 12:32:25 ******/
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
PRIMARY KEY CLUSTERED 
(
	[ownerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnershipReg]    Script Date: 18/12/2024 12:32:25 ******/
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
/****** Object:  Table [dbo].[Payments]    Script Date: 18/12/2024 12:32:25 ******/
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
/****** Object:  Table [dbo].[Promotions]    Script Date: 18/12/2024 12:32:25 ******/
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
/****** Object:  Table [dbo].[ReviewAndRatings]    Script Date: 18/12/2024 12:32:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReviewAndRatings](
	[reviewID] [int] NOT NULL,
	[cusID] [nvarchar](100) NULL,
	[homestayID] [int] NULL,
	[rating] [decimal](18, 0) NULL,
	[comment] [nvarchar](255) NULL,
	[reviewDate] [date] NULL,
	[bookingID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[reviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 18/12/2024 12:32:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[roleID] [nvarchar](100) NOT NULL,
	[nameRole] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 18/12/2024 12:32:25 ******/
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
INSERT [dbo].[Administrators] ([adminID], [userID], [roleID]) VALUES (N'0a002919-9a49-4fb3-86db-61857622b574', N'f92c5a5a-e925-4946-a17f-91730f6b8d04', N'df3e1a63-3b68-4d44-9fd6-cb1856f51dbf')
INSERT [dbo].[Administrators] ([adminID], [userID], [roleID]) VALUES (N'0c95cf66-8c41-4bce-9362-6798c907cde3', N'ea2d8677-5456-4acc-95bd-d302bed6a75b', N'ed204707-f559-4d7c-85ab-feb3d22af9a4')
INSERT [dbo].[Administrators] ([adminID], [userID], [roleID]) VALUES (N'e6ccdf5c-489e-4b05-92cf-3af24acd7765', N'd44fab19-09ef-4e9d-8ba8-a202bcf127b9', N'ed204707-f559-4d7c-85ab-feb3d22af9a4')
GO
SET IDENTITY_INSERT [dbo].[Advertisements] ON 

INSERT [dbo].[Advertisements] ([adID], [ownerID], [adTitle], [adDescription], [adPicture], [urlClick], [startDate], [endDate], [statusAd], [totalClick], [createdDate], [updatedDate], [placement], [cost], [reasonReject], [timePayment]) VALUES (49, N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Nơi Tận Hưởng Thanh Bình Giữa Lòng Thiên Nhiên"', N'Hãy để homestay của chúng tôi đưa bạn rời xa phố thị ồn ào, hòa mình vào khung cảnh thiên nhiên thơ mộng và yên bình.', N'/Images/20241212_104912_1395950_.jpg', N'http://localhost:3000/detail-homestay?id=2', CAST(N'2024-12-12T17:00:00.000' AS DateTime), CAST(N'2024-12-23T17:00:00.000' AS DateTime), 3, 1, CAST(N'2024-12-12T10:49:16.867' AS DateTime), CAST(N'2024-12-12T03:49:12.227' AS DateTime), 1, 300000, NULL, CAST(N'2024-12-12T13:29:21.000' AS DateTime))
INSERT [dbo].[Advertisements] ([adID], [ownerID], [adTitle], [adDescription], [adPicture], [urlClick], [startDate], [endDate], [statusAd], [totalClick], [createdDate], [updatedDate], [placement], [cost], [reasonReject], [timePayment]) VALUES (50, N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Homestay Sang Trọng Với Giá Phải Chăng', N'Đắm mình trong không gian hiện đại, đầy đủ tiện ích với mức giá hợp lý. Đặt ngay để nhận ưu đãi độc quyền!.', N'/Images/20241212_105013_6583911_.jpg', N'http://localhost:3000/detail-homestay?id=3', CAST(N'2024-12-12T17:00:00.000' AS DateTime), CAST(N'2024-12-20T17:00:00.000' AS DateTime), 3, 3, CAST(N'2024-12-12T10:50:13.427' AS DateTime), CAST(N'2024-12-12T03:50:13.193' AS DateTime), 1, 300000, NULL, CAST(N'2024-12-12T13:29:21.000' AS DateTime))
INSERT [dbo].[Advertisements] ([adID], [ownerID], [adTitle], [adDescription], [adPicture], [urlClick], [startDate], [endDate], [statusAd], [totalClick], [createdDate], [updatedDate], [placement], [cost], [reasonReject], [timePayment]) VALUES (51, N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Check-in Ngay! View Đẹp, Góc Sống Ảo Triệu Like', N'Homestay lý tưởng với tầm nhìn tuyệt đẹp. Mỗi góc đều là một khung hình hoàn hảo dành riêng cho bạn.', N'/Images/20241212_105118_8792129_.jpg', N'http://localhost:3000/detail-homestay?id=4', CAST(N'2024-12-12T17:00:00.000' AS DateTime), CAST(N'2024-12-29T17:00:00.000' AS DateTime), 3, 14, CAST(N'2024-12-12T10:51:18.403' AS DateTime), CAST(N'2024-12-12T03:51:18.397' AS DateTime), 1, 200000, NULL, CAST(N'2024-12-12T13:29:21.000' AS DateTime))
INSERT [dbo].[Advertisements] ([adID], [ownerID], [adTitle], [adDescription], [adPicture], [urlClick], [startDate], [endDate], [statusAd], [totalClick], [createdDate], [updatedDate], [placement], [cost], [reasonReject], [timePayment]) VALUES (52, N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Trải Nghiệm Văn Hóa Địa Phương Độc Đáo', N'Lưu trú tại homestay và cảm nhận sự mộc mạc, chân thành của con người cùng những nét đặc trưng văn hóa địa phương.', N'/Images/20241212_105210_1156916_.jpg', N'http://localhost:3000/detail-homestay?id=5', CAST(N'2024-12-12T17:00:00.000' AS DateTime), CAST(N'2024-12-20T17:00:00.000' AS DateTime), 3, 0, CAST(N'2024-12-12T10:52:10.823' AS DateTime), CAST(N'2024-12-12T03:52:10.770' AS DateTime), 2, 150000, NULL, CAST(N'2024-12-12T13:29:21.000' AS DateTime))
INSERT [dbo].[Advertisements] ([adID], [ownerID], [adTitle], [adDescription], [adPicture], [urlClick], [startDate], [endDate], [statusAd], [totalClick], [createdDate], [updatedDate], [placement], [cost], [reasonReject], [timePayment]) VALUES (53, N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Hành Trình Nghỉ Dưỡng Đẳng Cấp Bắt Đầu Tại Đây"', N'Không gian sang trọng, dịch vụ tận tâm, vị trí thuận tiện. Hãy để chúng tôi biến kỳ nghỉ của bạn thành kỷ niệm khó quên.', N'/Images/20241212_105240_5248742_.jpg', N'http://localhost:3000/detail-homestay?id=6', CAST(N'2024-12-12T17:00:00.000' AS DateTime), CAST(N'2024-12-20T17:00:00.000' AS DateTime), 3, 1, CAST(N'2024-12-12T10:52:40.790' AS DateTime), CAST(N'2024-12-12T03:52:40.787' AS DateTime), 2, 150000, NULL, CAST(N'2024-12-12T13:29:21.000' AS DateTime))
INSERT [dbo].[Advertisements] ([adID], [ownerID], [adTitle], [adDescription], [adPicture], [urlClick], [startDate], [endDate], [statusAd], [totalClick], [createdDate], [updatedDate], [placement], [cost], [reasonReject], [timePayment]) VALUES (54, N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Thoát Khỏi Bộn Bề - Về Với Biển Cả', N'Homestay sát biển, làn gió mát rượi và âm thanh sóng vỗ sẽ giúp bạn thư giãn tuyệt đối. Đặt phòng ngay hôm nay!', N'/Images/20241212_105319_3206092_.jpg', N'http://localhost:3000/detail-homestay?id=6', CAST(N'2024-12-12T17:00:00.000' AS DateTime), CAST(N'2024-12-20T17:00:00.000' AS DateTime), 3, 0, CAST(N'2024-12-12T10:53:19.943' AS DateTime), CAST(N'2024-12-12T03:53:19.937' AS DateTime), 2, 150000, NULL, CAST(N'2024-12-12T13:29:21.000' AS DateTime))
INSERT [dbo].[Advertisements] ([adID], [ownerID], [adTitle], [adDescription], [adPicture], [urlClick], [startDate], [endDate], [statusAd], [totalClick], [createdDate], [updatedDate], [placement], [cost], [reasonReject], [timePayment]) VALUES (55, N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Điểm Đến Hoàn Hảo Cho Gia Đình Và Bạn Bè', N'Homestay rộng rãi, phù hợp cho các nhóm đông người. Cùng bạn bè hoặc gia đình tận hưởng kỳ nghỉ tuyệt vời bên nhau.', N'/Images/20241212_105353_893207_.jpg', N'http://localhost:3000/detail-homestay?id=7', CAST(N'2024-12-12T17:00:00.000' AS DateTime), CAST(N'2024-12-20T17:00:00.000' AS DateTime), 3, 0, CAST(N'2024-12-12T10:53:53.463' AS DateTime), CAST(N'2024-12-12T03:53:53.417' AS DateTime), 2, 150000, NULL, CAST(N'2024-12-12T13:29:21.000' AS DateTime))
INSERT [dbo].[Advertisements] ([adID], [ownerID], [adTitle], [adDescription], [adPicture], [urlClick], [startDate], [endDate], [statusAd], [totalClick], [createdDate], [updatedDate], [placement], [cost], [reasonReject], [timePayment]) VALUES (56, N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Kỳ Nghỉ Lý Tưởng - Giá Rẻ Bất Ngờ', N'Homestay giá rẻ nhưng không gian và dịch vụ đều vượt mong đợi. Liên hệ ngay để không bỏ lỡ!', N'/Images/20241212_105427_8395156_.jpg', N'http://localhost:3000/detail-homestay?id=8', CAST(N'2024-12-12T17:00:00.000' AS DateTime), CAST(N'2024-12-20T17:00:00.000' AS DateTime), 3, 0, CAST(N'2024-12-12T10:54:27.817' AS DateTime), CAST(N'2024-12-12T03:54:27.807' AS DateTime), 2, 150000, NULL, CAST(N'2024-12-12T13:29:21.000' AS DateTime))
INSERT [dbo].[Advertisements] ([adID], [ownerID], [adTitle], [adDescription], [adPicture], [urlClick], [startDate], [endDate], [statusAd], [totalClick], [createdDate], [updatedDate], [placement], [cost], [reasonReject], [timePayment]) VALUES (57, N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Kỳ Nghỉ Lý Tưởng - Giá Rẻ Bất Ngờ', N'Homestay giá rẻ nhưng không gian và dịch vụ đều vượt mong đợi. Liên hệ ngay để không bỏ lỡ!', N'/Images/20241212_105450_1549039_.jpg', N'http://localhost:3000/detail-homestay?id=8', CAST(N'2024-12-12T17:00:00.000' AS DateTime), CAST(N'2024-12-20T17:00:00.000' AS DateTime), 3, 0, CAST(N'2024-12-12T10:54:50.083' AS DateTime), CAST(N'2024-12-12T03:54:50.077' AS DateTime), 3, 100000, NULL, CAST(N'2024-12-12T13:29:21.000' AS DateTime))
INSERT [dbo].[Advertisements] ([adID], [ownerID], [adTitle], [adDescription], [adPicture], [urlClick], [startDate], [endDate], [statusAd], [totalClick], [createdDate], [updatedDate], [placement], [cost], [reasonReject], [timePayment]) VALUES (58, N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Thức Giấc Giữa Mây Trời – Homestay Cực Chill', N'Căn phòng nhỏ xinh với tầm nhìn bao quát núi rừng, mang đến trải nghiệm hòa mình vào thiên nhiên kỳ thú.', N'/Images/20241212_105553_9351721_.jpg', N'http://localhost:3000/detail-homestay?id=8', CAST(N'2024-12-12T17:00:00.000' AS DateTime), CAST(N'2024-12-20T17:00:00.000' AS DateTime), 3, 0, CAST(N'2024-12-12T10:55:53.170' AS DateTime), CAST(N'2024-12-12T03:55:53.163' AS DateTime), 3, 100000, NULL, CAST(N'2024-12-12T13:29:21.797' AS DateTime))
INSERT [dbo].[Advertisements] ([adID], [ownerID], [adTitle], [adDescription], [adPicture], [urlClick], [startDate], [endDate], [statusAd], [totalClick], [createdDate], [updatedDate], [placement], [cost], [reasonReject], [timePayment]) VALUES (59, N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Homestay Với Hồ Bơi Riêng – Thỏa Sức Tung Tăng', N'Chìm đắm trong làn nước xanh mát ngay tại homestay mà không cần đi đâu xa. Đặt phòng ngay hôm nay!', N'/Images/20241212_105630_8423200_.jpg', N'http://localhost:3000/detail-homestay?id=9', CAST(N'2024-12-12T17:00:00.000' AS DateTime), CAST(N'2024-12-20T17:00:00.000' AS DateTime), 3, 0, CAST(N'2024-12-12T10:56:30.523' AS DateTime), CAST(N'2024-12-12T03:56:30.517' AS DateTime), 3, 100000, NULL, CAST(N'2024-12-12T12:52:49.783' AS DateTime))
SET IDENTITY_INSERT [dbo].[Advertisements] OFF
GO
SET IDENTITY_INSERT [dbo].[Amenities] ON 

INSERT [dbo].[Amenities] ([amenityID], [name], [icon]) VALUES (1, N'Wifi', N'fa-solid fa-wifi')
INSERT [dbo].[Amenities] ([amenityID], [name], [icon]) VALUES (2, N'Máy lọc không khí', N'fa fa-wind')
INSERT [dbo].[Amenities] ([amenityID], [name], [icon]) VALUES (3, N'Điều hòa', N'fas fa-snowflake')
INSERT [dbo].[Amenities] ([amenityID], [name], [icon]) VALUES (22, N'Hồ bơi', N'fas fa-swimmer')
INSERT [dbo].[Amenities] ([amenityID], [name], [icon]) VALUES (23, N'Quầy bar BBQ', N'fas fa-fire')
INSERT [dbo].[Amenities] ([amenityID], [name], [icon]) VALUES (24, N'Tivi', N'fas fa-tv')
INSERT [dbo].[Amenities] ([amenityID], [name], [icon]) VALUES (25, N'Khu vực đỗ xe', N'fas fa-parking')
INSERT [dbo].[Amenities] ([amenityID], [name], [icon]) VALUES (26, N'Thú cưng được chào đón', N'fas fa-paw')
INSERT [dbo].[Amenities] ([amenityID], [name], [icon]) VALUES (27, N'Khu vực thư giãn ngoài trời', N'fas fa-tree')
INSERT [dbo].[Amenities] ([amenityID], [name], [icon]) VALUES (28, N'Máy pha cà phê', N'fas fa-coffee')
INSERT [dbo].[Amenities] ([amenityID], [name], [icon]) VALUES (29, N'Hệ thống an ninh (camera)', N'fas fa-camera')
INSERT [dbo].[Amenities] ([amenityID], [name], [icon]) VALUES (30, N'Khăn tắm, dầu gội, sữa tắm', N'fas fa-bath')
INSERT [dbo].[Amenities] ([amenityID], [name], [icon]) VALUES (31, N'Bàn bi-a', N'fas fa-gamepad')
INSERT [dbo].[Amenities] ([amenityID], [name], [icon]) VALUES (32, N'Bàn ăn ngoài trời', N'fas fa-utensils')
INSERT [dbo].[Amenities] ([amenityID], [name], [icon]) VALUES (33, N'Phòng ngủ lớn', N'fas fa-bed')
INSERT [dbo].[Amenities] ([amenityID], [name], [icon]) VALUES (34, N'Sân chơi trẻ em', N'fas fa-child')
INSERT [dbo].[Amenities] ([amenityID], [name], [icon]) VALUES (35, N'Hệ thống chiếu sáng hiện đại', N'fas fa-lightbulb')
INSERT [dbo].[Amenities] ([amenityID], [name], [icon]) VALUES (36, N'Thang máy', N'fas fa-elevator')
SET IDENTITY_INSERT [dbo].[Amenities] OFF
GO
SET IDENTITY_INSERT [dbo].[Articles] ON 

INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (5, N'Tổng hợp những món ăn đặc sản Quảng Trị đậm chất miền Trung dân dã', N'<blockquote><figure class="media"><oembed url="https://www.youtube.com/watch?v=N1yO6dafJAg"></oembed></figure></blockquote><p><i>Hãy cùng HuyStay khám phá những món ăn đặc sản độc đáo, có 1-0-2 tại Quảng Trị bạn nhé!</i></p><h2><strong>Nem lụi</strong></h2><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/1570/nem-lui-cho-sai.jpeg" alt="Nem lụi chợ Sãi" width="1239" height="823"></p><p><i>Nem lụi chợ Sãi thơm ngon khó cưỡng</i></p><p>Nguyên liệu để làm món nem lụi, đặc sản tại chợ Sãi của Quảng Trị phải là thịt heo tươi roi rói cùng phần bì có độ đàn hồi tốt và các loại gia vị phổ thông như: đường, tiêu, bột ngọt,...</p><p>Tất cả các nguyên liệu được tẩm ướp và trộn lẫn với nhau tạo nên một tổng thể hỗn hợp mềm ẩm, dẻo dai.</p><p>Nem được ăn cùng bánh tráng và các loại rau sống tươi ngon, rau củ như: dưa chuột, chuối xanh, xoài xanh, đu đủ. Phần nước chấm được làm từ gan heo băm nhỏ với lạc, mè trắng, đậu tương và dứa chín.</p><h2><strong>Bún hến</strong></h2><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/1570/bun-hen-mai-xa.jpg" alt="Bún hến Mai Xá" width="2048" height="1536"></p><p><i>Món ăn dân dã của người dân Quảng Trị</i></p><p>Món ăn thứ hai trong danh sách đặc sản Quảng Trị mà chúng tôi muốn gửi đến bạn đó chính là bún hến Mai Xá.</p><p>Nguyên liệu không thể thiếu trong những bát bún hến đó chính con chắt chắt, một loại thuộc họ hến nhưng có hình dáng nhỏ hơn và phần màu đen đậm, vị ngọt khi ăn.</p><p>Một tô bún hến hoàn hảo sẽ bao gồm phần bún tươi, hến xào đậm đà và rau thơm ăn kèm. Nếu như khách hàng nào thích ăn những món có nước thì sẽ chan thêm nước dùng ninh xương thanh thanh.</p><h2><strong>Cháo cá vạt giường</strong></h2><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/1570/chao-ca-vat-giuong.jpg" alt="Món cháo phải ăn bằng đũa" width="720" height="540"></p><p><i>Món cháo phải ăn bằng đũa</i></p><p>Là người dân Quảng Trị thì chắc chắn bạn đã từng thưởng thức cháo cá vạt giường. Từ “vạt giường” ở đây có nghĩa là những sợi bột của cháo cá, phần hình khối dài giống chiếc vạt giường.&nbsp;</p><p>Người dân Quảng Trị thường có câu: “Người Quảng Trị ăn bánh canh giống như người Hà Nội ăn phở”.&nbsp;</p><p>Bánh canh được nấu bằng bột gạo, bột lọc hoặc thẩm chí là bột mì. Phần thịt cá nấu cùng được chọn từ những con cá lóc đồng to, săn chắc, thịt thơm, ngọt. Để cháo dậy vị, du khách khi thưởng thức có thể dùng cùng ớt và tiêu.</p><h2><strong>Thịt trâu lá trơng</strong></h2><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/1570/thit-trau-la-trong.jpeg" alt="Thịt trâu lá trơng" width="1280" height="720"></p><p><i>Thịt trâu lá trơng - Món ăn được nhiều khách du lịch săn đón</i></p><p>Lá trơng là một loại lá rừng phổ biến, đặc trưng, thường được người dân miền Trung sử dụng trong nhiều món ăn. Là có màu xanh đậm, hương vị hơi chát nhưng nếu ăn quen thì lại vô cùng cuốn hút và đưa miệng.</p><p>Thịt trâu nếu biết chế biến đúng cách thì sẽ rất mềm, đậm vị mà không bị dai. Du khách có thể chọn kiểu thịt trâu nướng, ăn chung cùng rau cải, tiêu, ớt xanh và nước tương.&nbsp;</p><h2><strong>Lòng sả</strong></h2><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/1570/long-sa-quang-tri.jpg" alt="Món lòng sả quảng trị" width="1200" height="860"></p><p><i>Một món ăn quen thuộc nhưng được chế biến theo cách vô cùng độc đáo của người Quảng Trị</i></p><p>Đặc sản của Quảng Trị khi nhắc tới đó chính là lòng sả. Không giống với món lòng tại Hà Nội, lòng sả Quảng Trị được chế biến rất cầu kỳ. Món ăn bao gồm nhiều ớt, thậm chí nếu không quen ăn cay thì bạn sẽ cảm thấy đến mức tê cả lưỡi.</p><p>Món ăn phù hợp để thưởng thức vào những ngày mưa mang lại cảm giác ấm bụng.</p><h2><strong>Bánh khoái</strong></h2><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/1570/banh-khoai-quang-tri.jpg" alt="Đặc sản ngon hết nấc tại Quảng TRị" width="512" height="342"></p><p><i>Đặc sản ngon hết nấc tại Quảng Trị</i></p><p>Món bánh khoái Quảng Trị có hình thức khá giống với bánh bèo Nam Bộ. Món ăn không chỉ đạt sự hoàn hảo về hương vị mà còn đáp ứng yêu cầu về thẩm mỹ khi kết hợp hài hòa giữa những màu sắc sặc sỡ, bắt mắt.</p><p>Điểm nhấn của món ăn chính là phần nước lèo “thần thánh” ăn cùng. Nước lèo được pha chế theo công thức đặc biệt, không đâu có được từ ruốc, gan và thịt nạc xay nhuyễn. Không những vậy nước còn được thêm chút lạc vừng giã nhỏ, tỏi, bột ớt,...cho trọn vị hơn.</p><h2><strong>Bánh ướt</strong></h2><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/1570/banh-uot-phuong-lang-quang-tri.jpg" alt="Đậm đà bánh ướt Quảng Trị" width="680" height="482"></p><p><i>Đậm đà bánh ướt Quảng Trị</i></p><p>Nhắc đến Phương Lang, Quảng Trị thì món ăn đầu tiên mà người ta nghĩ đến đó chính là bánh ướt. Tuy có cách làm khá đơn giản nhưng món ăn này yêu cầu người chế biến phải thật kéo tay để bánh không quá dày hay quá mỏng.</p><p>Ăn cùng bánh ướt là thịt heo luộc và phần rau sống tươi ngon, chấm thêm nước mắm pha đường và ớt cay, đậm đà.</p><h2><strong>Cà phê Khe Sanh</strong></h2><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/1570/ca-phe-khe-sanh.jpeg" alt="Cà phê Khe Sanh" width="680" height="453"></p><p><i>Cà phê Khe Sanh nức tiếng cả nước</i></p><p>Thị trấn Khe Sanh, tỉnh Quảng Trị được biết đến là địa phương đặc trưng với những ngọn đồi đất đỏ bazan. Nơi đây chính là xứ sở của những hạt cà phê thơm ngon. Cà phê sau khi được thu hoạch sẽ chế biến hoàn toàn thủ công để giữ được trọn vẹn hương vị.</p><p>Đây cũng chính là món quà phù hợp với những người du khách muốn mua quà về cho gia đình và bạn bè khi đi du lịch.&nbsp;</p><p>Với những món ăn đặc sản mà GoStay giới thiệu trong bài viết ở trên, hy vọng rằng mỗi người sẽ có cho mình được những kỷ niệm thật tuyệt vời tại mảnh đất “lửa” Quảng Trị nhé!</p>', N'/Images/20241204_142957.jpg', N'e6ccdf5c-489e-4b05-92cf-3af24acd7765', CAST(N'2024-12-17' AS Date), 1, N'Tổng hợp những món ăn đặc sản Quảng Trị đậm chất miền Trung dân dã')
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (6, N'Nhà gái tự đưa dâu về nhà chồng - Phong tục truyền thống của người', N'<p><i>Trong bài viết ngày hôm nay, HuyStay sẽ mời bạn cùng chúng tôi khám phá và trải nghiệm làng nghề bánh đa Thổ Hà, Bắc Giang - một trong những làm nghề truyền thống nổi tiếng từ xưa tới nay.</i></p><h2><strong>Nguồn gốc làng nghề bánh đa Thổ Hà</strong></h2><p>Những người con Thổ Hà không chỉ tự hào rằng ngôi làng của mình như một “nhân chứng lịch sử”, trải qua bao thăng trầm của đất nước mà còn là nơi để lưu giữ bí quyết làm nghề, lưu truyền qua nhiều thế hệ.&nbsp;</p><p>Làng nghề Thổ Hà nằm tại xã Vân Hà, huyện Việt Yên, tỉnh Bắc Giang. Ngôi làng cổ nhỏ bé này từng nổi danh với nghề gốm Bắc. Sau đó, khi nghề gốm “lùi” về sau thì làng lại nổi tiếng với một món ăn vô cùng dân dã - đó chính là bánh đa và đa nem.</p><p>Từ những năm thập niên 90 đến nay, người ta đã truyền tai nhau về món bánh đa, bánh đa nem Thổ Hà với hương vị, màu sắc không thể lẫn vào đâu được.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/354/banh-da-nem-lang-nghe-co-tho-ha.jpg" alt="Bánh đa nem được phơi dưới những nếp nhà cổ" width="1500" height="1000"></p><p><i>Bánh đa nem được phơi dưới những nếp nhà cổ</i></p><p>Đường vào làng Thổ Hà quanh co, cùng những mái nhà đơn sơ, mộc mạc, nhuốm màu thời gian. Dưới ánh hoàng hôn ngọt lịm, khói bếp xám ngút cuốn theo chiều gió, mang hương gạo nếp rang lan tỏa khắp không gian.&nbsp;</p><p>Tiếng nổ lách tách của những mẻ bánh đa vàng rụm, đang hơ “mình” trên than hồng mới thật bình dị, chân chất biết bao.</p><h2><strong>Bí quyết của làng nghề bánh đa Thổ Hà</strong></h2><p>Làng có nhiều gia đình đã làm bánh đa, đa nem qua nhiều đời. Những người con Thổ Hà gắn liền với từng mẻ bánh thơm, giòn từ thuở thiếu thời.</p><p>Nghề đồng hành cùng họ, chứng kiến qua bao đổi thay, thăng trầm của làng.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/354/lang-nghe-banh-da-tho-ha.jpg" alt="Từng chiếc bánh đa giòn rụm, thơm phức" width="1600" height="1200"></p><p><i>Từng chiếc bánh đa giòn rụm, thơm phức</i></p><p>Nghề làm bánh đa không hề đơn giản, đòi hỏi người làm bánh phải tỉ mỉ, tinh tế trong từng công đoạn. Để một mẻ bánh mới có thể ra lò, những người con của làng nghề bánh đa Thổ Hà phải dậy từ sáng sớm tinh mơ để chuẩn bị nguyên liệu.</p><p>Từ việc chọn gạo, vo gạo, xay bột, tráng bánh, phơi bánh hay đóng gói đều đòi hỏi sự chăm chút, tập trung và cái tâm với nghề. Có như vậy thì từng chiếc bánh khi hoàn thiện xong mới có chất lượng đồng đều.</p><p>Gạo nếp làm bánh phải là loại ngon nhất, được vo sạch, sau đó xay thành bột thật mịn. Khó nhất để cho một chiếc bánh ra lò chính là công đoạn tráng.&nbsp;</p><p>Mặc cho đôi tay chai sần của người nghệ nhân làng nghề, từng tầm bánh mỏng tang, đều đặn vẫn được thoăn thoắt trải ra.&nbsp;</p><p>Miếng bánh tráng đều, không phải chỗ dày chỗ mỏng, đem ra nắng phơi khô nhưng vẫn giữ được độ dẻo dai nhất định.&nbsp;</p><p>Tấm bánh được phơi đạt yêu cầu, đem cắt thành miếng vuông vắn chính là sản phẩm bánh đa nem Thổ Hà.&nbsp;</p><p>Những chiếc bánh đa thì sẽ được tráng bột dày hơn, rắc thêm vừng, lạc và dừa ở bên trên. Sau khi phơi khô, bánh được đem nướng bếp củi thơm phức rồi mới bán.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/354/phoi-banh-da-tho-ha.jpg" alt="Phơi bánh đa làng Thổ Hà" width="2721" height="1814"></p><p><i>Công đoạn phơi bánh đa</i></p><h2><strong>Làng nghề bánh đa Thổ Hà truyền lửa cho thế hệ trẻ</strong></h2><p>Nghề truyền thống trân quý là vậy nhưng những người trẻ ngày nay lại ít mặn mà với nghề thủ công của làng. Các nghệ nhân lớn tuổi trong làng cho biết rằng, lý do thanh niên thường không lựa chọn theo nghề là vì làm bánh vất vả, thu nhập lại không cao.</p><p>Nhiều người lo lắng nếu cứ tiếp tục tình trạng như thế này thì làng nghề bánh đa Thổ Hà sẽ chỉ còn là một cái tên trong tiến trình lịch sử.&nbsp;</p><p>Những người nghệ nhân vô cùng trăn trở và muốn truyền lại nghề cho thế hệ trẻ để làng có thể tiếp tục được lưu truyền, giữ gìn và phát triển.&nbsp;</p><p>Rất may mắn rằng, nhờ sự tâm huyết của những người lớn tuổi trong làng, nhiều thanh niên đã nối tiếp truyền thống của ông cha, trở thành thợ làm bánh tiềm năng.</p><p>Hiện nay, làng nghề bánh đa, bánh đa nem Thổ Hà vẫn được lưu giữ đến tận bây giờ, trở thành biểu tượng và niềm tự hào của người dân địa phương.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/354/nguoi-tre-giu-gin-lang-nghe-banh-da-tho-ha.jpg" alt="Những người trẻ với khát khao muốn gìn giữ nghề truyền thống của quê hương" width="1000" height="1343"></p><p><i>Những người trẻ với khát khao muốn gìn giữ nghề truyền thống của quê hương</i></p><p>Cùng với sự chung tay của các cấp chính quyền, các tổ chức chính trị xã hội sẽ tiếp tục quan tâm và đồng hành cùng người dân trong việc sản xuất, kinh doanh bánh đa, bánh đa nem.</p><p>Đồng thời, làng nghề cũng có thể xây dựng và quảng bá hình ảnh của mình ra thị trường trong nước và quốc tế thông qua những sản phẩm du lịch trải nghiệm ngay tại địa phương.</p><p>Có như vậy thì lửa nghề mới được lưu truyền qua nhiều đời mà vẫn đảm bảo cho dân làng có được nguồn thu nhập ổn định và bền vững.</p><p>Nếu các bạn chưa được thử cảm giác miếng bánh đa thơm bùi, giòn rụm cùng chút ngậy của dừa và vừng làng Thổ Hà thì sau khi đọc xong bài viết này hãy trải nghiệm ngay nhé!</p>', N'/Images/20241204_144407.jpeg', N'e6ccdf5c-489e-4b05-92cf-3af24acd7765', CAST(N'2024-12-04' AS Date), 1, NULL)
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (7, N'Nhà gái tự đưa dâu về nhà chồng - Phong tục truyền thống của người', N'<p><i>Trong bài viết ngày hôm nay, GoStay sẽ mời bạn cùng chúng tôi khám phá và trải nghiệm làng nghề bánh đa Thổ Hà, Bắc Giang - một trong những làm nghề truyền thống nổi tiếng từ xưa tới nay.</i></p><h2><strong>Nguồn gốc làng nghề bánh đa Thổ Hà</strong></h2><p>Những người con Thổ Hà không chỉ tự hào rằng ngôi làng của mình như một “nhân chứng lịch sử”, trải qua bao thăng trầm của đất nước mà còn là nơi để lưu giữ bí quyết làm nghề, lưu truyền qua nhiều thế hệ.&nbsp;</p><p>Làng nghề Thổ Hà nằm tại xã Vân Hà, huyện Việt Yên, tỉnh Bắc Giang. Ngôi làng cổ nhỏ bé này từng nổi danh với nghề gốm Bắc. Sau đó, khi nghề gốm “lùi” về sau thì làng lại nổi tiếng với một món ăn vô cùng dân dã - đó chính là bánh đa và đa nem.</p><p>Từ những năm thập niên 90 đến nay, người ta đã truyền tai nhau về món bánh đa, bánh đa nem Thổ Hà với hương vị, màu sắc không thể lẫn vào đâu được.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/354/banh-da-nem-lang-nghe-co-tho-ha.jpg" alt="Bánh đa nem được phơi dưới những nếp nhà cổ" width="1500" height="1000"></p><p><i>Bánh đa nem được phơi dưới những nếp nhà cổ</i></p><p>Đường vào làng Thổ Hà quanh co, cùng những mái nhà đơn sơ, mộc mạc, nhuốm màu thời gian. Dưới ánh hoàng hôn ngọt lịm, khói bếp xám ngút cuốn theo chiều gió, mang hương gạo nếp rang lan tỏa khắp không gian.&nbsp;</p><p>Tiếng nổ lách tách của những mẻ bánh đa vàng rụm, đang hơ “mình” trên than hồng mới thật bình dị, chân chất biết bao.</p><h2><strong>Bí quyết của làng nghề bánh đa Thổ Hà</strong></h2><p>Làng có nhiều gia đình đã làm bánh đa, đa nem qua nhiều đời. Những người con Thổ Hà gắn liền với từng mẻ bánh thơm, giòn từ thuở thiếu thời.</p><p>Nghề đồng hành cùng họ, chứng kiến qua bao đổi thay, thăng trầm của làng.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/354/lang-nghe-banh-da-tho-ha.jpg" alt="Từng chiếc bánh đa giòn rụm, thơm phức" width="1600" height="1200"></p><p><i>Từng chiếc bánh đa giòn rụm, thơm phức</i></p><p>Nghề làm bánh đa không hề đơn giản, đòi hỏi người làm bánh phải tỉ mỉ, tinh tế trong từng công đoạn. Để một mẻ bánh mới có thể ra lò, những người con của làng nghề bánh đa Thổ Hà phải dậy từ sáng sớm tinh mơ để chuẩn bị nguyên liệu.</p><p>Từ việc chọn gạo, vo gạo, xay bột, tráng bánh, phơi bánh hay đóng gói đều đòi hỏi sự chăm chút, tập trung và cái tâm với nghề. Có như vậy thì từng chiếc bánh khi hoàn thiện xong mới có chất lượng đồng đều.</p><p>Gạo nếp làm bánh phải là loại ngon nhất, được vo sạch, sau đó xay thành bột thật mịn. Khó nhất để cho một chiếc bánh ra lò chính là công đoạn tráng.&nbsp;</p><p>Mặc cho đôi tay chai sần của người nghệ nhân làng nghề, từng tầm bánh mỏng tang, đều đặn vẫn được thoăn thoắt trải ra.&nbsp;</p><p>Miếng bánh tráng đều, không phải chỗ dày chỗ mỏng, đem ra nắng phơi khô nhưng vẫn giữ được độ dẻo dai nhất định.&nbsp;</p><p>Tấm bánh được phơi đạt yêu cầu, đem cắt thành miếng vuông vắn chính là sản phẩm bánh đa nem Thổ Hà.&nbsp;</p><p>Những chiếc bánh đa thì sẽ được tráng bột dày hơn, rắc thêm vừng, lạc và dừa ở bên trên. Sau khi phơi khô, bánh được đem nướng bếp củi thơm phức rồi mới bán.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/354/phoi-banh-da-tho-ha.jpg" alt="Phơi bánh đa làng Thổ Hà" width="2721" height="1814"></p><p><i>Công đoạn phơi bánh đa</i></p><h2><strong>Làng nghề bánh đa Thổ Hà truyền lửa cho thế hệ trẻ</strong></h2><p>Nghề truyền thống trân quý là vậy nhưng những người trẻ ngày nay lại ít mặn mà với nghề thủ công của làng. Các nghệ nhân lớn tuổi trong làng cho biết rằng, lý do thanh niên thường không lựa chọn theo nghề là vì làm bánh vất vả, thu nhập lại không cao.</p><p>Nhiều người lo lắng nếu cứ tiếp tục tình trạng như thế này thì làng nghề bánh đa Thổ Hà sẽ chỉ còn là một cái tên trong tiến trình lịch sử.&nbsp;</p><p>Những người nghệ nhân vô cùng trăn trở và muốn truyền lại nghề cho thế hệ trẻ để làng có thể tiếp tục được lưu truyền, giữ gìn và phát triển.&nbsp;</p><p>Rất may mắn rằng, nhờ sự tâm huyết của những người lớn tuổi trong làng, nhiều thanh niên đã nối tiếp truyền thống của ông cha, trở thành thợ làm bánh tiềm năng.</p><p>Hiện nay, làng nghề bánh đa, bánh đa nem Thổ Hà vẫn được lưu giữ đến tận bây giờ, trở thành biểu tượng và niềm tự hào của người dân địa phương.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/354/nguoi-tre-giu-gin-lang-nghe-banh-da-tho-ha.jpg" alt="Những người trẻ với khát khao muốn gìn giữ nghề truyền thống của quê hương" width="1000" height="1343"></p><p><i>Những người trẻ với khát khao muốn gìn giữ nghề truyền thống của quê hương</i></p><p>Cùng với sự chung tay của các cấp chính quyền, các tổ chức chính trị xã hội sẽ tiếp tục quan tâm và đồng hành cùng người dân trong việc sản xuất, kinh doanh bánh đa, bánh đa nem.</p><p>Đồng thời, làng nghề cũng có thể xây dựng và quảng bá hình ảnh của mình ra thị trường trong nước và quốc tế thông qua những sản phẩm du lịch trải nghiệm ngay tại địa phương.</p><p>Có như vậy thì lửa nghề mới được lưu truyền qua nhiều đời mà vẫn đảm bảo cho dân làng có được nguồn thu nhập ổn định và bền vững.</p><p>Nếu các bạn chưa được thử cảm giác miếng bánh đa thơm bùi, giòn rụm cùng chút ngậy của dừa và vừng làng Thổ Hà thì sau khi đọc xong bài viết này hãy trải nghiệm ngay nhé!</p>', N'/Images/20241204_144420.jpg', N'e6ccdf5c-489e-4b05-92cf-3af24acd7765', CAST(N'2024-12-04' AS Date), 1, NULL)
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (8, N'Nét đẹp cố đô: Nông dân chèo thuyền gặt lúa giữa miền di sản', N'<p><i>Nếu có dịp ghé thăm Ninh Bình vào mùa hè này thì bạn đừng bỏ qua nét đẹp cố đô độc đáo khi ngắm nhìn những người nông dân chèo thuyền tại Tam Cốc Bích Động để gặt những mẻ lúa vàng xuộm, thích mắt nhé!</i></p><h2><strong>Tam Cốc Bích Động - Địa điểm du lịch nổi tiếng của Ninh Bình</strong></h2><p>Nổi tiếng nhất trong những nét đẹp cố đô Ninh Bình với danh xưng “nam thiên đệ nhị động” chính là động Tam Cốc. Nơi đây sở hữu cảnh sắc thiên nhiên làng quê yên bình với hệ thống hang động núi đá vôi đồ sộ.</p><p>Khu Tam Cốc Bích Động thì là một phần danh lam, nằm trong quần thể danh thắng Tràng An, Ninh Bình. Đây là địa điểm hoàn hảo cho những ai yêu thích vẻ đẹp thiên nhiên hoang sơ, gần gũi, kết hợp cùng với nhịp sống thường nhật, bình dị của người dân.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/358/net-dep-co-do.jpg" alt="Địa danh không thể bỏ qua khi tới Ninh Bình" width="1200" height="720"></p><p><i>Địa danh không thể bỏ qua khi tới Ninh Bình</i></p><p>Thời gian đẹp nhất để đến với Tam Cốc Bích Động là vào tháng 1 đến tháng 3 âm. Khi ấy thì khí hậu tương đối dễ chịu, thoáng mát và không có mưa nhiều. Điều này sẽ giúp cho chuyến đi của bạn trở nên toàn vẹn hơn.</p><p>Một trong những khoảng thời gian khác mà bạn cũng có thể cân nhắc tới thăm Tam Cốc Bích Động đó chính là vào cuối tháng 5, đầu tháng 6. Tới đây, bạn chắc chắn sẽ choáng ngợp trước cảnh sắc sặc sỡ của những cánh đồng lúa trổ đòng đòng với những bông lúa trĩu nặng.</p><h2><strong>Chiêm ngưỡng nét đẹp cố đô vào mùa lúa chín</strong></h2><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/358/net-dep-co-do-mua-lua-chin.jpg" alt="Nét đẹp cố đô mùa lúa chín" width="1200" height="801"></p><p><i>Nét đẹp cố đô mùa lúa chín</i></p><p>Chắc chắn bạn sẽ không thể nào quên được hình ảnh những con thuyền mộc mạc, chở khách muôn phương về nơi đây để vãn cảnh. Con thuyền lững lờ trôi trên dòng sông Ngô Đồng hiền hòa, thơ mộng.</p><p>Hai bên dòng sông là cánh đồng lúa đang mùa trổ bông, lay nhẹ theo từng cơn gió như những tấm thảm vàng lóng lánh. Tấm thảm khổng lồ uốn lượn theo từng cơn sóng nước.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/358/canh-dong-tam-coc-1.jpg" alt="Khung cảnh yên bình của vùng cố đô" width="1280" height="934"></p><p><i>Khung cảnh yên bình của vùng cố đô</i></p><p>Bảo quanh là núi non hùng vĩ, đứng sừng sững như tạc vào trời xanh.&nbsp;</p><p>Nơi đây cũng từng được chuyên trang du lịch quốc tế Business Insider bình chọn là một trong 5 cánh đồng lúa đẹp nhất Việt Nam.</p><p>Với mỗi người dân ta thì từ bao đời nay, lúa nước không chỉ được sử dụng làm lương thực, mà nó còn trở thành một biểu tượng văn hóa, du lịch, đại diện cho nền văn minh lúa nước lâu đời của người Việt cổ.&nbsp;</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/358/canh-dong-tam-coc.jpg" alt="Nụ cười của những người nông dân thu hoạch mùa lúa chín" width="2000" height="1334"></p><p><i>Nụ cười của những người nông dân thu hoạch mùa lúa chín</i></p><p>Để có thể thu hoạch được vụ mùa, từ sáng sớm, những người nông dân đã dậy từ sớm, chuẩn bị thuyền để chở lúa về bên sông, nơi chiếc máy tuốt lúa đã sẵn sàng hoạt động. Từng hạt thóc tròn mẩy, vàng xuộm báo hiệu cho một mùa vàng bội thu, ấm no.&nbsp;</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/358/tam-coc-bich-dong.jpg" alt="Những chiếc thuyền chở đầy ắp lúa chín" width="1848" height="1294"></p><p><i>Những chiếc thuyền chở đầy ắp lúa chín</i></p><p>Thế nhưng, để có được thành quả như vậy thì người dân nơi đây đã phải vất vả, chăm chỉ, chịu khó hơn rất nhiều lần so với việc canh tác trên cánh đồng thông thường. Mọi giai đoạn đều được làm thủ công.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/358/tam-coc-bich-dong-1.jpg" alt="Nụ cười hồn hậu của người nông dân " width="986" height="720"></p><p><i>Nụ cười hồn hậu của người nông dân&nbsp;</i></p><p>Toàn bộ khu vực cánh đồng Tam Cốc có diện tích lên tới hơn 18ha. Năm nào thời tiết mưa thuận gió hòa, “trời thương” thì sẽ đạt sản lượng từ 1.5 - 2 tạ/sào. Và mỗi năm thì người dân chỉ cấy duy nhất một vụ mùa.</p><p>Những thời gian khác trong năm, người dân sẽ chèo đò, chở khách du lịch tham quan Tam Cốc Bích Động. Trong một vài năm trở lại đây, người dân còn sáng tạo, nuôi cấy những cánh đồng của mình thành các bức tranh khổng lồ để thu hút khách tham quan.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/358/net-dep-co-do-1.jpeg" alt="Nét đẹp cố đô từ góc nhìn từ trên cao xuống" width="960" height="540"></p><p><i>Nét đẹp cố đô từ góc nhìn từ trên cao xuống</i></p><p>Điều này không chỉ cho thấy sự quyết tâm của người dân mà còn cho thấy sự tài tình, khéo léo và sáng tạo của những người nông dân.</p><p>Nổi bật nhất trong năm nay là bức tranh “Mục đồng thổi sáo” được triển khai trên diện tích rộng hơn 10.000m2. Du lịch vào mùa này, khách tham quan không những được chiêm ngưỡng cảnh sắc thiên nhiên tươi đẹp mà còn được làm quen, giao lưu với con người nơi đây.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/358/buc-tranh-muc-dong-thoi-sao.jpg" alt="Bức tranh " width="2560" height="1520"></p><p><i>Bức tranh "Mục đồng thổi sáo"</i></p><p>Sau khi đọc xong bài viết của chúng tôi, chắc hẳn các bạn đang rất muốn tham quan và trải nghiệm khu du lịch này rồi phải không nào? Vậy thì còn chần chờ gì nữa mà không xách balo lên và đi thôi!</p>', N'/Images/20241204_145001.jpg', N'e6ccdf5c-489e-4b05-92cf-3af24acd7765', CAST(N'2024-12-04' AS Date), 1, NULL)
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (1006, N'Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái', N'<h3><strong>Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái</strong></h3><p>05/07/2024 - Admin Gostay</p><p><i>Nhắc đến Mù Cang Chải, nhiều người sẽ nghĩ ngay tới những thửa ruộng bậc thang mênh mông tít tắp, trải dài khắp nơi. Thế nhưng, Mù Cang Chải còn được gắn liền với một loài hoa có tên vô cùng đặc biệt - hoa tớ dày. Hãy cùng chúng tôi ngắm nhìn sắc đẹp của loài hoa độc đáo này trong bài viết dưới đây nhé!</i></p><h2><strong>Sắc hoa tớ dày miền di sản</strong></h2><p>Tớ dày "uống sương", "ngậm gió" lạnh những ngày mùa đông rét buốt của vùng cao Mù Cang Chải để rồi khi xuân về, từng bông hoa hồng rực bung nở "mạnh mẽ" cũng giống như sức sống của người nới đây.</p><p>Hoa nở hồng của nương đồi, sườn non cao, dọc con đường ngoằn nghèo vào bản hay bên hiên những mái nhà tranh phảng phất khói sương. Tất cả tạo nên một bức tranh vừa hùng vĩ nhưng cũng vô cùng lãng mạn, mềm mại làm say đắm trái tim người du khách.</p><p>Đây là loài hoa thuộc họ đào, được người Mông gọi bằng tên "Pằng Tớ dày", theo tiếng việt có nghĩa là "hoa đào rừng".</p><p>Cây thuộc giống thân gỗ, có phần tán mọc xòe rộng, trải khắp sườn đồi, triền núi. Bông hoa bản dày, có 5 cánh, màu hồng sắc. Khi nở hoa kết chùm lại, nhị hoa dài có màu đỏ rực rỡ.&nbsp;</p><p>Loài hoa này có gắn bó mật thiết với cuộc sống của đồng bào người Mông nơi đây. Họ quan niệm rằng mùa Xuân là thời khắc đất trời chuyển mình, sau một năm lao động vất vả, mùa vàng bội thu, thóc lúa đầy nhà nên người dân sẽ cùng nhau ăn mừng.</p><p>Khi những cây tớ dày nở hoa hồng rực rỡ cả một góc trời cũng là lúc các&nbsp;chàng trai, cô gái Mông xúng xính trong bộ váy mới, luyện khèn, chuẩn bị quả Pao để chơi Tết, du xuân.</p><p>Loài hoa Tớ dày gắn liền với đời sống nhiều thế hệ người Mông vùng cao Mù Cang Chải. Loại hoa có sức sống mãnh liệt, tượng trưng cho sức sống của con người nơi đây.&nbsp;</p><p>Sau khoảng thời gian đó tuy chưa tàn hết nhưng màu sắc cũng sẽ phai nhưng vẫn giữ được vẻ đẹp e lệ, cuốn hút.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-5.jpg" alt="Hoa tớ dày bên những cung đường quanh co" width="1920" height="1493"></p><p><i>Hoa tớ dày và bản làng Mù Cang Chải cùng những con đường quanh co, uốn lượn</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-1.jpg" alt="Khoảnh khắc đáng yêu của đồng bào dân tộc" width="1920" height="1280"></i></p><p><i>Cô gái và chàng trai bản thổi nhau nghe khúc nhạc tình lãng mạn với cành hoa thớ dày sau lưng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-2.jpg" alt="Nụ cười hồn hậu của người dân tộc" width="1920" height="1280"></i></p><p><i>Những đứa trẻ lớn lên tại vùng cao nghèo khó nhưng sức sống mãnh liệt hệt như bông hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-yen-bai.jpg" alt="Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng" width="1920" height="1280"></i></p><p><i>Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day.jpg" alt="Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn" width="1920" height="1280"></i></p><p><i>Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn nhưng lúc nào cũng ngập tràn niềm vui</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/sac-hoa-to-day.jpg" alt="Vẻ đẹp của hoa thớ dày từ trên cao xuống" width="1920" height="1280"></i></p><p><i>Vẻ đẹp của hoa thớ dày từ trên cao xuống</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/tinh-yeu-doi-lua-duoi-hoa-to-day.jpg" alt="Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng" width="1920" height="1280"></i></p><p><i>Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day-mu-cang-chai.jpg" alt="Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày" width="1920" height="1363"></i></p><p><i>Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day.jpg" alt="Vẻ đẹp xao xuyến của từng bông hoa" width="1920" height="1271"></i></p><p><i>Vẻ đẹp xao xuyến của từng bông hoa</i></p><p>Còn chần chờ gì nữa mà không lên lịch ngay cho mình để ngắm sắc đẹp thướt tha, yêu kiều, dịu dàng của loài hoa này trên rẻo cao Mù Cang Chải thôi nào bạn ơi!</p>', N'/Images/20241216_133203.jpg', N'e6ccdf5c-489e-4b05-92cf-3af24acd7765', CAST(N'2024-12-16' AS Date), 2, N'Ẩm thực ba miền')
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (1007, N'Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái', N'<h3><strong>Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái</strong></h3><p>05/07/2024 - Admin Gostay</p><p><i>Nhắc đến Mù Cang Chải, nhiều người sẽ nghĩ ngay tới những thửa ruộng bậc thang mênh mông tít tắp, trải dài khắp nơi. Thế nhưng, Mù Cang Chải còn được gắn liền với một loài hoa có tên vô cùng đặc biệt - hoa tớ dày. Hãy cùng chúng tôi ngắm nhìn sắc đẹp của loài hoa độc đáo này trong bài viết dưới đây nhé!</i></p><h2><strong>Sắc hoa tớ dày miền di sản</strong></h2><p>Tớ dày "uống sương", "ngậm gió" lạnh những ngày mùa đông rét buốt của vùng cao Mù Cang Chải để rồi khi xuân về, từng bông hoa hồng rực bung nở "mạnh mẽ" cũng giống như sức sống của người nới đây.</p><p>Hoa nở hồng của nương đồi, sườn non cao, dọc con đường ngoằn nghèo vào bản hay bên hiên những mái nhà tranh phảng phất khói sương. Tất cả tạo nên một bức tranh vừa hùng vĩ nhưng cũng vô cùng lãng mạn, mềm mại làm say đắm trái tim người du khách.</p><p>Đây là loài hoa thuộc họ đào, được người Mông gọi bằng tên "Pằng Tớ dày", theo tiếng việt có nghĩa là "hoa đào rừng".</p><p>Cây thuộc giống thân gỗ, có phần tán mọc xòe rộng, trải khắp sườn đồi, triền núi. Bông hoa bản dày, có 5 cánh, màu hồng sắc. Khi nở hoa kết chùm lại, nhị hoa dài có màu đỏ rực rỡ.&nbsp;</p><p>Loài hoa này có gắn bó mật thiết với cuộc sống của đồng bào người Mông nơi đây. Họ quan niệm rằng mùa Xuân là thời khắc đất trời chuyển mình, sau một năm lao động vất vả, mùa vàng bội thu, thóc lúa đầy nhà nên người dân sẽ cùng nhau ăn mừng.</p><p>Khi những cây tớ dày nở hoa hồng rực rỡ cả một góc trời cũng là lúc các&nbsp;chàng trai, cô gái Mông xúng xính trong bộ váy mới, luyện khèn, chuẩn bị quả Pao để chơi Tết, du xuân.</p><p>Loài hoa Tớ dày gắn liền với đời sống nhiều thế hệ người Mông vùng cao Mù Cang Chải. Loại hoa có sức sống mãnh liệt, tượng trưng cho sức sống của con người nơi đây.&nbsp;</p><p>Sau khoảng thời gian đó tuy chưa tàn hết nhưng màu sắc cũng sẽ phai nhưng vẫn giữ được vẻ đẹp e lệ, cuốn hút.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-5.jpg" alt="Hoa tớ dày bên những cung đường quanh co" width="1920" height="1493"></p><p><i>Hoa tớ dày và bản làng Mù Cang Chải cùng những con đường quanh co, uốn lượn</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-1.jpg" alt="Khoảnh khắc đáng yêu của đồng bào dân tộc" width="1920" height="1280"></i></p><p><i>Cô gái và chàng trai bản thổi nhau nghe khúc nhạc tình lãng mạn với cành hoa thớ dày sau lưng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-2.jpg" alt="Nụ cười hồn hậu của người dân tộc" width="1920" height="1280"></i></p><p><i>Những đứa trẻ lớn lên tại vùng cao nghèo khó nhưng sức sống mãnh liệt hệt như bông hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-yen-bai.jpg" alt="Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng" width="1920" height="1280"></i></p><p><i>Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day.jpg" alt="Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn" width="1920" height="1280"></i></p><p><i>Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn nhưng lúc nào cũng ngập tràn niềm vui</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/sac-hoa-to-day.jpg" alt="Vẻ đẹp của hoa thớ dày từ trên cao xuống" width="1920" height="1280"></i></p><p><i>Vẻ đẹp của hoa thớ dày từ trên cao xuống</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/tinh-yeu-doi-lua-duoi-hoa-to-day.jpg" alt="Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng" width="1920" height="1280"></i></p><p><i>Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day-mu-cang-chai.jpg" alt="Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày" width="1920" height="1363"></i></p><p><i>Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day.jpg" alt="Vẻ đẹp xao xuyến của từng bông hoa" width="1920" height="1271"></i></p><p><i>Vẻ đẹp xao xuyến của từng bông hoa</i></p><p>Còn chần chờ gì nữa mà không lên lịch ngay cho mình để ngắm sắc đẹp thướt tha, yêu kiều, dịu dàng của loài hoa này trên rẻo cao Mù Cang Chải thôi nào bạn ơi!</p>', N'/Images/20241216_132654.png', N'e6ccdf5c-489e-4b05-92cf-3af24acd7765', CAST(N'2024-12-16' AS Date), 2, N'Ẩm thực ba miền')
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (1008, N'Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái', N'<h3><strong>Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái</strong></h3><p>05/07/2024 - Admin Gostay</p><p><i>Nhắc đến Mù Cang Chải, nhiều người sẽ nghĩ ngay tới những thửa ruộng bậc thang mênh mông tít tắp, trải dài khắp nơi. Thế nhưng, Mù Cang Chải còn được gắn liền với một loài hoa có tên vô cùng đặc biệt - hoa tớ dày. Hãy cùng chúng tôi ngắm nhìn sắc đẹp của loài hoa độc đáo này trong bài viết dưới đây nhé!</i></p><h2><strong>Sắc hoa tớ dày miền di sản</strong></h2><p>Tớ dày "uống sương", "ngậm gió" lạnh những ngày mùa đông rét buốt của vùng cao Mù Cang Chải để rồi khi xuân về, từng bông hoa hồng rực bung nở "mạnh mẽ" cũng giống như sức sống của người nới đây.</p><p>Hoa nở hồng của nương đồi, sườn non cao, dọc con đường ngoằn nghèo vào bản hay bên hiên những mái nhà tranh phảng phất khói sương. Tất cả tạo nên một bức tranh vừa hùng vĩ nhưng cũng vô cùng lãng mạn, mềm mại làm say đắm trái tim người du khách.</p><p>Đây là loài hoa thuộc họ đào, được người Mông gọi bằng tên "Pằng Tớ dày", theo tiếng việt có nghĩa là "hoa đào rừng".</p><p>Cây thuộc giống thân gỗ, có phần tán mọc xòe rộng, trải khắp sườn đồi, triền núi. Bông hoa bản dày, có 5 cánh, màu hồng sắc. Khi nở hoa kết chùm lại, nhị hoa dài có màu đỏ rực rỡ.&nbsp;</p><p>Loài hoa này có gắn bó mật thiết với cuộc sống của đồng bào người Mông nơi đây. Họ quan niệm rằng mùa Xuân là thời khắc đất trời chuyển mình, sau một năm lao động vất vả, mùa vàng bội thu, thóc lúa đầy nhà nên người dân sẽ cùng nhau ăn mừng.</p><p>Khi những cây tớ dày nở hoa hồng rực rỡ cả một góc trời cũng là lúc các&nbsp;chàng trai, cô gái Mông xúng xính trong bộ váy mới, luyện khèn, chuẩn bị quả Pao để chơi Tết, du xuân.</p><p>Loài hoa Tớ dày gắn liền với đời sống nhiều thế hệ người Mông vùng cao Mù Cang Chải. Loại hoa có sức sống mãnh liệt, tượng trưng cho sức sống của con người nơi đây.&nbsp;</p><p>Sau khoảng thời gian đó tuy chưa tàn hết nhưng màu sắc cũng sẽ phai nhưng vẫn giữ được vẻ đẹp e lệ, cuốn hút.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-5.jpg" alt="Hoa tớ dày bên những cung đường quanh co" width="1920" height="1493"></p><p><i>Hoa tớ dày và bản làng Mù Cang Chải cùng những con đường quanh co, uốn lượn</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-1.jpg" alt="Khoảnh khắc đáng yêu của đồng bào dân tộc" width="1920" height="1280"></i></p><p><i>Cô gái và chàng trai bản thổi nhau nghe khúc nhạc tình lãng mạn với cành hoa thớ dày sau lưng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-2.jpg" alt="Nụ cười hồn hậu của người dân tộc" width="1920" height="1280"></i></p><p><i>Những đứa trẻ lớn lên tại vùng cao nghèo khó nhưng sức sống mãnh liệt hệt như bông hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-yen-bai.jpg" alt="Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng" width="1920" height="1280"></i></p><p><i>Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day.jpg" alt="Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn" width="1920" height="1280"></i></p><p><i>Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn nhưng lúc nào cũng ngập tràn niềm vui</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/sac-hoa-to-day.jpg" alt="Vẻ đẹp của hoa thớ dày từ trên cao xuống" width="1920" height="1280"></i></p><p><i>Vẻ đẹp của hoa thớ dày từ trên cao xuống</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/tinh-yeu-doi-lua-duoi-hoa-to-day.jpg" alt="Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng" width="1920" height="1280"></i></p><p><i>Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day-mu-cang-chai.jpg" alt="Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày" width="1920" height="1363"></i></p><p><i>Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day.jpg" alt="Vẻ đẹp xao xuyến của từng bông hoa" width="1920" height="1271"></i></p><p><i>Vẻ đẹp xao xuyến của từng bông hoa</i></p><p>Còn chần chờ gì nữa mà không lên lịch ngay cho mình để ngắm sắc đẹp thướt tha, yêu kiều, dịu dàng của loài hoa này trên rẻo cao Mù Cang Chải thôi nào bạn ơi!</p>', N'/Images/20241216_132248.jpg', N'e6ccdf5c-489e-4b05-92cf-3af24acd7765', CAST(N'2024-12-16' AS Date), 1, N'Ẩm thực ba miền')
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (1009, N'Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái', N'<h3><strong>Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái</strong></h3><p>05/07/2024 - Admin Gostay</p><p><i>Nhắc đến Mù Cang Chải, nhiều người sẽ nghĩ ngay tới những thửa ruộng bậc thang mênh mông tít tắp, trải dài khắp nơi. Thế nhưng, Mù Cang Chải còn được gắn liền với một loài hoa có tên vô cùng đặc biệt - hoa tớ dày. Hãy cùng chúng tôi ngắm nhìn sắc đẹp của loài hoa độc đáo này trong bài viết dưới đây nhé!</i></p><h2><strong>Sắc hoa tớ dày miền di sản</strong></h2><p>Tớ dày "uống sương", "ngậm gió" lạnh những ngày mùa đông rét buốt của vùng cao Mù Cang Chải để rồi khi xuân về, từng bông hoa hồng rực bung nở "mạnh mẽ" cũng giống như sức sống của người nới đây.</p><p>Hoa nở hồng của nương đồi, sườn non cao, dọc con đường ngoằn nghèo vào bản hay bên hiên những mái nhà tranh phảng phất khói sương. Tất cả tạo nên một bức tranh vừa hùng vĩ nhưng cũng vô cùng lãng mạn, mềm mại làm say đắm trái tim người du khách.</p><p>Đây là loài hoa thuộc họ đào, được người Mông gọi bằng tên "Pằng Tớ dày", theo tiếng việt có nghĩa là "hoa đào rừng".</p><p>Cây thuộc giống thân gỗ, có phần tán mọc xòe rộng, trải khắp sườn đồi, triền núi. Bông hoa bản dày, có 5 cánh, màu hồng sắc. Khi nở hoa kết chùm lại, nhị hoa dài có màu đỏ rực rỡ.&nbsp;</p><p>Loài hoa này có gắn bó mật thiết với cuộc sống của đồng bào người Mông nơi đây. Họ quan niệm rằng mùa Xuân là thời khắc đất trời chuyển mình, sau một năm lao động vất vả, mùa vàng bội thu, thóc lúa đầy nhà nên người dân sẽ cùng nhau ăn mừng.</p><p>Khi những cây tớ dày nở hoa hồng rực rỡ cả một góc trời cũng là lúc các&nbsp;chàng trai, cô gái Mông xúng xính trong bộ váy mới, luyện khèn, chuẩn bị quả Pao để chơi Tết, du xuân.</p><p>Loài hoa Tớ dày gắn liền với đời sống nhiều thế hệ người Mông vùng cao Mù Cang Chải. Loại hoa có sức sống mãnh liệt, tượng trưng cho sức sống của con người nơi đây.&nbsp;</p><p>Sau khoảng thời gian đó tuy chưa tàn hết nhưng màu sắc cũng sẽ phai nhưng vẫn giữ được vẻ đẹp e lệ, cuốn hút.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-5.jpg" alt="Hoa tớ dày bên những cung đường quanh co" width="1920" height="1493"></p><p><i>Hoa tớ dày và bản làng Mù Cang Chải cùng những con đường quanh co, uốn lượn</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-1.jpg" alt="Khoảnh khắc đáng yêu của đồng bào dân tộc" width="1920" height="1280"></i></p><p><i>Cô gái và chàng trai bản thổi nhau nghe khúc nhạc tình lãng mạn với cành hoa thớ dày sau lưng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-2.jpg" alt="Nụ cười hồn hậu của người dân tộc" width="1920" height="1280"></i></p><p><i>Những đứa trẻ lớn lên tại vùng cao nghèo khó nhưng sức sống mãnh liệt hệt như bông hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-yen-bai.jpg" alt="Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng" width="1920" height="1280"></i></p><p><i>Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day.jpg" alt="Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn" width="1920" height="1280"></i></p><p><i>Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn nhưng lúc nào cũng ngập tràn niềm vui</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/sac-hoa-to-day.jpg" alt="Vẻ đẹp của hoa thớ dày từ trên cao xuống" width="1920" height="1280"></i></p><p><i>Vẻ đẹp của hoa thớ dày từ trên cao xuống</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/tinh-yeu-doi-lua-duoi-hoa-to-day.jpg" alt="Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng" width="1920" height="1280"></i></p><p><i>Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day-mu-cang-chai.jpg" alt="Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày" width="1920" height="1363"></i></p><p><i>Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day.jpg" alt="Vẻ đẹp xao xuyến của từng bông hoa" width="1920" height="1271"></i></p><p><i>Vẻ đẹp xao xuyến của từng bông hoa</i></p><p>Còn chần chờ gì nữa mà không lên lịch ngay cho mình để ngắm sắc đẹp thướt tha, yêu kiều, dịu dàng của loài hoa này trên rẻo cao Mù Cang Chải thôi nào bạn ơi!</p>', N'/Images/20241216_132300.jpg', N'e6ccdf5c-489e-4b05-92cf-3af24acd7765', CAST(N'2024-12-16' AS Date), 1, N'Ẩm thực ba miền')
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (1015, N'Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái', N'<h3><strong>Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái</strong></h3><p>05/07/2024 - Admin Gostay</p><p><i>Nhắc đến Mù Cang Chải, nhiều người sẽ nghĩ ngay tới những thửa ruộng bậc thang mênh mông tít tắp, trải dài khắp nơi. Thế nhưng, Mù Cang Chải còn được gắn liền với một loài hoa có tên vô cùng đặc biệt - hoa tớ dày. Hãy cùng chúng tôi ngắm nhìn sắc đẹp của loài hoa độc đáo này trong bài viết dưới đây nhé!</i></p><h2><strong>Sắc hoa tớ dày miền di sản</strong></h2><p>Tớ dày "uống sương", "ngậm gió" lạnh những ngày mùa đông rét buốt của vùng cao Mù Cang Chải để rồi khi xuân về, từng bông hoa hồng rực bung nở "mạnh mẽ" cũng giống như sức sống của người nới đây.</p><p>Hoa nở hồng của nương đồi, sườn non cao, dọc con đường ngoằn nghèo vào bản hay bên hiên những mái nhà tranh phảng phất khói sương. Tất cả tạo nên một bức tranh vừa hùng vĩ nhưng cũng vô cùng lãng mạn, mềm mại làm say đắm trái tim người du khách.</p><p>Đây là loài hoa thuộc họ đào, được người Mông gọi bằng tên "Pằng Tớ dày", theo tiếng việt có nghĩa là "hoa đào rừng".</p><p>Cây thuộc giống thân gỗ, có phần tán mọc xòe rộng, trải khắp sườn đồi, triền núi. Bông hoa bản dày, có 5 cánh, màu hồng sắc. Khi nở hoa kết chùm lại, nhị hoa dài có màu đỏ rực rỡ.&nbsp;</p><p>Loài hoa này có gắn bó mật thiết với cuộc sống của đồng bào người Mông nơi đây. Họ quan niệm rằng mùa Xuân là thời khắc đất trời chuyển mình, sau một năm lao động vất vả, mùa vàng bội thu, thóc lúa đầy nhà nên người dân sẽ cùng nhau ăn mừng.</p><p>Khi những cây tớ dày nở hoa hồng rực rỡ cả một góc trời cũng là lúc các&nbsp;chàng trai, cô gái Mông xúng xính trong bộ váy mới, luyện khèn, chuẩn bị quả Pao để chơi Tết, du xuân.</p><p>Loài hoa Tớ dày gắn liền với đời sống nhiều thế hệ người Mông vùng cao Mù Cang Chải. Loại hoa có sức sống mãnh liệt, tượng trưng cho sức sống của con người nơi đây.&nbsp;</p><p>Sau khoảng thời gian đó tuy chưa tàn hết nhưng màu sắc cũng sẽ phai nhưng vẫn giữ được vẻ đẹp e lệ, cuốn hút.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-5.jpg" alt="Hoa tớ dày bên những cung đường quanh co" width="1920" height="1493"></p><p><i>Hoa tớ dày và bản làng Mù Cang Chải cùng những con đường quanh co, uốn lượn</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-1.jpg" alt="Khoảnh khắc đáng yêu của đồng bào dân tộc" width="1920" height="1280"></i></p><p><i>Cô gái và chàng trai bản thổi nhau nghe khúc nhạc tình lãng mạn với cành hoa thớ dày sau lưng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-2.jpg" alt="Nụ cười hồn hậu của người dân tộc" width="1920" height="1280"></i></p><p><i>Những đứa trẻ lớn lên tại vùng cao nghèo khó nhưng sức sống mãnh liệt hệt như bông hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-yen-bai.jpg" alt="Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng" width="1920" height="1280"></i></p><p><i>Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day.jpg" alt="Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn" width="1920" height="1280"></i></p><p><i>Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn nhưng lúc nào cũng ngập tràn niềm vui</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/sac-hoa-to-day.jpg" alt="Vẻ đẹp của hoa thớ dày từ trên cao xuống" width="1920" height="1280"></i></p><p><i>Vẻ đẹp của hoa thớ dày từ trên cao xuống</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/tinh-yeu-doi-lua-duoi-hoa-to-day.jpg" alt="Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng" width="1920" height="1280"></i></p><p><i>Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day-mu-cang-chai.jpg" alt="Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày" width="1920" height="1363"></i></p><p><i>Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day.jpg" alt="Vẻ đẹp xao xuyến của từng bông hoa" width="1920" height="1271"></i></p><p><i>Vẻ đẹp xao xuyến của từng bông hoa</i></p><p>Còn chần chờ gì nữa mà không lên lịch ngay cho mình để ngắm sắc đẹp thướt tha, yêu kiều, dịu dàng của loài hoa này trên rẻo cao Mù Cang Chải thôi nào bạn ơi!</p>', N'/Images/20241216_133221.jpg', N'e6ccdf5c-489e-4b05-92cf-3af24acd7765', CAST(N'2024-12-16' AS Date), 2, N'Ẩm thực ba miền')
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (1016, N'Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái', N'<h3><strong>Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái</strong></h3><p>05/07/2024 - Admin Gostay</p><p><i>Nhắc đến Mù Cang Chải, nhiều người sẽ nghĩ ngay tới những thửa ruộng bậc thang mênh mông tít tắp, trải dài khắp nơi. Thế nhưng, Mù Cang Chải còn được gắn liền với một loài hoa có tên vô cùng đặc biệt - hoa tớ dày. Hãy cùng chúng tôi ngắm nhìn sắc đẹp của loài hoa độc đáo này trong bài viết dưới đây nhé!</i></p><h2><strong>Sắc hoa tớ dày miền di sản</strong></h2><p>Tớ dày "uống sương", "ngậm gió" lạnh những ngày mùa đông rét buốt của vùng cao Mù Cang Chải để rồi khi xuân về, từng bông hoa hồng rực bung nở "mạnh mẽ" cũng giống như sức sống của người nới đây.</p><p>Hoa nở hồng của nương đồi, sườn non cao, dọc con đường ngoằn nghèo vào bản hay bên hiên những mái nhà tranh phảng phất khói sương. Tất cả tạo nên một bức tranh vừa hùng vĩ nhưng cũng vô cùng lãng mạn, mềm mại làm say đắm trái tim người du khách.</p><p>Đây là loài hoa thuộc họ đào, được người Mông gọi bằng tên "Pằng Tớ dày", theo tiếng việt có nghĩa là "hoa đào rừng".</p><p>Cây thuộc giống thân gỗ, có phần tán mọc xòe rộng, trải khắp sườn đồi, triền núi. Bông hoa bản dày, có 5 cánh, màu hồng sắc. Khi nở hoa kết chùm lại, nhị hoa dài có màu đỏ rực rỡ.&nbsp;</p><p>Loài hoa này có gắn bó mật thiết với cuộc sống của đồng bào người Mông nơi đây. Họ quan niệm rằng mùa Xuân là thời khắc đất trời chuyển mình, sau một năm lao động vất vả, mùa vàng bội thu, thóc lúa đầy nhà nên người dân sẽ cùng nhau ăn mừng.</p><p>Khi những cây tớ dày nở hoa hồng rực rỡ cả một góc trời cũng là lúc các&nbsp;chàng trai, cô gái Mông xúng xính trong bộ váy mới, luyện khèn, chuẩn bị quả Pao để chơi Tết, du xuân.</p><p>Loài hoa Tớ dày gắn liền với đời sống nhiều thế hệ người Mông vùng cao Mù Cang Chải. Loại hoa có sức sống mãnh liệt, tượng trưng cho sức sống của con người nơi đây.&nbsp;</p><p>Sau khoảng thời gian đó tuy chưa tàn hết nhưng màu sắc cũng sẽ phai nhưng vẫn giữ được vẻ đẹp e lệ, cuốn hút.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-5.jpg" alt="Hoa tớ dày bên những cung đường quanh co" width="1920" height="1493"></p><p><i>Hoa tớ dày và bản làng Mù Cang Chải cùng những con đường quanh co, uốn lượn</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-1.jpg" alt="Khoảnh khắc đáng yêu của đồng bào dân tộc" width="1920" height="1280"></i></p><p><i>Cô gái và chàng trai bản thổi nhau nghe khúc nhạc tình lãng mạn với cành hoa thớ dày sau lưng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-2.jpg" alt="Nụ cười hồn hậu của người dân tộc" width="1920" height="1280"></i></p><p><i>Những đứa trẻ lớn lên tại vùng cao nghèo khó nhưng sức sống mãnh liệt hệt như bông hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-yen-bai.jpg" alt="Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng" width="1920" height="1280"></i></p><p><i>Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day.jpg" alt="Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn" width="1920" height="1280"></i></p><p><i>Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn nhưng lúc nào cũng ngập tràn niềm vui</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/sac-hoa-to-day.jpg" alt="Vẻ đẹp của hoa thớ dày từ trên cao xuống" width="1920" height="1280"></i></p><p><i>Vẻ đẹp của hoa thớ dày từ trên cao xuống</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/tinh-yeu-doi-lua-duoi-hoa-to-day.jpg" alt="Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng" width="1920" height="1280"></i></p><p><i>Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day-mu-cang-chai.jpg" alt="Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày" width="1920" height="1363"></i></p><p><i>Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day.jpg" alt="Vẻ đẹp xao xuyến của từng bông hoa" width="1920" height="1271"></i></p><p><i>Vẻ đẹp xao xuyến của từng bông hoa</i></p><p>Còn chần chờ gì nữa mà không lên lịch ngay cho mình để ngắm sắc đẹp thướt tha, yêu kiều, dịu dàng của loài hoa này trên rẻo cao Mù Cang Chải thôi nào bạn ơi!</p>', N'/Images/20241216_133620.jpeg', N'e6ccdf5c-489e-4b05-92cf-3af24acd7765', CAST(N'2024-12-16' AS Date), 3, N'Nếu như có một đám cưới nào mà nhà trai không cần phải đón dâu thì đó chính là lễ cưới của người')
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (1017, N'Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái', N'<h3><strong>Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái</strong></h3><p>05/07/2024 - Admin Gostay</p><p><i>Nhắc đến Mù Cang Chải, nhiều người sẽ nghĩ ngay tới những thửa ruộng bậc thang mênh mông tít tắp, trải dài khắp nơi. Thế nhưng, Mù Cang Chải còn được gắn liền với một loài hoa có tên vô cùng đặc biệt - hoa tớ dày. Hãy cùng chúng tôi ngắm nhìn sắc đẹp của loài hoa độc đáo này trong bài viết dưới đây nhé!</i></p><h2><strong>Sắc hoa tớ dày miền di sản</strong></h2><p>Tớ dày "uống sương", "ngậm gió" lạnh những ngày mùa đông rét buốt của vùng cao Mù Cang Chải để rồi khi xuân về, từng bông hoa hồng rực bung nở "mạnh mẽ" cũng giống như sức sống của người nới đây.</p><p>Hoa nở hồng của nương đồi, sườn non cao, dọc con đường ngoằn nghèo vào bản hay bên hiên những mái nhà tranh phảng phất khói sương. Tất cả tạo nên một bức tranh vừa hùng vĩ nhưng cũng vô cùng lãng mạn, mềm mại làm say đắm trái tim người du khách.</p><p>Đây là loài hoa thuộc họ đào, được người Mông gọi bằng tên "Pằng Tớ dày", theo tiếng việt có nghĩa là "hoa đào rừng".</p><p>Cây thuộc giống thân gỗ, có phần tán mọc xòe rộng, trải khắp sườn đồi, triền núi. Bông hoa bản dày, có 5 cánh, màu hồng sắc. Khi nở hoa kết chùm lại, nhị hoa dài có màu đỏ rực rỡ.&nbsp;</p><p>Loài hoa này có gắn bó mật thiết với cuộc sống của đồng bào người Mông nơi đây. Họ quan niệm rằng mùa Xuân là thời khắc đất trời chuyển mình, sau một năm lao động vất vả, mùa vàng bội thu, thóc lúa đầy nhà nên người dân sẽ cùng nhau ăn mừng.</p><p>Khi những cây tớ dày nở hoa hồng rực rỡ cả một góc trời cũng là lúc các&nbsp;chàng trai, cô gái Mông xúng xính trong bộ váy mới, luyện khèn, chuẩn bị quả Pao để chơi Tết, du xuân.</p><p>Loài hoa Tớ dày gắn liền với đời sống nhiều thế hệ người Mông vùng cao Mù Cang Chải. Loại hoa có sức sống mãnh liệt, tượng trưng cho sức sống của con người nơi đây.&nbsp;</p><p>Sau khoảng thời gian đó tuy chưa tàn hết nhưng màu sắc cũng sẽ phai nhưng vẫn giữ được vẻ đẹp e lệ, cuốn hút.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-5.jpg" alt="Hoa tớ dày bên những cung đường quanh co" width="1920" height="1493"></p><p><i>Hoa tớ dày và bản làng Mù Cang Chải cùng những con đường quanh co, uốn lượn</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-1.jpg" alt="Khoảnh khắc đáng yêu của đồng bào dân tộc" width="1920" height="1280"></i></p><p><i>Cô gái và chàng trai bản thổi nhau nghe khúc nhạc tình lãng mạn với cành hoa thớ dày sau lưng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-2.jpg" alt="Nụ cười hồn hậu của người dân tộc" width="1920" height="1280"></i></p><p><i>Những đứa trẻ lớn lên tại vùng cao nghèo khó nhưng sức sống mãnh liệt hệt như bông hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-yen-bai.jpg" alt="Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng" width="1920" height="1280"></i></p><p><i>Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day.jpg" alt="Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn" width="1920" height="1280"></i></p><p><i>Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn nhưng lúc nào cũng ngập tràn niềm vui</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/sac-hoa-to-day.jpg" alt="Vẻ đẹp của hoa thớ dày từ trên cao xuống" width="1920" height="1280"></i></p><p><i>Vẻ đẹp của hoa thớ dày từ trên cao xuống</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/tinh-yeu-doi-lua-duoi-hoa-to-day.jpg" alt="Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng" width="1920" height="1280"></i></p><p><i>Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day-mu-cang-chai.jpg" alt="Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày" width="1920" height="1363"></i></p><p><i>Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day.jpg" alt="Vẻ đẹp xao xuyến của từng bông hoa" width="1920" height="1271"></i></p><p><i>Vẻ đẹp xao xuyến của từng bông hoa</i></p><p>Còn chần chờ gì nữa mà không lên lịch ngay cho mình để ngắm sắc đẹp thướt tha, yêu kiều, dịu dàng của loài hoa này trên rẻo cao Mù Cang Chải thôi nào bạn ơi!</p>', N'/Images/20241216_133701.jpg', N'e6ccdf5c-489e-4b05-92cf-3af24acd7765', CAST(N'2024-12-16' AS Date), 3, N'Nếu như có một đám cưới nào mà nhà trai không cần phải đón dâu thì đó chính là lễ cưới của người')
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (1018, N'Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái', N'<h3><strong>Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái</strong></h3><p>05/07/2024 - Admin Gostay</p><p><i>Nhắc đến Mù Cang Chải, nhiều người sẽ nghĩ ngay tới những thửa ruộng bậc thang mênh mông tít tắp, trải dài khắp nơi. Thế nhưng, Mù Cang Chải còn được gắn liền với một loài hoa có tên vô cùng đặc biệt - hoa tớ dày. Hãy cùng chúng tôi ngắm nhìn sắc đẹp của loài hoa độc đáo này trong bài viết dưới đây nhé!</i></p><h2><strong>Sắc hoa tớ dày miền di sản</strong></h2><p>Tớ dày "uống sương", "ngậm gió" lạnh những ngày mùa đông rét buốt của vùng cao Mù Cang Chải để rồi khi xuân về, từng bông hoa hồng rực bung nở "mạnh mẽ" cũng giống như sức sống của người nới đây.</p><p>Hoa nở hồng của nương đồi, sườn non cao, dọc con đường ngoằn nghèo vào bản hay bên hiên những mái nhà tranh phảng phất khói sương. Tất cả tạo nên một bức tranh vừa hùng vĩ nhưng cũng vô cùng lãng mạn, mềm mại làm say đắm trái tim người du khách.</p><p>Đây là loài hoa thuộc họ đào, được người Mông gọi bằng tên "Pằng Tớ dày", theo tiếng việt có nghĩa là "hoa đào rừng".</p><p>Cây thuộc giống thân gỗ, có phần tán mọc xòe rộng, trải khắp sườn đồi, triền núi. Bông hoa bản dày, có 5 cánh, màu hồng sắc. Khi nở hoa kết chùm lại, nhị hoa dài có màu đỏ rực rỡ.&nbsp;</p><p>Loài hoa này có gắn bó mật thiết với cuộc sống của đồng bào người Mông nơi đây. Họ quan niệm rằng mùa Xuân là thời khắc đất trời chuyển mình, sau một năm lao động vất vả, mùa vàng bội thu, thóc lúa đầy nhà nên người dân sẽ cùng nhau ăn mừng.</p><p>Khi những cây tớ dày nở hoa hồng rực rỡ cả một góc trời cũng là lúc các&nbsp;chàng trai, cô gái Mông xúng xính trong bộ váy mới, luyện khèn, chuẩn bị quả Pao để chơi Tết, du xuân.</p><p>Loài hoa Tớ dày gắn liền với đời sống nhiều thế hệ người Mông vùng cao Mù Cang Chải. Loại hoa có sức sống mãnh liệt, tượng trưng cho sức sống của con người nơi đây.&nbsp;</p><p>Sau khoảng thời gian đó tuy chưa tàn hết nhưng màu sắc cũng sẽ phai nhưng vẫn giữ được vẻ đẹp e lệ, cuốn hút.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-5.jpg" alt="Hoa tớ dày bên những cung đường quanh co" width="1920" height="1493"></p><p><i>Hoa tớ dày và bản làng Mù Cang Chải cùng những con đường quanh co, uốn lượn</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-1.jpg" alt="Khoảnh khắc đáng yêu của đồng bào dân tộc" width="1920" height="1280"></i></p><p><i>Cô gái và chàng trai bản thổi nhau nghe khúc nhạc tình lãng mạn với cành hoa thớ dày sau lưng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-2.jpg" alt="Nụ cười hồn hậu của người dân tộc" width="1920" height="1280"></i></p><p><i>Những đứa trẻ lớn lên tại vùng cao nghèo khó nhưng sức sống mãnh liệt hệt như bông hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-yen-bai.jpg" alt="Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng" width="1920" height="1280"></i></p><p><i>Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day.jpg" alt="Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn" width="1920" height="1280"></i></p><p><i>Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn nhưng lúc nào cũng ngập tràn niềm vui</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/sac-hoa-to-day.jpg" alt="Vẻ đẹp của hoa thớ dày từ trên cao xuống" width="1920" height="1280"></i></p><p><i>Vẻ đẹp của hoa thớ dày từ trên cao xuống</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/tinh-yeu-doi-lua-duoi-hoa-to-day.jpg" alt="Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng" width="1920" height="1280"></i></p><p><i>Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day-mu-cang-chai.jpg" alt="Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày" width="1920" height="1363"></i></p><p><i>Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day.jpg" alt="Vẻ đẹp xao xuyến của từng bông hoa" width="1920" height="1271"></i></p><p><i>Vẻ đẹp xao xuyến của từng bông hoa</i></p><p>Còn chần chờ gì nữa mà không lên lịch ngay cho mình để ngắm sắc đẹp thướt tha, yêu kiều, dịu dàng của loài hoa này trên rẻo cao Mù Cang Chải thôi nào bạn ơi!</p>', N'/Images/20241216_131322.jpg', N'e6ccdf5c-489e-4b05-92cf-3af24acd7765', CAST(N'2024-12-16' AS Date), 3, N'Nếu như có một đám cưới nào mà nhà trai không cần phải đón dâu thì đó chính là lễ cưới của người')
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (1019, N'Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái', N'<h3><strong>Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái</strong></h3><p>05/07/2024 - Admin Gostay</p><p><i>Nhắc đến Mù Cang Chải, nhiều người sẽ nghĩ ngay tới những thửa ruộng bậc thang mênh mông tít tắp, trải dài khắp nơi. Thế nhưng, Mù Cang Chải còn được gắn liền với một loài hoa có tên vô cùng đặc biệt - hoa tớ dày. Hãy cùng chúng tôi ngắm nhìn sắc đẹp của loài hoa độc đáo này trong bài viết dưới đây nhé!</i></p><h2><strong>Sắc hoa tớ dày miền di sản</strong></h2><p>Tớ dày "uống sương", "ngậm gió" lạnh những ngày mùa đông rét buốt của vùng cao Mù Cang Chải để rồi khi xuân về, từng bông hoa hồng rực bung nở "mạnh mẽ" cũng giống như sức sống của người nới đây.</p><p>Hoa nở hồng của nương đồi, sườn non cao, dọc con đường ngoằn nghèo vào bản hay bên hiên những mái nhà tranh phảng phất khói sương. Tất cả tạo nên một bức tranh vừa hùng vĩ nhưng cũng vô cùng lãng mạn, mềm mại làm say đắm trái tim người du khách.</p><p>Đây là loài hoa thuộc họ đào, được người Mông gọi bằng tên "Pằng Tớ dày", theo tiếng việt có nghĩa là "hoa đào rừng".</p><p>Cây thuộc giống thân gỗ, có phần tán mọc xòe rộng, trải khắp sườn đồi, triền núi. Bông hoa bản dày, có 5 cánh, màu hồng sắc. Khi nở hoa kết chùm lại, nhị hoa dài có màu đỏ rực rỡ.&nbsp;</p><p>Loài hoa này có gắn bó mật thiết với cuộc sống của đồng bào người Mông nơi đây. Họ quan niệm rằng mùa Xuân là thời khắc đất trời chuyển mình, sau một năm lao động vất vả, mùa vàng bội thu, thóc lúa đầy nhà nên người dân sẽ cùng nhau ăn mừng.</p><p>Khi những cây tớ dày nở hoa hồng rực rỡ cả một góc trời cũng là lúc các&nbsp;chàng trai, cô gái Mông xúng xính trong bộ váy mới, luyện khèn, chuẩn bị quả Pao để chơi Tết, du xuân.</p><p>Loài hoa Tớ dày gắn liền với đời sống nhiều thế hệ người Mông vùng cao Mù Cang Chải. Loại hoa có sức sống mãnh liệt, tượng trưng cho sức sống của con người nơi đây.&nbsp;</p><p>Sau khoảng thời gian đó tuy chưa tàn hết nhưng màu sắc cũng sẽ phai nhưng vẫn giữ được vẻ đẹp e lệ, cuốn hút.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-5.jpg" alt="Hoa tớ dày bên những cung đường quanh co" width="1920" height="1493"></p><p><i>Hoa tớ dày và bản làng Mù Cang Chải cùng những con đường quanh co, uốn lượn</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-1.jpg" alt="Khoảnh khắc đáng yêu của đồng bào dân tộc" width="1920" height="1280"></i></p><p><i>Cô gái và chàng trai bản thổi nhau nghe khúc nhạc tình lãng mạn với cành hoa thớ dày sau lưng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-2.jpg" alt="Nụ cười hồn hậu của người dân tộc" width="1920" height="1280"></i></p><p><i>Những đứa trẻ lớn lên tại vùng cao nghèo khó nhưng sức sống mãnh liệt hệt như bông hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-yen-bai.jpg" alt="Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng" width="1920" height="1280"></i></p><p><i>Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day.jpg" alt="Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn" width="1920" height="1280"></i></p><p><i>Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn nhưng lúc nào cũng ngập tràn niềm vui</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/sac-hoa-to-day.jpg" alt="Vẻ đẹp của hoa thớ dày từ trên cao xuống" width="1920" height="1280"></i></p><p><i>Vẻ đẹp của hoa thớ dày từ trên cao xuống</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/tinh-yeu-doi-lua-duoi-hoa-to-day.jpg" alt="Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng" width="1920" height="1280"></i></p><p><i>Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day-mu-cang-chai.jpg" alt="Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày" width="1920" height="1363"></i></p><p><i>Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day.jpg" alt="Vẻ đẹp xao xuyến của từng bông hoa" width="1920" height="1271"></i></p><p><i>Vẻ đẹp xao xuyến của từng bông hoa</i></p><p>Còn chần chờ gì nữa mà không lên lịch ngay cho mình để ngắm sắc đẹp thướt tha, yêu kiều, dịu dàng của loài hoa này trên rẻo cao Mù Cang Chải thôi nào bạn ơi!</p>', N'/Images/20241216_133715.jpg', N'e6ccdf5c-489e-4b05-92cf-3af24acd7765', CAST(N'2024-12-16' AS Date), 3, N'Nếu như có một đám cưới nào mà nhà trai không cần phải đón dâu thì đó chính là lễ cưới của người')
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (1020, N'Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái', N'<h3><strong>Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái</strong></h3><p>05/07/2024 - Admin Gostay</p><p><i>Nhắc đến Mù Cang Chải, nhiều người sẽ nghĩ ngay tới những thửa ruộng bậc thang mênh mông tít tắp, trải dài khắp nơi. Thế nhưng, Mù Cang Chải còn được gắn liền với một loài hoa có tên vô cùng đặc biệt - hoa tớ dày. Hãy cùng chúng tôi ngắm nhìn sắc đẹp của loài hoa độc đáo này trong bài viết dưới đây nhé!</i></p><h2><strong>Sắc hoa tớ dày miền di sản</strong></h2><p>Tớ dày "uống sương", "ngậm gió" lạnh những ngày mùa đông rét buốt của vùng cao Mù Cang Chải để rồi khi xuân về, từng bông hoa hồng rực bung nở "mạnh mẽ" cũng giống như sức sống của người nới đây.</p><p>Hoa nở hồng của nương đồi, sườn non cao, dọc con đường ngoằn nghèo vào bản hay bên hiên những mái nhà tranh phảng phất khói sương. Tất cả tạo nên một bức tranh vừa hùng vĩ nhưng cũng vô cùng lãng mạn, mềm mại làm say đắm trái tim người du khách.</p><p>Đây là loài hoa thuộc họ đào, được người Mông gọi bằng tên "Pằng Tớ dày", theo tiếng việt có nghĩa là "hoa đào rừng".</p><p>Cây thuộc giống thân gỗ, có phần tán mọc xòe rộng, trải khắp sườn đồi, triền núi. Bông hoa bản dày, có 5 cánh, màu hồng sắc. Khi nở hoa kết chùm lại, nhị hoa dài có màu đỏ rực rỡ.&nbsp;</p><p>Loài hoa này có gắn bó mật thiết với cuộc sống của đồng bào người Mông nơi đây. Họ quan niệm rằng mùa Xuân là thời khắc đất trời chuyển mình, sau một năm lao động vất vả, mùa vàng bội thu, thóc lúa đầy nhà nên người dân sẽ cùng nhau ăn mừng.</p><p>Khi những cây tớ dày nở hoa hồng rực rỡ cả một góc trời cũng là lúc các&nbsp;chàng trai, cô gái Mông xúng xính trong bộ váy mới, luyện khèn, chuẩn bị quả Pao để chơi Tết, du xuân.</p><p>Loài hoa Tớ dày gắn liền với đời sống nhiều thế hệ người Mông vùng cao Mù Cang Chải. Loại hoa có sức sống mãnh liệt, tượng trưng cho sức sống của con người nơi đây.&nbsp;</p><p>Sau khoảng thời gian đó tuy chưa tàn hết nhưng màu sắc cũng sẽ phai nhưng vẫn giữ được vẻ đẹp e lệ, cuốn hút.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-5.jpg" alt="Hoa tớ dày bên những cung đường quanh co" width="1920" height="1493"></p><p><i>Hoa tớ dày và bản làng Mù Cang Chải cùng những con đường quanh co, uốn lượn</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-1.jpg" alt="Khoảnh khắc đáng yêu của đồng bào dân tộc" width="1920" height="1280"></i></p><p><i>Cô gái và chàng trai bản thổi nhau nghe khúc nhạc tình lãng mạn với cành hoa thớ dày sau lưng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-2.jpg" alt="Nụ cười hồn hậu của người dân tộc" width="1920" height="1280"></i></p><p><i>Những đứa trẻ lớn lên tại vùng cao nghèo khó nhưng sức sống mãnh liệt hệt như bông hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-yen-bai.jpg" alt="Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng" width="1920" height="1280"></i></p><p><i>Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day.jpg" alt="Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn" width="1920" height="1280"></i></p><p><i>Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn nhưng lúc nào cũng ngập tràn niềm vui</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/sac-hoa-to-day.jpg" alt="Vẻ đẹp của hoa thớ dày từ trên cao xuống" width="1920" height="1280"></i></p><p><i>Vẻ đẹp của hoa thớ dày từ trên cao xuống</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/tinh-yeu-doi-lua-duoi-hoa-to-day.jpg" alt="Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng" width="1920" height="1280"></i></p><p><i>Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day-mu-cang-chai.jpg" alt="Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày" width="1920" height="1363"></i></p><p><i>Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day.jpg" alt="Vẻ đẹp xao xuyến của từng bông hoa" width="1920" height="1271"></i></p><p><i>Vẻ đẹp xao xuyến của từng bông hoa</i></p><p>Còn chần chờ gì nữa mà không lên lịch ngay cho mình để ngắm sắc đẹp thướt tha, yêu kiều, dịu dàng của loài hoa này trên rẻo cao Mù Cang Chải thôi nào bạn ơi!</p>', N'/Images/20241216_133745.jpg', N'e6ccdf5c-489e-4b05-92cf-3af24acd7765', CAST(N'2024-12-16' AS Date), 3, N'Nếu như có một đám cưới nào mà nhà trai không cần phải đón dâu thì đó chính là lễ cưới của người')
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (1021, N'Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái', N'<h3><strong>Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái</strong></h3><p>05/07/2024 - Admin Gostay</p><p><i>Nhắc đến Mù Cang Chải, nhiều người sẽ nghĩ ngay tới những thửa ruộng bậc thang mênh mông tít tắp, trải dài khắp nơi. Thế nhưng, Mù Cang Chải còn được gắn liền với một loài hoa có tên vô cùng đặc biệt - hoa tớ dày. Hãy cùng chúng tôi ngắm nhìn sắc đẹp của loài hoa độc đáo này trong bài viết dưới đây nhé!</i></p><h2><strong>Sắc hoa tớ dày miền di sản</strong></h2><p>Tớ dày "uống sương", "ngậm gió" lạnh những ngày mùa đông rét buốt của vùng cao Mù Cang Chải để rồi khi xuân về, từng bông hoa hồng rực bung nở "mạnh mẽ" cũng giống như sức sống của người nới đây.</p><p>Hoa nở hồng của nương đồi, sườn non cao, dọc con đường ngoằn nghèo vào bản hay bên hiên những mái nhà tranh phảng phất khói sương. Tất cả tạo nên một bức tranh vừa hùng vĩ nhưng cũng vô cùng lãng mạn, mềm mại làm say đắm trái tim người du khách.</p><p>Đây là loài hoa thuộc họ đào, được người Mông gọi bằng tên "Pằng Tớ dày", theo tiếng việt có nghĩa là "hoa đào rừng".</p><p>Cây thuộc giống thân gỗ, có phần tán mọc xòe rộng, trải khắp sườn đồi, triền núi. Bông hoa bản dày, có 5 cánh, màu hồng sắc. Khi nở hoa kết chùm lại, nhị hoa dài có màu đỏ rực rỡ.&nbsp;</p><p>Loài hoa này có gắn bó mật thiết với cuộc sống của đồng bào người Mông nơi đây. Họ quan niệm rằng mùa Xuân là thời khắc đất trời chuyển mình, sau một năm lao động vất vả, mùa vàng bội thu, thóc lúa đầy nhà nên người dân sẽ cùng nhau ăn mừng.</p><p>Khi những cây tớ dày nở hoa hồng rực rỡ cả một góc trời cũng là lúc các&nbsp;chàng trai, cô gái Mông xúng xính trong bộ váy mới, luyện khèn, chuẩn bị quả Pao để chơi Tết, du xuân.</p><p>Loài hoa Tớ dày gắn liền với đời sống nhiều thế hệ người Mông vùng cao Mù Cang Chải. Loại hoa có sức sống mãnh liệt, tượng trưng cho sức sống của con người nơi đây.&nbsp;</p><p>Sau khoảng thời gian đó tuy chưa tàn hết nhưng màu sắc cũng sẽ phai nhưng vẫn giữ được vẻ đẹp e lệ, cuốn hút.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-5.jpg" alt="Hoa tớ dày bên những cung đường quanh co" width="1920" height="1493"></p><p><i>Hoa tớ dày và bản làng Mù Cang Chải cùng những con đường quanh co, uốn lượn</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-1.jpg" alt="Khoảnh khắc đáng yêu của đồng bào dân tộc" width="1920" height="1280"></i></p><p><i>Cô gái và chàng trai bản thổi nhau nghe khúc nhạc tình lãng mạn với cành hoa thớ dày sau lưng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-2.jpg" alt="Nụ cười hồn hậu của người dân tộc" width="1920" height="1280"></i></p><p><i>Những đứa trẻ lớn lên tại vùng cao nghèo khó nhưng sức sống mãnh liệt hệt như bông hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-yen-bai.jpg" alt="Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng" width="1920" height="1280"></i></p><p><i>Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day.jpg" alt="Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn" width="1920" height="1280"></i></p><p><i>Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn nhưng lúc nào cũng ngập tràn niềm vui</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/sac-hoa-to-day.jpg" alt="Vẻ đẹp của hoa thớ dày từ trên cao xuống" width="1920" height="1280"></i></p><p><i>Vẻ đẹp của hoa thớ dày từ trên cao xuống</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/tinh-yeu-doi-lua-duoi-hoa-to-day.jpg" alt="Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng" width="1920" height="1280"></i></p><p><i>Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day-mu-cang-chai.jpg" alt="Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày" width="1920" height="1363"></i></p><p><i>Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day.jpg" alt="Vẻ đẹp xao xuyến của từng bông hoa" width="1920" height="1271"></i></p><p><i>Vẻ đẹp xao xuyến của từng bông hoa</i></p><p>Còn chần chờ gì nữa mà không lên lịch ngay cho mình để ngắm sắc đẹp thướt tha, yêu kiều, dịu dàng của loài hoa này trên rẻo cao Mù Cang Chải thôi nào bạn ơi!</p>', N'/Images/20241216_131323.jpg', N'e6ccdf5c-489e-4b05-92cf-3af24acd7765', CAST(N'2024-12-16' AS Date), 3, N'Nếu như có một đám cưới nào mà nhà trai không cần phải đón dâu thì đó chính là lễ cưới của người')
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (1022, N'Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái', N'<h3><strong>Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái</strong></h3><p>05/07/2024 - Admin Gostay</p><p><i>Nhắc đến Mù Cang Chải, nhiều người sẽ nghĩ ngay tới những thửa ruộng bậc thang mênh mông tít tắp, trải dài khắp nơi. Thế nhưng, Mù Cang Chải còn được gắn liền với một loài hoa có tên vô cùng đặc biệt - hoa tớ dày. Hãy cùng chúng tôi ngắm nhìn sắc đẹp của loài hoa độc đáo này trong bài viết dưới đây nhé!</i></p><h2><strong>Sắc hoa tớ dày miền di sản</strong></h2><p>Tớ dày "uống sương", "ngậm gió" lạnh những ngày mùa đông rét buốt của vùng cao Mù Cang Chải để rồi khi xuân về, từng bông hoa hồng rực bung nở "mạnh mẽ" cũng giống như sức sống của người nới đây.</p><p>Hoa nở hồng của nương đồi, sườn non cao, dọc con đường ngoằn nghèo vào bản hay bên hiên những mái nhà tranh phảng phất khói sương. Tất cả tạo nên một bức tranh vừa hùng vĩ nhưng cũng vô cùng lãng mạn, mềm mại làm say đắm trái tim người du khách.</p><p>Đây là loài hoa thuộc họ đào, được người Mông gọi bằng tên "Pằng Tớ dày", theo tiếng việt có nghĩa là "hoa đào rừng".</p><p>Cây thuộc giống thân gỗ, có phần tán mọc xòe rộng, trải khắp sườn đồi, triền núi. Bông hoa bản dày, có 5 cánh, màu hồng sắc. Khi nở hoa kết chùm lại, nhị hoa dài có màu đỏ rực rỡ.&nbsp;</p><p>Loài hoa này có gắn bó mật thiết với cuộc sống của đồng bào người Mông nơi đây. Họ quan niệm rằng mùa Xuân là thời khắc đất trời chuyển mình, sau một năm lao động vất vả, mùa vàng bội thu, thóc lúa đầy nhà nên người dân sẽ cùng nhau ăn mừng.</p><p>Khi những cây tớ dày nở hoa hồng rực rỡ cả một góc trời cũng là lúc các&nbsp;chàng trai, cô gái Mông xúng xính trong bộ váy mới, luyện khèn, chuẩn bị quả Pao để chơi Tết, du xuân.</p><p>Loài hoa Tớ dày gắn liền với đời sống nhiều thế hệ người Mông vùng cao Mù Cang Chải. Loại hoa có sức sống mãnh liệt, tượng trưng cho sức sống của con người nơi đây.&nbsp;</p><p>Sau khoảng thời gian đó tuy chưa tàn hết nhưng màu sắc cũng sẽ phai nhưng vẫn giữ được vẻ đẹp e lệ, cuốn hút.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-5.jpg" alt="Hoa tớ dày bên những cung đường quanh co" width="1920" height="1493"></p><p><i>Hoa tớ dày và bản làng Mù Cang Chải cùng những con đường quanh co, uốn lượn</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-1.jpg" alt="Khoảnh khắc đáng yêu của đồng bào dân tộc" width="1920" height="1280"></i></p><p><i>Cô gái và chàng trai bản thổi nhau nghe khúc nhạc tình lãng mạn với cành hoa thớ dày sau lưng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-2.jpg" alt="Nụ cười hồn hậu của người dân tộc" width="1920" height="1280"></i></p><p><i>Những đứa trẻ lớn lên tại vùng cao nghèo khó nhưng sức sống mãnh liệt hệt như bông hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-yen-bai.jpg" alt="Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng" width="1920" height="1280"></i></p><p><i>Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day.jpg" alt="Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn" width="1920" height="1280"></i></p><p><i>Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn nhưng lúc nào cũng ngập tràn niềm vui</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/sac-hoa-to-day.jpg" alt="Vẻ đẹp của hoa thớ dày từ trên cao xuống" width="1920" height="1280"></i></p><p><i>Vẻ đẹp của hoa thớ dày từ trên cao xuống</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/tinh-yeu-doi-lua-duoi-hoa-to-day.jpg" alt="Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng" width="1920" height="1280"></i></p><p><i>Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day-mu-cang-chai.jpg" alt="Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày" width="1920" height="1363"></i></p><p><i>Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day.jpg" alt="Vẻ đẹp xao xuyến của từng bông hoa" width="1920" height="1271"></i></p><p><i>Vẻ đẹp xao xuyến của từng bông hoa</i></p><p>Còn chần chờ gì nữa mà không lên lịch ngay cho mình để ngắm sắc đẹp thướt tha, yêu kiều, dịu dàng của loài hoa này trên rẻo cao Mù Cang Chải thôi nào bạn ơi!</p>', N'/Images/20241216_132122.jpg', N'e6ccdf5c-489e-4b05-92cf-3af24acd7765', CAST(N'2024-12-16' AS Date), 1, N'Ẩm thực ba miền')
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (1025, N'Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái', N'<h3><strong>Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái</strong></h3><p>05/07/2024 - Admin Gostay</p><p><i>Nhắc đến Mù Cang Chải, nhiều người sẽ nghĩ ngay tới những thửa ruộng bậc thang mênh mông tít tắp, trải dài khắp nơi. Thế nhưng, Mù Cang Chải còn được gắn liền với một loài hoa có tên vô cùng đặc biệt - hoa tớ dày. Hãy cùng chúng tôi ngắm nhìn sắc đẹp của loài hoa độc đáo này trong bài viết dưới đây nhé!</i></p><h2><strong>Sắc hoa tớ dày miền di sản</strong></h2><p>Tớ dày "uống sương", "ngậm gió" lạnh những ngày mùa đông rét buốt của vùng cao Mù Cang Chải để rồi khi xuân về, từng bông hoa hồng rực bung nở "mạnh mẽ" cũng giống như sức sống của người nới đây.</p><p>Hoa nở hồng của nương đồi, sườn non cao, dọc con đường ngoằn nghèo vào bản hay bên hiên những mái nhà tranh phảng phất khói sương. Tất cả tạo nên một bức tranh vừa hùng vĩ nhưng cũng vô cùng lãng mạn, mềm mại làm say đắm trái tim người du khách.</p><p>Đây là loài hoa thuộc họ đào, được người Mông gọi bằng tên "Pằng Tớ dày", theo tiếng việt có nghĩa là "hoa đào rừng".</p><p>Cây thuộc giống thân gỗ, có phần tán mọc xòe rộng, trải khắp sườn đồi, triền núi. Bông hoa bản dày, có 5 cánh, màu hồng sắc. Khi nở hoa kết chùm lại, nhị hoa dài có màu đỏ rực rỡ.&nbsp;</p><p>Loài hoa này có gắn bó mật thiết với cuộc sống của đồng bào người Mông nơi đây. Họ quan niệm rằng mùa Xuân là thời khắc đất trời chuyển mình, sau một năm lao động vất vả, mùa vàng bội thu, thóc lúa đầy nhà nên người dân sẽ cùng nhau ăn mừng.</p><p>Khi những cây tớ dày nở hoa hồng rực rỡ cả một góc trời cũng là lúc các&nbsp;chàng trai, cô gái Mông xúng xính trong bộ váy mới, luyện khèn, chuẩn bị quả Pao để chơi Tết, du xuân.</p><p>Loài hoa Tớ dày gắn liền với đời sống nhiều thế hệ người Mông vùng cao Mù Cang Chải. Loại hoa có sức sống mãnh liệt, tượng trưng cho sức sống của con người nơi đây.&nbsp;</p><p>Sau khoảng thời gian đó tuy chưa tàn hết nhưng màu sắc cũng sẽ phai nhưng vẫn giữ được vẻ đẹp e lệ, cuốn hút.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-5.jpg" alt="Hoa tớ dày bên những cung đường quanh co" width="1920" height="1493"></p><p><i>Hoa tớ dày và bản làng Mù Cang Chải cùng những con đường quanh co, uốn lượn</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-1.jpg" alt="Khoảnh khắc đáng yêu của đồng bào dân tộc" width="1920" height="1280"></i></p><p><i>Cô gái và chàng trai bản thổi nhau nghe khúc nhạc tình lãng mạn với cành hoa thớ dày sau lưng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-2.jpg" alt="Nụ cười hồn hậu của người dân tộc" width="1920" height="1280"></i></p><p><i>Những đứa trẻ lớn lên tại vùng cao nghèo khó nhưng sức sống mãnh liệt hệt như bông hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-yen-bai.jpg" alt="Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng" width="1920" height="1280"></i></p><p><i>Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day.jpg" alt="Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn" width="1920" height="1280"></i></p><p><i>Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn nhưng lúc nào cũng ngập tràn niềm vui</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/sac-hoa-to-day.jpg" alt="Vẻ đẹp của hoa thớ dày từ trên cao xuống" width="1920" height="1280"></i></p><p><i>Vẻ đẹp của hoa thớ dày từ trên cao xuống</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/tinh-yeu-doi-lua-duoi-hoa-to-day.jpg" alt="Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng" width="1920" height="1280"></i></p><p><i>Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day-mu-cang-chai.jpg" alt="Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày" width="1920" height="1363"></i></p><p><i>Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day.jpg" alt="Vẻ đẹp xao xuyến của từng bông hoa" width="1920" height="1271"></i></p><p><i>Vẻ đẹp xao xuyến của từng bông hoa</i></p><p>Còn chần chờ gì nữa mà không lên lịch ngay cho mình để ngắm sắc đẹp thướt tha, yêu kiều, dịu dàng của loài hoa này trên rẻo cao Mù Cang Chải thôi nào bạn ơi!</p>', N'/Images/20241216_131324.jpg', N'e6ccdf5c-489e-4b05-92cf-3af24acd7765', CAST(N'2024-12-16' AS Date), 3, N'Nếu như có một đám cưới nào mà nhà trai không cần phải đón dâu thì đó chính là lễ cưới của người')
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (1026, N'Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái', N'<h3><strong>Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái</strong></h3><p>05/07/2024 - Admin Gostay</p><p><i>Nhắc đến Mù Cang Chải, nhiều người sẽ nghĩ ngay tới những thửa ruộng bậc thang mênh mông tít tắp, trải dài khắp nơi. Thế nhưng, Mù Cang Chải còn được gắn liền với một loài hoa có tên vô cùng đặc biệt - hoa tớ dày. Hãy cùng chúng tôi ngắm nhìn sắc đẹp của loài hoa độc đáo này trong bài viết dưới đây nhé!</i></p><h2><strong>Sắc hoa tớ dày miền di sản</strong></h2><p>Tớ dày "uống sương", "ngậm gió" lạnh những ngày mùa đông rét buốt của vùng cao Mù Cang Chải để rồi khi xuân về, từng bông hoa hồng rực bung nở "mạnh mẽ" cũng giống như sức sống của người nới đây.</p><p>Hoa nở hồng của nương đồi, sườn non cao, dọc con đường ngoằn nghèo vào bản hay bên hiên những mái nhà tranh phảng phất khói sương. Tất cả tạo nên một bức tranh vừa hùng vĩ nhưng cũng vô cùng lãng mạn, mềm mại làm say đắm trái tim người du khách.</p><p>Đây là loài hoa thuộc họ đào, được người Mông gọi bằng tên "Pằng Tớ dày", theo tiếng việt có nghĩa là "hoa đào rừng".</p><p>Cây thuộc giống thân gỗ, có phần tán mọc xòe rộng, trải khắp sườn đồi, triền núi. Bông hoa bản dày, có 5 cánh, màu hồng sắc. Khi nở hoa kết chùm lại, nhị hoa dài có màu đỏ rực rỡ.&nbsp;</p><p>Loài hoa này có gắn bó mật thiết với cuộc sống của đồng bào người Mông nơi đây. Họ quan niệm rằng mùa Xuân là thời khắc đất trời chuyển mình, sau một năm lao động vất vả, mùa vàng bội thu, thóc lúa đầy nhà nên người dân sẽ cùng nhau ăn mừng.</p><p>Khi những cây tớ dày nở hoa hồng rực rỡ cả một góc trời cũng là lúc các&nbsp;chàng trai, cô gái Mông xúng xính trong bộ váy mới, luyện khèn, chuẩn bị quả Pao để chơi Tết, du xuân.</p><p>Loài hoa Tớ dày gắn liền với đời sống nhiều thế hệ người Mông vùng cao Mù Cang Chải. Loại hoa có sức sống mãnh liệt, tượng trưng cho sức sống của con người nơi đây.&nbsp;</p><p>Sau khoảng thời gian đó tuy chưa tàn hết nhưng màu sắc cũng sẽ phai nhưng vẫn giữ được vẻ đẹp e lệ, cuốn hút.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-5.jpg" alt="Hoa tớ dày bên những cung đường quanh co" width="1920" height="1493"></p><p><i>Hoa tớ dày và bản làng Mù Cang Chải cùng những con đường quanh co, uốn lượn</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-1.jpg" alt="Khoảnh khắc đáng yêu của đồng bào dân tộc" width="1920" height="1280"></i></p><p><i>Cô gái và chàng trai bản thổi nhau nghe khúc nhạc tình lãng mạn với cành hoa thớ dày sau lưng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-2.jpg" alt="Nụ cười hồn hậu của người dân tộc" width="1920" height="1280"></i></p><p><i>Những đứa trẻ lớn lên tại vùng cao nghèo khó nhưng sức sống mãnh liệt hệt như bông hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-yen-bai.jpg" alt="Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng" width="1920" height="1280"></i></p><p><i>Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day.jpg" alt="Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn" width="1920" height="1280"></i></p><p><i>Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn nhưng lúc nào cũng ngập tràn niềm vui</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/sac-hoa-to-day.jpg" alt="Vẻ đẹp của hoa thớ dày từ trên cao xuống" width="1920" height="1280"></i></p><p><i>Vẻ đẹp của hoa thớ dày từ trên cao xuống</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/tinh-yeu-doi-lua-duoi-hoa-to-day.jpg" alt="Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng" width="1920" height="1280"></i></p><p><i>Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day-mu-cang-chai.jpg" alt="Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày" width="1920" height="1363"></i></p><p><i>Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day.jpg" alt="Vẻ đẹp xao xuyến của từng bông hoa" width="1920" height="1271"></i></p><p><i>Vẻ đẹp xao xuyến của từng bông hoa</i></p><p>Còn chần chờ gì nữa mà không lên lịch ngay cho mình để ngắm sắc đẹp thướt tha, yêu kiều, dịu dàng của loài hoa này trên rẻo cao Mù Cang Chải thôi nào bạn ơi!</p>', N'/Images/20241216_132139.jpg', N'e6ccdf5c-489e-4b05-92cf-3af24acd7765', CAST(N'2024-12-16' AS Date), 2, N'Ẩm thực ba miền')
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (1027, N'Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái', N'<h3><strong>Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái</strong></h3><p>05/07/2024 - Admin Gostay</p><p><i>Nhắc đến Mù Cang Chải, nhiều người sẽ nghĩ ngay tới những thửa ruộng bậc thang mênh mông tít tắp, trải dài khắp nơi. Thế nhưng, Mù Cang Chải còn được gắn liền với một loài hoa có tên vô cùng đặc biệt - hoa tớ dày. Hãy cùng chúng tôi ngắm nhìn sắc đẹp của loài hoa độc đáo này trong bài viết dưới đây nhé!</i></p><h2><strong>Sắc hoa tớ dày miền di sản</strong></h2><p>Tớ dày "uống sương", "ngậm gió" lạnh những ngày mùa đông rét buốt của vùng cao Mù Cang Chải để rồi khi xuân về, từng bông hoa hồng rực bung nở "mạnh mẽ" cũng giống như sức sống của người nới đây.</p><p>Hoa nở hồng của nương đồi, sườn non cao, dọc con đường ngoằn nghèo vào bản hay bên hiên những mái nhà tranh phảng phất khói sương. Tất cả tạo nên một bức tranh vừa hùng vĩ nhưng cũng vô cùng lãng mạn, mềm mại làm say đắm trái tim người du khách.</p><p>Đây là loài hoa thuộc họ đào, được người Mông gọi bằng tên "Pằng Tớ dày", theo tiếng việt có nghĩa là "hoa đào rừng".</p><p>Cây thuộc giống thân gỗ, có phần tán mọc xòe rộng, trải khắp sườn đồi, triền núi. Bông hoa bản dày, có 5 cánh, màu hồng sắc. Khi nở hoa kết chùm lại, nhị hoa dài có màu đỏ rực rỡ.&nbsp;</p><p>Loài hoa này có gắn bó mật thiết với cuộc sống của đồng bào người Mông nơi đây. Họ quan niệm rằng mùa Xuân là thời khắc đất trời chuyển mình, sau một năm lao động vất vả, mùa vàng bội thu, thóc lúa đầy nhà nên người dân sẽ cùng nhau ăn mừng.</p><p>Khi những cây tớ dày nở hoa hồng rực rỡ cả một góc trời cũng là lúc các&nbsp;chàng trai, cô gái Mông xúng xính trong bộ váy mới, luyện khèn, chuẩn bị quả Pao để chơi Tết, du xuân.</p><p>Loài hoa Tớ dày gắn liền với đời sống nhiều thế hệ người Mông vùng cao Mù Cang Chải. Loại hoa có sức sống mãnh liệt, tượng trưng cho sức sống của con người nơi đây.&nbsp;</p><p>Sau khoảng thời gian đó tuy chưa tàn hết nhưng màu sắc cũng sẽ phai nhưng vẫn giữ được vẻ đẹp e lệ, cuốn hút.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-5.jpg" alt="Hoa tớ dày bên những cung đường quanh co" width="1920" height="1493"></p><p><i>Hoa tớ dày và bản làng Mù Cang Chải cùng những con đường quanh co, uốn lượn</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-1.jpg" alt="Khoảnh khắc đáng yêu của đồng bào dân tộc" width="1920" height="1280"></i></p><p><i>Cô gái và chàng trai bản thổi nhau nghe khúc nhạc tình lãng mạn với cành hoa thớ dày sau lưng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-2.jpg" alt="Nụ cười hồn hậu của người dân tộc" width="1920" height="1280"></i></p><p><i>Những đứa trẻ lớn lên tại vùng cao nghèo khó nhưng sức sống mãnh liệt hệt như bông hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-yen-bai.jpg" alt="Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng" width="1920" height="1280"></i></p><p><i>Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day.jpg" alt="Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn" width="1920" height="1280"></i></p><p><i>Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn nhưng lúc nào cũng ngập tràn niềm vui</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/sac-hoa-to-day.jpg" alt="Vẻ đẹp của hoa thớ dày từ trên cao xuống" width="1920" height="1280"></i></p><p><i>Vẻ đẹp của hoa thớ dày từ trên cao xuống</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/tinh-yeu-doi-lua-duoi-hoa-to-day.jpg" alt="Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng" width="1920" height="1280"></i></p><p><i>Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day-mu-cang-chai.jpg" alt="Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày" width="1920" height="1363"></i></p><p><i>Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day.jpg" alt="Vẻ đẹp xao xuyến của từng bông hoa" width="1920" height="1271"></i></p><p><i>Vẻ đẹp xao xuyến của từng bông hoa</i></p><p>Còn chần chờ gì nữa mà không lên lịch ngay cho mình để ngắm sắc đẹp thướt tha, yêu kiều, dịu dàng của loài hoa này trên rẻo cao Mù Cang Chải thôi nào bạn ơi!</p>', N'/Images/20241216_133818.jpg', N'e6ccdf5c-489e-4b05-92cf-3af24acd7765', CAST(N'2024-12-16' AS Date), 2, N'Nếu như có một đám cưới nào mà nhà trai không cần phải đón dâu thì đó chính là lễ cưới của người')
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (1028, N'Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái', N'<h3><strong>Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái</strong></h3><p>05/07/2024 - Admin Gostay</p><p><i>Nhắc đến Mù Cang Chải, nhiều người sẽ nghĩ ngay tới những thửa ruộng bậc thang mênh mông tít tắp, trải dài khắp nơi. Thế nhưng, Mù Cang Chải còn được gắn liền với một loài hoa có tên vô cùng đặc biệt - hoa tớ dày. Hãy cùng chúng tôi ngắm nhìn sắc đẹp của loài hoa độc đáo này trong bài viết dưới đây nhé!</i></p><h2><strong>Sắc hoa tớ dày miền di sản</strong></h2><p>Tớ dày "uống sương", "ngậm gió" lạnh những ngày mùa đông rét buốt của vùng cao Mù Cang Chải để rồi khi xuân về, từng bông hoa hồng rực bung nở "mạnh mẽ" cũng giống như sức sống của người nới đây.</p><p>Hoa nở hồng của nương đồi, sườn non cao, dọc con đường ngoằn nghèo vào bản hay bên hiên những mái nhà tranh phảng phất khói sương. Tất cả tạo nên một bức tranh vừa hùng vĩ nhưng cũng vô cùng lãng mạn, mềm mại làm say đắm trái tim người du khách.</p><p>Đây là loài hoa thuộc họ đào, được người Mông gọi bằng tên "Pằng Tớ dày", theo tiếng việt có nghĩa là "hoa đào rừng".</p><p>Cây thuộc giống thân gỗ, có phần tán mọc xòe rộng, trải khắp sườn đồi, triền núi. Bông hoa bản dày, có 5 cánh, màu hồng sắc. Khi nở hoa kết chùm lại, nhị hoa dài có màu đỏ rực rỡ.&nbsp;</p><p>Loài hoa này có gắn bó mật thiết với cuộc sống của đồng bào người Mông nơi đây. Họ quan niệm rằng mùa Xuân là thời khắc đất trời chuyển mình, sau một năm lao động vất vả, mùa vàng bội thu, thóc lúa đầy nhà nên người dân sẽ cùng nhau ăn mừng.</p><p>Khi những cây tớ dày nở hoa hồng rực rỡ cả một góc trời cũng là lúc các&nbsp;chàng trai, cô gái Mông xúng xính trong bộ váy mới, luyện khèn, chuẩn bị quả Pao để chơi Tết, du xuân.</p><p>Loài hoa Tớ dày gắn liền với đời sống nhiều thế hệ người Mông vùng cao Mù Cang Chải. Loại hoa có sức sống mãnh liệt, tượng trưng cho sức sống của con người nơi đây.&nbsp;</p><p>Sau khoảng thời gian đó tuy chưa tàn hết nhưng màu sắc cũng sẽ phai nhưng vẫn giữ được vẻ đẹp e lệ, cuốn hút.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-5.jpg" alt="Hoa tớ dày bên những cung đường quanh co" width="1920" height="1493"></p><p><i>Hoa tớ dày và bản làng Mù Cang Chải cùng những con đường quanh co, uốn lượn</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-1.jpg" alt="Khoảnh khắc đáng yêu của đồng bào dân tộc" width="1920" height="1280"></i></p><p><i>Cô gái và chàng trai bản thổi nhau nghe khúc nhạc tình lãng mạn với cành hoa thớ dày sau lưng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-2.jpg" alt="Nụ cười hồn hậu của người dân tộc" width="1920" height="1280"></i></p><p><i>Những đứa trẻ lớn lên tại vùng cao nghèo khó nhưng sức sống mãnh liệt hệt như bông hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-yen-bai.jpg" alt="Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng" width="1920" height="1280"></i></p><p><i>Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day.jpg" alt="Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn" width="1920" height="1280"></i></p><p><i>Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn nhưng lúc nào cũng ngập tràn niềm vui</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/sac-hoa-to-day.jpg" alt="Vẻ đẹp của hoa thớ dày từ trên cao xuống" width="1920" height="1280"></i></p><p><i>Vẻ đẹp của hoa thớ dày từ trên cao xuống</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/tinh-yeu-doi-lua-duoi-hoa-to-day.jpg" alt="Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng" width="1920" height="1280"></i></p><p><i>Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day-mu-cang-chai.jpg" alt="Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày" width="1920" height="1363"></i></p><p><i>Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day.jpg" alt="Vẻ đẹp xao xuyến của từng bông hoa" width="1920" height="1271"></i></p><p><i>Vẻ đẹp xao xuyến của từng bông hoa</i></p><p>Còn chần chờ gì nữa mà không lên lịch ngay cho mình để ngắm sắc đẹp thướt tha, yêu kiều, dịu dàng của loài hoa này trên rẻo cao Mù Cang Chải thôi nào bạn ơi!</p>', N'/Images/20241216_133852.jpeg', N'e6ccdf5c-489e-4b05-92cf-3af24acd7765', CAST(N'2024-12-16' AS Date), 2, N'Nếu như có một đám cưới nào mà nhà trai không cần phải đón dâu thì đó chính là lễ cưới của người')
INSERT [dbo].[Articles] ([articleID], [title], [content], [picturePreview], [authorID], [publishDate], [cateArtID], [description]) VALUES (1032, N'Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái', N'<h3><strong>Sắc hoa tớ dày của miền di sản Mù Căng Chải, Yên Bái</strong></h3><p>05/07/2024 - Admin Gostay</p><p><i>Nhắc đến Mù Cang Chải, nhiều người sẽ nghĩ ngay tới những thửa ruộng bậc thang mênh mông tít tắp, trải dài khắp nơi. Thế nhưng, Mù Cang Chải còn được gắn liền với một loài hoa có tên vô cùng đặc biệt - hoa tớ dày. Hãy cùng chúng tôi ngắm nhìn sắc đẹp của loài hoa độc đáo này trong bài viết dưới đây nhé!</i></p><h2><strong>Sắc hoa tớ dày miền di sản</strong></h2><p>Tớ dày "uống sương", "ngậm gió" lạnh những ngày mùa đông rét buốt của vùng cao Mù Cang Chải để rồi khi xuân về, từng bông hoa hồng rực bung nở "mạnh mẽ" cũng giống như sức sống của người nới đây.</p><p>Hoa nở hồng của nương đồi, sườn non cao, dọc con đường ngoằn nghèo vào bản hay bên hiên những mái nhà tranh phảng phất khói sương. Tất cả tạo nên một bức tranh vừa hùng vĩ nhưng cũng vô cùng lãng mạn, mềm mại làm say đắm trái tim người du khách.</p><p>Đây là loài hoa thuộc họ đào, được người Mông gọi bằng tên "Pằng Tớ dày", theo tiếng việt có nghĩa là "hoa đào rừng".</p><p>Cây thuộc giống thân gỗ, có phần tán mọc xòe rộng, trải khắp sườn đồi, triền núi. Bông hoa bản dày, có 5 cánh, màu hồng sắc. Khi nở hoa kết chùm lại, nhị hoa dài có màu đỏ rực rỡ.&nbsp;</p><p>Loài hoa này có gắn bó mật thiết với cuộc sống của đồng bào người Mông nơi đây. Họ quan niệm rằng mùa Xuân là thời khắc đất trời chuyển mình, sau một năm lao động vất vả, mùa vàng bội thu, thóc lúa đầy nhà nên người dân sẽ cùng nhau ăn mừng.</p><p>Khi những cây tớ dày nở hoa hồng rực rỡ cả một góc trời cũng là lúc các&nbsp;chàng trai, cô gái Mông xúng xính trong bộ váy mới, luyện khèn, chuẩn bị quả Pao để chơi Tết, du xuân.</p><p>Loài hoa Tớ dày gắn liền với đời sống nhiều thế hệ người Mông vùng cao Mù Cang Chải. Loại hoa có sức sống mãnh liệt, tượng trưng cho sức sống của con người nơi đây.&nbsp;</p><p>Sau khoảng thời gian đó tuy chưa tàn hết nhưng màu sắc cũng sẽ phai nhưng vẫn giữ được vẻ đẹp e lệ, cuốn hút.</p><p><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-5.jpg" alt="Hoa tớ dày bên những cung đường quanh co" width="1920" height="1493"></p><p><i>Hoa tớ dày và bản làng Mù Cang Chải cùng những con đường quanh co, uốn lượn</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-1.jpg" alt="Khoảnh khắc đáng yêu của đồng bào dân tộc" width="1920" height="1280"></i></p><p><i>Cô gái và chàng trai bản thổi nhau nghe khúc nhạc tình lãng mạn với cành hoa thớ dày sau lưng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-2.jpg" alt="Nụ cười hồn hậu của người dân tộc" width="1920" height="1280"></i></p><p><i>Những đứa trẻ lớn lên tại vùng cao nghèo khó nhưng sức sống mãnh liệt hệt như bông hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day-yen-bai.jpg" alt="Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng" width="1920" height="1280"></i></p><p><i>Tớ dày hồng rực tô điểm cho những thửa ruộng bậc thang thêm thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/hoa-to-day.jpg" alt="Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn" width="1920" height="1280"></i></p><p><i>Câu chuyện cuộc sống hàng ngày tại nơi vùng cao khó khăn nhưng lúc nào cũng ngập tràn niềm vui</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/sac-hoa-to-day.jpg" alt="Vẻ đẹp của hoa thớ dày từ trên cao xuống" width="1920" height="1280"></i></p><p><i>Vẻ đẹp của hoa thớ dày từ trên cao xuống</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/tinh-yeu-doi-lua-duoi-hoa-to-day.jpg" alt="Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng" width="1920" height="1280"></i></p><p><i>Tình yêu đôi lứa dưới những tán hoa hồng thơ mộng</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day-mu-cang-chai.jpg" alt="Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày" width="1920" height="1363"></i></p><p><i>Khách du lịch cũng cùng những bức ảnh triệu likes bên tán hoa thớ dày</i></p><p><i><img src="https://cdn.realtech.com.vn/uploads/gostay/news/392/to-day.jpg" alt="Vẻ đẹp xao xuyến của từng bông hoa" width="1920" height="1271"></i></p><p><i>Vẻ đẹp xao xuyến của từng bông hoa</i></p><p>Còn chần chờ gì nữa mà không lên lịch ngay cho mình để ngắm sắc đẹp thướt tha, yêu kiều, dịu dàng của loài hoa này trên rẻo cao Mù Cang Chải thôi nào bạn ơi!</p>', N'/Images/20241216_133903.jpg', N'e6ccdf5c-489e-4b05-92cf-3af24acd7765', CAST(N'2024-12-16' AS Date), 2, N'Nếu như có một đám cưới nào mà nhà trai không cần phải đón dâu thì đó chính là lễ cưới của người')
SET IDENTITY_INSERT [dbo].[Articles] OFF
GO
SET IDENTITY_INSERT [dbo].[BookingProcess] ON 

INSERT [dbo].[BookingProcess] ([processID], [bookingID], [paymentTime], [checkInTime], [checkOutTime], [stepOrder], [createdAt], [updatedAt], [completeStatus]) VALUES (1018, 292480761, CAST(N'2024-12-11T11:34:01.623' AS DateTime), CAST(N'2024-12-11T12:22:34.330' AS DateTime), CAST(N'2024-12-11T12:22:44.863' AS DateTime), 4, CAST(N'2024-12-11T11:32:44.667' AS DateTime), NULL, NULL)
INSERT [dbo].[BookingProcess] ([processID], [bookingID], [paymentTime], [checkInTime], [checkOutTime], [stepOrder], [createdAt], [updatedAt], [completeStatus]) VALUES (1019, 156178698, CAST(N'2024-12-11T12:43:06.443' AS DateTime), CAST(N'2024-12-11T12:44:47.007' AS DateTime), CAST(N'2024-12-11T13:12:29.413' AS DateTime), 4, CAST(N'2024-12-11T12:27:10.817' AS DateTime), NULL, NULL)
INSERT [dbo].[BookingProcess] ([processID], [bookingID], [paymentTime], [checkInTime], [checkOutTime], [stepOrder], [createdAt], [updatedAt], [completeStatus]) VALUES (1020, 2039298058, CAST(N'2024-12-12T00:07:53.637' AS DateTime), CAST(N'2024-12-16T23:32:52.650' AS DateTime), CAST(N'2024-12-16T23:33:01.580' AS DateTime), 4, CAST(N'2024-12-12T00:03:16.810' AS DateTime), NULL, NULL)
INSERT [dbo].[BookingProcess] ([processID], [bookingID], [paymentTime], [checkInTime], [checkOutTime], [stepOrder], [createdAt], [updatedAt], [completeStatus]) VALUES (1021, 309803065, CAST(N'2024-12-12T00:08:53.423' AS DateTime), CAST(N'2024-12-17T15:04:02.737' AS DateTime), CAST(N'2024-12-17T15:04:07.890' AS DateTime), 4, CAST(N'2024-12-12T00:03:55.367' AS DateTime), NULL, NULL)
INSERT [dbo].[BookingProcess] ([processID], [bookingID], [paymentTime], [checkInTime], [checkOutTime], [stepOrder], [createdAt], [updatedAt], [completeStatus]) VALUES (2003, 313940001, NULL, NULL, NULL, 0, CAST(N'2024-12-17T15:04:25.420' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[BookingProcess] OFF
GO
INSERT [dbo].[Bookings] ([bookingID], [cusID], [ownerID], [homestayID], [checkInDate], [checkOutDate], [numberOfGuests], [totalPrice], [paymentMethod], [discountPrice], [discountCode], [originalPrice], [guestList], [description], [bookingTime], [email], [phone], [name], [isConfirm], [isCancel], [reasonCancel], [isSuccess], [statusBK], [timeConfirm], [timeReviewRating]) VALUES (55341790, N'c24084be-7373-42c1-abf5-6b065c1a7f90', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', 5, CAST(N'2024-12-15' AS Date), CAST(N'2024-12-17' AS Date), 5, 1400000, NULL, NULL, NULL, 1400000, NULL, N'haha', CAST(N'2024-12-12T09:20:50.453' AS DateTime), N'huymuahanglzd019@gmail.com', N'0364174636', N'Đào Quang Huy', 0, 0, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Bookings] ([bookingID], [cusID], [ownerID], [homestayID], [checkInDate], [checkOutDate], [numberOfGuests], [totalPrice], [paymentMethod], [discountPrice], [discountCode], [originalPrice], [guestList], [description], [bookingTime], [email], [phone], [name], [isConfirm], [isCancel], [reasonCancel], [isSuccess], [statusBK], [timeConfirm], [timeReviewRating]) VALUES (156178698, N'6c78fea3-8b5e-4eed-94a2-442e4acce6d4', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', 5, CAST(N'2024-12-11' AS Date), CAST(N'2024-12-15' AS Date), 5, 1000, NULL, NULL, NULL, 3000000, NULL, N'Hahaha', CAST(N'2024-12-11T05:25:58.317' AS DateTime), N'duongdatx2004@gmail.com', N'0364174636', N'Đào Văn Hoàng', 1, 0, NULL, 1, 6, CAST(N'2024-12-11T12:27:10.817' AS DateTime), CAST(N'2024-12-11T22:55:08.110' AS DateTime))
INSERT [dbo].[Bookings] ([bookingID], [cusID], [ownerID], [homestayID], [checkInDate], [checkOutDate], [numberOfGuests], [totalPrice], [paymentMethod], [discountPrice], [discountCode], [originalPrice], [guestList], [description], [bookingTime], [email], [phone], [name], [isConfirm], [isCancel], [reasonCancel], [isSuccess], [statusBK], [timeConfirm], [timeReviewRating]) VALUES (292480761, N'6c78fea3-8b5e-4eed-94a2-442e4acce6d4', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', 3, CAST(N'2024-12-12' AS Date), CAST(N'2024-12-14' AS Date), 4, 10000, NULL, NULL, NULL, 1700000, NULL, N'Hahaha', CAST(N'2024-12-11T04:32:30.710' AS DateTime), N'duongdatx2004@gmail.com', N'0364174636', N'Đào Văn Hoàng', 1, 0, NULL, 1, 6, CAST(N'2024-12-11T11:32:44.667' AS DateTime), CAST(N'2024-12-11T23:03:07.890' AS DateTime))
INSERT [dbo].[Bookings] ([bookingID], [cusID], [ownerID], [homestayID], [checkInDate], [checkOutDate], [numberOfGuests], [totalPrice], [paymentMethod], [discountPrice], [discountCode], [originalPrice], [guestList], [description], [bookingTime], [email], [phone], [name], [isConfirm], [isCancel], [reasonCancel], [isSuccess], [statusBK], [timeConfirm], [timeReviewRating]) VALUES (294101655, N'02d3d9e1-093b-4e58-aae6-be1465a05a3d', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', 15, CAST(N'2024-12-16' AS Date), CAST(N'2024-12-19' AS Date), 5, 2200000, NULL, 0, N'', 2200000, NULL, NULL, CAST(N'2024-12-16T13:17:01.973' AS DateTime), N'duongdatx2004@gmail.com', N'0364174636', N'Đào Văn Hoàng', 0, 0, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Bookings] ([bookingID], [cusID], [ownerID], [homestayID], [checkInDate], [checkOutDate], [numberOfGuests], [totalPrice], [paymentMethod], [discountPrice], [discountCode], [originalPrice], [guestList], [description], [bookingTime], [email], [phone], [name], [isConfirm], [isCancel], [reasonCancel], [isSuccess], [statusBK], [timeConfirm], [timeReviewRating]) VALUES (309803065, N'6c78fea3-8b5e-4eed-94a2-442e4acce6d4', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', 3, CAST(N'2024-12-12' AS Date), CAST(N'2024-12-16' AS Date), 4, 1000, NULL, NULL, NULL, 900000, NULL, N'Hahaha', CAST(N'2024-12-11T06:30:39.063' AS DateTime), N'duongdatx2004@gmail.com', N'0364174636', N'Đào Văn Hoàng', 1, 0, NULL, 1, 6, CAST(N'2024-12-12T00:03:55.367' AS DateTime), NULL)
INSERT [dbo].[Bookings] ([bookingID], [cusID], [ownerID], [homestayID], [checkInDate], [checkOutDate], [numberOfGuests], [totalPrice], [paymentMethod], [discountPrice], [discountCode], [originalPrice], [guestList], [description], [bookingTime], [email], [phone], [name], [isConfirm], [isCancel], [reasonCancel], [isSuccess], [statusBK], [timeConfirm], [timeReviewRating]) VALUES (313940001, N'02d3d9e1-093b-4e58-aae6-be1465a05a3d', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', 15, CAST(N'2024-12-17' AS Date), CAST(N'2024-12-20' AS Date), 5, 2200000, NULL, 0, N'', 2200000, NULL, NULL, CAST(N'2024-12-16T13:19:43.773' AS DateTime), N'duongdatx2004@gmail.com', N'0364174636', N'Đào Văn Hoàng', 1, 0, NULL, NULL, 2, CAST(N'2024-12-17T15:04:25.420' AS DateTime), NULL)
INSERT [dbo].[Bookings] ([bookingID], [cusID], [ownerID], [homestayID], [checkInDate], [checkOutDate], [numberOfGuests], [totalPrice], [paymentMethod], [discountPrice], [discountCode], [originalPrice], [guestList], [description], [bookingTime], [email], [phone], [name], [isConfirm], [isCancel], [reasonCancel], [isSuccess], [statusBK], [timeConfirm], [timeReviewRating]) VALUES (758095013, N'6c78fea3-8b5e-4eed-94a2-442e4acce6d4', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', 2, CAST(N'2024-12-17' AS Date), CAST(N'2024-12-18' AS Date), 5, 400000, NULL, 500000, N'CHAOMUNGHUY', 900000, NULL, N'haha', CAST(N'2024-12-12T16:27:55.773' AS DateTime), N'huymuahanglzd019@gmail.com', N'0364174636', N'Đào Quang Huy', 0, 0, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Bookings] ([bookingID], [cusID], [ownerID], [homestayID], [checkInDate], [checkOutDate], [numberOfGuests], [totalPrice], [paymentMethod], [discountPrice], [discountCode], [originalPrice], [guestList], [description], [bookingTime], [email], [phone], [name], [isConfirm], [isCancel], [reasonCancel], [isSuccess], [statusBK], [timeConfirm], [timeReviewRating]) VALUES (896401668, N'02d3d9e1-093b-4e58-aae6-be1465a05a3d', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', 15, CAST(N'2024-12-23' AS Date), CAST(N'2024-12-26' AS Date), 5, 2200000, NULL, 0, N'', 2200000, NULL, NULL, CAST(N'2024-12-16T13:20:24.413' AS DateTime), N'duongdatx2004@gmail.com', N'0364174636', N'Đào Văn Hoàng', 0, 0, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Bookings] ([bookingID], [cusID], [ownerID], [homestayID], [checkInDate], [checkOutDate], [numberOfGuests], [totalPrice], [paymentMethod], [discountPrice], [discountCode], [originalPrice], [guestList], [description], [bookingTime], [email], [phone], [name], [isConfirm], [isCancel], [reasonCancel], [isSuccess], [statusBK], [timeConfirm], [timeReviewRating]) VALUES (1091381701, N'02d3d9e1-093b-4e58-aae6-be1465a05a3d', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', 4, CAST(N'2024-12-18' AS Date), CAST(N'2024-12-19' AS Date), 5, 600000, NULL, 0, N'', 600000, NULL, NULL, CAST(N'2024-12-16T11:51:37.113' AS DateTime), N'duongdatx2004@gmail.com', N'0364174636', N'Đào Văn Hoàng', 0, 0, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Bookings] ([bookingID], [cusID], [ownerID], [homestayID], [checkInDate], [checkOutDate], [numberOfGuests], [totalPrice], [paymentMethod], [discountPrice], [discountCode], [originalPrice], [guestList], [description], [bookingTime], [email], [phone], [name], [isConfirm], [isCancel], [reasonCancel], [isSuccess], [statusBK], [timeConfirm], [timeReviewRating]) VALUES (1588275769, N'02d3d9e1-093b-4e58-aae6-be1465a05a3d', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', 2, CAST(N'2024-12-18' AS Date), CAST(N'2024-12-20' AS Date), 3, 1700000, NULL, 0, N'', 1700000, NULL, N'ok', CAST(N'2024-12-16T09:11:25.673' AS DateTime), N'duongdatx2004@gmail.com', N'0364174636', N'Đào Văn Hoàng', 0, 0, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Bookings] ([bookingID], [cusID], [ownerID], [homestayID], [checkInDate], [checkOutDate], [numberOfGuests], [totalPrice], [paymentMethod], [discountPrice], [discountCode], [originalPrice], [guestList], [description], [bookingTime], [email], [phone], [name], [isConfirm], [isCancel], [reasonCancel], [isSuccess], [statusBK], [timeConfirm], [timeReviewRating]) VALUES (2039298058, N'6c78fea3-8b5e-4eed-94a2-442e4acce6d4', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', 2, CAST(N'2024-12-11' AS Date), CAST(N'2024-12-13' AS Date), 4, 1000, NULL, NULL, NULL, 1700000, NULL, N'Hahaha', CAST(N'2024-12-11T16:59:53.027' AS DateTime), N'duongdatx2004@gmail.com', N'0364174636', N'Đào Văn Hoàng', 1, 0, NULL, 1, 6, CAST(N'2024-12-12T00:03:16.810' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[CategoryArticles] ON 

INSERT [dbo].[CategoryArticles] ([cateID], [cateName], [description]) VALUES (1, N'Ẩm thực ba miền', N'Bài viết về Ẩm thực ba miền')
INSERT [dbo].[CategoryArticles] ([cateID], [cateName], [description]) VALUES (2, N'Văn Hóa Lễ Hội', N'Văn Hóa Lễ Hội')
INSERT [dbo].[CategoryArticles] ([cateID], [cateName], [description]) VALUES (3, N'Văn Hóa Phong Tục', N'Văn Hóa Phong Tục')
SET IDENTITY_INSERT [dbo].[CategoryArticles] OFF
GO
INSERT [dbo].[Customers] ([cusID], [userID], [rentedRoomsTotal], [totalAmountPaID]) VALUES (N'02d3d9e1-093b-4e58-aae6-be1465a05a3d', N'5d51dc22-7a01-48a6-abaa-1db6e245b984', NULL, NULL)
INSERT [dbo].[Customers] ([cusID], [userID], [rentedRoomsTotal], [totalAmountPaID]) VALUES (N'3ea3c734-1812-46de-bc9c-30c9d677cec4', N'282ce462-cf0a-48da-8c5a-e0f0d062f2a7', NULL, NULL)
INSERT [dbo].[Customers] ([cusID], [userID], [rentedRoomsTotal], [totalAmountPaID]) VALUES (N'4100f676-9d78-40a1-95df-f6b180a9b95e', N'3d175641-ac1f-471f-9340-b91d31b87d97', NULL, NULL)
INSERT [dbo].[Customers] ([cusID], [userID], [rentedRoomsTotal], [totalAmountPaID]) VALUES (N'600953ab-49ee-4cb0-a7ff-6ea7352e3959', N'cb637013-0ff9-4d4f-9adf-eaca5e03b932', NULL, NULL)
INSERT [dbo].[Customers] ([cusID], [userID], [rentedRoomsTotal], [totalAmountPaID]) VALUES (N'6c78fea3-8b5e-4eed-94a2-442e4acce6d4', N'e0dd17bb-c7ea-4b19-96ae-9b59aaf50868', NULL, NULL)
INSERT [dbo].[Customers] ([cusID], [userID], [rentedRoomsTotal], [totalAmountPaID]) VALUES (N'c24084be-7373-42c1-abf5-6b065c1a7f90', N'bf46a84f-50b9-4417-bce0-ebe019d7ffd9', NULL, NULL)
INSERT [dbo].[Customers] ([cusID], [userID], [rentedRoomsTotal], [totalAmountPaID]) VALUES (N'da5b4462-f24d-43c6-9e79-7240fe5e19fb', N'6a046231-e6a4-4fbf-a835-3defc91a70b5', NULL, NULL)
INSERT [dbo].[Customers] ([cusID], [userID], [rentedRoomsTotal], [totalAmountPaID]) VALUES (N'ded4fdf6-02cf-4a23-8d42-ae92efe10c66', N'856b76fa-d626-416f-90d0-b1f10e855a5f', NULL, NULL)
INSERT [dbo].[Customers] ([cusID], [userID], [rentedRoomsTotal], [totalAmountPaID]) VALUES (N'ef094cf9-7848-4ed7-9c68-72f1f509d2cc', N'001387d6-69a2-43d3-9244-52a5c96d72f2', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[DetailHomeStays] ON 

INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [numberOfBedrooms], [numberOfLivingRooms], [numberOfBathrooms], [numberOfKitchens], [note], [rules], [utilities], [regulation]) VALUES (2, 2, 2, 2, 2, 2, N'MIMI HOUSE - GÓC VƯỜN NHỎ AN YÊN

Cạnh bao la ruộng lúa xanh ngát, nơi ta có thể tìm về chút bình yên, Mimi House như một viên ngọc nhỏ giấu mình trong lòng thiên nhiên, nơi bạn sẽ được tận hưởng sự riêng tư tuyệt vời giữa những góc vườn xanh mát, xinh xắn.

Tách biệt hẳn khỏi khói bụi, ồn ào của phố thị, Mimi HOUSE đưa bạn về với sự trong lành, nơi tiếng chim hót véo von hòa cùng gió thoảng nhẹ qua cánh đồng lúa mênh mông, tạo nên một không gian tràn đầy sức sống và sự thư thái.

🌿 Tiện nghi tại Mimi House Không gian ngập tràn sắc xanh, hòa quyện cùng muôn hoa khoe sắc, mang lại những khoảnh khắc riêng tư và niềm vui bất tận.

⛵️ Hồ bơi ngoài trời xanh mát rộng 9x3m2 ⛵️ Bàn bi-a và bàn ăn ngoài trời cho những giây phút thư giãn 🔆 Phòng khách với tivi nối liền không gian ăn uống và bếp ấm cúng trong nhà 🔆 Hai phòng ngủ khép kín với giường lớn 2mx2m2 🔆 Hai phòng vệ sinh tiện nghi và hiện đại 🔆 Dàn âm thanh karaoke sống động sử dụng miễn phí 🔆 Khu bếp trong nhà và ngoài trời đầy đủ tiện nghi với bếp từ, tủ lạnh, lò vi sóng, nồi cơm điện, ấm đun nước, bát đũa, cùng bếp BBQ ngoài trời sẵn sàng cho những buổi tiệc nướng 🌿 Các tiện ích khác: Máy sấy tóc, khăn tắm, sữa tắm, dầu gội và khu vực để xe an toàn, tiện lợi.', N'⏰ Check-in: Sau 14:00:00
⏳ Check-out: Trước 12:00:00
🆔 Yêu cầu CMT / CCCD / Hộ chiếu
🤫 Hạn chế làm ồn sau 10 giờ tối
👟❌ Không đi giày / dép trong nhà
🚭 Không hút thuốc ở khu vực chung
🚭 Không cho phép hút thuốc
🐾❌ Không cho phép mang theo thú cưng
🎉 Cho phép tổ chức tiệc
🍳 Cho phép nấu ăn
📸 Cho phép chụp ảnh thương mại', NULL, N'

Người lớn: Trên 12 tuổi
Trẻ em: Từ 6 đến 12 tuổi
Em bé: Dưới 6 tuổi')
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [numberOfBedrooms], [numberOfLivingRooms], [numberOfBathrooms], [numberOfKitchens], [note], [rules], [utilities], [regulation]) VALUES (3, 3, 2, 2, 2, 2, N'MIMI HOUSE - GÓC VƯỜN NHỎ AN YÊN

Cạnh bao la ruộng lúa xanh ngát, nơi ta có thể tìm về chút bình yên, Mimi House như một viên ngọc nhỏ giấu mình trong lòng thiên nhiên, nơi bạn sẽ được tận hưởng sự riêng tư tuyệt vời giữa những góc vườn xanh mát, xinh xắn.

Tách biệt hẳn khỏi khói bụi, ồn ào của phố thị, Mimi HOUSE đưa bạn về với sự trong lành, nơi tiếng chim hót véo von hòa cùng gió thoảng nhẹ qua cánh đồng lúa mênh mông, tạo nên một không gian tràn đầy sức sống và sự thư thái.

🌿 Tiện nghi tại Mimi House Không gian ngập tràn sắc xanh, hòa quyện cùng muôn hoa khoe sắc, mang lại những khoảnh khắc riêng tư và niềm vui bất tận.

⛵️ Hồ bơi ngoài trời xanh mát rộng 9x3m2 ⛵️ Bàn bi-a và bàn ăn ngoài trời cho những giây phút thư giãn 🔆 Phòng khách với tivi nối liền không gian ăn uống và bếp ấm cúng trong nhà 🔆 Hai phòng ngủ khép kín với giường lớn 2mx2m2 🔆 Hai phòng vệ sinh tiện nghi và hiện đại 🔆 Dàn âm thanh karaoke sống động sử dụng miễn phí 🔆 Khu bếp trong nhà và ngoài trời đầy đủ tiện nghi với bếp từ, tủ lạnh, lò vi sóng, nồi cơm điện, ấm đun nước, bát đũa, cùng bếp BBQ ngoài trời sẵn sàng cho những buổi tiệc nướng 🌿 Các tiện ích khác: Máy sấy tóc, khăn tắm, sữa tắm, dầu gội và khu vực để xe an toàn, tiện lợi.', N'⏰ Check-in: Sau 14:00:00
⏳ Check-out: Trước 12:00:00
🆔 Yêu cầu CMT / CCCD / Hộ chiếu
🤫 Hạn chế làm ồn sau 10 giờ tối
👟❌ Không đi giày / dép trong nhà
🚭 Không hút thuốc ở khu vực chung
🚭 Không cho phép hút thuốc
🐾❌ Không cho phép mang theo thú cưng
🎉 Cho phép tổ chức tiệc
🍳 Cho phép nấu ăn
📸 Cho phép chụp ảnh thương mại', N'🛏 Hai phòng ngủ khép kín với giường lớn 2mx2m2
🚿 Hai phòng vệ sinh tiện nghi và hiện đại
🎤 Dàn âm thanh karaoke sống động sử dụng miễn phí
🍽 Khu vực bếp ăn đầy đủ dụng cụ nấu nướng, giúp bạn thoải mái chế biến những món ăn yêu thích
🌞 Khu vực thư giãn ngoài trời với ghế dài và dù che, lý tưởng để tận hưởng những ngày nắng ấm
🚗 Khu vực đỗ xe an toàn, rộng rãi ngay cạnh căn nhà
📡 Wifi miễn phí phủ sóng toàn bộ khu vực, giúp bạn dễ dàng kết nối mọi lúc mọi nơi
🎮 Máy game với nhiều trò chơi thú vị cho trẻ em và người lớn
🧺 Dịch vụ giặt ủi miễn phí, giúp bạn tiết kiệm thời gian và công sức
🛋 Không gian phòng khách rộng rãi, trang bị đầy đủ ghế sofa sang trọng, thích hợp cho những buổi tụ họp bạn bè và gia đình
🍃 Khu vườn nhỏ với cây cối xanh tươi, không gian lý tưởng để thư giãn và nghỉ ngơi.', N'Người lớn: Trên 12 tuổi
Trẻ em: Từ 6 đến 12 tuổi
Em bé: Dưới 6 tuổi

Người lớn: Trên 12 tuổi
Trẻ em: Từ 6 đến 12 tuổi
Em bé: Dưới 6 tuổi')
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [numberOfBedrooms], [numberOfLivingRooms], [numberOfBathrooms], [numberOfKitchens], [note], [rules], [utilities], [regulation]) VALUES (4, 4, 5, 5, 5, 5, N'MIMI HOUSE - GÓC VƯỜN NHỎ AN YÊN

Cạnh bao la ruộng lúa xanh ngát, nơi ta có thể tìm về chút bình yên, Mimi House như một viên ngọc nhỏ giấu mình trong lòng thiên nhiên, nơi bạn sẽ được tận hưởng sự riêng tư tuyệt vời giữa những góc vườn xanh mát, xinh xắn.

Tách biệt hẳn khỏi khói bụi, ồn ào của phố thị, Mimi HOUSE đưa bạn về với sự trong lành, nơi tiếng chim hót véo von hòa cùng gió thoảng nhẹ qua cánh đồng lúa mênh mông, tạo nên một không gian tràn đầy sức sống và sự thư thái.

🌿 Tiện nghi tại Mimi House Không gian ngập tràn sắc xanh, hòa quyện cùng muôn hoa khoe sắc, mang lại những khoảnh khắc riêng tư và niềm vui bất tận.

⛵️ Hồ bơi ngoài trời xanh mát rộng 9x3m2 ⛵️ Bàn bi-a và bàn ăn ngoài trời cho những giây phút thư giãn 🔆 Phòng khách với tivi nối liền không gian ăn uống và bếp ấm cúng trong nhà 🔆 Hai phòng ngủ khép kín với giường lớn 2mx2m2 🔆 Hai phòng vệ sinh tiện nghi và hiện đại 🔆 Dàn âm thanh karaoke sống động sử dụng miễn phí 🔆 Khu bếp trong nhà và ngoài trời đầy đủ tiện nghi với bếp từ, tủ lạnh, lò vi sóng, nồi cơm điện, ấm đun nước, bát đũa, cùng bếp BBQ ngoài trời sẵn sàng cho những buổi tiệc nướng 🌿 Các tiện ích khác: Máy sấy tóc, khăn tắm, sữa tắm, dầu gội và khu vực để xe an toàn, tiện lợi.', N'⏰ Check-in: Sau 14:00:00
⏳ Check-out: Trước 12:00:00
🆔 Yêu cầu CMT / CCCD / Hộ chiếu
🤫 Hạn chế làm ồn sau 10 giờ tối
👟❌ Không đi giày / dép trong nhà
🚭 Không hút thuốc ở khu vực chung
🚭 Không cho phép hút thuốc
🐾❌ Không cho phép mang theo thú cưng
🎉 Cho phép tổ chức tiệc
🍳 Cho phép nấu ăn
📸 Cho phép chụp ảnh thương mại', NULL, N'

Người lớn: Trên 12 tuổi
Trẻ em: Từ 6 đến 12 tuổi
Em bé: Dưới 6 tuổi')
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [numberOfBedrooms], [numberOfLivingRooms], [numberOfBathrooms], [numberOfKitchens], [note], [rules], [utilities], [regulation]) VALUES (5, 5, 5, 5, 5, 5, N'MIMI HOUSE - GÓC VƯỜN NHỎ AN YÊN

Cạnh bao la ruộng lúa xanh ngát, nơi ta có thể tìm về chút bình yên, Mimi House như một viên ngọc nhỏ giấu mình trong lòng thiên nhiên, nơi bạn sẽ được tận hưởng sự riêng tư tuyệt vời giữa những góc vườn xanh mát, xinh xắn.

Tách biệt hẳn khỏi khói bụi, ồn ào của phố thị, Mimi HOUSE đưa bạn về với sự trong lành, nơi tiếng chim hót véo von hòa cùng gió thoảng nhẹ qua cánh đồng lúa mênh mông, tạo nên một không gian tràn đầy sức sống và sự thư thái.

🌿 Tiện nghi tại Mimi House Không gian ngập tràn sắc xanh, hòa quyện cùng muôn hoa khoe sắc, mang lại những khoảnh khắc riêng tư và niềm vui bất tận.

⛵️ Hồ bơi ngoài trời xanh mát rộng 9x3m2 ⛵️ Bàn bi-a và bàn ăn ngoài trời cho những giây phút thư giãn 🔆 Phòng khách với tivi nối liền không gian ăn uống và bếp ấm cúng trong nhà 🔆 Hai phòng ngủ khép kín với giường lớn 2mx2m2 🔆 Hai phòng vệ sinh tiện nghi và hiện đại 🔆 Dàn âm thanh karaoke sống động sử dụng miễn phí 🔆 Khu bếp trong nhà và ngoài trời đầy đủ tiện nghi với bếp từ, tủ lạnh, lò vi sóng, nồi cơm điện, ấm đun nước, bát đũa, cùng bếp BBQ ngoài trời sẵn sàng cho những buổi tiệc nướng 🌿 Các tiện ích khác: Máy sấy tóc, khăn tắm, sữa tắm, dầu gội và khu vực để xe an toàn, tiện lợi.', N'⏰ Check-in: Sau 14:00:00
⏳ Check-out: Trước 12:00:00
🆔 Yêu cầu CMT / CCCD / Hộ chiếu
🤫 Hạn chế làm ồn sau 10 giờ tối
👟❌ Không đi giày / dép trong nhà
🚭 Không hút thuốc ở khu vực chung
🚭 Không cho phép hút thuốc
🐾❌ Không cho phép mang theo thú cưng
🎉 Cho phép tổ chức tiệc
🍳 Cho phép nấu ăn
📸 Cho phép chụp ảnh thương mại', NULL, N'

Người lớn: Trên 12 tuổi
Trẻ em: Từ 6 đến 12 tuổi
Em bé: Dưới 6 tuổi')
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [numberOfBedrooms], [numberOfLivingRooms], [numberOfBathrooms], [numberOfKitchens], [note], [rules], [utilities], [regulation]) VALUES (6, 6, 5, 5, 5, 5, N'MIMI HOUSE - GÓC VƯỜN NHỎ AN YÊN

Cạnh bao la ruộng lúa xanh ngát, nơi ta có thể tìm về chút bình yên, Mimi House như một viên ngọc nhỏ giấu mình trong lòng thiên nhiên, nơi bạn sẽ được tận hưởng sự riêng tư tuyệt vời giữa những góc vườn xanh mát, xinh xắn.

Tách biệt hẳn khỏi khói bụi, ồn ào của phố thị, Mimi HOUSE đưa bạn về với sự trong lành, nơi tiếng chim hót véo von hòa cùng gió thoảng nhẹ qua cánh đồng lúa mênh mông, tạo nên một không gian tràn đầy sức sống và sự thư thái.

🌿 Tiện nghi tại Mimi House Không gian ngập tràn sắc xanh, hòa quyện cùng muôn hoa khoe sắc, mang lại những khoảnh khắc riêng tư và niềm vui bất tận.

⛵️ Hồ bơi ngoài trời xanh mát rộng 9x3m2 ⛵️ Bàn bi-a và bàn ăn ngoài trời cho những giây phút thư giãn 🔆 Phòng khách với tivi nối liền không gian ăn uống và bếp ấm cúng trong nhà 🔆 Hai phòng ngủ khép kín với giường lớn 2mx2m2 🔆 Hai phòng vệ sinh tiện nghi và hiện đại 🔆 Dàn âm thanh karaoke sống động sử dụng miễn phí 🔆 Khu bếp trong nhà và ngoài trời đầy đủ tiện nghi với bếp từ, tủ lạnh, lò vi sóng, nồi cơm điện, ấm đun nước, bát đũa, cùng bếp BBQ ngoài trời sẵn sàng cho những buổi tiệc nướng 🌿 Các tiện ích khác: Máy sấy tóc, khăn tắm, sữa tắm, dầu gội và khu vực để xe an toàn, tiện lợi.', N'⏰ Check-in: Sau 14:00:00
⏳ Check-out: Trước 12:00:00
🆔 Yêu cầu CMT / CCCD / Hộ chiếu
🤫 Hạn chế làm ồn sau 10 giờ tối
👟❌ Không đi giày / dép trong nhà
🚭 Không hút thuốc ở khu vực chung
🚭 Không cho phép hút thuốc
🐾❌ Không cho phép mang theo thú cưng
🎉 Cho phép tổ chức tiệc
🍳 Cho phép nấu ăn
📸 Cho phép chụp ảnh thương mại', NULL, N'

Người lớn: Trên 12 tuổi
Trẻ em: Từ 6 đến 12 tuổi
Em bé: Dưới 6 tuổi')
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [numberOfBedrooms], [numberOfLivingRooms], [numberOfBathrooms], [numberOfKitchens], [note], [rules], [utilities], [regulation]) VALUES (7, 7, 5, 5, 5, 5, N'MIMI HOUSE - GÓC VƯỜN NHỎ AN YÊN

Cạnh bao la ruộng lúa xanh ngát, nơi ta có thể tìm về chút bình yên, Mimi House như một viên ngọc nhỏ giấu mình trong lòng thiên nhiên, nơi bạn sẽ được tận hưởng sự riêng tư tuyệt vời giữa những góc vườn xanh mát, xinh xắn.

Tách biệt hẳn khỏi khói bụi, ồn ào của phố thị, Mimi HOUSE đưa bạn về với sự trong lành, nơi tiếng chim hót véo von hòa cùng gió thoảng nhẹ qua cánh đồng lúa mênh mông, tạo nên một không gian tràn đầy sức sống và sự thư thái.

🌿 Tiện nghi tại Mimi House Không gian ngập tràn sắc xanh, hòa quyện cùng muôn hoa khoe sắc, mang lại những khoảnh khắc riêng tư và niềm vui bất tận.

⛵️ Hồ bơi ngoài trời xanh mát rộng 9x3m2 ⛵️ Bàn bi-a và bàn ăn ngoài trời cho những giây phút thư giãn 🔆 Phòng khách với tivi nối liền không gian ăn uống và bếp ấm cúng trong nhà 🔆 Hai phòng ngủ khép kín với giường lớn 2mx2m2 🔆 Hai phòng vệ sinh tiện nghi và hiện đại 🔆 Dàn âm thanh karaoke sống động sử dụng miễn phí 🔆 Khu bếp trong nhà và ngoài trời đầy đủ tiện nghi với bếp từ, tủ lạnh, lò vi sóng, nồi cơm điện, ấm đun nước, bát đũa, cùng bếp BBQ ngoài trời sẵn sàng cho những buổi tiệc nướng 🌿 Các tiện ích khác: Máy sấy tóc, khăn tắm, sữa tắm, dầu gội và khu vực để xe an toàn, tiện lợi.', N'⏰ Check-in: Sau 14:00:00
⏳ Check-out: Trước 12:00:00
🆔 Yêu cầu CMT / CCCD / Hộ chiếu
🤫 Hạn chế làm ồn sau 10 giờ tối
👟❌ Không đi giày / dép trong nhà
🚭 Không hút thuốc ở khu vực chung
🚭 Không cho phép hút thuốc
🐾❌ Không cho phép mang theo thú cưng
🎉 Cho phép tổ chức tiệc
🍳 Cho phép nấu ăn
📸 Cho phép chụp ảnh thương mại', NULL, N'

Người lớn: Trên 12 tuổi
Trẻ em: Từ 6 đến 12 tuổi
Em bé: Dưới 6 tuổi')
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [numberOfBedrooms], [numberOfLivingRooms], [numberOfBathrooms], [numberOfKitchens], [note], [rules], [utilities], [regulation]) VALUES (8, 8, 5, 5, 5, 5, N'MIMI HOUSE - GÓC VƯỜN NHỎ AN YÊN

Cạnh bao la ruộng lúa xanh ngát, nơi ta có thể tìm về chút bình yên, Mimi House như một viên ngọc nhỏ giấu mình trong lòng thiên nhiên, nơi bạn sẽ được tận hưởng sự riêng tư tuyệt vời giữa những góc vườn xanh mát, xinh xắn.

Tách biệt hẳn khỏi khói bụi, ồn ào của phố thị, Mimi HOUSE đưa bạn về với sự trong lành, nơi tiếng chim hót véo von hòa cùng gió thoảng nhẹ qua cánh đồng lúa mênh mông, tạo nên một không gian tràn đầy sức sống và sự thư thái.

🌿 Tiện nghi tại Mimi House Không gian ngập tràn sắc xanh, hòa quyện cùng muôn hoa khoe sắc, mang lại những khoảnh khắc riêng tư và niềm vui bất tận.

⛵️ Hồ bơi ngoài trời xanh mát rộng 9x3m2 ⛵️ Bàn bi-a và bàn ăn ngoài trời cho những giây phút thư giãn 🔆 Phòng khách với tivi nối liền không gian ăn uống và bếp ấm cúng trong nhà 🔆 Hai phòng ngủ khép kín với giường lớn 2mx2m2 🔆 Hai phòng vệ sinh tiện nghi và hiện đại 🔆 Dàn âm thanh karaoke sống động sử dụng miễn phí 🔆 Khu bếp trong nhà và ngoài trời đầy đủ tiện nghi với bếp từ, tủ lạnh, lò vi sóng, nồi cơm điện, ấm đun nước, bát đũa, cùng bếp BBQ ngoài trời sẵn sàng cho những buổi tiệc nướng 🌿 Các tiện ích khác: Máy sấy tóc, khăn tắm, sữa tắm, dầu gội và khu vực để xe an toàn, tiện lợi.', N'⏰ Check-in: Sau 14:00:00
⏳ Check-out: Trước 12:00:00
🆔 Yêu cầu CMT / CCCD / Hộ chiếu
🤫 Hạn chế làm ồn sau 10 giờ tối
👟❌ Không đi giày / dép trong nhà
🚭 Không hút thuốc ở khu vực chung
🚭 Không cho phép hút thuốc
🐾❌ Không cho phép mang theo thú cưng
🎉 Cho phép tổ chức tiệc
🍳 Cho phép nấu ăn
📸 Cho phép chụp ảnh thương mại', NULL, N'

Người lớn: Trên 12 tuổi
Trẻ em: Từ 6 đến 12 tuổi
Em bé: Dưới 6 tuổi')
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [numberOfBedrooms], [numberOfLivingRooms], [numberOfBathrooms], [numberOfKitchens], [note], [rules], [utilities], [regulation]) VALUES (9, 9, 5, 5, 5, 5, N'MIMI HOUSE - GÓC VƯỜN NHỎ AN YÊN

Cạnh bao la ruộng lúa xanh ngát, nơi ta có thể tìm về chút bình yên, Mimi House như một viên ngọc nhỏ giấu mình trong lòng thiên nhiên, nơi bạn sẽ được tận hưởng sự riêng tư tuyệt vời giữa những góc vườn xanh mát, xinh xắn.

Tách biệt hẳn khỏi khói bụi, ồn ào của phố thị, Mimi HOUSE đưa bạn về với sự trong lành, nơi tiếng chim hót véo von hòa cùng gió thoảng nhẹ qua cánh đồng lúa mênh mông, tạo nên một không gian tràn đầy sức sống và sự thư thái.

🌿 Tiện nghi tại Mimi House Không gian ngập tràn sắc xanh, hòa quyện cùng muôn hoa khoe sắc, mang lại những khoảnh khắc riêng tư và niềm vui bất tận.

⛵️ Hồ bơi ngoài trời xanh mát rộng 9x3m2 ⛵️ Bàn bi-a và bàn ăn ngoài trời cho những giây phút thư giãn 🔆 Phòng khách với tivi nối liền không gian ăn uống và bếp ấm cúng trong nhà 🔆 Hai phòng ngủ khép kín với giường lớn 2mx2m2 🔆 Hai phòng vệ sinh tiện nghi và hiện đại 🔆 Dàn âm thanh karaoke sống động sử dụng miễn phí 🔆 Khu bếp trong nhà và ngoài trời đầy đủ tiện nghi với bếp từ, tủ lạnh, lò vi sóng, nồi cơm điện, ấm đun nước, bát đũa, cùng bếp BBQ ngoài trời sẵn sàng cho những buổi tiệc nướng 🌿 Các tiện ích khác: Máy sấy tóc, khăn tắm, sữa tắm, dầu gội và khu vực để xe an toàn, tiện lợi.', N'⏰ Check-in: Sau 14:00:00
⏳ Check-out: Trước 12:00:00
🆔 Yêu cầu CMT / CCCD / Hộ chiếu
🤫 Hạn chế làm ồn sau 10 giờ tối
👟❌ Không đi giày / dép trong nhà
🚭 Không hút thuốc ở khu vực chung
🚭 Không cho phép hút thuốc
🐾❌ Không cho phép mang theo thú cưng
🎉 Cho phép tổ chức tiệc
🍳 Cho phép nấu ăn
📸 Cho phép chụp ảnh thương mại', NULL, N'

Người lớn: Trên 12 tuổi
Trẻ em: Từ 6 đến 12 tuổi
Em bé: Dưới 6 tuổi')
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [numberOfBedrooms], [numberOfLivingRooms], [numberOfBathrooms], [numberOfKitchens], [note], [rules], [utilities], [regulation]) VALUES (10, 10, 5, 5, 5, 5, N'MIMI HOUSE - GÓC VƯỜN NHỎ AN YÊN

Cạnh bao la ruộng lúa xanh ngát, nơi ta có thể tìm về chút bình yên, Mimi House như một viên ngọc nhỏ giấu mình trong lòng thiên nhiên, nơi bạn sẽ được tận hưởng sự riêng tư tuyệt vời giữa những góc vườn xanh mát, xinh xắn.

Tách biệt hẳn khỏi khói bụi, ồn ào của phố thị, Mimi HOUSE đưa bạn về với sự trong lành, nơi tiếng chim hót véo von hòa cùng gió thoảng nhẹ qua cánh đồng lúa mênh mông, tạo nên một không gian tràn đầy sức sống và sự thư thái.

🌿 Tiện nghi tại Mimi House Không gian ngập tràn sắc xanh, hòa quyện cùng muôn hoa khoe sắc, mang lại những khoảnh khắc riêng tư và niềm vui bất tận.

⛵️ Hồ bơi ngoài trời xanh mát rộng 9x3m2 ⛵️ Bàn bi-a và bàn ăn ngoài trời cho những giây phút thư giãn 🔆 Phòng khách với tivi nối liền không gian ăn uống và bếp ấm cúng trong nhà 🔆 Hai phòng ngủ khép kín với giường lớn 2mx2m2 🔆 Hai phòng vệ sinh tiện nghi và hiện đại 🔆 Dàn âm thanh karaoke sống động sử dụng miễn phí 🔆 Khu bếp trong nhà và ngoài trời đầy đủ tiện nghi với bếp từ, tủ lạnh, lò vi sóng, nồi cơm điện, ấm đun nước, bát đũa, cùng bếp BBQ ngoài trời sẵn sàng cho những buổi tiệc nướng 🌿 Các tiện ích khác: Máy sấy tóc, khăn tắm, sữa tắm, dầu gội và khu vực để xe an toàn, tiện lợi.', N'⏰ Check-in: Sau 14:00:00
⏳ Check-out: Trước 12:00:00
🆔 Yêu cầu CMT / CCCD / Hộ chiếu
🤫 Hạn chế làm ồn sau 10 giờ tối
👟❌ Không đi giày / dép trong nhà
🚭 Không hút thuốc ở khu vực chung
🚭 Không cho phép hút thuốc
🐾❌ Không cho phép mang theo thú cưng
🎉 Cho phép tổ chức tiệc
🍳 Cho phép nấu ăn
📸 Cho phép chụp ảnh thương mại', NULL, N'

Người lớn: Trên 12 tuổi
Trẻ em: Từ 6 đến 12 tuổi
Em bé: Dưới 6 tuổi')
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [numberOfBedrooms], [numberOfLivingRooms], [numberOfBathrooms], [numberOfKitchens], [note], [rules], [utilities], [regulation]) VALUES (11, 11, 5, 5, 5, 5, N'MIMI HOUSE - GÓC VƯỜN NHỎ AN YÊN

Cạnh bao la ruộng lúa xanh ngát, nơi ta có thể tìm về chút bình yên, Mimi House như một viên ngọc nhỏ giấu mình trong lòng thiên nhiên, nơi bạn sẽ được tận hưởng sự riêng tư tuyệt vời giữa những góc vườn xanh mát, xinh xắn.

Tách biệt hẳn khỏi khói bụi, ồn ào của phố thị, Mimi HOUSE đưa bạn về với sự trong lành, nơi tiếng chim hót véo von hòa cùng gió thoảng nhẹ qua cánh đồng lúa mênh mông, tạo nên một không gian tràn đầy sức sống và sự thư thái.

🌿 Tiện nghi tại Mimi House Không gian ngập tràn sắc xanh, hòa quyện cùng muôn hoa khoe sắc, mang lại những khoảnh khắc riêng tư và niềm vui bất tận.

⛵️ Hồ bơi ngoài trời xanh mát rộng 9x3m2 ⛵️ Bàn bi-a và bàn ăn ngoài trời cho những giây phút thư giãn 🔆 Phòng khách với tivi nối liền không gian ăn uống và bếp ấm cúng trong nhà 🔆 Hai phòng ngủ khép kín với giường lớn 2mx2m2 🔆 Hai phòng vệ sinh tiện nghi và hiện đại 🔆 Dàn âm thanh karaoke sống động sử dụng miễn phí 🔆 Khu bếp trong nhà và ngoài trời đầy đủ tiện nghi với bếp từ, tủ lạnh, lò vi sóng, nồi cơm điện, ấm đun nước, bát đũa, cùng bếp BBQ ngoài trời sẵn sàng cho những buổi tiệc nướng 🌿 Các tiện ích khác: Máy sấy tóc, khăn tắm, sữa tắm, dầu gội và khu vực để xe an toàn, tiện lợi.', N'⏰ Check-in: Sau 14:00:00
⏳ Check-out: Trước 12:00:00
🆔 Yêu cầu CMT / CCCD / Hộ chiếu
🤫 Hạn chế làm ồn sau 10 giờ tối
👟❌ Không đi giày / dép trong nhà
🚭 Không hút thuốc ở khu vực chung
🚭 Không cho phép hút thuốc
🐾❌ Không cho phép mang theo thú cưng
🎉 Cho phép tổ chức tiệc
🍳 Cho phép nấu ăn
📸 Cho phép chụp ảnh thương mại', NULL, N'

Người lớn: Trên 12 tuổi
Trẻ em: Từ 6 đến 12 tuổi
Em bé: Dưới 6 tuổi')
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [numberOfBedrooms], [numberOfLivingRooms], [numberOfBathrooms], [numberOfKitchens], [note], [rules], [utilities], [regulation]) VALUES (12, 12, 5, 5, 5, 5, N'MIMI HOUSE - GÓC VƯỜN NHỎ AN YÊN

Cạnh bao la ruộng lúa xanh ngát, nơi ta có thể tìm về chút bình yên, Mimi House như một viên ngọc nhỏ giấu mình trong lòng thiên nhiên, nơi bạn sẽ được tận hưởng sự riêng tư tuyệt vời giữa những góc vườn xanh mát, xinh xắn.

Tách biệt hẳn khỏi khói bụi, ồn ào của phố thị, Mimi HOUSE đưa bạn về với sự trong lành, nơi tiếng chim hót véo von hòa cùng gió thoảng nhẹ qua cánh đồng lúa mênh mông, tạo nên một không gian tràn đầy sức sống và sự thư thái.

🌿 Tiện nghi tại Mimi House Không gian ngập tràn sắc xanh, hòa quyện cùng muôn hoa khoe sắc, mang lại những khoảnh khắc riêng tư và niềm vui bất tận.

⛵️ Hồ bơi ngoài trời xanh mát rộng 9x3m2 ⛵️ Bàn bi-a và bàn ăn ngoài trời cho những giây phút thư giãn 🔆 Phòng khách với tivi nối liền không gian ăn uống và bếp ấm cúng trong nhà 🔆 Hai phòng ngủ khép kín với giường lớn 2mx2m2 🔆 Hai phòng vệ sinh tiện nghi và hiện đại 🔆 Dàn âm thanh karaoke sống động sử dụng miễn phí 🔆 Khu bếp trong nhà và ngoài trời đầy đủ tiện nghi với bếp từ, tủ lạnh, lò vi sóng, nồi cơm điện, ấm đun nước, bát đũa, cùng bếp BBQ ngoài trời sẵn sàng cho những buổi tiệc nướng 🌿 Các tiện ích khác: Máy sấy tóc, khăn tắm, sữa tắm, dầu gội và khu vực để xe an toàn, tiện lợi.', N'⏰ Check-in: Sau 14:00:00
⏳ Check-out: Trước 12:00:00
🆔 Yêu cầu CMT / CCCD / Hộ chiếu
🤫 Hạn chế làm ồn sau 10 giờ tối
👟❌ Không đi giày / dép trong nhà
🚭 Không hút thuốc ở khu vực chung
🚭 Không cho phép hút thuốc
🐾❌ Không cho phép mang theo thú cưng
🎉 Cho phép tổ chức tiệc
🍳 Cho phép nấu ăn
📸 Cho phép chụp ảnh thương mại', NULL, N'

Người lớn: Trên 12 tuổi
Trẻ em: Từ 6 đến 12 tuổi
Em bé: Dưới 6 tuổi')
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [numberOfBedrooms], [numberOfLivingRooms], [numberOfBathrooms], [numberOfKitchens], [note], [rules], [utilities], [regulation]) VALUES (13, 13, 5, 5, 5, 5, N'MIMI HOUSE - GÓC VƯỜN NHỎ AN YÊN

Cạnh bao la ruộng lúa xanh ngát, nơi ta có thể tìm về chút bình yên, Mimi House như một viên ngọc nhỏ giấu mình trong lòng thiên nhiên, nơi bạn sẽ được tận hưởng sự riêng tư tuyệt vời giữa những góc vườn xanh mát, xinh xắn.

Tách biệt hẳn khỏi khói bụi, ồn ào của phố thị, Mimi HOUSE đưa bạn về với sự trong lành, nơi tiếng chim hót véo von hòa cùng gió thoảng nhẹ qua cánh đồng lúa mênh mông, tạo nên một không gian tràn đầy sức sống và sự thư thái.

🌿 Tiện nghi tại Mimi House Không gian ngập tràn sắc xanh, hòa quyện cùng muôn hoa khoe sắc, mang lại những khoảnh khắc riêng tư và niềm vui bất tận.

⛵️ Hồ bơi ngoài trời xanh mát rộng 9x3m2 ⛵️ Bàn bi-a và bàn ăn ngoài trời cho những giây phút thư giãn 🔆 Phòng khách với tivi nối liền không gian ăn uống và bếp ấm cúng trong nhà 🔆 Hai phòng ngủ khép kín với giường lớn 2mx2m2 🔆 Hai phòng vệ sinh tiện nghi và hiện đại 🔆 Dàn âm thanh karaoke sống động sử dụng miễn phí 🔆 Khu bếp trong nhà và ngoài trời đầy đủ tiện nghi với bếp từ, tủ lạnh, lò vi sóng, nồi cơm điện, ấm đun nước, bát đũa, cùng bếp BBQ ngoài trời sẵn sàng cho những buổi tiệc nướng 🌿 Các tiện ích khác: Máy sấy tóc, khăn tắm, sữa tắm, dầu gội và khu vực để xe an toàn, tiện lợi.', N'⏰ Check-in: Sau 14:00:00
⏳ Check-out: Trước 12:00:00
🆔 Yêu cầu CMT / CCCD / Hộ chiếu
🤫 Hạn chế làm ồn sau 10 giờ tối
👟❌ Không đi giày / dép trong nhà
🚭 Không hút thuốc ở khu vực chung
🚭 Không cho phép hút thuốc
🐾❌ Không cho phép mang theo thú cưng
🎉 Cho phép tổ chức tiệc
🍳 Cho phép nấu ăn
📸 Cho phép chụp ảnh thương mại', NULL, N'

Người lớn: Trên 12 tuổi
Trẻ em: Từ 6 đến 12 tuổi
Em bé: Dưới 6 tuổi')
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [numberOfBedrooms], [numberOfLivingRooms], [numberOfBathrooms], [numberOfKitchens], [note], [rules], [utilities], [regulation]) VALUES (14, 14, 5, 5, 5, 5, N'MIMI HOUSE - GÓC VƯỜN NHỎ AN YÊN

Cạnh bao la ruộng lúa xanh ngát, nơi ta có thể tìm về chút bình yên, Mimi House như một viên ngọc nhỏ giấu mình trong lòng thiên nhiên, nơi bạn sẽ được tận hưởng sự riêng tư tuyệt vời giữa những góc vườn xanh mát, xinh xắn.

Tách biệt hẳn khỏi khói bụi, ồn ào của phố thị, Mimi HOUSE đưa bạn về với sự trong lành, nơi tiếng chim hót véo von hòa cùng gió thoảng nhẹ qua cánh đồng lúa mênh mông, tạo nên một không gian tràn đầy sức sống và sự thư thái.

🌿 Tiện nghi tại Mimi House Không gian ngập tràn sắc xanh, hòa quyện cùng muôn hoa khoe sắc, mang lại những khoảnh khắc riêng tư và niềm vui bất tận.

⛵️ Hồ bơi ngoài trời xanh mát rộng 9x3m2 ⛵️ Bàn bi-a và bàn ăn ngoài trời cho những giây phút thư giãn 🔆 Phòng khách với tivi nối liền không gian ăn uống và bếp ấm cúng trong nhà 🔆 Hai phòng ngủ khép kín với giường lớn 2mx2m2 🔆 Hai phòng vệ sinh tiện nghi và hiện đại 🔆 Dàn âm thanh karaoke sống động sử dụng miễn phí 🔆 Khu bếp trong nhà và ngoài trời đầy đủ tiện nghi với bếp từ, tủ lạnh, lò vi sóng, nồi cơm điện, ấm đun nước, bát đũa, cùng bếp BBQ ngoài trời sẵn sàng cho những buổi tiệc nướng 🌿 Các tiện ích khác: Máy sấy tóc, khăn tắm, sữa tắm, dầu gội và khu vực để xe an toàn, tiện lợi.', N'⏰ Check-in: Sau 14:00:00
⏳ Check-out: Trước 12:00:00
🆔 Yêu cầu CMT / CCCD / Hộ chiếu
🤫 Hạn chế làm ồn sau 10 giờ tối
👟❌ Không đi giày / dép trong nhà
🚭 Không hút thuốc ở khu vực chung
🚭 Không cho phép hút thuốc
🐾❌ Không cho phép mang theo thú cưng
🎉 Cho phép tổ chức tiệc
🍳 Cho phép nấu ăn
📸 Cho phép chụp ảnh thương mại', NULL, N'

Người lớn: Trên 12 tuổi
Trẻ em: Từ 6 đến 12 tuổi
Em bé: Dưới 6 tuổi')
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [numberOfBedrooms], [numberOfLivingRooms], [numberOfBathrooms], [numberOfKitchens], [note], [rules], [utilities], [regulation]) VALUES (15, 15, 5, 5, 5, 5, N'MIMI HOUSE - GÓC VƯỜN NHỎ AN YÊN

Cạnh bao la ruộng lúa xanh ngát, nơi ta có thể tìm về chút bình yên, Mimi House như một viên ngọc nhỏ giấu mình trong lòng thiên nhiên, nơi bạn sẽ được tận hưởng sự riêng tư tuyệt vời giữa những góc vườn xanh mát, xinh xắn.

Tách biệt hẳn khỏi khói bụi, ồn ào của phố thị, Mimi HOUSE đưa bạn về với sự trong lành, nơi tiếng chim hót véo von hòa cùng gió thoảng nhẹ qua cánh đồng lúa mênh mông, tạo nên một không gian tràn đầy sức sống và sự thư thái.

🌿 Tiện nghi tại Mimi House Không gian ngập tràn sắc xanh, hòa quyện cùng muôn hoa khoe sắc, mang lại những khoảnh khắc riêng tư và niềm vui bất tận.

⛵️ Hồ bơi ngoài trời xanh mát rộng 9x3m2 ⛵️ Bàn bi-a và bàn ăn ngoài trời cho những giây phút thư giãn 🔆 Phòng khách với tivi nối liền không gian ăn uống và bếp ấm cúng trong nhà 🔆 Hai phòng ngủ khép kín với giường lớn 2mx2m2 🔆 Hai phòng vệ sinh tiện nghi và hiện đại 🔆 Dàn âm thanh karaoke sống động sử dụng miễn phí 🔆 Khu bếp trong nhà và ngoài trời đầy đủ tiện nghi với bếp từ, tủ lạnh, lò vi sóng, nồi cơm điện, ấm đun nước, bát đũa, cùng bếp BBQ ngoài trời sẵn sàng cho những buổi tiệc nướng 🌿 Các tiện ích khác: Máy sấy tóc, khăn tắm, sữa tắm, dầu gội và khu vực để xe an toàn, tiện lợi.', N'⏰ Check-in: Sau 14:00:00
⏳ Check-out: Trước 12:00:00
🆔 Yêu cầu CMT / CCCD / Hộ chiếu
🤫 Hạn chế làm ồn sau 10 giờ tối
👟❌ Không đi giày / dép trong nhà
🚭 Không hút thuốc ở khu vực chung
🚭 Không cho phép hút thuốc
🐾❌ Không cho phép mang theo thú cưng
🎉 Cho phép tổ chức tiệc
🍳 Cho phép nấu ăn
📸 Cho phép chụp ảnh thương mại', NULL, N'

Người lớn: Trên 12 tuổi
Trẻ em: Từ 6 đến 12 tuổi
Em bé: Dưới 6 tuổi')
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [numberOfBedrooms], [numberOfLivingRooms], [numberOfBathrooms], [numberOfKitchens], [note], [rules], [utilities], [regulation]) VALUES (16, 16, 5, 5, 5, 5, N'MIMI HOUSE - GÓC VƯỜN NHỎ AN YÊN

Cạnh bao la ruộng lúa xanh ngát, nơi ta có thể tìm về chút bình yên, Mimi House như một viên ngọc nhỏ giấu mình trong lòng thiên nhiên, nơi bạn sẽ được tận hưởng sự riêng tư tuyệt vời giữa những góc vườn xanh mát, xinh xắn.

Tách biệt hẳn khỏi khói bụi, ồn ào của phố thị, Mimi HOUSE đưa bạn về với sự trong lành, nơi tiếng chim hót véo von hòa cùng gió thoảng nhẹ qua cánh đồng lúa mênh mông, tạo nên một không gian tràn đầy sức sống và sự thư thái.

🌿 Tiện nghi tại Mimi House Không gian ngập tràn sắc xanh, hòa quyện cùng muôn hoa khoe sắc, mang lại những khoảnh khắc riêng tư và niềm vui bất tận.

⛵️ Hồ bơi ngoài trời xanh mát rộng 9x3m2 ⛵️ Bàn bi-a và bàn ăn ngoài trời cho những giây phút thư giãn 🔆 Phòng khách với tivi nối liền không gian ăn uống và bếp ấm cúng trong nhà 🔆 Hai phòng ngủ khép kín với giường lớn 2mx2m2 🔆 Hai phòng vệ sinh tiện nghi và hiện đại 🔆 Dàn âm thanh karaoke sống động sử dụng miễn phí 🔆 Khu bếp trong nhà và ngoài trời đầy đủ tiện nghi với bếp từ, tủ lạnh, lò vi sóng, nồi cơm điện, ấm đun nước, bát đũa, cùng bếp BBQ ngoài trời sẵn sàng cho những buổi tiệc nướng 🌿 Các tiện ích khác: Máy sấy tóc, khăn tắm, sữa tắm, dầu gội và khu vực để xe an toàn, tiện lợi.', N'⏰ Check-in: Sau 14:00:00
⏳ Check-out: Trước 12:00:00
🆔 Yêu cầu CMT / CCCD / Hộ chiếu
🤫 Hạn chế làm ồn sau 10 giờ tối
👟❌ Không đi giày / dép trong nhà
🚭 Không hút thuốc ở khu vực chung
🚭 Không cho phép hút thuốc
🐾❌ Không cho phép mang theo thú cưng
🎉 Cho phép tổ chức tiệc
🍳 Cho phép nấu ăn
📸 Cho phép chụp ảnh thương mại', NULL, N'

Người lớn: Trên 12 tuổi
Trẻ em: Từ 6 đến 12 tuổi
Em bé: Dưới 6 tuổi')
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [numberOfBedrooms], [numberOfLivingRooms], [numberOfBathrooms], [numberOfKitchens], [note], [rules], [utilities], [regulation]) VALUES (17, 17, 5, 5, 5, 5, N'MIMI HOUSE - GÓC VƯỜN NHỎ AN YÊN

Cạnh bao la ruộng lúa xanh ngát, nơi ta có thể tìm về chút bình yên, Mimi House như một viên ngọc nhỏ giấu mình trong lòng thiên nhiên, nơi bạn sẽ được tận hưởng sự riêng tư tuyệt vời giữa những góc vườn xanh mát, xinh xắn.

Tách biệt hẳn khỏi khói bụi, ồn ào của phố thị, Mimi HOUSE đưa bạn về với sự trong lành, nơi tiếng chim hót véo von hòa cùng gió thoảng nhẹ qua cánh đồng lúa mênh mông, tạo nên một không gian tràn đầy sức sống và sự thư thái.

🌿 Tiện nghi tại Mimi House Không gian ngập tràn sắc xanh, hòa quyện cùng muôn hoa khoe sắc, mang lại những khoảnh khắc riêng tư và niềm vui bất tận.

⛵️ Hồ bơi ngoài trời xanh mát rộng 9x3m2 ⛵️ Bàn bi-a và bàn ăn ngoài trời cho những giây phút thư giãn 🔆 Phòng khách với tivi nối liền không gian ăn uống và bếp ấm cúng trong nhà 🔆 Hai phòng ngủ khép kín với giường lớn 2mx2m2 🔆 Hai phòng vệ sinh tiện nghi và hiện đại 🔆 Dàn âm thanh karaoke sống động sử dụng miễn phí 🔆 Khu bếp trong nhà và ngoài trời đầy đủ tiện nghi với bếp từ, tủ lạnh, lò vi sóng, nồi cơm điện, ấm đun nước, bát đũa, cùng bếp BBQ ngoài trời sẵn sàng cho những buổi tiệc nướng 🌿 Các tiện ích khác: Máy sấy tóc, khăn tắm, sữa tắm, dầu gội và khu vực để xe an toàn, tiện lợi.', N'⏰ Check-in: Sau 14:00:00
⏳ Check-out: Trước 12:00:00
🆔 Yêu cầu CMT / CCCD / Hộ chiếu
🤫 Hạn chế làm ồn sau 10 giờ tối
👟❌ Không đi giày / dép trong nhà
🚭 Không hút thuốc ở khu vực chung
🚭 Không cho phép hút thuốc
🐾❌ Không cho phép mang theo thú cưng
🎉 Cho phép tổ chức tiệc
🍳 Cho phép nấu ăn
📸 Cho phép chụp ảnh thương mại', NULL, N'

Người lớn: Trên 12 tuổi
Trẻ em: Từ 6 đến 12 tuổi
Em bé: Dưới 6 tuổi')
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [numberOfBedrooms], [numberOfLivingRooms], [numberOfBathrooms], [numberOfKitchens], [note], [rules], [utilities], [regulation]) VALUES (18, 18, 2, 2, 2, 2, N'MIMI HOUSE - GÓC VƯỜN NHỎ AN YÊN

Cạnh bao la ruộng lúa xanh ngát, nơi ta có thể tìm về chút bình yên, Mimi House như một viên ngọc nhỏ giấu mình trong lòng thiên nhiên, nơi bạn sẽ được tận hưởng sự riêng tư tuyệt vời giữa những góc vườn xanh mát, xinh xắn.

Tách biệt hẳn khỏi khói bụi, ồn ào của phố thị, Mimi HOUSE đưa bạn về với sự trong lành, nơi tiếng chim hót véo von hòa cùng gió thoảng nhẹ qua cánh đồng lúa mênh mông, tạo nên một không gian tràn đầy sức sống và sự thư thái.

🌿 Tiện nghi tại Mimi House Không gian ngập tràn sắc xanh, hòa quyện cùng muôn hoa khoe sắc, mang lại những khoảnh khắc riêng tư và niềm vui bất tận.

⛵️ Hồ bơi ngoài trời xanh mát rộng 9x3m2 ⛵️ Bàn bi-a và bàn ăn ngoài trời cho những giây phút thư giãn 🔆 Phòng khách với tivi nối liền không gian ăn uống và bếp ấm cúng trong nhà 🔆 Hai phòng ngủ khép kín với giường lớn 2mx2m2 🔆 Hai phòng vệ sinh tiện nghi và hiện đại 🔆 Dàn âm thanh karaoke sống động sử dụng miễn phí 🔆 Khu bếp trong nhà và ngoài trời đầy đủ tiện nghi với bếp từ, tủ lạnh, lò vi sóng, nồi cơm điện, ấm đun nước, bát đũa, cùng bếp BBQ ngoài trời sẵn sàng cho những buổi tiệc nướng 🌿 Các tiện ích khác: Máy sấy tóc, khăn tắm, sữa tắm, dầu gội và khu vực để xe an toàn, tiện lợi.', N'⏰ Check-in: Sau 14:00:00
⏳ Check-out: Trước 12:00:00
🆔 Yêu cầu CMT / CCCD / Hộ chiếu
🤫 Hạn chế làm ồn sau 10 giờ tối
👟❌ Không đi giày / dép trong nhà
🚭 Không hút thuốc ở khu vực chung
🚭 Không cho phép hút thuốc
🐾❌ Không cho phép mang theo thú cưng
🎉 Cho phép tổ chức tiệc
🍳 Cho phép nấu ăn
📸 Cho phép chụp ảnh thương mại', NULL, N'

Người lớn: Trên 12 tuổi
Trẻ em: Từ 6 đến 12 tuổi
Em bé: Dưới 6 tuổi')
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [numberOfBedrooms], [numberOfLivingRooms], [numberOfBathrooms], [numberOfKitchens], [note], [rules], [utilities], [regulation]) VALUES (19, 19, 2, 2, 2, 2, N'MIMI HOUSE - GÓC VƯỜN NHỎ AN YÊN

Cạnh bao la ruộng lúa xanh ngát, nơi ta có thể tìm về chút bình yên, Mimi House như một viên ngọc nhỏ giấu mình trong lòng thiên nhiên, nơi bạn sẽ được tận hưởng sự riêng tư tuyệt vời giữa những góc vườn xanh mát, xinh xắn.

Tách biệt hẳn khỏi khói bụi, ồn ào của phố thị, Mimi HOUSE đưa bạn về với sự trong lành, nơi tiếng chim hót véo von hòa cùng gió thoảng nhẹ qua cánh đồng lúa mênh mông, tạo nên một không gian tràn đầy sức sống và sự thư thái.

🌿 Tiện nghi tại Mimi House Không gian ngập tràn sắc xanh, hòa quyện cùng muôn hoa khoe sắc, mang lại những khoảnh khắc riêng tư và niềm vui bất tận.

⛵️ Hồ bơi ngoài trời xanh mát rộng 9x3m2 ⛵️ Bàn bi-a và bàn ăn ngoài trời cho những giây phút thư giãn 🔆 Phòng khách với tivi nối liền không gian ăn uống và bếp ấm cúng trong nhà 🔆 Hai phòng ngủ khép kín với giường lớn 2mx2m2 🔆 Hai phòng vệ sinh tiện nghi và hiện đại 🔆 Dàn âm thanh karaoke sống động sử dụng miễn phí 🔆 Khu bếp trong nhà và ngoài trời đầy đủ tiện nghi với bếp từ, tủ lạnh, lò vi sóng, nồi cơm điện, ấm đun nước, bát đũa, cùng bếp BBQ ngoài trời sẵn sàng cho những buổi tiệc nướng 🌿 Các tiện ích khác: Máy sấy tóc, khăn tắm, sữa tắm, dầu gội và khu vực để xe an toàn, tiện lợi.', N'⏰ Check-in: Sau 14:00:00
⏳ Check-out: Trước 12:00:00
🆔 Yêu cầu CMT / CCCD / Hộ chiếu
🤫 Hạn chế làm ồn sau 10 giờ tối
👟❌ Không đi giày / dép trong nhà
🚭 Không hút thuốc ở khu vực chung
🚭 Không cho phép hút thuốc
🐾❌ Không cho phép mang theo thú cưng
🎉 Cho phép tổ chức tiệc
🍳 Cho phép nấu ăn
📸 Cho phép chụp ảnh thương mại', NULL, N'

Người lớn: Trên 12 tuổi
Trẻ em: Từ 6 đến 12 tuổi
Em bé: Dưới 6 tuổi')
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [numberOfBedrooms], [numberOfLivingRooms], [numberOfBathrooms], [numberOfKitchens], [note], [rules], [utilities], [regulation]) VALUES (20, 20, 5, 5, 5, 5, N'MIMI HOUSE - GÓC VƯỜN NHỎ AN YÊN

Cạnh bao la ruộng lúa xanh ngát, nơi ta có thể tìm về chút bình yên, Mimi House như một viên ngọc nhỏ giấu mình trong lòng thiên nhiên, nơi bạn sẽ được tận hưởng sự riêng tư tuyệt vời giữa những góc vườn xanh mát, xinh xắn.

Tách biệt hẳn khỏi khói bụi, ồn ào của phố thị, Mimi HOUSE đưa bạn về với sự trong lành, nơi tiếng chim hót véo von hòa cùng gió thoảng nhẹ qua cánh đồng lúa mênh mông, tạo nên một không gian tràn đầy sức sống và sự thư thái.

🌿 Tiện nghi tại Mimi House Không gian ngập tràn sắc xanh, hòa quyện cùng muôn hoa khoe sắc, mang lại những khoảnh khắc riêng tư và niềm vui bất tận.

⛵️ Hồ bơi ngoài trời xanh mát rộng 9x3m2 ⛵️ Bàn bi-a và bàn ăn ngoài trời cho những giây phút thư giãn 🔆 Phòng khách với tivi nối liền không gian ăn uống và bếp ấm cúng trong nhà 🔆 Hai phòng ngủ khép kín với giường lớn 2mx2m2 🔆 Hai phòng vệ sinh tiện nghi và hiện đại 🔆 Dàn âm thanh karaoke sống động sử dụng miễn phí 🔆 Khu bếp trong nhà và ngoài trời đầy đủ tiện nghi với bếp từ, tủ lạnh, lò vi sóng, nồi cơm điện, ấm đun nước, bát đũa, cùng bếp BBQ ngoài trời sẵn sàng cho những buổi tiệc nướng 🌿 Các tiện ích khác: Máy sấy tóc, khăn tắm, sữa tắm, dầu gội và khu vực để xe an toàn, tiện lợi.', N'⏰ Check-in: Sau 14:00:00
⏳ Check-out: Trước 12:00:00
🆔 Yêu cầu CMT / CCCD / Hộ chiếu
🤫 Hạn chế làm ồn sau 10 giờ tối
👟❌ Không đi giày / dép trong nhà
🚭 Không hút thuốc ở khu vực chung
🚭 Không cho phép hút thuốc
🐾❌ Không cho phép mang theo thú cưng
🎉 Cho phép tổ chức tiệc
🍳 Cho phép nấu ăn
📸 Cho phép chụp ảnh thương mại', NULL, N'

Người lớn: Trên 12 tuổi
Trẻ em: Từ 6 đến 12 tuổi
Em bé: Dưới 6 tuổi')
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [numberOfBedrooms], [numberOfLivingRooms], [numberOfBathrooms], [numberOfKitchens], [note], [rules], [utilities], [regulation]) VALUES (21, 21, 5, 5, 5, 5, N'MIMI HOUSE - GÓC VƯỜN NHỎ AN YÊN

Cạnh bao la ruộng lúa xanh ngát, nơi ta có thể tìm về chút bình yên, Mimi House như một viên ngọc nhỏ giấu mình trong lòng thiên nhiên, nơi bạn sẽ được tận hưởng sự riêng tư tuyệt vời giữa những góc vườn xanh mát, xinh xắn.

Tách biệt hẳn khỏi khói bụi, ồn ào của phố thị, Mimi HOUSE đưa bạn về với sự trong lành, nơi tiếng chim hót véo von hòa cùng gió thoảng nhẹ qua cánh đồng lúa mênh mông, tạo nên một không gian tràn đầy sức sống và sự thư thái.

🌿 Tiện nghi tại Mimi House Không gian ngập tràn sắc xanh, hòa quyện cùng muôn hoa khoe sắc, mang lại những khoảnh khắc riêng tư và niềm vui bất tận.

⛵️ Hồ bơi ngoài trời xanh mát rộng 9x3m2 ⛵️ Bàn bi-a và bàn ăn ngoài trời cho những giây phút thư giãn 🔆 Phòng khách với tivi nối liền không gian ăn uống và bếp ấm cúng trong nhà 🔆 Hai phòng ngủ khép kín với giường lớn 2mx2m2 🔆 Hai phòng vệ sinh tiện nghi và hiện đại 🔆 Dàn âm thanh karaoke sống động sử dụng miễn phí 🔆 Khu bếp trong nhà và ngoài trời đầy đủ tiện nghi với bếp từ, tủ lạnh, lò vi sóng, nồi cơm điện, ấm đun nước, bát đũa, cùng bếp BBQ ngoài trời sẵn sàng cho những buổi tiệc nướng 🌿 Các tiện ích khác: Máy sấy tóc, khăn tắm, sữa tắm, dầu gội và khu vực để xe an toàn, tiện lợi.', N'⏰ Check-in: Sau 14:00:00
⏳ Check-out: Trước 12:00:00
🆔 Yêu cầu CMT / CCCD / Hộ chiếu
🤫 Hạn chế làm ồn sau 10 giờ tối
👟❌ Không đi giày / dép trong nhà
🚭 Không hút thuốc ở khu vực chung
🚭 Không cho phép hút thuốc
🐾❌ Không cho phép mang theo thú cưng
🎉 Cho phép tổ chức tiệc
🍳 Cho phép nấu ăn
📸 Cho phép chụp ảnh thương mại', NULL, N'

Người lớn: Trên 12 tuổi
Trẻ em: Từ 6 đến 12 tuổi
Em bé: Dưới 6 tuổi')
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [numberOfBedrooms], [numberOfLivingRooms], [numberOfBathrooms], [numberOfKitchens], [note], [rules], [utilities], [regulation]) VALUES (22, 22, 5, 5, 5, 5, N'MIMI HOUSE - GÓC VƯỜN NHỎ AN YÊN

Cạnh bao la ruộng lúa xanh ngát, nơi ta có thể tìm về chút bình yên, Mimi House như một viên ngọc nhỏ giấu mình trong lòng thiên nhiên, nơi bạn sẽ được tận hưởng sự riêng tư tuyệt vời giữa những góc vườn xanh mát, xinh xắn.

Tách biệt hẳn khỏi khói bụi, ồn ào của phố thị, Mimi HOUSE đưa bạn về với sự trong lành, nơi tiếng chim hót véo von hòa cùng gió thoảng nhẹ qua cánh đồng lúa mênh mông, tạo nên một không gian tràn đầy sức sống và sự thư thái.

🌿 Tiện nghi tại Mimi House Không gian ngập tràn sắc xanh, hòa quyện cùng muôn hoa khoe sắc, mang lại những khoảnh khắc riêng tư và niềm vui bất tận.

⛵️ Hồ bơi ngoài trời xanh mát rộng 9x3m2 ⛵️ Bàn bi-a và bàn ăn ngoài trời cho những giây phút thư giãn 🔆 Phòng khách với tivi nối liền không gian ăn uống và bếp ấm cúng trong nhà 🔆 Hai phòng ngủ khép kín với giường lớn 2mx2m2 🔆 Hai phòng vệ sinh tiện nghi và hiện đại 🔆 Dàn âm thanh karaoke sống động sử dụng miễn phí 🔆 Khu bếp trong nhà và ngoài trời đầy đủ tiện nghi với bếp từ, tủ lạnh, lò vi sóng, nồi cơm điện, ấm đun nước, bát đũa, cùng bếp BBQ ngoài trời sẵn sàng cho những buổi tiệc nướng 🌿 Các tiện ích khác: Máy sấy tóc, khăn tắm, sữa tắm, dầu gội và khu vực để xe an toàn, tiện lợi.', N'⏰ Check-in: Sau 14:00:00
⏳ Check-out: Trước 12:00:00
🆔 Yêu cầu CMT / CCCD / Hộ chiếu
🤫 Hạn chế làm ồn sau 10 giờ tối
👟❌ Không đi giày / dép trong nhà
🚭 Không hút thuốc ở khu vực chung
🚭 Không cho phép hút thuốc
🐾❌ Không cho phép mang theo thú cưng
🎉 Cho phép tổ chức tiệc
🍳 Cho phép nấu ăn
📸 Cho phép chụp ảnh thương mại', NULL, N'

Người lớn: Trên 12 tuổi
Trẻ em: Từ 6 đến 12 tuổi
Em bé: Dưới 6 tuổi')
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [numberOfBedrooms], [numberOfLivingRooms], [numberOfBathrooms], [numberOfKitchens], [note], [rules], [utilities], [regulation]) VALUES (23, 23, 5, 5, 5, 5, N'MIMI HOUSE - GÓC VƯỜN NHỎ AN YÊN

Cạnh bao la ruộng lúa xanh ngát, nơi ta có thể tìm về chút bình yên, Mimi House như một viên ngọc nhỏ giấu mình trong lòng thiên nhiên, nơi bạn sẽ được tận hưởng sự riêng tư tuyệt vời giữa những góc vườn xanh mát, xinh xắn.

Tách biệt hẳn khỏi khói bụi, ồn ào của phố thị, Mimi HOUSE đưa bạn về với sự trong lành, nơi tiếng chim hót véo von hòa cùng gió thoảng nhẹ qua cánh đồng lúa mênh mông, tạo nên một không gian tràn đầy sức sống và sự thư thái.

🌿 Tiện nghi tại Mimi House Không gian ngập tràn sắc xanh, hòa quyện cùng muôn hoa khoe sắc, mang lại những khoảnh khắc riêng tư và niềm vui bất tận.

⛵️ Hồ bơi ngoài trời xanh mát rộng 9x3m2 ⛵️ Bàn bi-a và bàn ăn ngoài trời cho những giây phút thư giãn 🔆 Phòng khách với tivi nối liền không gian ăn uống và bếp ấm cúng trong nhà 🔆 Hai phòng ngủ khép kín với giường lớn 2mx2m2 🔆 Hai phòng vệ sinh tiện nghi và hiện đại 🔆 Dàn âm thanh karaoke sống động sử dụng miễn phí 🔆 Khu bếp trong nhà và ngoài trời đầy đủ tiện nghi với bếp từ, tủ lạnh, lò vi sóng, nồi cơm điện, ấm đun nước, bát đũa, cùng bếp BBQ ngoài trời sẵn sàng cho những buổi tiệc nướng 🌿 Các tiện ích khác: Máy sấy tóc, khăn tắm, sữa tắm, dầu gội và khu vực để xe an toàn, tiện lợi.', N'⏰ Check-in: Sau 14:00:00
⏳ Check-out: Trước 12:00:00
🆔 Yêu cầu CMT / CCCD / Hộ chiếu
🤫 Hạn chế làm ồn sau 10 giờ tối
👟❌ Không đi giày / dép trong nhà
🚭 Không hút thuốc ở khu vực chung
🚭 Không cho phép hút thuốc
🐾❌ Không cho phép mang theo thú cưng
🎉 Cho phép tổ chức tiệc
🍳 Cho phép nấu ăn
📸 Cho phép chụp ảnh thương mại', NULL, N'

Người lớn: Trên 12 tuổi
Trẻ em: Từ 6 đến 12 tuổi
Em bé: Dưới 6 tuổi')
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [numberOfBedrooms], [numberOfLivingRooms], [numberOfBathrooms], [numberOfKitchens], [note], [rules], [utilities], [regulation]) VALUES (24, 24, 5, 5, 5, 5, N'MIMI HOUSE - GÓC VƯỜN NHỎ AN YÊN

Cạnh bao la ruộng lúa xanh ngát, nơi ta có thể tìm về chút bình yên, Mimi House như một viên ngọc nhỏ giấu mình trong lòng thiên nhiên, nơi bạn sẽ được tận hưởng sự riêng tư tuyệt vời giữa những góc vườn xanh mát, xinh xắn.

Tách biệt hẳn khỏi khói bụi, ồn ào của phố thị, Mimi HOUSE đưa bạn về với sự trong lành, nơi tiếng chim hót véo von hòa cùng gió thoảng nhẹ qua cánh đồng lúa mênh mông, tạo nên một không gian tràn đầy sức sống và sự thư thái.

🌿 Tiện nghi tại Mimi House Không gian ngập tràn sắc xanh, hòa quyện cùng muôn hoa khoe sắc, mang lại những khoảnh khắc riêng tư và niềm vui bất tận.

⛵️ Hồ bơi ngoài trời xanh mát rộng 9x3m2 ⛵️ Bàn bi-a và bàn ăn ngoài trời cho những giây phút thư giãn 🔆 Phòng khách với tivi nối liền không gian ăn uống và bếp ấm cúng trong nhà 🔆 Hai phòng ngủ khép kín với giường lớn 2mx2m2 🔆 Hai phòng vệ sinh tiện nghi và hiện đại 🔆 Dàn âm thanh karaoke sống động sử dụng miễn phí 🔆 Khu bếp trong nhà và ngoài trời đầy đủ tiện nghi với bếp từ, tủ lạnh, lò vi sóng, nồi cơm điện, ấm đun nước, bát đũa, cùng bếp BBQ ngoài trời sẵn sàng cho những buổi tiệc nướng 🌿 Các tiện ích khác: Máy sấy tóc, khăn tắm, sữa tắm, dầu gội và khu vực để xe an toàn, tiện lợi.', N'⏰ Check-in: Sau 14:00:00
⏳ Check-out: Trước 12:00:00
🆔 Yêu cầu CMT / CCCD / Hộ chiếu
🤫 Hạn chế làm ồn sau 10 giờ tối
👟❌ Không đi giày / dép trong nhà
🚭 Không hút thuốc ở khu vực chung
🚭 Không cho phép hút thuốc
🐾❌ Không cho phép mang theo thú cưng
🎉 Cho phép tổ chức tiệc
🍳 Cho phép nấu ăn
📸 Cho phép chụp ảnh thương mại', NULL, N'

Người lớn: Trên 12 tuổi
Trẻ em: Từ 6 đến 12 tuổi
Em bé: Dưới 6 tuổi')
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [numberOfBedrooms], [numberOfLivingRooms], [numberOfBathrooms], [numberOfKitchens], [note], [rules], [utilities], [regulation]) VALUES (25, 25, 5, 5, 5, 5, N'MIMI HOUSE - GÓC VƯỜN NHỎ AN YÊN

Cạnh bao la ruộng lúa xanh ngát, nơi ta có thể tìm về chút bình yên, Mimi House như một viên ngọc nhỏ giấu mình trong lòng thiên nhiên, nơi bạn sẽ được tận hưởng sự riêng tư tuyệt vời giữa những góc vườn xanh mát, xinh xắn.

Tách biệt hẳn khỏi khói bụi, ồn ào của phố thị, Mimi HOUSE đưa bạn về với sự trong lành, nơi tiếng chim hót véo von hòa cùng gió thoảng nhẹ qua cánh đồng lúa mênh mông, tạo nên một không gian tràn đầy sức sống và sự thư thái.

🌿 Tiện nghi tại Mimi House Không gian ngập tràn sắc xanh, hòa quyện cùng muôn hoa khoe sắc, mang lại những khoảnh khắc riêng tư và niềm vui bất tận.

⛵️ Hồ bơi ngoài trời xanh mát rộng 9x3m2 ⛵️ Bàn bi-a và bàn ăn ngoài trời cho những giây phút thư giãn 🔆 Phòng khách với tivi nối liền không gian ăn uống và bếp ấm cúng trong nhà 🔆 Hai phòng ngủ khép kín với giường lớn 2mx2m2 🔆 Hai phòng vệ sinh tiện nghi và hiện đại 🔆 Dàn âm thanh karaoke sống động sử dụng miễn phí 🔆 Khu bếp trong nhà và ngoài trời đầy đủ tiện nghi với bếp từ, tủ lạnh, lò vi sóng, nồi cơm điện, ấm đun nước, bát đũa, cùng bếp BBQ ngoài trời sẵn sàng cho những buổi tiệc nướng 🌿 Các tiện ích khác: Máy sấy tóc, khăn tắm, sữa tắm, dầu gội và khu vực để xe an toàn, tiện lợi.', N'⏰ Check-in: Sau 14:00:00
⏳ Check-out: Trước 12:00:00
🆔 Yêu cầu CMT / CCCD / Hộ chiếu
🤫 Hạn chế làm ồn sau 10 giờ tối
👟❌ Không đi giày / dép trong nhà
🚭 Không hút thuốc ở khu vực chung
🚭 Không cho phép hút thuốc
🐾❌ Không cho phép mang theo thú cưng
🎉 Cho phép tổ chức tiệc
🍳 Cho phép nấu ăn
📸 Cho phép chụp ảnh thương mại', NULL, N'

Người lớn: Trên 12 tuổi
Trẻ em: Từ 6 đến 12 tuổi
Em bé: Dưới 6 tuổi')
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [numberOfBedrooms], [numberOfLivingRooms], [numberOfBathrooms], [numberOfKitchens], [note], [rules], [utilities], [regulation]) VALUES (26, 26, 5, 5, 5, 5, N'MIMI HOUSE - GÓC VƯỜN NHỎ AN YÊN

Cạnh bao la ruộng lúa xanh ngát, nơi ta có thể tìm về chút bình yên, Mimi House như một viên ngọc nhỏ giấu mình trong lòng thiên nhiên, nơi bạn sẽ được tận hưởng sự riêng tư tuyệt vời giữa những góc vườn xanh mát, xinh xắn.

Tách biệt hẳn khỏi khói bụi, ồn ào của phố thị, Mimi HOUSE đưa bạn về với sự trong lành, nơi tiếng chim hót véo von hòa cùng gió thoảng nhẹ qua cánh đồng lúa mênh mông, tạo nên một không gian tràn đầy sức sống và sự thư thái.

🌿 Tiện nghi tại Mimi House Không gian ngập tràn sắc xanh, hòa quyện cùng muôn hoa khoe sắc, mang lại những khoảnh khắc riêng tư và niềm vui bất tận.

⛵️ Hồ bơi ngoài trời xanh mát rộng 9x3m2 ⛵️ Bàn bi-a và bàn ăn ngoài trời cho những giây phút thư giãn 🔆 Phòng khách với tivi nối liền không gian ăn uống và bếp ấm cúng trong nhà 🔆 Hai phòng ngủ khép kín với giường lớn 2mx2m2 🔆 Hai phòng vệ sinh tiện nghi và hiện đại 🔆 Dàn âm thanh karaoke sống động sử dụng miễn phí 🔆 Khu bếp trong nhà và ngoài trời đầy đủ tiện nghi với bếp từ, tủ lạnh, lò vi sóng, nồi cơm điện, ấm đun nước, bát đũa, cùng bếp BBQ ngoài trời sẵn sàng cho những buổi tiệc nướng 🌿 Các tiện ích khác: Máy sấy tóc, khăn tắm, sữa tắm, dầu gội và khu vực để xe an toàn, tiện lợi.', N'⏰ Check-in: Sau 14:00:00
⏳ Check-out: Trước 12:00:00
🆔 Yêu cầu CMT / CCCD / Hộ chiếu
🤫 Hạn chế làm ồn sau 10 giờ tối
👟❌ Không đi giày / dép trong nhà
🚭 Không hút thuốc ở khu vực chung
🚭 Không cho phép hút thuốc
🐾❌ Không cho phép mang theo thú cưng
🎉 Cho phép tổ chức tiệc
🍳 Cho phép nấu ăn
📸 Cho phép chụp ảnh thương mại', NULL, N'

Người lớn: Trên 12 tuổi
Trẻ em: Từ 6 đến 12 tuổi
Em bé: Dưới 6 tuổi')
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [numberOfBedrooms], [numberOfLivingRooms], [numberOfBathrooms], [numberOfKitchens], [note], [rules], [utilities], [regulation]) VALUES (27, 27, 5, 5, 5, 5, N'MIMI HOUSE - GÓC VƯỜN NHỎ AN YÊN

Cạnh bao la ruộng lúa xanh ngát, nơi ta có thể tìm về chút bình yên, Mimi House như một viên ngọc nhỏ giấu mình trong lòng thiên nhiên, nơi bạn sẽ được tận hưởng sự riêng tư tuyệt vời giữa những góc vườn xanh mát, xinh xắn.

Tách biệt hẳn khỏi khói bụi, ồn ào của phố thị, Mimi HOUSE đưa bạn về với sự trong lành, nơi tiếng chim hót véo von hòa cùng gió thoảng nhẹ qua cánh đồng lúa mênh mông, tạo nên một không gian tràn đầy sức sống và sự thư thái.

🌿 Tiện nghi tại Mimi House Không gian ngập tràn sắc xanh, hòa quyện cùng muôn hoa khoe sắc, mang lại những khoảnh khắc riêng tư và niềm vui bất tận.

⛵️ Hồ bơi ngoài trời xanh mát rộng 9x3m2 ⛵️ Bàn bi-a và bàn ăn ngoài trời cho những giây phút thư giãn 🔆 Phòng khách với tivi nối liền không gian ăn uống và bếp ấm cúng trong nhà 🔆 Hai phòng ngủ khép kín với giường lớn 2mx2m2 🔆 Hai phòng vệ sinh tiện nghi và hiện đại 🔆 Dàn âm thanh karaoke sống động sử dụng miễn phí 🔆 Khu bếp trong nhà và ngoài trời đầy đủ tiện nghi với bếp từ, tủ lạnh, lò vi sóng, nồi cơm điện, ấm đun nước, bát đũa, cùng bếp BBQ ngoài trời sẵn sàng cho những buổi tiệc nướng 🌿 Các tiện ích khác: Máy sấy tóc, khăn tắm, sữa tắm, dầu gội và khu vực để xe an toàn, tiện lợi.', N'⏰ Check-in: Sau 14:00:00
⏳ Check-out: Trước 12:00:00
🆔 Yêu cầu CMT / CCCD / Hộ chiếu
🤫 Hạn chế làm ồn sau 10 giờ tối
👟❌ Không đi giày / dép trong nhà
🚭 Không hút thuốc ở khu vực chung
🚭 Không cho phép hút thuốc
🐾❌ Không cho phép mang theo thú cưng
🎉 Cho phép tổ chức tiệc
🍳 Cho phép nấu ăn
📸 Cho phép chụp ảnh thương mại', NULL, N'

Người lớn: Trên 12 tuổi
Trẻ em: Từ 6 đến 12 tuổi
Em bé: Dưới 6 tuổi')
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [numberOfBedrooms], [numberOfLivingRooms], [numberOfBathrooms], [numberOfKitchens], [note], [rules], [utilities], [regulation]) VALUES (28, 28, 5, 5, 5, 5, N'MIMI HOUSE - GÓC VƯỜN NHỎ AN YÊN

Cạnh bao la ruộng lúa xanh ngát, nơi ta có thể tìm về chút bình yên, Mimi House như một viên ngọc nhỏ giấu mình trong lòng thiên nhiên, nơi bạn sẽ được tận hưởng sự riêng tư tuyệt vời giữa những góc vườn xanh mát, xinh xắn.

Tách biệt hẳn khỏi khói bụi, ồn ào của phố thị, Mimi HOUSE đưa bạn về với sự trong lành, nơi tiếng chim hót véo von hòa cùng gió thoảng nhẹ qua cánh đồng lúa mênh mông, tạo nên một không gian tràn đầy sức sống và sự thư thái.

🌿 Tiện nghi tại Mimi House Không gian ngập tràn sắc xanh, hòa quyện cùng muôn hoa khoe sắc, mang lại những khoảnh khắc riêng tư và niềm vui bất tận.

⛵️ Hồ bơi ngoài trời xanh mát rộng 9x3m2 ⛵️ Bàn bi-a và bàn ăn ngoài trời cho những giây phút thư giãn 🔆 Phòng khách với tivi nối liền không gian ăn uống và bếp ấm cúng trong nhà 🔆 Hai phòng ngủ khép kín với giường lớn 2mx2m2 🔆 Hai phòng vệ sinh tiện nghi và hiện đại 🔆 Dàn âm thanh karaoke sống động sử dụng miễn phí 🔆 Khu bếp trong nhà và ngoài trời đầy đủ tiện nghi với bếp từ, tủ lạnh, lò vi sóng, nồi cơm điện, ấm đun nước, bát đũa, cùng bếp BBQ ngoài trời sẵn sàng cho những buổi tiệc nướng 🌿 Các tiện ích khác: Máy sấy tóc, khăn tắm, sữa tắm, dầu gội và khu vực để xe an toàn, tiện lợi.', N'⏰ Check-in: Sau 14:00:00
⏳ Check-out: Trước 12:00:00
🆔 Yêu cầu CMT / CCCD / Hộ chiếu
🤫 Hạn chế làm ồn sau 10 giờ tối
👟❌ Không đi giày / dép trong nhà
🚭 Không hút thuốc ở khu vực chung
🚭 Không cho phép hút thuốc
🐾❌ Không cho phép mang theo thú cưng
🎉 Cho phép tổ chức tiệc
🍳 Cho phép nấu ăn
📸 Cho phép chụp ảnh thương mại', NULL, N'

Người lớn: Trên 12 tuổi
Trẻ em: Từ 6 đến 12 tuổi
Em bé: Dưới 6 tuổi')
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [numberOfBedrooms], [numberOfLivingRooms], [numberOfBathrooms], [numberOfKitchens], [note], [rules], [utilities], [regulation]) VALUES (29, 29, 5, 5, 5, 5, N'MIMI HOUSE - GÓC VƯỜN NHỎ AN YÊN

Cạnh bao la ruộng lúa xanh ngát, nơi ta có thể tìm về chút bình yên, Mimi House như một viên ngọc nhỏ giấu mình trong lòng thiên nhiên, nơi bạn sẽ được tận hưởng sự riêng tư tuyệt vời giữa những góc vườn xanh mát, xinh xắn.

Tách biệt hẳn khỏi khói bụi, ồn ào của phố thị, Mimi HOUSE đưa bạn về với sự trong lành, nơi tiếng chim hót véo von hòa cùng gió thoảng nhẹ qua cánh đồng lúa mênh mông, tạo nên một không gian tràn đầy sức sống và sự thư thái.

🌿 Tiện nghi tại Mimi House Không gian ngập tràn sắc xanh, hòa quyện cùng muôn hoa khoe sắc, mang lại những khoảnh khắc riêng tư và niềm vui bất tận.

⛵️ Hồ bơi ngoài trời xanh mát rộng 9x3m2 ⛵️ Bàn bi-a và bàn ăn ngoài trời cho những giây phút thư giãn 🔆 Phòng khách với tivi nối liền không gian ăn uống và bếp ấm cúng trong nhà 🔆 Hai phòng ngủ khép kín với giường lớn 2mx2m2 🔆 Hai phòng vệ sinh tiện nghi và hiện đại 🔆 Dàn âm thanh karaoke sống động sử dụng miễn phí 🔆 Khu bếp trong nhà và ngoài trời đầy đủ tiện nghi với bếp từ, tủ lạnh, lò vi sóng, nồi cơm điện, ấm đun nước, bát đũa, cùng bếp BBQ ngoài trời sẵn sàng cho những buổi tiệc nướng 🌿 Các tiện ích khác: Máy sấy tóc, khăn tắm, sữa tắm, dầu gội và khu vực để xe an toàn, tiện lợi.', N'⏰ Check-in: Sau 14:00:00
⏳ Check-out: Trước 12:00:00
🆔 Yêu cầu CMT / CCCD / Hộ chiếu
🤫 Hạn chế làm ồn sau 10 giờ tối
👟❌ Không đi giày / dép trong nhà
🚭 Không hút thuốc ở khu vực chung
🚭 Không cho phép hút thuốc
🐾❌ Không cho phép mang theo thú cưng
🎉 Cho phép tổ chức tiệc
🍳 Cho phép nấu ăn
📸 Cho phép chụp ảnh thương mại', NULL, N'

Người lớn: Trên 12 tuổi
Trẻ em: Từ 6 đến 12 tuổi
Em bé: Dưới 6 tuổi')
SET IDENTITY_INSERT [dbo].[DetailHomeStays] OFF
GO
SET IDENTITY_INSERT [dbo].[FAQs] ON 

INSERT [dbo].[FAQs] ([faqID], [question], [answer], [createdDate], [updatedDate], [authorID]) VALUES (1, N'Làm thế nào để tìm và đặt phòng homestay?', N'Bạn có thể tìm kiếm homestay trên trang web bằng cách nhập địa điểm, ngày nhận/trả phòng và số lượng khách. Sau đó, chọn homestay phù hợp và nhấn "Đặt phòng" để tiến hành thanh toán và xác nhận.', NULL, NULL, N'e6ccdf5c-489e-4b05-92cf-3af24acd7765')
INSERT [dbo].[FAQs] ([faqID], [question], [answer], [createdDate], [updatedDate], [authorID]) VALUES (2, N'Tôi có thể thay đổi hoặc hủy đặt phòng không? Phí hủy phòng như thế nào?', N'Bạn có thể thay đổi hoặc hủy đặt phòng trong phần "Quản lý đặt phòng". Phí hủy sẽ phụ thuộc vào chính sách của từng homestay và thời điểm bạn hủy phòng.', NULL, NULL, N'e6ccdf5c-489e-4b05-92cf-3af24acd7765')
INSERT [dbo].[FAQs] ([faqID], [question], [answer], [createdDate], [updatedDate], [authorID]) VALUES (3, N'Làm sao để biết phòng đã được xác nhận thành công?', N'Sau khi hoàn tất thanh toán, bạn sẽ nhận được email xác nhận đặt phòng và thông tin chi tiết từ hệ thống.', NULL, NULL, N'e6ccdf5c-489e-4b05-92cf-3af24acd7765')
INSERT [dbo].[FAQs] ([faqID], [question], [answer], [createdDate], [updatedDate], [authorID]) VALUES (4, N'Tôi có thể đặt phòng cho người khác không?', N'Có, bạn chỉ cần điền thông tin của người nhận phòng khi đặt phòng trên hệ thống.', NULL, NULL, N'e6ccdf5c-489e-4b05-92cf-3af24acd7765')
INSERT [dbo].[FAQs] ([faqID], [question], [answer], [createdDate], [updatedDate], [authorID]) VALUES (5, N'Làm sao để biết phòng đã được xác nhận thành công?', N'Sau khi hoàn tất thanh toán, bạn sẽ nhận được email xác nhận đặt phòng và thông tin chi tiết từ hệ thống.', NULL, NULL, N'e6ccdf5c-489e-4b05-92cf-3af24acd7765')
INSERT [dbo].[FAQs] ([faqID], [question], [answer], [createdDate], [updatedDate], [authorID]) VALUES (6, N'Có chính sách hoàn tiền trong trường hợp hủy phòng không?', N'Chính sách hoàn tiền sẽ phụ thuộc vào thời gian hủy và điều khoản của homestay bạn đã đặt.', NULL, NULL, N'e6ccdf5c-489e-4b05-92cf-3af24acd7765')
INSERT [dbo].[FAQs] ([faqID], [question], [answer], [createdDate], [updatedDate], [authorID]) VALUES (7, N' Tôi phải làm gì khi gặp sự cố trong quá trình thanh toán?', N'Vui lòng liên hệ bộ phận chăm sóc khách hàng qua hotline hoặc email hỗ trợ để được giải quyết kịp thời.', NULL, NULL, N'e6ccdf5c-489e-4b05-92cf-3af24acd7765')
INSERT [dbo].[FAQs] ([faqID], [question], [answer], [createdDate], [updatedDate], [authorID]) VALUES (9, N'Làm thế nào để liên hệ với chủ nhà hoặc dịch vụ khách hàng?', N'Thông tin liên hệ sẽ có trong email xác nhận đặt phòng hoặc mục "Chi tiết đặt phòng".', NULL, NULL, N'e6ccdf5c-489e-4b05-92cf-3af24acd7765')
SET IDENTITY_INSERT [dbo].[FAQs] OFF
GO
SET IDENTITY_INSERT [dbo].[Favorites] ON 

INSERT [dbo].[Favorites] ([favID], [cusID], [homestayID], [createdAt]) VALUES (2, N'ded4fdf6-02cf-4a23-8d42-ae92efe10c66', 2, NULL)
INSERT [dbo].[Favorites] ([favID], [cusID], [homestayID], [createdAt]) VALUES (3, N'4100f676-9d78-40a1-95df-f6b180a9b95e', 2, NULL)
INSERT [dbo].[Favorites] ([favID], [cusID], [homestayID], [createdAt]) VALUES (4, N'c24084be-7373-42c1-abf5-6b065c1a7f90', 3, NULL)
INSERT [dbo].[Favorites] ([favID], [cusID], [homestayID], [createdAt]) VALUES (5, N'c24084be-7373-42c1-abf5-6b065c1a7f90', 2, NULL)
INSERT [dbo].[Favorites] ([favID], [cusID], [homestayID], [createdAt]) VALUES (6, N'da5b4462-f24d-43c6-9e79-7240fe5e19fb', 2, NULL)
INSERT [dbo].[Favorites] ([favID], [cusID], [homestayID], [createdAt]) VALUES (1006, N'c24084be-7373-42c1-abf5-6b065c1a7f90', 11, NULL)
INSERT [dbo].[Favorites] ([favID], [cusID], [homestayID], [createdAt]) VALUES (1007, N'c24084be-7373-42c1-abf5-6b065c1a7f90', 8, NULL)
INSERT [dbo].[Favorites] ([favID], [cusID], [homestayID], [createdAt]) VALUES (1008, N'c24084be-7373-42c1-abf5-6b065c1a7f90', 7, NULL)
INSERT [dbo].[Favorites] ([favID], [cusID], [homestayID], [createdAt]) VALUES (1009, N'c24084be-7373-42c1-abf5-6b065c1a7f90', 6, NULL)
INSERT [dbo].[Favorites] ([favID], [cusID], [homestayID], [createdAt]) VALUES (1010, N'6c78fea3-8b5e-4eed-94a2-442e4acce6d4', 2, NULL)
INSERT [dbo].[Favorites] ([favID], [cusID], [homestayID], [createdAt]) VALUES (2006, N'02d3d9e1-093b-4e58-aae6-be1465a05a3d', 2, NULL)
INSERT [dbo].[Favorites] ([favID], [cusID], [homestayID], [createdAt]) VALUES (3006, N'02d3d9e1-093b-4e58-aae6-be1465a05a3d', 5, NULL)
INSERT [dbo].[Favorites] ([favID], [cusID], [homestayID], [createdAt]) VALUES (3007, N'02d3d9e1-093b-4e58-aae6-be1465a05a3d', 7, NULL)
INSERT [dbo].[Favorites] ([favID], [cusID], [homestayID], [createdAt]) VALUES (3008, N'02d3d9e1-093b-4e58-aae6-be1465a05a3d', 14, NULL)
INSERT [dbo].[Favorites] ([favID], [cusID], [homestayID], [createdAt]) VALUES (3009, N'02d3d9e1-093b-4e58-aae6-be1465a05a3d', 16, NULL)
INSERT [dbo].[Favorites] ([favID], [cusID], [homestayID], [createdAt]) VALUES (3010, N'02d3d9e1-093b-4e58-aae6-be1465a05a3d', 9, NULL)
INSERT [dbo].[Favorites] ([favID], [cusID], [homestayID], [createdAt]) VALUES (3011, N'02d3d9e1-093b-4e58-aae6-be1465a05a3d', 3, NULL)
INSERT [dbo].[Favorites] ([favID], [cusID], [homestayID], [createdAt]) VALUES (3012, N'02d3d9e1-093b-4e58-aae6-be1465a05a3d', 19, NULL)
SET IDENTITY_INSERT [dbo].[Favorites] OFF
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (326629887, 2, 1)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (326629909, 2, 2)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (880294131, 3, 1)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (880292850, 3, 2)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (880294147, 3, 3)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (880294195, 3, 22)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (880294149, 3, 23)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (880294197, 3, 24)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (880294198, 3, 25)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (880294200, 3, 26)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (880294202, 3, 27)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (880294201, 3, 28)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (880294204, 3, 29)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (880294205, 3, 30)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1158464451, 4, 1)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1158466995, 4, 2)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1479278964, 5, 1)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1479279200, 5, 2)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1499163216, 6, 1)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1499163466, 6, 2)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1508707690, 7, 1)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1508709439, 7, 2)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1514574746, 8, 1)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1514599078, 8, 2)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1519990554, 9, 1)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1519991050, 9, 2)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1520872834, 10, 1)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1520873191, 10, 2)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1530488962, 11, 1)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1530489253, 11, 2)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1534802538, 12, 1)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1534808523, 12, 2)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1538238986, 13, 1)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1538240406, 13, 2)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1558172877, 14, 1)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1558173044, 14, 2)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1569851324, 15, 1)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1569851717, 15, 2)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1577356522, 16, 1)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1577367728, 16, 2)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1006971750, 17, 1)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1006971776, 17, 2)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1593240770, 18, 1)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1593241257, 18, 2)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1026240324, 19, 1)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1026341609, 19, 2)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (888911423, 20, 1)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (889417672, 20, 2)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (926438902, 21, 1)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (926439199, 21, 2)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (932464110, 22, 1)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (932464494, 22, 2)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (936084031, 23, 1)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (936084549, 23, 2)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (938562159, 24, 1)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (938562494, 24, 2)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (945322727, 25, 1)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (945323151, 25, 2)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (952334545, 26, 1)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (952334892, 26, 2)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (958798013, 27, 1)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (958798752, 27, 2)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (966173009, 28, 1)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (966173448, 28, 2)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (971145900, 29, 1)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (971146310, 29, 2)
GO
SET IDENTITY_INSERT [dbo].[HomeStays] ON 

INSERT [dbo].[HomeStays] ([homestayID], [homestayName], [ownerID], [addressDetail], [country], [imagePreview], [pricePerNight], [approvalStatus], [createdAt], [updatedAt], [province], [district], [wardOrCommune], [discountSecondNight], [minPerson], [maxPerson], [totalView], [isLocked], [linkGoogleMap]) VALUES (2, N'Homestay Bến Nhà Nò Số 72 Khoái Châu Hưng Yên', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Xóm 7 nhà Trần Duy Hưng', N'Việt Nam', N'["/Images/20241125_132356.png","/Images/20241125_132356.png","/Images/20241125_132356.png","/Images/20241125_132356.png","/Images/20241125_132356.png","/Images/20241125_132356.jpg"]', 900000, 1, NULL, NULL, N'Hưng Yên', N'Khoái Châu', N'Việt Hòa', 800000, 3, 5, 67, NULL, N'http://googlemap.com')
INSERT [dbo].[HomeStays] ([homestayID], [homestayName], [ownerID], [addressDetail], [country], [imagePreview], [pricePerNight], [approvalStatus], [createdAt], [updatedAt], [province], [district], [wardOrCommune], [discountSecondNight], [minPerson], [maxPerson], [totalView], [isLocked], [linkGoogleMap]) VALUES (3, N'Homestay Nhà Núi Bát Bộ , 27 Ngô Đình Niêm', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Xóm 7 nhà Trần Duy Hưng', N'Việt Nam', N'["/Images/20241126_105636.jpg","/Images/20241126_105636.jpg","/Images/20241126_105636.jpg","/Images/20241126_105636.jpg","/Images/20241126_105636.jpg","/Images/20241126_105636.jpg"]', 900000, 1, NULL, NULL, N'Hà Nội', N'Ba Vì', N'Sơn Tây', 800000, 3, 5, 25, NULL, N'http://googlemap.com')
INSERT [dbo].[HomeStays] ([homestayID], [homestayName], [ownerID], [addressDetail], [country], [imagePreview], [pricePerNight], [approvalStatus], [createdAt], [updatedAt], [province], [district], [wardOrCommune], [discountSecondNight], [minPerson], [maxPerson], [totalView], [isLocked], [linkGoogleMap]) VALUES (4, N'Homestay Nhà Núi Bát Bộ , 27 Ngô Đình Niêm', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Xóm 7 nhà Trần Duy Hưng', N'Việt Nam', N'["/Images/20241204_100907.jpg","/Images/20241204_100907.jpg","/Images/20241204_100907.jpg","/Images/20241204_100907.jpg","/Images/20241204_100907.jpg","/Images/20241204_100907.jpg"]', 600000, 1, CAST(N'2024-12-04T10:09:11.887' AS DateTime), NULL, N'Hưng Yên', N'Khoái Châu', N'Việt Hòa', 800000, 5, 5, 22, 0, N'http://googlemap.com')
INSERT [dbo].[HomeStays] ([homestayID], [homestayName], [ownerID], [addressDetail], [country], [imagePreview], [pricePerNight], [approvalStatus], [createdAt], [updatedAt], [province], [district], [wardOrCommune], [discountSecondNight], [minPerson], [maxPerson], [totalView], [isLocked], [linkGoogleMap]) VALUES (5, N'Homestay Nhà Núi Bát Bộ , 27 Ngô Đình Niêm', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Xóm 7 nhà Trần Duy Hưng', N'Việt Nam', N'["/Images/20241204_100944.jpg","/Images/20241204_100944.jpg","/Images/20241204_100944.jpg","/Images/20241204_100944.jpg","/Images/20241204_100944.jpg","/Images/20241204_100944.png"]', 600000, 1, CAST(N'2024-12-04T10:09:44.080' AS DateTime), NULL, N'Hưng Yên', N'Khoái Châu', N'Việt Hòa', 800000, 5, 5, 5, 0, N'http://googlemap.com')
INSERT [dbo].[HomeStays] ([homestayID], [homestayName], [ownerID], [addressDetail], [country], [imagePreview], [pricePerNight], [approvalStatus], [createdAt], [updatedAt], [province], [district], [wardOrCommune], [discountSecondNight], [minPerson], [maxPerson], [totalView], [isLocked], [linkGoogleMap]) VALUES (6, N'Homestay Nhà Núi Bát Bộ , 27 Ngô Đình Niêm', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Xóm 7 nhà Trần Duy Hưng', N'Việt Nam', N'["/Images/20241204_100946.jpg","/Images/20241204_100946.jpg","/Images/20241204_100946.jpg","/Images/20241204_100946.jpg","/Images/20241204_100946.jpg","/Images/20241204_100946.png"]', 600000, 1, CAST(N'2024-12-04T10:09:46.073' AS DateTime), NULL, N'Hưng Yên', N'Khoái Châu', N'Việt Hòa', 800000, 5, 5, 6, 0, N'http://googlemap.com')
INSERT [dbo].[HomeStays] ([homestayID], [homestayName], [ownerID], [addressDetail], [country], [imagePreview], [pricePerNight], [approvalStatus], [createdAt], [updatedAt], [province], [district], [wardOrCommune], [discountSecondNight], [minPerson], [maxPerson], [totalView], [isLocked], [linkGoogleMap]) VALUES (7, N'Homestay Nhà Núi Bát Bộ , 27 Ngô Đình Niêm', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Xóm 7 nhà Trần Duy Hưng', N'Việt Nam', N'["/Images/20241204_100946.jpg","/Images/20241204_100946.jpg","/Images/20241204_100946.jpg","/Images/20241204_100946.jpg","/Images/20241204_100946.jpg","/Images/20241204_100946.png"]', 600000, 1, CAST(N'2024-12-04T10:09:47.013' AS DateTime), NULL, N'Hưng Yên', N'Khoái Châu', N'Việt Hòa', 800000, 5, 5, 2, 0, N'http://googlemap.com')
INSERT [dbo].[HomeStays] ([homestayID], [homestayName], [ownerID], [addressDetail], [country], [imagePreview], [pricePerNight], [approvalStatus], [createdAt], [updatedAt], [province], [district], [wardOrCommune], [discountSecondNight], [minPerson], [maxPerson], [totalView], [isLocked], [linkGoogleMap]) VALUES (8, N'Homestay Nhà Núi Bát Bộ , 27 Ngô Đình Niêm', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Xóm 7 nhà Trần Duy Hưng', N'Việt Nam', N'["/Images/20241204_100947.jpg","/Images/20241204_100947.jpg","/Images/20241204_100947.jpg","/Images/20241204_100947.jpg","/Images/20241204_100947.jpg","/Images/20241204_100947.png"]', 600000, 1, CAST(N'2024-12-04T10:09:47.603' AS DateTime), NULL, N'Hưng Yên', N'Khoái Châu', N'Việt Hòa', 800000, 5, 5, 1, 0, N'http://googlemap.com')
INSERT [dbo].[HomeStays] ([homestayID], [homestayName], [ownerID], [addressDetail], [country], [imagePreview], [pricePerNight], [approvalStatus], [createdAt], [updatedAt], [province], [district], [wardOrCommune], [discountSecondNight], [minPerson], [maxPerson], [totalView], [isLocked], [linkGoogleMap]) VALUES (9, N'Homestay Nhà Núi Bát Bộ , 27 Ngô Đình Niêm', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Xóm 7 nhà Trần Duy Hưng', N'Việt Nam', N'["/Images/20241204_100947.jpg","/Images/20241204_100947.jpg","/Images/20241204_100947.jpg","/Images/20241204_100947.jpg","/Images/20241204_100947.jpg","/Images/20241204_100947.png"]', 600000, 1, CAST(N'2024-12-04T10:09:48.140' AS DateTime), NULL, N'Hưng Yên', N'Khoái Châu', N'Việt Hòa', 800000, 5, 5, 0, 0, N'http://googlemap.com')
INSERT [dbo].[HomeStays] ([homestayID], [homestayName], [ownerID], [addressDetail], [country], [imagePreview], [pricePerNight], [approvalStatus], [createdAt], [updatedAt], [province], [district], [wardOrCommune], [discountSecondNight], [minPerson], [maxPerson], [totalView], [isLocked], [linkGoogleMap]) VALUES (10, N'Homestay Nhà Núi Bát Bộ , 27 Ngô Đình Niêm', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Xóm 7 nhà Trần Duy Hưng', N'Việt Nam', N'["/Images/20241204_100947.jpg","/Images/20241204_100947.jpg","/Images/20241204_100947.jpg","/Images/20241204_100947.jpg","/Images/20241204_100947.jpg","/Images/20241204_100948.png"]', 600000, 1, CAST(N'2024-12-04T10:09:48.167' AS DateTime), NULL, N'Hưng Yên', N'Khoái Châu', N'Việt Hòa', 800000, 5, 5, 0, 0, N'http://googlemap.com')
INSERT [dbo].[HomeStays] ([homestayID], [homestayName], [ownerID], [addressDetail], [country], [imagePreview], [pricePerNight], [approvalStatus], [createdAt], [updatedAt], [province], [district], [wardOrCommune], [discountSecondNight], [minPerson], [maxPerson], [totalView], [isLocked], [linkGoogleMap]) VALUES (11, N'Homestay Nhà Núi Bát Bộ , 27 Ngô Đình Niêm', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Xóm 7 nhà Trần Duy Hưng', N'Việt Nam', N'["/Images/20241204_100948.jpg","/Images/20241204_100948.jpg","/Images/20241204_100948.jpg","/Images/20241204_100948.jpg","/Images/20241204_100948.jpg","/Images/20241204_100949.png"]', 600000, 1, CAST(N'2024-12-04T10:09:49.130' AS DateTime), NULL, N'Hưng Yên', N'Khoái Châu', N'Việt Hòa', 800000, 5, 5, 0, 0, N'http://googlemap.com')
INSERT [dbo].[HomeStays] ([homestayID], [homestayName], [ownerID], [addressDetail], [country], [imagePreview], [pricePerNight], [approvalStatus], [createdAt], [updatedAt], [province], [district], [wardOrCommune], [discountSecondNight], [minPerson], [maxPerson], [totalView], [isLocked], [linkGoogleMap]) VALUES (12, N'Homestay Nhà Núi Bát Bộ , 27 Ngô Đình Niêm', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Xóm 7 nhà Trần Duy Hưng', N'Việt Nam', N'["/Images/20241204_100949.jpg","/Images/20241204_100949.jpg","/Images/20241204_100949.jpg","/Images/20241204_100949.jpg","/Images/20241204_100949.jpg","/Images/20241204_100949.png"]', 600000, 1, CAST(N'2024-12-04T10:09:49.590' AS DateTime), NULL, N'Hưng Yên', N'Khoái Châu', N'Việt Hòa', 800000, 5, 5, 0, 0, N'http://googlemap.com')
INSERT [dbo].[HomeStays] ([homestayID], [homestayName], [ownerID], [addressDetail], [country], [imagePreview], [pricePerNight], [approvalStatus], [createdAt], [updatedAt], [province], [district], [wardOrCommune], [discountSecondNight], [minPerson], [maxPerson], [totalView], [isLocked], [linkGoogleMap]) VALUES (13, N'Homestay Nhà Núi Bát Bộ , 27 Ngô Đình Niêm', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Xóm 7 nhà Trần Duy Hưng', N'Việt Nam', N'["/Images/20241204_100949.jpg","/Images/20241204_100949.jpg","/Images/20241204_100949.jpg","/Images/20241204_100949.jpg","/Images/20241204_100949.jpg","/Images/20241204_100949.png"]', 600000, 1, CAST(N'2024-12-04T10:09:49.910' AS DateTime), NULL, N'Hưng Yên', N'Khoái Châu', N'Việt Hòa', 800000, 5, 5, 1, 0, N'http://googlemap.com')
INSERT [dbo].[HomeStays] ([homestayID], [homestayName], [ownerID], [addressDetail], [country], [imagePreview], [pricePerNight], [approvalStatus], [createdAt], [updatedAt], [province], [district], [wardOrCommune], [discountSecondNight], [minPerson], [maxPerson], [totalView], [isLocked], [linkGoogleMap]) VALUES (14, N'Homestay Nhà Núi Bát Bộ , 27 Ngô Đình Niêm', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Xóm 7 nhà Trần Duy Hưng', N'Việt Nam', N'["/Images/20241204_100951.jpg","/Images/20241204_100951.jpg","/Images/20241204_100951.jpg","/Images/20241204_100951.jpg","/Images/20241204_100951.jpg","/Images/20241204_100951.png"]', 600000, 1, CAST(N'2024-12-04T10:09:51.973' AS DateTime), NULL, N'Hưng Yên', N'Khoái Châu', N'Việt Hòa', 800000, 5, 5, 1, 0, N'http://googlemap.com')
INSERT [dbo].[HomeStays] ([homestayID], [homestayName], [ownerID], [addressDetail], [country], [imagePreview], [pricePerNight], [approvalStatus], [createdAt], [updatedAt], [province], [district], [wardOrCommune], [discountSecondNight], [minPerson], [maxPerson], [totalView], [isLocked], [linkGoogleMap]) VALUES (15, N'Homestay Nhà Núi Bát Bộ , 27 Ngô Đình Niêm', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Xóm 7 nhà Trần Duy Hưng', N'Việt Nam', N'["/Images/20241204_100953.jpg","/Images/20241204_100953.jpg","/Images/20241204_100953.jpg","/Images/20241204_100953.jpg","/Images/20241204_100953.jpg","/Images/20241204_100953.png"]', 600000, 1, CAST(N'2024-12-04T10:09:53.133' AS DateTime), NULL, N'Hưng Yên', N'Khoái Châu', N'Việt Hòa', 800000, 5, 5, 3, 0, N'http://googlemap.com')
INSERT [dbo].[HomeStays] ([homestayID], [homestayName], [ownerID], [addressDetail], [country], [imagePreview], [pricePerNight], [approvalStatus], [createdAt], [updatedAt], [province], [district], [wardOrCommune], [discountSecondNight], [minPerson], [maxPerson], [totalView], [isLocked], [linkGoogleMap]) VALUES (16, N'Homestay Nhà Núi Bát Bộ , 27 Ngô Đình Niêm', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Xóm 7 nhà Trần Duy Hưng', N'Việt Nam', N'["/Images/20241204_100953.jpg","/Images/20241204_100953.jpg","/Images/20241204_100953.jpg","/Images/20241204_100953.jpg","/Images/20241204_100953.jpg","/Images/20241204_100953.png"]', 600000, 1, CAST(N'2024-12-04T10:09:53.893' AS DateTime), NULL, N'Hưng Yên', N'Khoái Châu', N'Việt Hòa', 800000, 5, 5, 0, 0, N'http://googlemap.com')
INSERT [dbo].[HomeStays] ([homestayID], [homestayName], [ownerID], [addressDetail], [country], [imagePreview], [pricePerNight], [approvalStatus], [createdAt], [updatedAt], [province], [district], [wardOrCommune], [discountSecondNight], [minPerson], [maxPerson], [totalView], [isLocked], [linkGoogleMap]) VALUES (17, N'Homestay Nhà Núi Bát Bộ , 27 Ngô Đình Niêm', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Xóm 7 nhà Trần Duy Hưng', N'Việt Nam', N'["/Images/20241204_103613.jpg","/Images/20241204_103613.jpg","/Images/20241204_103613.jpg","/Images/20241204_103613.jpg","/Images/20241204_103613.jpg","/Images/20241204_103613.jpg"]', 900000, 1, NULL, NULL, N'Hà Nội', N'Ba Vì', N'Sơn Tây', 200000, 5, 5, 0, NULL, N'http://googlemap.com')
INSERT [dbo].[HomeStays] ([homestayID], [homestayName], [ownerID], [addressDetail], [country], [imagePreview], [pricePerNight], [approvalStatus], [createdAt], [updatedAt], [province], [district], [wardOrCommune], [discountSecondNight], [minPerson], [maxPerson], [totalView], [isLocked], [linkGoogleMap]) VALUES (18, N'Homestay Nhà Núi Bát Bộ , 27 Ngô Đình Niêm', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Xóm 7 nhà Trần Duy Hưng', N'Việt Nam', N'["/Images/20241204_103833.jpg","/Images/20241204_103833.jpg","/Images/20241204_103833.jpg","/Images/20241204_103833.jpg","/Images/20241204_103833.jpg"]', 1000000, 1, CAST(N'2024-12-04T10:38:33.463' AS DateTime), NULL, N'Ga', N'Khoái Châu', N'Việt Hòa', 100000, 2, 2, 1, 0, N'http://googlemap.com')
INSERT [dbo].[HomeStays] ([homestayID], [homestayName], [ownerID], [addressDetail], [country], [imagePreview], [pricePerNight], [approvalStatus], [createdAt], [updatedAt], [province], [district], [wardOrCommune], [discountSecondNight], [minPerson], [maxPerson], [totalView], [isLocked], [linkGoogleMap]) VALUES (19, N'Homestay Nhà Núi Bát Bộ , 27 Ngô Đình Niêm', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Xóm 7 nhà Trần Duy Hưng', N'Việt Nam', N'["/Images/20241204_104445_2416380_.jpg","/Images/20241204_104445_6704878_.jpg","/Images/20241204_104445_2783246_.jpg","/Images/20241204_104445_4110684_.jpg","/Images/20241204_104445_7607238_.jpg","/Images/20241204_104445_1844431_.jpg"]', 1000000, 2, CAST(N'2024-12-04T10:44:46.057' AS DateTime), NULL, N'Ga', N'Khoái Châu', N'Việt Hòa', 100000, 2, 2, 1, 0, N'http://googlemap.com')
INSERT [dbo].[HomeStays] ([homestayID], [homestayName], [ownerID], [addressDetail], [country], [imagePreview], [pricePerNight], [approvalStatus], [createdAt], [updatedAt], [province], [district], [wardOrCommune], [discountSecondNight], [minPerson], [maxPerson], [totalView], [isLocked], [linkGoogleMap]) VALUES (20, N'HomeStay Thanh Xuân Hà Nội', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Số 423 , đường Lê Thánh Tông xóm bà Trưng bà Triệu', N'Việt Nam', N'["/Images/20241204_133620_527355_.jpg","/Images/20241204_133620_2719241_.jpg","/Images/20241204_133620_4784329_.png","/Images/20241204_133620_6778730_.png"]', 600000, 2, CAST(N'2024-12-04T13:36:20.213' AS DateTime), NULL, N'Hà Nội', N'Thanh Xuân', N'Lê Thánh Tông', 800000, 5, 5, 0, 0, N'http://googlemap.com')
INSERT [dbo].[HomeStays] ([homestayID], [homestayName], [ownerID], [addressDetail], [country], [imagePreview], [pricePerNight], [approvalStatus], [createdAt], [updatedAt], [province], [district], [wardOrCommune], [discountSecondNight], [minPerson], [maxPerson], [totalView], [isLocked], [linkGoogleMap]) VALUES (21, N'HomeStay Thanh Xuân Hà Nội', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Số 423 , đường Lê Thánh Tông xóm bà Trưng bà Triệu', N'Việt Nam', N'["/Images/20241204_133624_5041112_.jpg","/Images/20241204_133624_4497575_.jpg","/Images/20241204_133624_4875500_.png","/Images/20241204_133624_9062658_.png"]', 600000, 1, CAST(N'2024-12-04T13:36:24.160' AS DateTime), NULL, N'Hà Nội', N'Thanh Xuân', N'Lê Thánh Tông', 800000, 5, 5, 0, 0, N'http://googlemap.com')
INSERT [dbo].[HomeStays] ([homestayID], [homestayName], [ownerID], [addressDetail], [country], [imagePreview], [pricePerNight], [approvalStatus], [createdAt], [updatedAt], [province], [district], [wardOrCommune], [discountSecondNight], [minPerson], [maxPerson], [totalView], [isLocked], [linkGoogleMap]) VALUES (22, N'HomeStay Thanh Xuân Hà Nội', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Số 423 , đường Lê Thánh Tông xóm bà Trưng bà Triệu', N'Việt Nam', N'["/Images/20241204_133624_5357602_.jpg","/Images/20241204_133624_1308391_.jpg","/Images/20241204_133624_5054806_.png","/Images/20241204_133624_8090847_.png"]', 600000, 1, CAST(N'2024-12-04T13:36:24.713' AS DateTime), NULL, N'Hà Nội', N'Thanh Xuân', N'Lê Thánh Tông', 800000, 5, 5, 0, 0, N'http://googlemap.com')
INSERT [dbo].[HomeStays] ([homestayID], [homestayName], [ownerID], [addressDetail], [country], [imagePreview], [pricePerNight], [approvalStatus], [createdAt], [updatedAt], [province], [district], [wardOrCommune], [discountSecondNight], [minPerson], [maxPerson], [totalView], [isLocked], [linkGoogleMap]) VALUES (23, N'HomeStay Thanh Xuân Hà Nội', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Số 423 , đường Lê Thánh Tông xóm bà Trưng bà Triệu', N'Việt Nam', N'["/Images/20241204_133625_1817792_.jpg","/Images/20241204_133625_5379212_.jpg","/Images/20241204_133625_7130765_.png","/Images/20241204_133625_5784377_.png"]', 600000, 1, CAST(N'2024-12-04T13:36:25.170' AS DateTime), NULL, N'Hà Nội', N'Thanh Xuân', N'Lê Thánh Tông', 800000, 5, 5, 0, 0, N'http://googlemap.com')
INSERT [dbo].[HomeStays] ([homestayID], [homestayName], [ownerID], [addressDetail], [country], [imagePreview], [pricePerNight], [approvalStatus], [createdAt], [updatedAt], [province], [district], [wardOrCommune], [discountSecondNight], [minPerson], [maxPerson], [totalView], [isLocked], [linkGoogleMap]) VALUES (24, N'HomeStay Thanh Xuân Hà Nội', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Số 423 , đường Lê Thánh Tông xóm bà Trưng bà Triệu', N'Việt Nam', N'["/Images/20241204_133625_1138301_.jpg","/Images/20241204_133625_9698782_.jpg","/Images/20241204_133625_9129662_.png","/Images/20241204_133625_6613380_.png"]', 600000, 1, CAST(N'2024-12-04T13:36:25.420' AS DateTime), NULL, N'Hà Nội', N'Thanh Xuân', N'Lê Thánh Tông', 800000, 5, 5, 0, 0, N'http://googlemap.com')
INSERT [dbo].[HomeStays] ([homestayID], [homestayName], [ownerID], [addressDetail], [country], [imagePreview], [pricePerNight], [approvalStatus], [createdAt], [updatedAt], [province], [district], [wardOrCommune], [discountSecondNight], [minPerson], [maxPerson], [totalView], [isLocked], [linkGoogleMap]) VALUES (25, N'HomeStay Thanh Xuân Hà Nội', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Số 423 , đường Lê Thánh Tông xóm bà Trưng bà Triệu', N'Việt Nam', N'["/Images/20241204_133626_5483651_.jpg","/Images/20241204_133626_8075764_.jpg","/Images/20241204_133626_8841363_.png","/Images/20241204_133626_2906433_.png"]', 600000, 1, CAST(N'2024-12-04T13:36:26.097' AS DateTime), NULL, N'Hà Nội', N'Thanh Xuân', N'Lê Thánh Tông', 800000, 5, 5, 0, 0, N'http://googlemap.com')
INSERT [dbo].[HomeStays] ([homestayID], [homestayName], [ownerID], [addressDetail], [country], [imagePreview], [pricePerNight], [approvalStatus], [createdAt], [updatedAt], [province], [district], [wardOrCommune], [discountSecondNight], [minPerson], [maxPerson], [totalView], [isLocked], [linkGoogleMap]) VALUES (26, N'HomeStay Thanh Xuân Hà Nội', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Số 423 , đường Lê Thánh Tông xóm bà Trưng bà Triệu', N'Việt Nam', N'["/Images/20241204_133626_816507_.jpg","/Images/20241204_133626_5907944_.jpg","/Images/20241204_133626_7566879_.png","/Images/20241204_133626_3336684_.png"]', 600000, 1, CAST(N'2024-12-04T13:36:26.797' AS DateTime), NULL, N'Hà Nội', N'Thanh Xuân', N'Lê Thánh Tông', 800000, 5, 5, 0, 0, N'http://googlemap.com')
INSERT [dbo].[HomeStays] ([homestayID], [homestayName], [ownerID], [addressDetail], [country], [imagePreview], [pricePerNight], [approvalStatus], [createdAt], [updatedAt], [province], [district], [wardOrCommune], [discountSecondNight], [minPerson], [maxPerson], [totalView], [isLocked], [linkGoogleMap]) VALUES (27, N'HomeStay Thanh Xuân Hà Nội', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Số 423 , đường Lê Thánh Tông xóm bà Trưng bà Triệu', N'Việt Nam', N'["/Images/20241204_133627_9305300_.jpg","/Images/20241204_133627_5485606_.jpg","/Images/20241204_133627_7056103_.png","/Images/20241204_133627_5469242_.png"]', 600000, 1, CAST(N'2024-12-04T13:36:27.443' AS DateTime), NULL, N'Hà Nội', N'Thanh Xuân', N'Lê Thánh Tông', 800000, 5, 5, 0, 0, N'http://googlemap.com')
INSERT [dbo].[HomeStays] ([homestayID], [homestayName], [ownerID], [addressDetail], [country], [imagePreview], [pricePerNight], [approvalStatus], [createdAt], [updatedAt], [province], [district], [wardOrCommune], [discountSecondNight], [minPerson], [maxPerson], [totalView], [isLocked], [linkGoogleMap]) VALUES (28, N'HomeStay Thanh Xuân Hà Nội', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Số 423 , đường Lê Thánh Tông xóm bà Trưng bà Triệu', N'Việt Nam', N'["/Images/20241204_133628_8261359_.jpg","/Images/20241204_133628_5513740_.jpg","/Images/20241204_133628_9060534_.png","/Images/20241204_133628_7395560_.png"]', 600000, 1, CAST(N'2024-12-04T13:36:28.180' AS DateTime), NULL, N'Hà Nội', N'Thanh Xuân', N'Lê Thánh Tông', 800000, 5, 5, 0, 0, N'http://googlemap.com')
INSERT [dbo].[HomeStays] ([homestayID], [homestayName], [ownerID], [addressDetail], [country], [imagePreview], [pricePerNight], [approvalStatus], [createdAt], [updatedAt], [province], [district], [wardOrCommune], [discountSecondNight], [minPerson], [maxPerson], [totalView], [isLocked], [linkGoogleMap]) VALUES (29, N'HomeStay Thanh Xuân Hà Nội', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Số 423 , đường Lê Thánh Tông xóm bà Trưng bà Triệu', N'Việt Nam', N'["/Images/20241204_133628_3450041_.jpg","/Images/20241204_133628_2299488_.jpg","/Images/20241204_133628_7215100_.png","/Images/20241204_133628_1610733_.png"]', 600000, 1, CAST(N'2024-12-04T13:36:28.680' AS DateTime), NULL, N'Hà Nội', N'Thanh Xuân', N'Lê Thánh Tông', 800000, 5, 5, 0, 0, N'http://googlemap.com')
SET IDENTITY_INSERT [dbo].[HomeStays] OFF
GO
INSERT [dbo].[OwnerStays] ([ownerID], [userID], [bannerImage], [defaultCheckinTime], [defaultCheckoutTime], [description]) VALUES (N'250c96bb-7463-4e10-8969-3b56a2c0daed', N'282ce462-cf0a-48da-8c5a-e0f0d062f2a7', NULL, NULL, NULL, NULL)
INSERT [dbo].[OwnerStays] ([ownerID], [userID], [bannerImage], [defaultCheckinTime], [defaultCheckoutTime], [description]) VALUES (N'a5587fd8-b105-46cb-bb7c-7ad66da8b9b6', N'282ce462-cf0a-48da-8c5a-e0f0d062f2a7', NULL, NULL, NULL, NULL)
INSERT [dbo].[OwnerStays] ([ownerID], [userID], [bannerImage], [defaultCheckinTime], [defaultCheckoutTime], [description]) VALUES (N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'bf46a84f-50b9-4417-bce0-ebe019d7ffd9', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[PartnershipReg] ON 

INSERT [dbo].[PartnershipReg] ([id], [customerID], [companyName], [fullName], [address], [phoneNumber], [email], [totalHomeStay], [imgPreview], [partnershipAgreement], [businessLicense], [note], [bankAccount], [status], [rejectionReason], [createdAt], [updatedAt]) VALUES (1, N'c24084be-7373-42c1-abf5-6b065c1a7f90', N'Đào Quang Huy', N'Đào Quang Huy', N'Hưng Yên', N'0364174636', N'daohuy1692003@gmail.com', 5, N'["/Images/20241125_111003.png","/Images/20241125_111003.png","/Images/20241125_111003.jpg","/Images/20241125_111003.jpg","/Images/20241125_111003.jpg","/Images/20241125_111003.jpg"]', NULL, NULL, N'Homestay rất sạch sẽ', NULL, 1, NULL, CAST(N'2024-11-25T11:10:03.960' AS DateTime), NULL)
INSERT [dbo].[PartnershipReg] ([id], [customerID], [companyName], [fullName], [address], [phoneNumber], [email], [totalHomeStay], [imgPreview], [partnershipAgreement], [businessLicense], [note], [bankAccount], [status], [rejectionReason], [createdAt], [updatedAt]) VALUES (3, N'3ea3c734-1812-46de-bc9c-30c9d677cec4', N'Vũ Đình Côn', N'Đào Quang Huy', N'Hưng Yên', N'0364174636', N'duongdatx2004@gmail.com', 5, N'["/Images/20241209_153503_3181982_.png","/Images/20241209_153503_2180750_.jpg","/Images/20241209_153503_5153390_.jpg","/Images/20241209_153503_1343563_.jpg"]', NULL, NULL, N'sadasssd', NULL, 2, N'K', CAST(N'2024-12-09T15:35:04.113' AS DateTime), NULL)
INSERT [dbo].[PartnershipReg] ([id], [customerID], [companyName], [fullName], [address], [phoneNumber], [email], [totalHomeStay], [imgPreview], [partnershipAgreement], [businessLicense], [note], [bankAccount], [status], [rejectionReason], [createdAt], [updatedAt]) VALUES (4, N'3ea3c734-1812-46de-bc9c-30c9d677cec4', N'Vũ Đình Côn', N'Đào Quang Huy', N'Hưng Yên', N'0364174636', N'duongdatx2004@gmail.com', 5, N'["/Images/20241209_154326_9945359_.png","/Images/20241209_154326_9686518_.jpg","/Images/20241209_154326_2026947_.jpg","/Images/20241209_154326_2370198_.jpg"]', NULL, NULL, N'sadasssd', NULL, 1, NULL, CAST(N'2024-12-09T15:43:27.027' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[PartnershipReg] OFF
GO
SET IDENTITY_INSERT [dbo].[Payments] ON 

INSERT [dbo].[Payments] ([paymentID], [bookingID], [ownerID], [cusID], [paymentType], [amount], [paymentStatus], [paymentMethod], [paymentDate], [notePayment], [advertisementID], [userID]) VALUES (1, 2039298058, NULL, N'6c78fea3-8b5e-4eed-94a2-442e4acce6d4', 1, 1000, 1, N'Thanh toán qua Momo', CAST(N'2024-12-12T00:07:53.643' AS DateTime), N'Thanh toán tiền phòng cho Booking #2039298058', NULL, N'e0dd17bb-c7ea-4b19-96ae-9b59aaf50868')
INSERT [dbo].[Payments] ([paymentID], [bookingID], [ownerID], [cusID], [paymentType], [amount], [paymentStatus], [paymentMethod], [paymentDate], [notePayment], [advertisementID], [userID]) VALUES (2, 309803065, NULL, N'6c78fea3-8b5e-4eed-94a2-442e4acce6d4', 1, 1000, 1, N'Thanh toán qua Momo', CAST(N'2024-12-12T00:08:53.423' AS DateTime), N'Thanh toán tiền phòng cho Booking #309803065', NULL, N'e0dd17bb-c7ea-4b19-96ae-9b59aaf50868')
INSERT [dbo].[Payments] ([paymentID], [bookingID], [ownerID], [cusID], [paymentType], [amount], [paymentStatus], [paymentMethod], [paymentDate], [notePayment], [advertisementID], [userID]) VALUES (5, NULL, N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', NULL, 1, 100000, 1, N'Thanh toán qua Momo', CAST(N'2024-12-12T12:52:49.787' AS DateTime), N'Thanh toán tiền quảng cáo cho mã #59', 59, N'bf46a84f-50b9-4417-bce0-ebe019d7ffd9')
INSERT [dbo].[Payments] ([paymentID], [bookingID], [ownerID], [cusID], [paymentType], [amount], [paymentStatus], [paymentMethod], [paymentDate], [notePayment], [advertisementID], [userID]) VALUES (6, NULL, N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', NULL, 1, 100000, 1, N'Thanh toán qua Momo', CAST(N'2024-12-12T13:29:21.803' AS DateTime), N'Thanh toán tiền quảng cáo cho mã #58', 58, NULL)
SET IDENTITY_INSERT [dbo].[Payments] OFF
GO
SET IDENTITY_INSERT [dbo].[Promotions] ON 

INSERT [dbo].[Promotions] ([prmID], [discountCode], [discountAmount], [description], [startDate], [endDate], [ownerID]) VALUES (1, N'CHAOMUNGHUY', CAST(500000 AS Decimal(18, 0)), N'Mã giảm giá nhân ngày valentine', CAST(N'2024-11-26T10:00:00.000' AS DateTime), CAST(N'2024-12-28T00:00:00.000' AS DateTime), N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19')
INSERT [dbo].[Promotions] ([prmID], [discountCode], [discountAmount], [description], [startDate], [endDate], [ownerID]) VALUES (2, N'VINHATO', CAST(100000 AS Decimal(18, 0)), N'hhhahha', CAST(N'2024-12-11T00:00:00.000' AS DateTime), CAST(N'2024-12-21T00:00:00.000' AS DateTime), N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19')
INSERT [dbo].[Promotions] ([prmID], [discountCode], [discountAmount], [description], [startDate], [endDate], [ownerID]) VALUES (3, N'Hahah', CAST(1000000 AS Decimal(18, 0)), N'1223122231', CAST(N'2024-12-19T00:00:00.000' AS DateTime), CAST(N'2024-12-26T00:00:00.000' AS DateTime), N'250c96bb-7463-4e10-8969-3b56a2c0daed')
INSERT [dbo].[Promotions] ([prmID], [discountCode], [discountAmount], [description], [startDate], [endDate], [ownerID]) VALUES (4, N'HUYOKNE', CAST(100000 AS Decimal(18, 0)), N'Giảm giá Tết dương lịch', CAST(N'2024-12-16T06:00:00.000' AS DateTime), CAST(N'2024-12-17T18:00:00.000' AS DateTime), N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19')
INSERT [dbo].[Promotions] ([prmID], [discountCode], [discountAmount], [description], [startDate], [endDate], [ownerID]) VALUES (5, N'MAGIAMGIA', CAST(259000 AS Decimal(18, 0)), N'Mã giảm giá ngày chung đôi hihi', CAST(N'2024-12-12T14:00:00.000' AS DateTime), CAST(N'2024-12-29T15:00:00.000' AS DateTime), N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19')
SET IDENTITY_INSERT [dbo].[Promotions] OFF
GO
INSERT [dbo].[ReviewAndRatings] ([reviewID], [cusID], [homestayID], [rating], [comment], [reviewDate], [bookingID]) VALUES (222267969, N'ded4fdf6-02cf-4a23-8d42-ae92efe10c66', 3, CAST(5 AS Decimal(18, 0)), N'HomeStay trải nghiệm tuyệt vời', CAST(N'2024-12-11' AS Date), 292480761)
INSERT [dbo].[ReviewAndRatings] ([reviewID], [cusID], [homestayID], [rating], [comment], [reviewDate], [bookingID]) VALUES (274530877, N'da5b4462-f24d-43c6-9e79-7240fe5e19fb', 5, CAST(4 AS Decimal(18, 0)), N'HomeStay trải nghiệm tuyệt vời', CAST(N'2024-12-11' AS Date), 156178698)
GO
INSERT [dbo].[Roles] ([roleID], [nameRole]) VALUES (N'01e3be14-988f-471a-92a6-66afc4c5b4f9', N'Kế toán')
INSERT [dbo].[Roles] ([roleID], [nameRole]) VALUES (N'1938013a-8aa5-44bb-850a-5b549e041c9f', N'Kiểm duyệt HomeStay')
INSERT [dbo].[Roles] ([roleID], [nameRole]) VALUES (N'4b2fa2b6-5363-4eb8-a642-3af4286243e0', N'Nhân viên hỗ trợ')
INSERT [dbo].[Roles] ([roleID], [nameRole]) VALUES (N'df3e1a63-3b68-4d44-9fd6-cb1856f51dbf', N'Marketing')
INSERT [dbo].[Roles] ([roleID], [nameRole]) VALUES (N'ed204707-f559-4d7c-85ab-feb3d22af9a4', N'Quản trị viên')
GO
INSERT [dbo].[Users] ([userID], [username], [fullName], [email], [phoneNumber], [password], [profilePicture], [dateOfBirth], [country], [address], [accountStatus], [createdAt], [status], [gender], [typeUser]) VALUES (N'001387d6-69a2-43d3-9244-52a5c96d72f2', N'huycustomer', N'huycustomer', NULL, NULL, N'$2a$11$.ln6qsXZ6UnpCTpilx/aGuti/wMoEzvtyrN3sx8vndSHttin8DL3u', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2)
INSERT [dbo].[Users] ([userID], [username], [fullName], [email], [phoneNumber], [password], [profilePicture], [dateOfBirth], [country], [address], [accountStatus], [createdAt], [status], [gender], [typeUser]) VALUES (N'282ce462-cf0a-48da-8c5a-e0f0d062f2a7', N'vinh123', N'Vũ Đình Vinh', N'duongdatx2004@gmail.com', NULL, N'$2a$11$r93v6DMKsB.YoV2MXB1xSeT8PHvLVMPpOCP8Dh/g9io9UKbHe.QWS', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1)
INSERT [dbo].[Users] ([userID], [username], [fullName], [email], [phoneNumber], [password], [profilePicture], [dateOfBirth], [country], [address], [accountStatus], [createdAt], [status], [gender], [typeUser]) VALUES (N'3d175641-ac1f-471f-9340-b91d31b87d97', N'vinh', N'vinh', NULL, NULL, N'$2a$11$RwCA4NA8II/AGXWsJ1lbHeBZR0hNNUP/mCszsYs//dxytNhOqIxkC', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0)
INSERT [dbo].[Users] ([userID], [username], [fullName], [email], [phoneNumber], [password], [profilePicture], [dateOfBirth], [country], [address], [accountStatus], [createdAt], [status], [gender], [typeUser]) VALUES (N'5d51dc22-7a01-48a6-abaa-1db6e245b984', N'kien', N'Đào Văn Hoàng', N'duongdatx2004@gmail.com', NULL, N'$2a$11$gCgUxwAveWQtA9E64iyDwuy0eg8bB/OrPMkR68fXuVW6yidamGsj2', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2)
INSERT [dbo].[Users] ([userID], [username], [fullName], [email], [phoneNumber], [password], [profilePicture], [dateOfBirth], [country], [address], [accountStatus], [createdAt], [status], [gender], [typeUser]) VALUES (N'6a046231-e6a4-4fbf-a835-3defc91a70b5', N'hoang', N'Đào Văn Hoàng', NULL, NULL, N'$2a$11$vJhkiYwvlX360fIdWUkbj.zS2Kt6g6vGbqC8iMEkdYKmCYf1NpPza', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2)
INSERT [dbo].[Users] ([userID], [username], [fullName], [email], [phoneNumber], [password], [profilePicture], [dateOfBirth], [country], [address], [accountStatus], [createdAt], [status], [gender], [typeUser]) VALUES (N'856b76fa-d626-416f-90d0-b1f10e855a5f', N'quyen', N'Đào Quang Huy', NULL, NULL, N'$2a$11$I91z6mKdxG0/MK5/E2biuebMuqWOVE.I0gzb6KIhOmYYEhxJCLDbe', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0)
INSERT [dbo].[Users] ([userID], [username], [fullName], [email], [phoneNumber], [password], [profilePicture], [dateOfBirth], [country], [address], [accountStatus], [createdAt], [status], [gender], [typeUser]) VALUES (N'bf46a84f-50b9-4417-bce0-ebe019d7ffd9', N'huy', N'Đào Quang Huy', NULL, NULL, N'$2a$11$a6PpNXW6Qux3fLQryzOAguRG9Es7UktG2ROz8Kl4zqTnRHo624VVi', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1)
INSERT [dbo].[Users] ([userID], [username], [fullName], [email], [phoneNumber], [password], [profilePicture], [dateOfBirth], [country], [address], [accountStatus], [createdAt], [status], [gender], [typeUser]) VALUES (N'cb637013-0ff9-4d4f-9adf-eaca5e03b932', N'huy12345', N'Đào Văn Hoàng', N'duongdatx2004@gmail.com', NULL, N'$2a$11$VC6ndefyRC/iWnTUNx./uOK1pfEfrTO4dsU0Cy8O7sdJ9OGn/X6h2', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2)
INSERT [dbo].[Users] ([userID], [username], [fullName], [email], [phoneNumber], [password], [profilePicture], [dateOfBirth], [country], [address], [accountStatus], [createdAt], [status], [gender], [typeUser]) VALUES (N'd44fab19-09ef-4e9d-8ba8-a202bcf127b9', N'admin', N'Huy Đại Ca', N'huymuahanglzd019@gmail.com', N'string', N'$2a$11$rFPDvAljRSUB7Cqupq8E2ODmhW7Cqsq6UdHRJ2xatVjTtGYTSgNpO', N'/Images/20241205_103553.jpeg', NULL, NULL, N'string', NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Users] ([userID], [username], [fullName], [email], [phoneNumber], [password], [profilePicture], [dateOfBirth], [country], [address], [accountStatus], [createdAt], [status], [gender], [typeUser]) VALUES (N'e0dd17bb-c7ea-4b19-96ae-9b59aaf50868', N'huytest', N'huytest', N'duongdatx2004@gmail.com', NULL, N'$2a$11$kPwH269ATVXRee40uMf2h.92vkmgiM6bd1crFUcUqDpwRFhZfGYKG', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2)
INSERT [dbo].[Users] ([userID], [username], [fullName], [email], [phoneNumber], [password], [profilePicture], [dateOfBirth], [country], [address], [accountStatus], [createdAt], [status], [gender], [typeUser]) VALUES (N'ea2d8677-5456-4acc-95bd-d302bed6a75b', N'daohuy1692003@gmail.com', N'Đào Văn Hoàng', N'duongdatx2004@gmail.com', N'0364174636', N'$2a$11$w2WCq9THbCEiKZMR9DTHJepiONSo/0pYxkeJEoeFsNoVvXXWQFfXu', N'/Images/20241205_090907.jpeg', NULL, NULL, N'Hưng Yên', NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Users] ([userID], [username], [fullName], [email], [phoneNumber], [password], [profilePicture], [dateOfBirth], [country], [address], [accountStatus], [createdAt], [status], [gender], [typeUser]) VALUES (N'f92c5a5a-e925-4946-a17f-91730f6b8d04', N'huybaiviet', N'Đào Quang Huy', N'huymuahanglzd019@gmail.com', N'0364174636', N'$2a$11$pn03abMfsvnlLvTTpeEOG.fWtNE8whjkvR6ww370o1t5swTWkZtyK', N'/Images/20241205_103451.jpeg', NULL, NULL, N'Hưng Yên', NULL, NULL, 1, NULL, 0)
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
ALTER TABLE [dbo].[Bookings] ADD  DEFAULT ((0)) FOR [isSuccess]
GO
ALTER TABLE [dbo].[Conversations] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[FAQs] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[HomeStays] ADD  DEFAULT ((0)) FOR [approvalStatus]
GO
ALTER TABLE [dbo].[HomeStays] ADD  DEFAULT ((0)) FOR [totalView]
GO
ALTER TABLE [dbo].[Messages] ADD  DEFAULT (getdate()) FOR [timestamp]
GO
ALTER TABLE [dbo].[PartnershipReg] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT (getdate()) FOR [paymentDate]
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
ALTER TABLE [dbo].[Conversations]  WITH CHECK ADD FOREIGN KEY([ownerID])
REFERENCES [dbo].[OwnerStays] ([ownerID])
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
USE [master]
GO
ALTER DATABASE [HomeStay_HUB] SET  READ_WRITE 
GO
