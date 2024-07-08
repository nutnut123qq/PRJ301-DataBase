
if DB_ID('PRJ') is not null
	DROP DATABASE PRJ;

create database PRJ;
GO
use PRJ;
GO

CREATE TABLE tblCourse(
	id bigint IDENTITY(1,1) PRIMARY KEY,
	name nvarchar(30) NOT NULL,
	rate int,
	price float,
	time_course datetime,
	description nvarchar(MAX), 
	id_category bigint,
	FOREIGN KEY (id_category) REFERENCES tblCategory(id)
);
GO


create table tblUsers(
	id bigint IDENTITY(1,1) primary key,
	username nvarchar(30),
	email nvarchar(30),
	password nvarchar(30),
	role nvarchar(50) DEFAULT 'user' CHECK (role IN ('admin', 'user')),
	status nvarchar(50) DEFAULT 'active' CHECK (status IN ('active', 'inactive')),
	createdDate datetime,
	updatedDate datetime,
	updatedBy nvarchar(30),
	createdBy nvarchar(30)
);
GO

create table tblUserInfor(
	id bigint IDENTITY(1,1) primary key,
	phone nvarchar(30),
	address nvarchar(MAX),
	fullName nvarchar(30),
	birthDay date,
	sex bit DEFAULT '1' CHECK (sex IN ('1', '0')),
	avatar nvarchar(50),
	id_user bigint,
	createdDate datetime,
	updatedDate datetime,
	updatedBy bigint,
	createdBy bigint,
	FOREIGN KEY (id_user) REFERENCES tblUsers(id)
);
GO

create table tblInvoices(
	id bigint IDENTITY(1,1) primary key,
	purch_date datetime,
	id_user bigint,
	order_status bit,
	FOREIGN KEY (id_user) REFERENCES tblUsers(id)
);
GO

create table tbldetailinvoices(
	id bigint IDENTITY(1,1) primary key,
	id_voice bigint,
	id_course bigint,
	quantity_purch int,
	FOREIGN KEY (id_voice) REFERENCES tblInvoices(id),
	FOREIGN KEY (id_course) REFERENCES tblCourse(id)
);
GO

create table tblLesson(
	id bigint IDENTITY(1,1) primary key,
	namelesson nvarchar(30),
	id_course bigint, 
	createdDate datetime,
	updatedDate datetime,
	createdBy bigint,
	updatedBy bigint,
	content nvarchar(MAX),
	lesson_id bigint,
	time_lesson time, 
	FOREIGN KEY (lesson_id) REFERENCES tblLesson(id),
	FOREIGN KEY (id_course) REFERENCES tblCourse(id)
);
GO

DROP TABLE IF EXISTS tblComment;
create table tblComment(
	id bigint IDENTITY(1,1) primary key,
	name nvarchar(30) not null,
	email nvarchar(30), 
	comment_id bigint,
	status nvarchar(50) DEFAULT 'active' CHECK (status IN ('active', 'inactive')),
	quantity int,
	website nvarchar(500),
	message nvarchar(MAX),
	createdDate datetime,
	updatedDate datetime,
	createdBy bigint,
	updatedBy bigint,
	id_course bigint,
	FOREIGN KEY (comment_id) REFERENCES tblComment(id),
	FOREIGN KEY (id_course) REFERENCES tblCourse(id)
);
GO

create table tblAds(
	id bigint IDENTITY(1,1) primary key,
	img nvarchar(MAX),
	description nvarchar(MAX),
	link nvarchar(MAX),
	position int,
	status nvarchar(50) DEFAULT 'active' CHECK (status IN ('active', 'inactive')),
	createdDate datetime,
	updatedDate datetime,
	createdBy bigint,
	updateBy bigint,
	width float,
	height float
);
GO

create table tblRating(
	id bigint IDENTITY(1,1) primary key,
	comment nvarchar(MAX),
	website  nvarchar(500),
	updatedBy bigint,
	updatedDate datetime,
	ratedBy bigint,
	ratedAt datetime,
	id_course bigint,
	numberStar TINYINT CHECK (numberStar BETWEEN 0 AND 5),
	FOREIGN KEY (id_course) REFERENCES tblCourse(id)
);
GO

CREATE TABLE tblCategory (
	id bigint IDENTITY(1,1) PRIMARY KEY,
	name nvarchar(255),
	description nvarchar(MAX),
	status bit DEFAULT 1 -- Changed status to bit with default value 1 (active)
);
GO

create table tblAssignments(
	id bigint IDENTITY(1,1) primary key,
	id_course bigint,
	title nvarchar(100),
	description nvarchar(MAX),
	deadline datetime,
	fileURL nvarchar(MAX),
	updatedBy bigint,
	updatedDate datetime,
	createdDate datetime,
	createdBy bigint,
	FOREIGN KEY (id_course) REFERENCES tblCourse(id)
);
GO

create table tblCart(
	id bigint IDENTITY(1,1) primary key,
	id_user bigint,
	id_course  bigint,
	addedAt datetime, 
	updatedBy bigint,
	updatedDate datetime,
	createdDate datetime,
	createdBy bigint,
	FOREIGN KEY (id_course) REFERENCES tblCourse(id),
	FOREIGN KEY (id_user) REFERENCES tblUsers(id)
);
GO

create table tblMessages(
	id bigint IDENTITY(1,1) primary key,
	subject nvarchar(30),
	email  nvarchar(MAX),
	description nvarchar(MAX),
	updatedBy bigint,
	updatedDate datetime,
	createdDate datetime,
	createdBy bigint,
	message nvarchar(MAX)
);
GO

create table tblHistory(
	id bigint IDENTITY(1,1) primary key,
	ipAddress nvarchar(50),
	updatedDate datetime,
	createdDate datetime,
	type nvarchar(50),
	mappingId int
);
GO

create table tblWebsetting(
	id bigint IDENTITY(1,1) primary key,
	content nvarchar(MAX),
	updatedBy bigint,
	updatedDate datetime,
	createdDate datetime,
	createdBy bigint,
	status nvarchar(50) DEFAULT 'active' CHECK (status IN ('active', 'inactive')),
	type nvarchar(50)
);
GO

INSERT INTO tblCategory (name, description, status)
VALUES 
    (N'Kỳ 1', N'Nhập môn lập trình', 1),
    (N'Kỳ 2', N'Nhập môn hướng đối tượng', 1),
    (N'Kỳ 3', N'Cấu trúc dữ liệu và giải thuật', 1),
    (N'Kỳ 4', N'Phát triển ứng dụng Java Web', 1);
GO

INSERT INTO tblCourse (name, rate, price, time_course, description, id_category)
VALUES 
    (N'PRF192', 5, 400000, '2024-07-08 10:00:00', N'Nhập môn lập trình', 1),
    (N'PRO192', 5, 400000, '2024-07-08 11:00:00', N'Nhập môn hướng đối tượng', 2), 
    (N'CSD201', 5, 400000, '2024-07-08 09:00:00', N'Cấu trúc dữ liệu và giải thuật', 3), 
    (N'PRJ301', 4, 400000, '2024-07-08 12:00:00', N'Phát triển ứng dụng Java Web', 4),

    (N'MAE101', 5, 400000, '2024-07-08 10:00:00', N'Toán cho ngành kỹ thuật', 1),
    (N'MAD101', 4, 400000, '2024-07-08 11:00:00', N'Toán rời rạc', 2), 
    (N'MAS291', 5, 400000, '2024-07-08 09:00:00', N'Xác suất thống kê', 4), 

	(N'DBI202', 5, 400000, '2024-07-08 10:00:00', N'Các hệ cơ sở dữ liệu', 3),
    (N'WED201c', 4, 400000, '2024-07-08 11:00:00', N'Thiết kế web', 3), 

    (N'JPD113', 4, 400000, '2024-07-08 12:00:00', N'Tiếng Nhật sơ cấp 1', 3),
	(N'JPD123', 4, 400000, '2024-07-08 12:00:00', N'Tiếng Nhật sơ cấp 2', 4); 
GO

