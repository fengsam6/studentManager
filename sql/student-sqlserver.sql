USE [student]
GO
/****** Object:  Table [dbo].[tb_class]    Script Date: 2018/7/11 22:29:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_class](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[class_name] [varchar](30) NOT NULL,
	[comment] [varchar](40) NOT NULL,
	[create_time] [varchar](30) NULL,
 CONSTRAINT [PK_tb_class] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_school]    Script Date: 2018/7/11 22:29:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_school](
	[school_id] [int] IDENTITY(1,1) NOT NULL,
	[school_name] [varchar](40) NOT NULL,
	[address] [varchar](80) NOT NULL,
 CONSTRAINT [PK_tb_school] PRIMARY KEY CLUSTERED 
(
	[school_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_student]    Script Date: 2018/7/11 22:29:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[student_name] [varchar](30) NOT NULL,
	[student_num] [varchar](30) NOT NULL,
	[gender] [int] NULL,
	[enter_school_time] [varchar](30) NULL,
	[major] [varchar](30) NOT NULL,
	[email] [varchar](30) NULL,
	[phone] [varchar](30) NULL,
	[aver_path] [varchar](30) NULL,
	[class_id] [int] NOT NULL,
	[school_id] [int] NOT NULL,
 CONSTRAINT [PK_student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_studentInfo]    Script Date: 2018/7/11 22:29:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_studentInfo]
AS
SELECT   s.Id, s.student_name, s.student_num, s.gender, s.enter_school_time, s.major, s.email, s.phone, s.aver_path, s.class_id, 
                s.school_id, c.comment, c.create_time, c.class_name, dbo.tb_school.school_name
FROM      dbo.tb_student AS s INNER JOIN
                dbo.tb_class AS c ON s.class_id = c.Id INNER JOIN
                dbo.tb_school ON s.school_id = dbo.tb_school.school_id
GO
/****** Object:  Table [dbo].[tb_role]    Script Date: 2018/7/11 22:29:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_user]    Script Date: 2018/7/11 22:29:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_user](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[num] [varchar](20) NULL,
	[password] [varchar](20) NOT NULL,
	[gender] [int] NULL,
	[role_id] [int] NULL,
	[create_time] [varchar](35) NULL,
	[last_login_time] [varchar](35) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_userInfo]    Script Date: 2018/7/11 22:29:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[view_userInfo] as select u.*,r.Id as roleId, r.role_name from tb_user u inner join tb_role r on u.role_id = r.Id
GO
/****** Object:  Table [dbo].[tb_systemLog]    Script Date: 2018/7/11 22:29:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_systemLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](25) NOT NULL,
	[create_date] [varchar](45) NOT NULL,
	[operation] [varchar](45) NOT NULL,
	[method] [varchar](145) NOT NULL,
	[params] [varchar](245) NOT NULL,
	[time] [varchar](45) NOT NULL,
	[ip] [varchar](45) NOT NULL,
 CONSTRAINT [PK_systemLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tb_class] ON 

INSERT [dbo].[tb_class] ([Id], [class_name], [comment], [create_time]) VALUES (1, N'1501', N'优秀', N'')
INSERT [dbo].[tb_class] ([Id], [class_name], [comment], [create_time]) VALUES (3, N'1502', N'优秀', NULL)
INSERT [dbo].[tb_class] ([Id], [class_name], [comment], [create_time]) VALUES (4, N'1503', N'优秀', NULL)
INSERT [dbo].[tb_class] ([Id], [class_name], [comment], [create_time]) VALUES (7, N'1504', N'不错', NULL)
INSERT [dbo].[tb_class] ([Id], [class_name], [comment], [create_time]) VALUES (8, N'1601', N'不错', NULL)
INSERT [dbo].[tb_class] ([Id], [class_name], [comment], [create_time]) VALUES (13, N'1602', N'test', N'2018年07月 01:12:14')
INSERT [dbo].[tb_class] ([Id], [class_name], [comment], [create_time]) VALUES (14, N'6455', N'36595+5', N'2018年07月 04:33:45')
SET IDENTITY_INSERT [dbo].[tb_class] OFF
SET IDENTITY_INSERT [dbo].[tb_role] ON 

INSERT [dbo].[tb_role] ([Id], [role_name]) VALUES (1, N'普通用户')
INSERT [dbo].[tb_role] ([Id], [role_name]) VALUES (2, N'教学秘书')
INSERT [dbo].[tb_role] ([Id], [role_name]) VALUES (3, N'管理员')
INSERT [dbo].[tb_role] ([Id], [role_name]) VALUES (7, N'超级管理员')
INSERT [dbo].[tb_role] ([Id], [role_name]) VALUES (15, N'46456')
INSERT [dbo].[tb_role] ([Id], [role_name]) VALUES (1009, N'+56+56+')
SET IDENTITY_INSERT [dbo].[tb_role] OFF
SET IDENTITY_INSERT [dbo].[tb_school] ON 

INSERT [dbo].[tb_school] ([school_id], [school_name], [address]) VALUES (1, N'武汉大学211', N'武汉        ')
INSERT [dbo].[tb_school] ([school_id], [school_name], [address]) VALUES (2, N'华中科技大学', N'武汉        ')
INSERT [dbo].[tb_school] ([school_id], [school_name], [address]) VALUES (3, N'湖北师范', N'黄石        ')
INSERT [dbo].[tb_school] ([school_id], [school_name], [address]) VALUES (4, N'武汉理工2', N'武汉        ')
INSERT [dbo].[tb_school] ([school_id], [school_name], [address]) VALUES (5, N'2123', N'312312    ')
INSERT [dbo].[tb_school] ([school_id], [school_name], [address]) VALUES (6, N'112', N'2121      ')
INSERT [dbo].[tb_school] ([school_id], [school_name], [address]) VALUES (7, N'1122', N'12212     ')
INSERT [dbo].[tb_school] ([school_id], [school_name], [address]) VALUES (18, N'3123', N'123123    ')
INSERT [dbo].[tb_school] ([school_id], [school_name], [address]) VALUES (21, N'21312', N'1232      ')
INSERT [dbo].[tb_school] ([school_id], [school_name], [address]) VALUES (22, N'321312', N'3213123   ')
INSERT [dbo].[tb_school] ([school_id], [school_name], [address]) VALUES (23, N'445', N'45445     ')
INSERT [dbo].[tb_school] ([school_id], [school_name], [address]) VALUES (24, N'445', N'45445     ')
INSERT [dbo].[tb_school] ([school_id], [school_name], [address]) VALUES (25, N'21329999', N'31233     ')
INSERT [dbo].[tb_school] ([school_id], [school_name], [address]) VALUES (29, N'3123', N'3213')
INSERT [dbo].[tb_school] ([school_id], [school_name], [address]) VALUES (30, N'3213', N'123123')
INSERT [dbo].[tb_school] ([school_id], [school_name], [address]) VALUES (31, N'1232', N'213')
INSERT [dbo].[tb_school] ([school_id], [school_name], [address]) VALUES (32, N'test', N'test')
INSERT [dbo].[tb_school] ([school_id], [school_name], [address]) VALUES (33, N'4486', N'6644')
INSERT [dbo].[tb_school] ([school_id], [school_name], [address]) VALUES (1028, N'56456', N'6456456')
SET IDENTITY_INSERT [dbo].[tb_school] OFF
SET IDENTITY_INSERT [dbo].[tb_student] ON 

INSERT [dbo].[tb_student] ([Id], [student_name], [student_num], [gender], [enter_school_time], [major], [email], [phone], [aver_path], [class_id], [school_id]) VALUES (2, N'sam', N'8689686456', 0, N'2018-07-06 23:27:24', N'MajorTest', N'1501', N'4545645654444', NULL, 1, 1)
INSERT [dbo].[tb_student] ([Id], [student_name], [student_num], [gender], [enter_school_time], [major], [email], [phone], [aver_path], [class_id], [school_id]) VALUES (3, N'lisi', N'12', 1, N'', N'MajorTest', N'', N'45666', NULL, 1, 1)
INSERT [dbo].[tb_student] ([Id], [student_name], [student_num], [gender], [enter_school_time], [major], [email], [phone], [aver_path], [class_id], [school_id]) VALUES (4, N'张三', N'54645', 0, N'2018-07-10', N'MajorTest', N'1502', N'', NULL, 1, 1)
INSERT [dbo].[tb_student] ([Id], [student_name], [student_num], [gender], [enter_school_time], [major], [email], [phone], [aver_path], [class_id], [school_id]) VALUES (5, N'王二', N'14', 1, N'', N'MajorTest2', N'', N'4463456', NULL, 1, 1)
INSERT [dbo].[tb_student] ([Id], [student_name], [student_num], [gender], [enter_school_time], [major], [email], [phone], [aver_path], [class_id], [school_id]) VALUES (6, N'test', N'15', -1, N'', N'554', N'5456', N'54', NULL, 3, 3)
INSERT [dbo].[tb_student] ([Id], [student_name], [student_num], [gender], [enter_school_time], [major], [email], [phone], [aver_path], [class_id], [school_id]) VALUES (8, N'test3', N'17', NULL, N'', N'1213', N'1233', N'3123', NULL, 3, 3)
INSERT [dbo].[tb_student] ([Id], [student_name], [student_num], [gender], [enter_school_time], [major], [email], [phone], [aver_path], [class_id], [school_id]) VALUES (9, N'4563', N'465', NULL, N'', N'6456', N'', N'6456', NULL, 3, 2)
INSERT [dbo].[tb_student] ([Id], [student_name], [student_num], [gender], [enter_school_time], [major], [email], [phone], [aver_path], [class_id], [school_id]) VALUES (14, N'test14', N'4565', NULL, N'2018-07-16 00:00:00', N'4564', N'', N'11111', NULL, 4, 1)
INSERT [dbo].[tb_student] ([Id], [student_name], [student_num], [gender], [enter_school_time], [major], [email], [phone], [aver_path], [class_id], [school_id]) VALUES (16, N'test4', N'465645', 1, N'2018-07-24 00:00:00', N'64564', N'', N'65464', NULL, 8, 7)
INSERT [dbo].[tb_student] ([Id], [student_name], [student_num], [gender], [enter_school_time], [major], [email], [phone], [aver_path], [class_id], [school_id]) VALUES (17, N'11', N'11', 0, N'2018-07-30 00:00:00', N'11', N'11', N'11', NULL, 1, 4)
INSERT [dbo].[tb_student] ([Id], [student_name], [student_num], [gender], [enter_school_time], [major], [email], [phone], [aver_path], [class_id], [school_id]) VALUES (18, N'1323', N'1323', 0, N'2018-07-09 00:00:00', N'3213', N'', N'3123', NULL, 1, 1)
INSERT [dbo].[tb_student] ([Id], [student_name], [student_num], [gender], [enter_school_time], [major], [email], [phone], [aver_path], [class_id], [school_id]) VALUES (19, N'356', N'64645', 1, N'2018-07-09 00:00:00', N'4648', N'48', N'4545645654444', NULL, 4, 3)
INSERT [dbo].[tb_student] ([Id], [student_name], [student_num], [gender], [enter_school_time], [major], [email], [phone], [aver_path], [class_id], [school_id]) VALUES (1015, N'6456', N'645646', 0, N'2018-07-10 14:05:07', N'645645', N'6456456', N'645645', NULL, 3, 5)
INSERT [dbo].[tb_student] ([Id], [student_name], [student_num], [gender], [enter_school_time], [major], [email], [phone], [aver_path], [class_id], [school_id]) VALUES (1016, N'6456', N'645646', 0, N'2018-07-10 14:05:07', N'645645', N'6456456', N'645645', NULL, 3, 5)
SET IDENTITY_INSERT [dbo].[tb_student] OFF
SET IDENTITY_INSERT [dbo].[tb_systemLog] ON 

INSERT [dbo].[tb_systemLog] ([Id], [username], [create_date], [operation], [method], [params], [time], [ip]) VALUES (2, N'admin', N'2018年07月10日 01:22:02', N'用户登录', N'cn.feng.controller.UserController.login()', N'{"username":"admin","password":"123456"}', N'38', N'127.0.0.1')
INSERT [dbo].[tb_systemLog] ([Id], [username], [create_date], [operation], [method], [params], [time], [ip]) VALUES (3, N'admin', N'2018年07月10日 01:22:22', N'添加角色', N'cn.feng.controller.RoleController.add()', N'{"id":1009,"roleName":"+56+56+"}', N'4', N'127.0.0.1')
INSERT [dbo].[tb_systemLog] ([Id], [username], [create_date], [operation], [method], [params], [time], [ip]) VALUES (4, N'admin', N'2018年07月10日 01:36:25', N'用户登录', N'cn.feng.controller.UserController.login()', N'{"username":"admin","password":"123456"}', N'288', N'127.0.0.1')
INSERT [dbo].[tb_systemLog] ([Id], [username], [create_date], [operation], [method], [params], [time], [ip]) VALUES (5, N'admin', N'2018年07月10日 01:49:28', N'用户登录', N'cn.feng.controller.UserController.login()', N'{"username":"admin","password":"123456"}', N'300', N'127.0.0.1')
INSERT [dbo].[tb_systemLog] ([Id], [username], [create_date], [operation], [method], [params], [time], [ip]) VALUES (6, N'admin', N'2018年07月10日 01:58:24', N'用户登录', N'cn.feng.controller.UserController.login()', N'{"username":"admin","password":"123456"}', N'36', N'127.0.0.1')
INSERT [dbo].[tb_systemLog] ([Id], [username], [create_date], [operation], [method], [params], [time], [ip]) VALUES (7, N'admin', N'2018年07月10日 02:02:16', N'添加用户', N'cn.feng.controller.UserController.add()', N'{"id":1021,"username":"5645","password":"++54+","roleId":1,"createTime":"2018年07月10日 02:02:16"}', N'8', N'127.0.0.1')
INSERT [dbo].[tb_systemLog] ([Id], [username], [create_date], [operation], [method], [params], [time], [ip]) VALUES (8, N'admin', N'2018年07月10日 02:05:32', N'添加学生', N'cn.feng.controller.StudentController.add()', N'{"id":1016,"studentName":"6456","studentNum":"645646","gender":0,"major":"645645","email":"6456456","enterSchoolTime":"2018-07-10 14:05:07","phone":"645645","classId":3,"schoolId":5}', N'28', N'127.0.0.1')
SET IDENTITY_INSERT [dbo].[tb_systemLog] OFF
SET IDENTITY_INSERT [dbo].[tb_user] ON 

INSERT [dbo].[tb_user] ([Id], [username], [num], [password], [gender], [role_id], [create_time], [last_login_time]) VALUES (1, N'test', NULL, N'123456', NULL, 1, N'Fri Jun 15 20:56:44 CST 2018', NULL)
INSERT [dbo].[tb_user] ([Id], [username], [num], [password], [gender], [role_id], [create_time], [last_login_time]) VALUES (2, N'admin', NULL, N'123456', NULL, 3, N'20180615 09:04:21', N'2018年07月 01:58:24')
INSERT [dbo].[tb_user] ([Id], [username], [num], [password], [gender], [role_id], [create_time], [last_login_time]) VALUES (3, N'sam', NULL, N'123456', NULL, 1, N'2018-06-15 09:04:47', N'2018年07月 11:24:21')
INSERT [dbo].[tb_user] ([Id], [username], [num], [password], [gender], [role_id], [create_time], [last_login_time]) VALUES (4, N'lisi', NULL, N'123456', NULL, 1, N'2018-06-15 09:31:13', NULL)
INSERT [dbo].[tb_user] ([Id], [username], [num], [password], [gender], [role_id], [create_time], [last_login_time]) VALUES (6, N'46', NULL, N'6456', NULL, NULL, N'2018年07月 02:38:25', NULL)
INSERT [dbo].[tb_user] ([Id], [username], [num], [password], [gender], [role_id], [create_time], [last_login_time]) VALUES (7, N'23', NULL, N'232', NULL, NULL, N'2018年07月 03:54:40', NULL)
INSERT [dbo].[tb_user] ([Id], [username], [num], [password], [gender], [role_id], [create_time], [last_login_time]) VALUES (9, N'21321311', NULL, N'1212', NULL, NULL, N'2018年07月 04:11:56', NULL)
INSERT [dbo].[tb_user] ([Id], [username], [num], [password], [gender], [role_id], [create_time], [last_login_time]) VALUES (10, N'888', NULL, N'87878', NULL, 1, N'2018年07月 04:13:21', NULL)
INSERT [dbo].[tb_user] ([Id], [username], [num], [password], [gender], [role_id], [create_time], [last_login_time]) VALUES (11, N'3123', NULL, N'32131', NULL, 1, N'2018年07月 08:02:34', NULL)
INSERT [dbo].[tb_user] ([Id], [username], [num], [password], [gender], [role_id], [create_time], [last_login_time]) VALUES (12, N'99999', NULL, N'645654', NULL, 2, N'2018年07月 08:59:59', NULL)
INSERT [dbo].[tb_user] ([Id], [username], [num], [password], [gender], [role_id], [create_time], [last_login_time]) VALUES (17, N'test6', NULL, N'test', NULL, 1, N'2018年07月 01:13:01', NULL)
INSERT [dbo].[tb_user] ([Id], [username], [num], [password], [gender], [role_id], [create_time], [last_login_time]) VALUES (18, N'464', NULL, N'45645', NULL, 1, N'2018年07月 03:10:18', NULL)
INSERT [dbo].[tb_user] ([Id], [username], [num], [password], [gender], [role_id], [create_time], [last_login_time]) VALUES (1016, N'54646', NULL, N'64564', NULL, 1, N'2018年07月 06:31:30', NULL)
INSERT [dbo].[tb_user] ([Id], [username], [num], [password], [gender], [role_id], [create_time], [last_login_time]) VALUES (1017, N'+87+78', NULL, N'988', NULL, 1, N'2018年07月 06:31:38', NULL)
INSERT [dbo].[tb_user] ([Id], [username], [num], [password], [gender], [role_id], [create_time], [last_login_time]) VALUES (1018, N'63456', NULL, N'63456', NULL, 1, N'2018年07月10日 01:59:06', NULL)
INSERT [dbo].[tb_user] ([Id], [username], [num], [password], [gender], [role_id], [create_time], [last_login_time]) VALUES (1019, N'6546', NULL, N'6456456', NULL, 1, N'2018年07月10日 02:00:47', NULL)
INSERT [dbo].[tb_user] ([Id], [username], [num], [password], [gender], [role_id], [create_time], [last_login_time]) VALUES (1020, N'456', NULL, N'6546', NULL, 1, N'2018年07月10日 02:01:06', NULL)
INSERT [dbo].[tb_user] ([Id], [username], [num], [password], [gender], [role_id], [create_time], [last_login_time]) VALUES (1021, N'5645', NULL, N'++54+', NULL, 1, N'2018年07月10日 02:02:16', NULL)
SET IDENTITY_INSERT [dbo].[tb_user] OFF
ALTER TABLE [dbo].[tb_student]  WITH CHECK ADD  CONSTRAINT [FK_tb_student_tb_class] FOREIGN KEY([class_id])
REFERENCES [dbo].[tb_class] ([Id])
GO
ALTER TABLE [dbo].[tb_student] CHECK CONSTRAINT [FK_tb_student_tb_class]
GO
ALTER TABLE [dbo].[tb_student]  WITH CHECK ADD  CONSTRAINT [FK_tb_student_tb_school] FOREIGN KEY([school_id])
REFERENCES [dbo].[tb_school] ([school_id])
GO
ALTER TABLE [dbo].[tb_student] CHECK CONSTRAINT [FK_tb_student_tb_school]
GO
ALTER TABLE [dbo].[tb_user]  WITH CHECK ADD  CONSTRAINT [FK_tb_user_tb_role] FOREIGN KEY([role_id])
REFERENCES [dbo].[tb_role] ([Id])
GO
ALTER TABLE [dbo].[tb_user] CHECK CONSTRAINT [FK_tb_user_tb_role]
GO
/****** Object:  StoredProcedure [dbo].[GeStudentInfo]    Script Date: 2018/7/11 22:29:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GeStudentInfo] 
AS
begin 
 select * from view_studentInfo
end;
GO
/****** Object:  StoredProcedure [dbo].[GeStudentInfoByClassName]    Script Date: 2018/7/11 22:29:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GeStudentInfoByClassName] 
@className varchar
AS
begin 
 select * from view_studentInfo where class_name = @className
end;
GO
/****** Object:  StoredProcedure [dbo].[GetUserInfo]    Script Date: 2018/7/11 22:29:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetUserInfo] as
begin 
    select * from view_userInfo; 
end;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[27] 4[28] 2[30] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "s"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 230
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 268
               Bottom = 127
               Right = 423
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_school"
            Begin Extent = 
               Top = 6
               Left = 461
               Bottom = 127
               Right = 625
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1770
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_studentInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_studentInfo'
GO
