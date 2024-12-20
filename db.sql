USE [master]
GO
/****** Object:  Database [HomeStay_HUB]    Script Date: 02/12/2024 1:40:05 CH ******/
CREATE DATABASE [HomeStay_HUB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HomeStay_HUB', FILENAME = N'D:\app\SQL_SERVER\MSSQL16.MSSQLSERVER\MSSQL\DATA\HomeStay_HUB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HomeStay_HUB_log', FILENAME = N'D:\app\SQL_SERVER\MSSQL16.MSSQLSERVER\MSSQL\DATA\HomeStay_HUB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[Administrators]    Script Date: 02/12/2024 1:40:06 CH ******/
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
/****** Object:  Table [dbo].[Advertisements]    Script Date: 02/12/2024 1:40:06 CH ******/
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
PRIMARY KEY CLUSTERED 
(
	[adID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Amenities]    Script Date: 02/12/2024 1:40:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Amenities](
	[amenityID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[amenityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Articles]    Script Date: 02/12/2024 1:40:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articles](
	[articleID] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[content] [text] NOT NULL,
	[picturePreview] [nvarchar](300) NULL,
	[authorID] [nvarchar](100) NOT NULL,
	[publishDate] [date] NOT NULL,
	[cateArtID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[articleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingProcess]    Script Date: 02/12/2024 1:40:06 CH ******/
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
/****** Object:  Table [dbo].[Bookings]    Script Date: 02/12/2024 1:40:06 CH ******/
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
PRIMARY KEY CLUSTERED 
(
	[bookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryArticles]    Script Date: 02/12/2024 1:40:06 CH ******/
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
/****** Object:  Table [dbo].[Conversations]    Script Date: 02/12/2024 1:40:06 CH ******/
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
/****** Object:  Table [dbo].[Customers]    Script Date: 02/12/2024 1:40:06 CH ******/
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
/****** Object:  Table [dbo].[DetailHomeStays]    Script Date: 02/12/2024 1:40:06 CH ******/
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
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FAQs]    Script Date: 02/12/2024 1:40:06 CH ******/
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
/****** Object:  Table [dbo].[Favorites]    Script Date: 02/12/2024 1:40:06 CH ******/
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
/****** Object:  Table [dbo].[HomestayAmenities]    Script Date: 02/12/2024 1:40:06 CH ******/
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
/****** Object:  Table [dbo].[HomeStays]    Script Date: 02/12/2024 1:40:06 CH ******/
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
/****** Object:  Table [dbo].[Messages]    Script Date: 02/12/2024 1:40:06 CH ******/
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
/****** Object:  Table [dbo].[OwnerStays]    Script Date: 02/12/2024 1:40:06 CH ******/
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
/****** Object:  Table [dbo].[PartnershipReg]    Script Date: 02/12/2024 1:40:06 CH ******/
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
/****** Object:  Table [dbo].[Payments]    Script Date: 02/12/2024 1:40:06 CH ******/
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
	[paymentMethod] [nvarchar](255) NOT NULL,
	[paymentDate] [datetime] NULL,
	[notePayment] [nvarchar](350) NULL,
PRIMARY KEY CLUSTERED 
(
	[paymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payouts]    Script Date: 02/12/2024 1:40:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payouts](
	[payoutID] [int] IDENTITY(1,1) NOT NULL,
	[ownerID] [nvarchar](100) NULL,
	[cusID] [nvarchar](100) NULL,
	[totalEarnings] [float] NOT NULL,
	[payoutAmount] [float] NOT NULL,
	[payoutStatus] [nvarchar](50) NOT NULL,
	[payoutDate] [datetime] NULL,
	[payoutMethod] [nvarchar](255) NOT NULL,
	[createdAt] [datetime] NULL,
	[createdBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[payoutID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotions]    Script Date: 02/12/2024 1:40:06 CH ******/
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
/****** Object:  Table [dbo].[ReviewAndRatings]    Script Date: 02/12/2024 1:40:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReviewAndRatings](
	[reviewID] [int] NOT NULL,
	[cusID] [nvarchar](100) NULL,
	[homestayID] [int] NULL,
	[rating] [int] NULL,
	[comment] [varchar](255) NULL,
	[reviewDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[reviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 02/12/2024 1:40:06 CH ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 02/12/2024 1:40:06 CH ******/
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
INSERT [dbo].[Administrators] ([adminID], [userID], [roleID]) VALUES (N'23423423423424', N'2342342342342', N'ed204707-f559-4d7c-85ab-feb3d22af9a4')
GO
SET IDENTITY_INSERT [dbo].[Amenities] ON 

INSERT [dbo].[Amenities] ([amenityID], [name]) VALUES (1, N'Wifi')
INSERT [dbo].[Amenities] ([amenityID], [name]) VALUES (2, N'Máy lọc không khí')
SET IDENTITY_INSERT [dbo].[Amenities] OFF
GO
SET IDENTITY_INSERT [dbo].[BookingProcess] ON 

INSERT [dbo].[BookingProcess] ([processID], [bookingID], [paymentTime], [checkInTime], [checkOutTime], [stepOrder], [createdAt], [updatedAt], [completeStatus]) VALUES (1, 1996112974, NULL, NULL, NULL, 1, CAST(N'2024-11-25T14:26:31.550' AS DateTime), NULL, NULL)
INSERT [dbo].[BookingProcess] ([processID], [bookingID], [paymentTime], [checkInTime], [checkOutTime], [stepOrder], [createdAt], [updatedAt], [completeStatus]) VALUES (2, 1996112974, NULL, NULL, NULL, 1, CAST(N'2024-11-25T14:26:37.047' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[BookingProcess] OFF
GO
INSERT [dbo].[Bookings] ([bookingID], [cusID], [ownerID], [homestayID], [checkInDate], [checkOutDate], [numberOfGuests], [totalPrice], [paymentMethod], [discountPrice], [discountCode], [originalPrice], [guestList], [description], [bookingTime], [email], [phone], [name], [isConfirm], [isCancel], [reasonCancel]) VALUES (1996112974, N'ded4fdf6-02cf-4a23-8d42-ae92efe10c66', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', 2, CAST(N'2024-11-24' AS Date), CAST(N'2024-11-27' AS Date), 5, 2500000, NULL, NULL, NULL, 2500000, NULL, N'Đào Quang Huy', CAST(N'2024-11-25T06:59:35.797' AS DateTime), N'daohuy1692003@gmail.com', N'0364174636', N'Đào Quang Huy', 1, 0, NULL)
GO
INSERT [dbo].[Customers] ([cusID], [userID], [rentedRoomsTotal], [totalAmountPaID]) VALUES (N'4100f676-9d78-40a1-95df-f6b180a9b95e', N'3d175641-ac1f-471f-9340-b91d31b87d97', NULL, NULL)
INSERT [dbo].[Customers] ([cusID], [userID], [rentedRoomsTotal], [totalAmountPaID]) VALUES (N'c24084be-7373-42c1-abf5-6b065c1a7f90', N'bf46a84f-50b9-4417-bce0-ebe019d7ffd9', NULL, NULL)
INSERT [dbo].[Customers] ([cusID], [userID], [rentedRoomsTotal], [totalAmountPaID]) VALUES (N'ded4fdf6-02cf-4a23-8d42-ae92efe10c66', N'856b76fa-d626-416f-90d0-b1f10e855a5f', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[DetailHomeStays] ON 

INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [numberOfBedrooms], [numberOfLivingRooms], [numberOfBathrooms], [numberOfKitchens], [note]) VALUES (2, 2, 2, 2, 2, 2, N'HomeStay quá là ok')
INSERT [dbo].[DetailHomeStays] ([id], [homestayID], [numberOfBedrooms], [numberOfLivingRooms], [numberOfBathrooms], [numberOfKitchens], [note]) VALUES (3, 3, 2, 2, 2, 2, NULL)
SET IDENTITY_INSERT [dbo].[DetailHomeStays] OFF
GO
SET IDENTITY_INSERT [dbo].[Favorites] ON 

INSERT [dbo].[Favorites] ([favID], [cusID], [homestayID], [createdAt]) VALUES (2, N'ded4fdf6-02cf-4a23-8d42-ae92efe10c66', 2, NULL)
INSERT [dbo].[Favorites] ([favID], [cusID], [homestayID], [createdAt]) VALUES (3, N'4100f676-9d78-40a1-95df-f6b180a9b95e', 2, NULL)
INSERT [dbo].[Favorites] ([favID], [cusID], [homestayID], [createdAt]) VALUES (4, N'c24084be-7373-42c1-abf5-6b065c1a7f90', 3, NULL)
SET IDENTITY_INSERT [dbo].[Favorites] OFF
GO
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1024323399, 2, 1)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (1024324839, 2, 2)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (286301400, 3, 1)
INSERT [dbo].[HomestayAmenities] ([id], [homestayID], [amenityID]) VALUES (286297657, 3, 2)
GO
SET IDENTITY_INSERT [dbo].[HomeStays] ON 

INSERT [dbo].[HomeStays] ([homestayID], [homestayName], [ownerID], [addressDetail], [country], [imagePreview], [pricePerNight], [approvalStatus], [createdAt], [updatedAt], [province], [district], [wardOrCommune], [discountSecondNight], [minPerson], [maxPerson], [totalView], [isLocked], [linkGoogleMap]) VALUES (1, N'Homestay Bến Nhà Nò Số 72 Khoái Châu Hưng Yên', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Xóm 7 nhà Trần Duy Hưng', N'Việt Nam', N'["/Images/20241125_132356.png","/Images/20241125_132356.png","/Images/20241125_132356.png","/Images/20241125_132356.png","/Images/20241125_132356.png","/Images/20241125_132356.jpg"]', 900000, 0, CAST(N'2024-11-25T13:37:52.837' AS DateTime), NULL, N'Hưng Yên', N'Khoái Châu', N'Việt Hòa', 800000, 3, 5, NULL, 0, N'http://googlemap.com')
INSERT [dbo].[HomeStays] ([homestayID], [homestayName], [ownerID], [addressDetail], [country], [imagePreview], [pricePerNight], [approvalStatus], [createdAt], [updatedAt], [province], [district], [wardOrCommune], [discountSecondNight], [minPerson], [maxPerson], [totalView], [isLocked], [linkGoogleMap]) VALUES (2, N'Homestay Bến Nhà Nò Số 72 Khoái Châu Hưng Yên', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Xóm 7 nhà Trần Duy Hưng', N'Việt Nam', N'["/Images/20241125_132356.png","/Images/20241125_132356.png","/Images/20241125_132356.png","/Images/20241125_132356.png","/Images/20241125_132356.png","/Images/20241125_132356.jpg"]', 900000, 1, CAST(N'2024-11-25T13:40:04.880' AS DateTime), NULL, N'Hưng Yên', N'Khoái Châu', N'Việt Hòa', 800000, 3, 5, NULL, 0, N'http://googlemap.com')
INSERT [dbo].[HomeStays] ([homestayID], [homestayName], [ownerID], [addressDetail], [country], [imagePreview], [pricePerNight], [approvalStatus], [createdAt], [updatedAt], [province], [district], [wardOrCommune], [discountSecondNight], [minPerson], [maxPerson], [totalView], [isLocked], [linkGoogleMap]) VALUES (3, N'Homestay Nhà Núi Bát Bộ , 27 Ngô Đình Niêm', N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'Xóm 7 nhà Trần Duy Hưng', N'Việt Nam', N'["/Images/20241126_105636.jpg","/Images/20241126_105636.jpg","/Images/20241126_105636.jpg","/Images/20241126_105636.jpg","/Images/20241126_105636.jpg","/Images/20241126_105636.jpg"]', 900000, 1, CAST(N'2024-11-26T10:56:36.257' AS DateTime), NULL, N'Hà Nội', N'Ba Vì', N'Sơn Tây', 800000, 3, 5, NULL, 0, N'http://googlemap.com')
SET IDENTITY_INSERT [dbo].[HomeStays] OFF
GO
INSERT [dbo].[OwnerStays] ([ownerID], [userID], [bannerImage], [defaultCheckinTime], [defaultCheckoutTime], [description]) VALUES (N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19', N'bf46a84f-50b9-4417-bce0-ebe019d7ffd9', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[PartnershipReg] ON 

INSERT [dbo].[PartnershipReg] ([id], [customerID], [companyName], [fullName], [address], [phoneNumber], [email], [totalHomeStay], [imgPreview], [partnershipAgreement], [businessLicense], [note], [bankAccount], [status], [rejectionReason], [createdAt], [updatedAt]) VALUES (1, N'c24084be-7373-42c1-abf5-6b065c1a7f90', N'Đào Quang Huy', N'Đào Quang Huy', N'Hưng Yên', N'0364174636', N'daohuy1692003@gmail.com', 5, N'["/Images/20241125_111003.png","/Images/20241125_111003.png","/Images/20241125_111003.jpg","/Images/20241125_111003.jpg","/Images/20241125_111003.jpg","/Images/20241125_111003.jpg"]', NULL, NULL, N'Homestay rất sạch sẽ', NULL, 1, NULL, CAST(N'2024-11-25T11:10:03.960' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[PartnershipReg] OFF
GO
SET IDENTITY_INSERT [dbo].[Promotions] ON 

INSERT [dbo].[Promotions] ([prmID], [discountCode], [discountAmount], [description], [startDate], [endDate], [ownerID]) VALUES (1, N'CHAOMUNGHUY', CAST(500000 AS Decimal(18, 0)), N'Mã giảm giá nhân ngày valentine', CAST(N'2024-11-26T00:00:00.000' AS DateTime), CAST(N'2024-11-28T00:00:00.000' AS DateTime), N'f2c3f66f-efd9-4c4c-b95d-d7178f913d19')
SET IDENTITY_INSERT [dbo].[Promotions] OFF
GO
INSERT [dbo].[Roles] ([roleID], [nameRole]) VALUES (N'ed204707-f559-4d7c-85ab-feb3d22af9a4', N'Quản trị viên')
GO
INSERT [dbo].[Users] ([userID], [username], [fullName], [email], [phoneNumber], [password], [profilePicture], [dateOfBirth], [country], [address], [accountStatus], [createdAt], [status], [gender], [typeUser]) VALUES (N'2342342342342', N'admin', N'Đào Quang Huy', N'daohuy1692003@gmail.com', N'0364174636', N'123', NULL, NULL, NULL, NULL, 1, NULL, 1, 1, 0)
INSERT [dbo].[Users] ([userID], [username], [fullName], [email], [phoneNumber], [password], [profilePicture], [dateOfBirth], [country], [address], [accountStatus], [createdAt], [status], [gender], [typeUser]) VALUES (N'3d175641-ac1f-471f-9340-b91d31b87d97', N'vinh', N'vinh', NULL, NULL, N'$2a$11$RwCA4NA8II/AGXWsJ1lbHeBZR0hNNUP/mCszsYs//dxytNhOqIxkC', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0)
INSERT [dbo].[Users] ([userID], [username], [fullName], [email], [phoneNumber], [password], [profilePicture], [dateOfBirth], [country], [address], [accountStatus], [createdAt], [status], [gender], [typeUser]) VALUES (N'856b76fa-d626-416f-90d0-b1f10e855a5f', N'quyen', N'Đào Quang Huy', NULL, NULL, N'$2a$11$I91z6mKdxG0/MK5/E2biuebMuqWOVE.I0gzb6KIhOmYYEhxJCLDbe', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0)
INSERT [dbo].[Users] ([userID], [username], [fullName], [email], [phoneNumber], [password], [profilePicture], [dateOfBirth], [country], [address], [accountStatus], [createdAt], [status], [gender], [typeUser]) VALUES (N'bf46a84f-50b9-4417-bce0-ebe019d7ffd9', N'huy', N'Đào Quang Huy', NULL, NULL, N'$2a$11$a6PpNXW6Qux3fLQryzOAguRG9Es7UktG2ROz8Kl4zqTnRHo624VVi', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1)
GO
ALTER TABLE [dbo].[Advertisements] ADD  DEFAULT (getdate()) FOR [createdDate]
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
ALTER TABLE [dbo].[Conversations] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[FAQs] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[HomeStays] ADD  DEFAULT ((0)) FOR [approvalStatus]
GO
ALTER TABLE [dbo].[Messages] ADD  DEFAULT (getdate()) FOR [timestamp]
GO
ALTER TABLE [dbo].[PartnershipReg] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT (getdate()) FOR [paymentDate]
GO
ALTER TABLE [dbo].[Payouts] ADD  DEFAULT (getdate()) FOR [payoutDate]
GO
ALTER TABLE [dbo].[Payouts] ADD  DEFAULT (getdate()) FOR [createdAt]
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
ALTER TABLE [dbo].[Payouts]  WITH CHECK ADD FOREIGN KEY([cusID])
REFERENCES [dbo].[Customers] ([cusID])
GO
ALTER TABLE [dbo].[Payouts]  WITH CHECK ADD FOREIGN KEY([ownerID])
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
