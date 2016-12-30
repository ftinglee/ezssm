# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.30)
# Database: ezssm
# Generation Time: 2016-11-23 10:19:52 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table sys_menu
# ------------------------------------------------------------

CREATE TABLE `sys_menu` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'UUID_Base64 ID',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
  `parent_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  `sort` int(10) DEFAULT '0' COMMENT '排序',
  `icon` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '图标class',
  `href` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '链接',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `useable_flag` char(1) COLLATE utf8_bin DEFAULT '1' COMMENT '启用标记',
  `del_flag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜单表';

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;

INSERT INTO `sys_menu` (`id`, `name`, `parent_id`, `sort`, `icon`, `href`, `remarks`, `useable_flag`, `del_flag`)
VALUES
  (X'4269494162523673544C53304468534862565A7A3667',X'E8A792E889B2E7AEA1E79086',X'685A4D724B344A635479696C5256516B6F7248476341',NULL,X'66612D736974656D6170',X'2F726F6C652F70616765',NULL,NULL,X'30'),
  (X'685A4D724B344A635479696C5256516B6F7248476341',X'E7B3BBE7BB9FE7AEA1E79086',X'30',NULL,X'',NULL,NULL,NULL,X'30'),
  (X'7637733264306F6E53577930666A6772413842313651',X'E794A8E688B7E7AEA1E79086',X'685A4D724B344A635479696C5256516B6F7248476341',NULL,X'66612D75736572',X'2F757365722F70616765',NULL,NULL,X'30');

/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_permission
# ------------------------------------------------------------

CREATE TABLE `sys_permission` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'UUID_Base64 ID',
  `code` int(10) NOT NULL COMMENT '权限代码',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '权限名称',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='权限表';



# Dump of table sys_role
# ------------------------------------------------------------

CREATE TABLE `sys_role` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'UUID_Base64 ID',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '角色名称',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色表';

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;

INSERT INTO `sys_role` (`id`, `name`, `remarks`, `del_flag`)
VALUES
  (X'77536277396B5953526D366639644279704A4D697841',X'E7B3BBE7BB9FE7AEA1E79086E59198',NULL,X'30');

/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_role_menu
# ------------------------------------------------------------

CREATE TABLE `sys_role_menu` (
  `role_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '角色编号',
  `menu_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色-菜单';

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;

INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES
  (X'77536277396B5953526D366639644279704A4D697841',X'4269494162523673544C53304468534862565A7A3667'),
  (X'77536277396B5953526D366639644279704A4D697841',X'685A4D724B344A635479696C5256516B6F7248476341'),
  (X'77536277396B5953526D366639644279704A4D697841',X'7637733264306F6E53577930666A6772413842313651');

/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_role_permission
# ------------------------------------------------------------

CREATE TABLE `sys_role_permission` (
  `role_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '角色编号',
  `permission_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '权限编号',
  PRIMARY KEY (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色-权限';



# Dump of table sys_user
# ------------------------------------------------------------

CREATE TABLE `sys_user` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'UUID_Base64 ID',
  `username` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `password` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '密码',
  `salt` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '盐',
  `name` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '姓名',
  `email` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `avatar` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '头像路径',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `login_flag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '登录标记',
  `del_flag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户表';

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;

INSERT INTO `sys_user` (`id`, `username`, `password`, `salt`, `name`, `email`, `avatar`,`remarks`, `login_flag`, `del_flag`)
VALUES
  (X'674A535757426C33536E2D5F4B43466A6F5139307441',X'6674696E676C6565',X'64393631333563393835633063333432386165336232663434613865333732663066383136646434643766383232376664383765353734376263373334386263',X'3878464F334F566D51444D',X'4C6565',X'3933393238394071712E636F6D',NULL,NULL,X'30',X'30');

/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_user_role
# ------------------------------------------------------------

CREATE TABLE `sys_user_role` (
  `user_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '用户编号',
  `role_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户-角色';

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;

INSERT INTO `sys_user_role` (`user_id`, `role_id`)
VALUES
  (X'674A535757426C33536E2D5F4B43466A6F5139307441',X'77536277396B5953526D366639644279704A4D697841');

/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
