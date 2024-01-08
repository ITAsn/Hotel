USE [master]
GO
/****** Object:  Database [HotelBase]    Script Date: 08.01.2024 23:52:54 ******/
CREATE DATABASE [HotelBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HotelBase', FILENAME = N'E:\sql\MSSQL16.MSSQLSERVER\MSSQL\DATA\HotelBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HotelBase_log', FILENAME = N'E:\sql\MSSQL16.MSSQLSERVER\MSSQL\DATA\HotelBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [HotelBase] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HotelBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HotelBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HotelBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HotelBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HotelBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HotelBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [HotelBase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HotelBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HotelBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HotelBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HotelBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HotelBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HotelBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HotelBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HotelBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HotelBase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HotelBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HotelBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HotelBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HotelBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HotelBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HotelBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HotelBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HotelBase] SET RECOVERY FULL 
GO
ALTER DATABASE [HotelBase] SET  MULTI_USER 
GO
ALTER DATABASE [HotelBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HotelBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HotelBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HotelBase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HotelBase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HotelBase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'HotelBase', N'ON'
GO
ALTER DATABASE [HotelBase] SET QUERY_STORE = ON
GO
ALTER DATABASE [HotelBase] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [HotelBase]
GO
/****** Object:  User [ProgramUser]    Script Date: 08.01.2024 23:52:54 ******/
CREATE USER [ProgramUser] FOR LOGIN [ProgramUser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ProgramUser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ProgramUser]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 08.01.2024 23:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[IDBooking] [int] NOT NULL,
	[IDRoom] [int] NOT NULL,
	[KeyRoom] [nvarchar](50) NOT NULL,
	[BookingWhen] [date] NOT NULL,
	[BookingIn] [date] NOT NULL,
	[BookingOut] [date] NOT NULL,
	[EmailOrPhone] [nvarchar](100) NULL,
 CONSTRAINT [PK_Bookings] PRIMARY KEY CLUSTERED 
(
	[IDBooking] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelRooms]    Script Date: 08.01.2024 23:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelRooms](
	[IDRoom] [int] NOT NULL,
	[IDHotel] [int] NULL,
	[Cost] [int] NOT NULL,
	[Coments] [text] NOT NULL,
	[RoomsCount] [int] NOT NULL,
	[TakedTimes] [text] NOT NULL,
	[ImageRoom] [image] NULL,
 CONSTRAINT [PK_HotelRooms] PRIMARY KEY CLUSTERED 
(
	[IDRoom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotels]    Script Date: 08.01.2024 23:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotels](
	[IDHotel] [int] NOT NULL,
	[Location] [nvarchar](250) NOT NULL,
	[RoomsCount] [int] NOT NULL,
 CONSTRAINT [PK_Hotels] PRIMARY KEY CLUSTERED 
(
	[IDHotel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Bookings] ([IDBooking], [IDRoom], [KeyRoom], [BookingWhen], [BookingIn], [BookingOut], [EmailOrPhone]) VALUES (17773648, 0, N'62739', CAST(N'2024-01-08' AS Date), CAST(N'2024-01-12' AS Date), CAST(N'2024-01-13' AS Date), N'452424;ytutyu')
INSERT [dbo].[Bookings] ([IDBooking], [IDRoom], [KeyRoom], [BookingWhen], [BookingIn], [BookingOut], [EmailOrPhone]) VALUES (93757752, 0, N'15153', CAST(N'2024-01-08' AS Date), CAST(N'2024-01-09' AS Date), CAST(N'2024-01-11' AS Date), N'12323;qwewqe@gmail.com')
GO
INSERT [dbo].[HotelRooms] ([IDRoom], [IDHotel], [Cost], [Coments], [RoomsCount], [TakedTimes], [ImageRoom]) VALUES (0, 0, 30, N'Прекрасное место для отдыха. Каждая секунда там будет вам как один год в вашей счастливой жизни.', 2, N'20.12.2023;20.12.2023;21.12.2023;22.12.2023;23.12.2023;24.12.2023;09.01.2024;09.01.2024;10.01.2024;11.01.2024;12.01.2024;12.01.2024;13.01.2024;', 0x89504E470D0A1A0A0000000D4948445200000293000001320806000000A6BE5B2B000000017352474200AECE1CE90000000467414D410000B18F0BFC6105000000097048597300000EC300000EC301C76FA8640000108549444154785EEDDDCD91EC480185D1670BF6B0C71736E30B1ECC128FF00248869A56AB6F55A5B2F493A93C27E2DB88524C4BD39D758305FCFA370000343226010068664C0200D0CC980400A09931090040336312008066C6240000CD8C4900009A19930000343326010068664C0200D0CC980400A09931090040336312008066C62470B9BFFCFED73F03602CC62470A9E590342801C6634C0297322601C6664C02974A63B204C0188C49E072C624C0B88C49E072694C9600E89F310974218DC912007D3326812EA4215902A06FC624D08D34264B00F4CB9804BA91866409807E19934057D2982C01D0276312E88E3109300E6312E84E1A932500FA634C025D322601C6604C025D4A63B204405F8C49A05BC62440FF8C49A05B694C9600E8873109742D8DC912007D302681AEA5215902A00FC624D0BD34264B005CCF9804BA9786640980EB1993C010D2982C01702D631218421A922500AE654C02C34863B204C0758C496028C624405F8C496028694C9600B88631090CC79804E88731090C278DC91200E7332681211993007D30268121A5315902E05CC62430AC34264B009CC79804869586640980F31893C0D0D2982C01700E6312185A1A922500CE614C02C34B63B204C0F18C49E0168C49806B1893C02DA4315902E058C624701BC624C0F98C49E036D2982C01701C6312B8156312E05CC624702B694C960038863109DC4E1A932500F6674C02B79386640980FD1993C02DA5315902605FC624704B69489600D8973109DC561A932500F6634C02B79586640980FD1893C0ADA5315902601FC624707BC624C0718C49E0F6D2982CF1FDDD00B4302681292C47D3CCE329BD8765005B1993C014D2702ACD203DF7B300B632268169A4F154BAA3F49C35016C654C02D348E3A97417E9D9B604D0C29804A69246546954E959B604F0296312984A1A54A551A49F7D6B007B322681E9A48155EA55FA59B70670146312984E1A5BA59EA49F6F6B006730268129A5F155BA52FA79B6067036631298560F632CFD0C5B03B89231094C2B0DB3D2D1D23F734B003D312681A99D3DD6D23FAF26805E1993C0D4CE1E6EE99FF72C80111893C0F4CE1C70CB7F560A6034C624C0C90C48E04E8C4900009A1993D031FF0D1600BD3326A153EB21F92C00B89231099D4AC3B12600389331099D4A43B13500388A31091D4BC3708F00602FC6240C228DC23D038016C6240C2C8DC23D0380778C49B8913408F70C00D68C49B8B9340AF70C80B9199330A1340AF70A80B91893401C857B06C07D1993409446E19E01700FC62450250DC23D03604CC624D02C8DC23D03A07FC624B0AB340AF70A80FE1893C0A1D228DC2B00AE674C02A74BC3B03500AE654C02974B23B13600AE654C025D4AC33105C0B58C4960188624407F8C4900009A19930000343326010068664C0200D0CC980400A0993109004033631220F8E7DFFFF667003C674C02AC2C87A44109F09A3109B0624C02D4332601568C49807AC624C0CAD163D2FF25247027C624C0CA9163723924D7018CC8980458B96A4C3E0218893109105C39269701F4CE980408D663F2CA415902E8953109DCCE1E23ECC831F9B0FC39B704D0136312B895BDC6D719637229FDDCEF02E8813109DC421A5B8F5A9C3D261FD2CF5F13C0558C496078695C2D6B71D5985C4ACFF22E80B31993C0B0D2985AD7AA8731F9909EAB2680331893C090D2785AF7899EC6E4527ACE9A008E624C02C3496369D91E7A1D930FE9B96B02D89B31090C238DA3757BE97D4C2EA5F75013C01E8C496008690C2DDBDB4863F221BD979A003E614C025D4BE367DD51461C940FE93DD504B0953109742B8D9D75471A794C3EA4775613402D6312E8521A38CBCE708731B994DE634D00AF18934057D298597796BB8DC9A5F45EDF059018934037D2805976B63B8FC987F49E5F05B0664C02974BA365DD156618934BE9BDAF03583326814BA5C1B2EE2AB38DC987F4EFE011C09A31095C268D9565579B754C2EF5F4EF03E89331099C6E39509ED5036312E03D631238551A8ECB7A624C02BC674C02A748C3715D6F8C4980F78C49E0706938AEEB954109F09A31091C2A0DC765BD3326015E33268143A4E1B86E04C624C06BC624B0BB341C978DC4980478CD9804769386E3BAD1189300AF1993C02ED2705C37226312E0356312F8581A8ECB46664C02BC664C02CDD2705C373A6312E0356312689286E3B2BB3026015E3326814DD2705C7727C624C06BC624502D0DC775776450023C674C0255D2705C7667C624C073C62450250DC84777674C023C674C0255661C910FC624C073C624506DC62159189300CF1993006F189300CF1993006F189300CF1993006F189300CF1993006F189300CF1993006F189300CF1993006F189300CF199300150C4A80CC9804A8604C0264C62440056312203326012A18930099310950C19804C88C49800AC62440664C0254302601326312A082310990199300158C4980CC9804A8604C0264C62440256312E0276312A0D27A4C1A9400C62440356312E0276312A0923109F093310950C99804F8C99804A8644C02FC644C02543226017E3226012A1993003F199300958C49809F8C49804AC624C04FC62440256312E027631260038312E03B631260036312E03B631260036312E03B631260036312E03B631260036312E03B631260036312E03B631260036312E03B631260036312E03B631260036312E03B631260036312E03B631260036312E03B631260238312E08B3109B0913109F0C59804D8C89804F8624C026C644C027C31260136322601BE1893001B1993005F8C49808D8C49802FC624C046C624C017631260236312E08B310974E3D7AF5F7FD6336312E08B31095C6E392297F5CC9804F88331095C260DC811332881991993C0E9D220BB43003372FA01A74903EC6E01CCC6C9071C2E8DAEBB06301B271F70A834B852BFFDF65BBC3E5A00B371F2018748432B5546E428A59F7F1DC06C9C7CC0AED2C04AA5B1D673E9195200B371F201BB48C3EA5969ACF55C7A866701CCC6C9077C240DAA67A5A1D67BE9395E05301B271FD0240DA967A5913642E9591E95FF91F2741D60364E3E609334A09E9506DA08A56759F6EA7300B371F201D5D2784A2D87D948A56749BDFA3CC06C9C7C4095349C666B393C8D49803F38F980B7D2689AADF590342601FEE0E403DE4AA36996D2887C943E0F301B271FF0561A4D339406E4B2740FC06C9C7C4095349CEE5E1A90CBD23D00B371F20155D2704A036BD45A9E2FDD03301B271F50250DA734B046ADE5F9D23D00B371F20155D2704A036BD45A9E2FDD03301B271F50250DA734B046ADE5F9D23D00B371F20155D2704A036BD45A9E2FDD53FE3FBB0166624C0255D2704A036BD45A9E2FDD634C02B33126812A6938A581356A2DCF97EE312681D918934095349CD2C01AB596E74BF71893C06C8C49A04A1A4E69608D5ACBF3A57B8C496036C62450250DA734B046ADE5F9D23DC624301B6312A89286531A58A3D6F27CE91E6312988D31095449C3290DAC516B79BE748F3109CCC69804AAA4E19406D6A8B53C5FBAC7980466634C0255D2704A036BD45A9E2FDD634C02B33126812A6938A581356A2DCF97EE2963D2A00466624C0255D2704A036BD45A9E2FDD634C02B33126812A6938A581356A2DCF97EE312681D918934095349CD2C01AB596E74BF76C1D937FF9FDAFC305B0644C0255D2704A036BD45A9E2FDDF36C4CA65176B7803919934095349CD2C01AB596E74BF794CA984C636B9680B918934095349AD2C01AB596E74BF794661F9325601EC62450258DA634B046ADE5F9D23D2563F27B4BE97D4935D12FFF76802AE9704F036BD45A9E2FDD53322673E95D49BA41E98094F6887B490748FAF73E6A2DCF97EE291993B9F4AE24DDA074404AD2BA7480A4CF8D5ACBF3A57B4AC6642EBD2B4937281D9092B42E1D20E973A3D6F27CE99E52199306652EBD2F4983970E48495A970E90F4B9516B79BE744FC998DCA75FFFF897F447E1EF4C1D950E48495A970E90F4B9516B79BE744FC998DCB7382E24F553BC287D58FAE2D5D8A5D1943E376A2DCF97EE291993C794CE1A491D142F4AD2BA309AD2C01AB596E74BF7948CC9E38ABF9B92AE2D5E94A4756134A581356A2DCF97EE291993C7177F47255D53BC2849EBC2684A036BD45A9E2FDD533226CF2BFEAE4A3AB7785192D685D19406D6A8B53E5FBACF903CBFF83B2BE99CE245495A1746531A57A3D6FA7CE9BE3476744EF17757D2B1C58B92B42E8CA634AE46ADF5F9D27D69E4E8BCE2EFAFA4E38A1725695D184D695C8D5AEBF3A5FBD2C0D1B9C5DF6149C7142F4AD2BA309AD2B81AB5D6E74BF7A571A36B8ABFCB92F62D5E94A4756134A571356AADCF97EE4BA346D7167FA725ED53BC2849EBC2684AE36AD45A9F2FDD97C68CAE2FFE5E4BFABC785192FEDBB72FE2309AD2B81AB5F47CA5F4D965E99EE57B535FA5DF73491F162F4A9AB2F4E5FB288DA634AE462D3D5F297D7659BA27BD3FF553FADD97F441F1A2A4E94A5FBACBD2684AE36AD4D2F395D26797A57BD2FB535FA5BF01498DC58B92A6287DC93E2B8DA634AE462D3D5F297D7659BA27BD3FF557FA9B90D450BC28E9D6A52FD677A5D194C6D5A8A5E72BA5CF2E4BF7A4F7A77E4B7F239236142F4ABA5DE94B744B6934A571356AE9F94AE9B3CBD23DE9FDA9EFD2DF8CA4CAE24549B7297D71B69446531A57A3969EAF943EBB2CDD93DE9FC628FD0D497A53BC28E916A52FCBD6D2684AE36AD4D2F395D26797A57BD2FBD358A5BF27494F8A17250D5DFA72FCB4349AD2B81AB5F47CA5F4D965E99EF4FE3466E9EF4BD2AA7851D2B0A52FC43D4AA3298DAB514BCF574A9F5D96EE49EF4FE396FECE242D8A17250D59FA22DCAB349AD2B81AB5F47CA5F4D947E9F3A5F4FE3476E9EF4DD2FF8B17250D55FAF2DBBB349AD2C01AB5F47CA5F4D952FAECA3F4FE748FD2DF9F347DF1A2A4214A5F76479546531A59A3969EAFB4E5B38FD2FBD37D4A7F8BD2D4C58B92BA2E7DC11D5D1A4D69688D5A7ABE52EDE796A5F7A77B95FE2EA5698B17257559FA523BAB349AD643EB0E3D7BC6F5F567A577A7FB96FE4EA5E98A17257557FA223BB3349C96236CF4D2F3955EFD678FD2FBD25CA5BF59699AE24549DD94BEB8AE288DA8F5201BB5F46CB5A577A5794B7FC3D2ED8B17255D5EFAA2BAB234A4D2301BB5F47CEF4AEF492AA5BF69E9B6C58B922E2D7D395D5D1A53A534CC462C3DDBABD23B92D6A5BF6FE976C58B922E297D19F5521A543396DE8DF4AEF4F72EDDA67851D2A9A52F9FDE4AC36AB6D27B915A4AE780346CF1A2A4D34A5F343D96C6D54CA577227D5A3A13A4E18A17259D52FA72E9B534B0662ABD1369AFD2F9200D53BC28E9F0D2174AEFA5913543E95D487B97CE096988E245498796BE4824A994CE0CA9EBE245498795BE3C242995CE10A9BBE245498794BE2C24A9A674A6485D142F4ADABDF4E520492DA53346BAAC7851D2AEA52F0349DAA374E648A7162F4ADAAD74F84BD2DEA5F3473AA57851D22EA5035F928E2C9D45D2A1C58B9276291DF4927446E94C920E295E94F471E97097A4AB4AE794B44BF1A2A48F4B87B9245D5D3AAFA48F8A17257D543AC025A9A7D2D92535152F4AFAA874704B528FA5334CDA54BC28A9B974584BD208A5334D7A5BBC28A9B974404BD228A5734D7A59BC28A9A974304BD2A8A5734EFA51BC28A9A974184BD2C8A5B34EFA56BC286973E91096A4BB94CE3DE97FC58B9236970E5F49BA53E9EC938C496987D2A12B49772B9D7F923129ED503A7425E98EA5335093172F4AAA2E1DB69274E7D259A8898B172555970E5A49BA73E92CD4C4C58B92AA4A87AC24CD503A133569F1A2A4AAD2012B493395CE464D56BC28E96DE95095A4194B67A4262A5E94F4B674A04AD28CA5335213152F4A7A5B3A502569E6D259A9BBF7AF7FFF07BFDE505E4F38694D0000000049454E44AE426082)
INSERT [dbo].[HotelRooms] ([IDRoom], [IDHotel], [Cost], [Coments], [RoomsCount], [TakedTimes], [ImageRoom]) VALUES (84832, 1, 22, N'Прекрасное место', 1, N'08.01.2024 0:00:00', 0x89504E470D0A1A0A0000000D4948445200000293000001320806000000A6BE5B2B000000017352474200AECE1CE90000000467414D410000B18F0BFC6105000000097048597300000EC300000EC301C76FA8640000108549444154785EEDDDCD91EC480185D1670BF6B0C71736E30B1ECC128FF00248869A56AB6F55A5B2F493A93C27E2DB88524C4BD39D758305FCFA370000343226010068664C0200D0CC980400A09931090040336312008066C6240000CD8C4900009A19930000343326010068664C0200D0CC980400A09931090040336312008066C62470B9BFFCFED73F03602CC62470A9E590342801C6634C0297322601C6664C02974A63B204C0188C49E072C624C0B88C49E072694C9600E89F310974218DC912007D3326812EA4215902A06FC624D08D34264B00F4CB9804BA91866409807E19934057D2982C01D0276312E88E3109300E6312E84E1A932500FA634C025D322601C6604C025D4A63B204405F8C49A05BC62440FF8C49A05B694C9600E8873109742D8DC912007D302681AEA5215902A00FC624D0BD34264B005CCF9804BA9786640980EB1993C010D2982C01702D631218421A922500AE654C02C34863B204C0758C496028C624405F8C496028694C9600B88631090CC79804E88731090C278DC91200E7332681211993007D30268121A5315902E05CC62430AC34264B009CC79804869586640980F31893C0D0D2982C01700E6312185A1A922500CE614C02C34B63B204C0F18C49E0168C49806B1893C02DA4315902E058C624701BC624C0F98C49E036D2982C01701C6312B8156312E05CC624702B694C960038863109DC4E1A932500F6674C02B79386640980FD1993C02DA5315902605FC624704B69489600D8973109DC561A932500F6634C02B79586640980FD1893C0ADA5315902601FC624707BC624C0718C49E0F6D2982CF1FDDD00B4302681292C47D3CCE329BD8765005B1993C014D2702ACD203DF7B300B632268169A4F154BAA3F49C35016C654C02D348E3A97417E9D9B604D0C29804A69246546954E959B604F0296312984A1A54A551A49F7D6B007B322681E9A48155EA55FA59B70670146312984E1A5BA59EA49F6F6B006730268129A5F155BA52FA79B6067036631298560F632CFD0C5B03B89231094C2B0DB3D2D1D23F734B003D312681A99D3DD6D23FAF26805E1993C0D4CE1E6EE99FF72C80111893C0F4CE1C70CB7F560A6034C624C0C90C48E04E8C4900009A1993D031FF0D1600BD3326A153EB21F92C00B89231099D4AC3B12600389331099D4A43B13500388A31091D4BC3708F00602FC6240C228DC23D038016C6240C2C8DC23D0380778C49B8913408F70C00D68C49B8B9340AF70C80B9199330A1340AF70A80B91893401C857B06C07D1993409446E19E01700FC62450250DC23D03604CC624D02C8DC23D03A07FC624B0AB340AF70A80FE1893C0A1D228DC2B00AE674C02A74BC3B03500AE654C02974B23B13600AE654C025D4AC33105C0B58C4960188624407F8C4900009A19930000343326010068664C0200D0CC980400A0993109004033631220F8E7DFFFF667003C674C02AC2C87A44109F09A3109B0624C02D4332601568C49807AC624C0CAD163D2FF25247027C624C0CA9163723924D7018CC8980458B96A4C3E0218893109105C39269701F4CE980408D663F2CA415902E8953109DCCE1E23ECC831F9B0FC39B704D0136312B895BDC6D719637229FDDCEF02E8813109DC421A5B8F5A9C3D261FD2CF5F13C0558C496078695C2D6B71D5985C4ACFF22E80B31993C0B0D2985AD7AA8731F9909EAB2680331893C090D2785AF7899EC6E4527ACE9A008E624C02C3496369D91E7A1D930FE9B96B02D89B31090C238DA3757BE97D4C2EA5F75013C01E8C496008690C2DDBDB4863F221BD979A003E614C025D4BE367DD51461C940FE93DD504B0953109742B8D9D75471A794C3EA4775613402D6312E8521A38CBCE708731B994DE634D00AF18934057D298597796BB8DC9A5F45EDF059018934037D2805976B63B8FC987F49E5F05B0664C02974BA365DD156618934BE9BDAF03583326814BA5C1B2EE2AB38DC987F4EFE011C09A31095C268D9565579B754C2EF5F4EF03E89331099C6E39509ED5036312E03D631238551A8ECB7A624C02BC674C02A748C3715D6F8C4980F78C49E0706938AEEB954109F09A31091C2A0DC765BD3326015E33268143A4E1B86E04C624C06BC624B0BB341C978DC4980478CD9804769386E3BAD1189300AF1993C02ED2705C37226312E0356312F8581A8ECB46664C02BC664C02CDD2705C373A6312E0356312689286E3B2BB3026015E3326814DD2705C7727C624C06BC624502D0DC775776450023C674C0255D2705C7667C624C073C62450250DC84777674C023C674C0255661C910FC624C073C624506DC62159189300CF1993006F189300CF1993006F189300CF1993006F189300CF1993006F189300CF1993006F189300CF1993006F189300CF199300150C4A80CC9804A8604C0264C62440056312203326012A18930099310950C19804C88C49800AC62440664C0254302601326312A082310990199300158C4980CC9804A8604C0264C62440256312E0276312A0D27A4C1A9400C62440356312E0276312A0923109F093310950C99804F8C99804A8644C02FC644C02543226017E3226012A1993003F199300958C49809F8C49804AC624C04FC62440256312E027631260038312E03B631260036312E03B631260036312E03B631260036312E03B631260036312E03B631260036312E03B631260036312E03B631260036312E03B631260036312E03B631260036312E03B631260036312E03B631260238312E08B3109B0913109F0C59804D8C89804F8624C026C644C027C31260136322601BE1893001B1993005F8C49808D8C49802FC624C046C624C017631260236312E08B310974E3D7AF5F7FD6336312E08B31095C6E392297F5CC9804F88331095C260DC811332881991993C0E9D220BB43003372FA01A74903EC6E01CCC6C9071C2E8DAEBB06301B271F70A834B852BFFDF65BBC3E5A00B371F2018748432B5546E428A59F7F1DC06C9C7CC0AED2C04AA5B1D673E9195200B371F201BB48C3EA5969ACF55C7A866701CCC6C9077C240DAA67A5A1D67BE9395E05301B271FD0240DA967A5913642E9591E95FF91F2741D60364E3E609334A09E9506DA08A56759F6EA7300B371F201D5D2784A2D87D948A56749BDFA3CC06C9C7C4095349C666B393C8D49803F38F980B7D2689AADF590342601FEE0E403DE4AA36996D2887C943E0F301B271FF0561A4D339406E4B2740FC06C9C7C4095349CEE5E1A90CBD23D00B371F20155D2704A036BD45A9E2FDD03301B271F50250DA734B046ADE5F9D23D00B371F20155D2704A036BD45A9E2FDD03301B271F50250DA734B046ADE5F9D23D00B371F20155D2704A036BD45A9E2FDD53FE3FBB0166624C0255D2704A036BD45A9E2FDD634C02B33126812A6938A581356A2DCF97EE312681D918934095349CD2C01AB596E74BF71893C06C8C49A04A1A4E69608D5ACBF3A57B8C496036C62450250DA734B046ADE5F9D23DC624301B6312A89286531A58A3D6F27CE91E6312988D31095449C3290DAC516B79BE748F3109CCC69804AAA4E19406D6A8B53C5FBAC7980466634C0255D2704A036BD45A9E2FDD634C02B33126812A6938A581356A2DCF97EE2963D2A00466624C0255D2704A036BD45A9E2FDD634C02B33126812A6938A581356A2DCF97EE312681D918934095349CD2C01AB596E74BF76C1D937FF9FDAFC305B0644C0255D2704A036BD45A9E2FDDF36C4CA65176B7803919934095349CD2C01AB596E74BF794CA984C636B9680B918934095349AD2C01AB596E74BF794661F9325601EC62450258DA634B046ADE5F9D23D2563F27B4BE97D4935D12FFF76802AE9704F036BD45A9E2FDD53322673E95D49BA41E98094F6887B490748FAF73E6A2DCF97EE291993B9F4AE24DDA074404AD2BA7480A4CF8D5ACBF3A57B4AC6642EBD2B4937281D9092B42E1D20E973A3D6F27CE99E52199306652EBD2F4983970E48495A970E90F4B9516B79BE744FC998DCA75FFFF897F447E1EF4C1D950E48495A970E90F4B9516B79BE744FC998DCB7382E24F553BC287D58FAE2D5D8A5D1943E376A2DCF97EE291993C794CE1A491D142F4AD2BA309AD2C01AB596E74BF7948CC9E38ABF9B92AE2D5E94A4756134A581356A2DCF97EE291993C7177F47255D53BC2849EBC2684A036BD45A9E2FDD533226CF2BFEAE4A3AB7785192D685D19406D6A8B53E5FBACF903CBFF83B2BE99CE245495A1746531A57A3D6FA7CE9BE3476744EF17757D2B1C58B92B42E8CA634AE46ADF5F9D27D69E4E8BCE2EFAFA4E38A1725695D184D695C8D5AEBF3A5FBD2C0D1B9C5DF6149C7142F4AD2BA309AD2B81AB5D6E74BF7A571A36B8ABFCB92F62D5E94A4756134A571356AADCF97EE4BA346D7167FA725ED53BC2849EBC2684AE36AD45A9F2FDD97C68CAE2FFE5E4BFABC785192FEDBB72FE2309AD2B81AB5F47CA5F4D965E99EE57B535FA5DF73491F162F4A9AB2F4E5FB288DA634AE462D3D5F297D7659BA27BD3FF553FADD97F441F1A2A4E94A5FBACBD2684AE36AD4D2F395D26797A57BD2FB535FA5BF01498DC58B92A6287DC93E2B8DA634AE462D3D5F297D7659BA27BD3FF557FA9B90D450BC28E9D6A52FD677A5D194C6D5A8A5E72BA5CF2E4BF7A4F7A77E4B7F239236142F4ABA5DE94B744B6934A571356AE9F94AE9B3CBD23DE9FDA9EFD2DF8CA4CAE24549B7297D71B69446531A57A3969EAF943EBB2CDD93DE9FC628FD0D497A53BC28E916A52FCBD6D2684AE36AD4D2F395D26797A57BD2FBD358A5BF27494F8A17250D5DFA72FCB4349AD2B81AB5F47CA5F4D965E99EF4FE3466E9EF4BD2AA7851D2B0A52FC43D4AA3298DAB514BCF574A9F5D96EE49EF4FE396FECE242D8A17250D59FA22DCAB349AD2B81AB5F47CA5F4D947E9F3A5F4FE3476E9EF4DD2FF8B17250D55FAF2DBBB349AD2C01AB5F47CA5F4D952FAECA3F4FE748FD2DF9F347DF1A2A4214A5F76479546531A59A3969EAFB4E5B38FD2FBD37D4A7F8BD2D4C58B92BA2E7DC11D5D1A4D69688D5A7ABE52EDE796A5F7A77B95FE2EA5698B17257559FA523BAB349AD643EB0E3D7BC6F5F567A577A7FB96FE4EA5E98A17257557FA223BB3349C96236CF4D2F3955EFD678FD2FBD25CA5BF59699AE24549DD94BEB8AE288DA8F5201BB5F46CB5A577A5794B7FC3D2ED8B17255D5EFAA2BAB234A4D2301BB5F47CEF4AEF492AA5BF69E9B6C58B922E2D7D395D5D1A53A534CC462C3DDBABD23B92D6A5BF6FE976C58B922E297D19F5521A543396DE8DF4AEF4F72EDDA67851D2A9A52F9FDE4AC36AB6D27B915A4AE780346CF1A2A4D34A5F343D96C6D54CA577227D5A3A13A4E18A17259D52FA72E9B534B0662ABD1369AFD2F9200D53BC28E9F0D2174AEFA5913543E95D487B97CE096988E245498796BE4824A994CE0CA9EBE245498795BE3C242995CE10A9BBE245498794BE2C24A9A674A6485D142F4ADABDF4E520492DA53346BAAC7851D2AEA52F0349DAA374E648A7162F4ADAAD74F84BD2DEA5F3473AA57851D22EA5035F928E2C9D45D2A1C58B9276291DF4927446E94C920E295E94F471E97097A4AB4AE794B44BF1A2A48F4B87B9245D5D3AAFA48F8A17257D543AC025A9A7D2D92535152F4AFAA874704B528FA5334CDA54BC28A9B974584BD208A5334D7A5BBC28A9B974404BD228A5734D7A59BC28A9A974304BD2A8A5734EFA51BC28A9A974184BD2C8A5B34EFA56BC286973E91096A4BB94CE3DE97FC58B9236970E5F49BA53E9EC938C496987D2A12B49772B9D7F923129ED503A7425E98EA5335093172F4AAA2E1DB69274E7D259A8898B172555970E5A49BA73E92CD4C4C58B92AA4A87AC24CD503A133569F1A2A4AAD2012B493395CE464D56BC28E96DE95095A4194B67A4262A5E94F4B674A04AD28CA5335213152F4A7A5B3A502569E6D259A9BBF7AF7FFF07BFDE505E4F38694D0000000049454E44AE426082)
GO
INSERT [dbo].[Hotels] ([IDHotel], [Location], [RoomsCount]) VALUES (0, N'г. Берлин', 5)
INSERT [dbo].[Hotels] ([IDHotel], [Location], [RoomsCount]) VALUES (1, N'г. Москва, ул Пушкина, д. Колотушкина', 3)
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_HotelRooms] FOREIGN KEY([IDRoom])
REFERENCES [dbo].[HotelRooms] ([IDRoom])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_HotelRooms]
GO
ALTER TABLE [dbo].[HotelRooms]  WITH CHECK ADD  CONSTRAINT [FK_HotelRooms_Hotels] FOREIGN KEY([IDHotel])
REFERENCES [dbo].[Hotels] ([IDHotel])
GO
ALTER TABLE [dbo].[HotelRooms] CHECK CONSTRAINT [FK_HotelRooms_Hotels]
GO
USE [master]
GO
ALTER DATABASE [HotelBase] SET  READ_WRITE 
GO
