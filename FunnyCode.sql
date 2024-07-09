DROP DATABASE [FunnyCode_DB]
CREATE DATABASE [FunnyCode_DB]
USE [FunnyCode_DB]
GO
/****** Object:  Table [dbo].[tblAds]    Script Date: 08/07/2024 5:38:49 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAds](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[img] [text] NULL,
	[description] [text] NULL,
	[link] [text] NULL,
	[position] [int] NULL,
	[status] [nvarchar](50) NULL,
	[createdDate] [datetime] NULL,
	[updatedDate] [datetime] NULL,
	[createdBy] [bigint] NULL,
	[updateBy] [bigint] NULL,
	[width] [float] NULL,
	[height] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCart]    Script Date: 08/07/2024 5:38:49 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCart](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_user] [bigint] NULL,
	[id_course] [bigint] NULL,
	[addedAt] [datetime] NULL,
	[updatedBy] [bigint] NULL,
	[updatedDate] [datetime] NULL,
	[createdDate] [datetime] NULL,
	[createdBy] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 08/07/2024 5:38:49 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](30) NULL, --chuyen thanh tieng viet
	[description] [nvarchar](50) NULL,
	[updatedBy] [bigint] NULL,
	[updatedDate] [datetime] NULL,
	[createdDate] [datetime] NULL,
	[createdBy] [bigint] NULL,
	[status] [bit] NULL, -- 1 active -- 0 inactive
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] 
GO
/****** Object:  Table [dbo].[tblComment]    Script Date: 08/07/2024 5:38:49 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblComment](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](30) NOT NULL,
	[email] [nvarchar](30) NULL,
	[comment_id] [bigint] NULL,
	[status] [nvarchar](50) NULL,
	[quantity] [int] NULL,
	[website] [varchar](500) NULL,
	[message] [text] NULL,
	[createdDate] [datetime] NULL,
	[updatedDate] [datetime] NULL,
	[createdBy] [bigint] NULL,
	[updatedBy] [bigint] NULL,
	[id_course] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCourse]    Script Date: 08/07/2024 5:38:49 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCourse](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](30) NOT NULL,
	[rate] [int] NULL,
	[price] [float] NULL,
	[time_course] [nvarchar](30) NULL,
	[description] [nvarchar](30) NULL,
	[createdDate] [datetime] NULL,
	[updatedDate] [datetime] NULL,
	[createdBy] [nchar](30) NULL,
	[updatedBy] [nchar](30) NULL,
	[id_category] [bigint] NULL,
	[type_course] [bit] NULL, -- 1 zoom 0 record
	[id_lesson_time] [nvarchar](30) NULL,
	[total_lesson] [int] NULL,
	[img] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] 
GO
/****** Object:  Table [dbo].[tbldetailinvoices]    Script Date: 08/07/2024 5:38:49 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbldetailinvoices](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_voice] [bigint] NULL,
	[id_course] [bigint] NULL,
	[quantity_purch] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblInvoices]    Script Date: 08/07/2024 5:38:49 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblInvoices](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[purch_date] [datetime] NULL,
	[id_user] [bigint] NULL,
	[order_status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLesson]    Script Date: 08/07/2024 5:38:49 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLesson](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[namelesson] [nvarchar](30) NULL,
	[id_course] [bigint] NULL,
	[createdDate] [datetime] NULL,
	[updatedDate] [datetime] NULL,
	[createdBy] [bigint] NULL,
	[updatedBy] [bigint] NULL,
	[content] [nvarchar](255) NULL,
	[time_lesson] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMessages]    Script Date: 08/07/2024 5:38:49 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMessages](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[subject] [nvarchar](30) NULL,
	[email] [text] NULL,
	[description] [text] NULL,
	[updatedBy] [bigint] NULL,
	[updatedDate] [datetime] NULL,
	[createdDate] [datetime] NULL,
	[createdBy] [bigint] NULL,
	[message] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRating]    Script Date: 08/07/2024 5:38:49 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRating](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[comment] [text] NULL,
	[website] [varchar](500) NULL,
	[updatedBy] [bigint] NULL,
	[updatedDate] [datetime] NULL,
	[ratedBy] [bigint] NULL,
	[ratedAt] [datetime] NULL,
	[id_course] [bigint] NULL,
	[numberStar] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 08/07/2024 5:38:49 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](30) NULL,
	[email] [nvarchar](30) NULL,
	[fullName] [nvarchar](30) NULL,
	[password] [nvarchar](30) NULL,
	[avatar] [varchar](50) NULL,
	[phone] [varchar](30) NULL,
	[role] [varchar](1) NULL,
	[status] [bit] NULL,
	[code] [varchar](6) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLessonTime]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLessonTime](
	[id] [nvarchar](30) NOT NULL,
	[name] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblAds] ADD  DEFAULT ('active') FOR [status]
GO
ALTER TABLE [dbo].[tblCategory] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[tblComment] ADD  DEFAULT ('active') FOR [status]
GO
ALTER TABLE [dbo].[tblUsers] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[tblCourse] ADD  DEFAULT ((0)) FOR [total_lesson]
GO

ALTER TABLE [dbo].[tblCourse] WITH CHECK ADD FOREIGN KEY ([id_lesson_time]) 
REFERENCES [dbo].[tblLessonTime] ([id]);
GO
ALTER TABLE [dbo].[tblCourse] WITH CHECK ADD FOREIGN KEY ([id_category]) 
REFERENCES [dbo].[tblCategory] ([id]);
GO
ALTER TABLE [dbo].[tblCart]  WITH CHECK ADD FOREIGN KEY([id_course])
REFERENCES [dbo].[tblCourse] ([id])
GO
ALTER TABLE [dbo].[tblCart]  WITH CHECK ADD FOREIGN KEY([id_user])
REFERENCES [dbo].[tblUsers] ([id])
GO
ALTER TABLE [dbo].[tblComment]  WITH CHECK ADD FOREIGN KEY([comment_id])
REFERENCES [dbo].[tblComment] ([id])
GO
ALTER TABLE [dbo].[tblComment]  WITH CHECK ADD FOREIGN KEY([id_course])
REFERENCES [dbo].[tblCourse] ([id])
GO
ALTER TABLE [dbo].[tbldetailinvoices]  WITH CHECK ADD FOREIGN KEY([id_course])
REFERENCES [dbo].[tblCourse] ([id])
GO
ALTER TABLE [dbo].[tbldetailinvoices]  WITH CHECK ADD FOREIGN KEY([id_voice])
REFERENCES [dbo].[tblInvoices] ([id])
GO
ALTER TABLE [dbo].[tblInvoices]  WITH CHECK ADD FOREIGN KEY([id_user])
REFERENCES [dbo].[tblUsers] ([id])
GO
ALTER TABLE [dbo].[tblLesson]  WITH CHECK ADD FOREIGN KEY([id_course])
REFERENCES [dbo].[tblCourse] ([id])
GO
ALTER TABLE [dbo].[tblRating]  WITH CHECK ADD FOREIGN KEY([id_course])
REFERENCES [dbo].[tblCourse] ([id])
GO
ALTER TABLE [dbo].[tblAds]  WITH CHECK ADD CHECK  (([status]='inactive' OR [status]='active'))
GO
ALTER TABLE [dbo].[tblCategory]  WITH CHECK ADD CHECK  (([status]= 0 OR [status]= 1))
GO
ALTER TABLE [dbo].[tblComment]  WITH CHECK ADD CHECK  (([status]='inactive' OR [status]='active'))
GO
ALTER TABLE [dbo].[tblRating]  WITH CHECK ADD CHECK  (([numberStar]>=(0) AND [numberStar]<=(5)))
GO

INSERT INTO dbo.tblLessonTime ([id], [name])
VALUES 
('SP23', 'Spring Semester 2023'),
('SU23', 'Summer Semester 2023'),
('FA23', 'Fall Semester 2023'),
('SP24', 'Spring Semester 2024'),
('SU24', 'Summer Semester 2024'),
('FA24', 'Fall Semester 2024'),
('SP25', 'Spring Semester 2025'),
('SU25', 'Summer Semester 2025'),
('FA25', 'Fall Semester 2025');

INSERT INTO [dbo].[tblCategory] (name, description, status, createdDate, createdBy)
VALUES 
    (N'Kỳ 1', N'Nhập môn lập trình', 0, GETDATE(), 1),
    (N'Kỳ 2', N'Nhập môn hướng đối tượng', 0, GETDATE(), 1),
    (N'Kỳ 3', N'Cấu trúc dữ liệu và giải thuật', 0, GETDATE(), 1),
    (N'Kỳ 4', N'Phát triển ứng dụng Java Web', 0, GETDATE(), 1);

INSERT INTO dbo.tblCourse ([name], [rate], [price], [time_course], [description], [createdDate], [updatedDate], [createdBy], [updatedBy], [id_category], [type_course], [id_lesson_time], [total_lesson], [img])
VALUES 
('PRF192', 5, 400000, '10:00:00', N'Nhập môn lập trình', GETDATE(), NULL, 'admin', NULL, 1, 0, 'SP24', NULL, NULL),
('PRF192', 5, 400000, '10:00:00', N'Nhập môn lập trình', GETDATE(), NULL, 'admin', NULL, 1, 0, 'SU24', NULL, NULL),
(N'PRO192', 5, 400000, '11:00:00', N'Nhập môn hướng đối tượng', GETDATE(), NULL, 'admin', NULL, 2, 0, 'FA23', NULL, NULL),
(N'PRO192', 5, 400000, '11:00:00', N'Nhập môn hướng đối tượng', GETDATE(), NULL, 'admin', NULL, 2, 0, 'SU24', NULL, NULL), 
(N'CSD201', 5, 400000, '09:00:00', N'Cấu trúc dữ liệu và giải thuật', GETDATE(), NULL, 'admin', NULL, 3, 0, 'SU24', NULL, NULL), 
(N'CSD201', 5, 400000, '09:00:00', N'Cấu trúc dữ liệu và giải thuật', GETDATE(), NULL, 'admin', NULL, 3, 0, 'SP24', NULL, NULL),
(N'PRJ301', 4, 400000, '12:00:00', N'Phát triển ứng dụng Java Web', GETDATE(), NULL, 'admin', NULL, 4, 0, 'SU24', NULL, NULL),
(N'MAE101', 5, 100000, '10:00:00', N'Toán cho ngành kỹ thuật', GETDATE(), NULL, 'admin', NULL, 1, 0, 'SU23', NULL, NULL),
(N'MAE101', 5, 400000, '10:00:00', N'Toán cho ngành kỹ thuật', GETDATE(), NULL, 'admin', NULL, 1, 0, 'SU24', NULL, NULL),
(N'MAD101', 4, 400000, '11:00:00', N'Toán rời rạc', GETDATE(), NULL, 'admin', NULL, 2, 0, 'SU24', NULL, NULL), 
(N'MAS291', 5, 400000, '09:00:00', N'Xác suất thống kê', GETDATE(), NULL, 'admin', NULL, 4, 0, 'SU24', NULL, NULL), 
(N'DBI202', 5, 400000, '10:00:00', N'Các hệ cơ sở dữ liệu', GETDATE(), NULL, 'admin', NULL, 3, 0, 'SP24', NULL, NULL),
(N'WED201c', 4, 400000, '11:00:00', N'Thiết kế web', GETDATE(), NULL, 'admin', NULL, 3, 0, 'SP24', NULL, NULL), 
(N'JPD113', 4, 400000, '12:00:00', N'Tiếng Nhật sơ cấp 1', GETDATE(), NULL, 'admin', NULL, 3, 0, 'SP24', NULL, NULL),
(N'JPD123', 4, 400000, '12:00:00', N'Tiếng Nhật sơ cấp 2', GETDATE(), NULL, 'admin', NULL, 4, 0, 'SP25', NULL, NULL); 


INSERT INTO [dbo].[tblLesson] (namelesson, id_course, createdDate, createdBy, content, time_lesson)
VALUES
    (N'Buổi 1', 3, GETDATE(), 1, N'JAVA BASIC', '01:22:37'),
    (N'Buổi 2', 3, GETDATE(), 1, N'Scanner, Trôi lệnh và cách sử dụng Try-Catch', '01:13:49'),
    (N'Buổi 3', 3, GETDATE(), 1, N'NHẬP MÔN LẬP TRÌNH HƯỚNG ĐỐI TƯỢNG', '00:55:02'),
    (N'Buổi 4', 3, GETDATE(), 1, N'Nắm hết kiến thức ARRAY trong JAVA chỉ trong 20 phút', '00:22:32'),
    (N'Buổi 5', 3, GETDATE(), 1, N'Ôn tập mảng - Inherritance Part 1', '00:53:02'),
    (N'Buổi 6', 3, GETDATE(), 1, N'Inheritance - Khái niệm', '00:27:35'),
    (N'Buổi 7', 3, GETDATE(), 1, N'Giới Thiệu Abstracts Class', '00:49:18'),
    (N'Buổi 8', 3, GETDATE(), 1, N'String và Interface', '01:10:15'),
    (N'Buổi 9', 3, GETDATE(), 1, N'Nhận đối tượng từ File', '00:54:02'),
    (N'Buổi 10', 3, GETDATE(), 1, N'Tổng ôn trước thi PE', '00:53:25'),
    (N'Buổi 11', 3, GETDATE(), 1, N'PE Buổi 1: Thực Chiến PE#1', '02:22:01'),
    (N'Buổi 12', 3, GETDATE(), 1, N'PE Buổi 2: Thực Chiến PE#2', '01:07:57'),
    (N'Buổi 13', 3, GETDATE(), 1, N'PE Buổi 3: PE Hola/HCM #1', '00:38:47'),
    (N'Buổi 14', 3, GETDATE(), 1, N'PE Buổi 4: PE Hola/HCM#2', '01:39:49');

	UPDATE tblCourse
SET total_lesson = (
    SELECT COUNT(*)
    FROM tblLesson
    WHERE tblLesson.id_course = tblCourse.id
);
