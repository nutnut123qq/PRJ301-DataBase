
if DB_ID('PRJ') is not null
	DROP DATABASE PRJ;

create database PRJ;
GO
use PRJ;
GO

CREATE TABLE tblCategory (
    id bigint IDENTITY(1,1) PRIMARY KEY,
    name nvarchar(255),
    description nvarchar(MAX),
    status bit DEFAULT 1, -- Changed status to bit with default value 1 (active)
);
GO

CREATE TABLE tblLessonTime (
    id nvarchar(10) PRIMARY KEY,
    name nvarchar(100)
);

CREATE TABLE tblCourse (
    id bigint IDENTITY(1,1) PRIMARY KEY,
    name nvarchar(30) NOT NULL,
    rate int,
    price float,
    time_course nvarchar(30),
    description nvarchar(MAX),
    id_category bigint,
    type_course bit DEFAULT 1, -- Thuộc tính Loại khóa học: Zoom (1) or Record (0)
    id_lesson_time nvarchar(10), -- Cột id_lesson_time
    total_lessons int DEFAULT 0, -- Tổng số bài học mặc định là 0
    FOREIGN KEY (id_category) REFERENCES tblCategory(id),
    FOREIGN KEY (id_lesson_time) REFERENCES tblLessonTime(id)
);


CREATE TABLE tblUsers (
    id bigint IDENTITY(1,1) PRIMARY KEY,
    username nvarchar(30),
    email nvarchar(30),
    password nvarchar(30),
    role nvarchar(50) DEFAULT 'user' CHECK (role IN ('admin', 'user')),
    status bit DEFAULT 1 -- Changed status to bit with default value 1 (active)
);
GO

CREATE TABLE tblUserInfor (
    id bigint IDENTITY(1,1) PRIMARY KEY,
    phone nvarchar(30),
    address nvarchar(MAX),
    fullName nvarchar(30),
    birthDay date,
    sex bit DEFAULT '1' CHECK (sex IN ('1', '0')),
    avatar nvarchar(50),
    id_user bigint,
    FOREIGN KEY (id_user) REFERENCES tblUsers(id)
);
GO

CREATE TABLE tblInvoices (
    id bigint IDENTITY(1,1) PRIMARY KEY,
    purch_date datetime,
    id_user bigint,
    order_status bit,
    FOREIGN KEY (id_user) REFERENCES tblUsers(id)
);
GO

CREATE TABLE tbldetailinvoices (
    id bigint IDENTITY(1,1) PRIMARY KEY,
    id_voice bigint,
    id_course bigint,
    quantity_purch int,
    FOREIGN KEY (id_voice) REFERENCES tblInvoices(id),
    FOREIGN KEY (id_course) REFERENCES tblCourse(id)
);
GO

CREATE TABLE tblLesson (
    id bigint IDENTITY(1,1) PRIMARY KEY,
    namelesson nvarchar(30),
    id_course bigint,
    content nvarchar(MAX),
    time_lesson time,
    FOREIGN KEY (id_course) REFERENCES tblCourse(id)
);
GO


DROP TABLE IF EXISTS tblComment;
CREATE TABLE tblComment (
    id bigint IDENTITY(1,1) PRIMARY KEY,
    name nvarchar(30) NOT NULL,
    email nvarchar(30),
    comment_id bigint,
    status bit DEFAULT 1, -- Changed status to bit with default value 1 (active)
    quantity int,
    website nvarchar(500),
    message nvarchar(MAX),
    createdDate datetime,
    updatedDate datetime,
    id_course bigint,
    FOREIGN KEY (comment_id) REFERENCES tblComment(id),
    FOREIGN KEY (id_course) REFERENCES tblCourse(id)
);
GO

CREATE TABLE tblAds (
    id bigint IDENTITY(1,1) PRIMARY KEY,
    img nvarchar(MAX),
    description nvarchar(MAX),
    link nvarchar(MAX),
    position int,
    status bit DEFAULT 1, -- Changed status to bit with default value 1 (active)	
    createdDate datetime,
    updatedDate datetime,
    width float,
    height float
);
GO

CREATE TABLE tblRating (
    id bigint IDENTITY(1,1) PRIMARY KEY,
    comment nvarchar(MAX),
    website nvarchar(500),
    ratedBy bigint,
    ratedAt datetime,
    id_course bigint,
    numberStar TINYINT CHECK (numberStar BETWEEN 0 AND 5),
    FOREIGN KEY (id_course) REFERENCES tblCourse(id)
);
GO

CREATE TABLE tblAssignments (
    id bigint IDENTITY(1,1) PRIMARY KEY,
    id_course bigint,
    title nvarchar(100),
    description nvarchar(MAX),
    deadline datetime,
    fileURL nvarchar(MAX),
    FOREIGN KEY (id_course) REFERENCES tblCourse(id)
);
GO

CREATE TABLE tblCart (
    id bigint IDENTITY(1,1) PRIMARY KEY,
    id_user bigint,
    id_course bigint,
    addedAt datetime,
    FOREIGN KEY (id_course) REFERENCES tblCourse(id),
    FOREIGN KEY (id_user) REFERENCES tblUsers(id)
);
GO

CREATE TABLE tblMessages (
    id bigint IDENTITY(1,1) PRIMARY KEY,
    subject nvarchar(30),
    email nvarchar(MAX),
    description nvarchar(MAX),
    message nvarchar(MAX)
);
GO

CREATE TABLE tblHistory (
    id bigint IDENTITY(1,1) PRIMARY KEY,
    ipAddress nvarchar(50),
    updatedDate datetime,
    type nvarchar(50),
    mappingId int
);
GO

CREATE TABLE tblWebsetting (
    id bigint IDENTITY(1,1) PRIMARY KEY,
    content nvarchar(MAX),
    status bit DEFAULT 1, -- 1: active, 0: inactive
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

INSERT INTO tblCourse (name, rate, price, time_course, description, id_category, type_course, id_lesson_time)
VALUES 
	(N'PRF192', 5, 400000, '10:00:00', N'Nhập môn lập trình', 1, 0, 'SP24'),
    (N'PRF192', 5, 400000, '10:00:00', N'Nhập môn lập trình', 1, 0, 'SU24'),
	(N'PRO192', 5, 400000, '11:00:00', N'Nhập môn hướng đối tượng', 2, 0, 'SP24'),
    (N'PRO192', 5, 400000, '11:00:00', N'Nhập môn hướng đối tượng', 2, 0, 'SU24'), 
    (N'CSD201', 5, 400000, '09:00:00', N'Cấu trúc dữ liệu và giải thuật', 3, 0, 'SU24'), 
	(N'CSD201', 5, 400000, '09:00:00', N'Cấu trúc dữ liệu và giải thuật', 3, 0, 'SP24'),
    (N'PRJ301', 4, 400000, '12:00:00', N'Phát triển ứng dụng Java Web', 4, 0, 'SU24'),

	(N'MAE101', 5, 100000, '10:00:00', N'Toán cho ngành kỹ thuật', 1, 0, 'SU23'),
    (N'MAE101', 5, 400000, '10:00:00', N'Toán cho ngành kỹ thuật', 1, 0, 'SU24'),
    (N'MAD101', 4, 400000, '11:00:00', N'Toán rời rạc', 2, 0, 'SU24'), 
    (N'MAS291', 5, 400000, '09:00:00', N'Xác suất thống kê', 4, 0, 'SU24'), 

    (N'DBI202', 5, 400000, '10:00:00', N'Các hệ cơ sở dữ liệu', 3, 0, 'SP24'),
    (N'WED201c', 4, 400000, '11:00:00', N'Thiết kế web', 3, 0, 'SP24'), 

    (N'JPD113', 4, 400000, '12:00:00', N'Tiếng Nhật sơ cấp 1', 3, 0, 'SP24'),
    (N'JPD123', 4, 400000, '12:00:00', N'Tiếng Nhật sơ cấp 2', 4, 0, 'SP25'); 
GO

DECLARE @year INT = 23; 

WHILE @year <= 26  
BEGIN
    INSERT INTO tblLessonTime (id, name)
    VALUES 
        (CONCAT('SP', @year), CONCAT('Spring Semester ', 2000 + @year)),
        (CONCAT('SU', @year), CONCAT('Summer Semester ', 2000 + @year)),
        (CONCAT('FA', @year), CONCAT('Fall Semester ', 2000 + @year));

    SET @year = @year + 1; 
END;

-- Cập nhật total_lessons từ tblLesson
UPDATE tblCourse
SET total_lessons = (SELECT COUNT(*) FROM tblLesson WHERE tblLesson.id_course = tblCourse.id);
