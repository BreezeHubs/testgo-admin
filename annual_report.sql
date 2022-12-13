/*
 Navicat Premium Data Transfer

 Source Server         : 公司IPXE-阿里云
 Source Server Type    : MySQL
 Source Server Version : 50736 (5.7.36)
 Source Host           : 8.134.86.242:2237
 Source Schema         : annual_report

 Target Server Type    : MySQL
 Target Server Version : 50736 (5.7.36)
 File Encoding         : 65001

 Date: 13/12/2022 14:50:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for data_statistics
-- ----------------------------
DROP TABLE IF EXISTS `data_statistics`;
CREATE TABLE `data_statistics`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) UNSIGNED NOT NULL COMMENT '如祺用户ID',
  `channel_id` int(11) UNSIGNED NOT NULL COMMENT '渠道ID',
  `entrance` tinyint(1) NULL DEFAULT NULL COMMENT '访问来源：1APP、2小程序、3公众号、4分享链接、5二维码、6其它；当page_type=index_page或result_page时需要',
  `page_type` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '访问页面类型：index_page（首页页面访问）、index_btn（首页按钮点击）、result_page（结果页页面访问）、result_btn_enjoy（结果页分享领券按钮点击）、result_btn_save（结果页保存海报按钮点击）、result_btn_again（结果页再玩一次按钮点击）',
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_channel_id`(`channel_id`) USING BTREE,
  INDEX `idx_entrance`(`entrance`) USING BTREE,
  INDEX `idx_page_type`(`page_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_statistics
-- ----------------------------

-- ----------------------------
-- Table structure for sys_api
-- ----------------------------
DROP TABLE IF EXISTS `sys_api`;
CREATE TABLE `sys_api`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键编码',
  `handle` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'handle',
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `path` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接口类型',
  `action` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求类型',
  `created_at` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) NULL DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) NULL DEFAULT NULL COMMENT '删除时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_api_create_by`(`create_by`) USING BTREE,
  INDEX `idx_sys_api_update_by`(`update_by`) USING BTREE,
  INDEX `idx_sys_api_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 160 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_api
-- ----------------------------
INSERT INTO `sys_api` VALUES (5, 'go-admin/app/admin/apis.SysLoginLog.Get-fm', '登录日志通过id获取', '/api/v1/sys-login-log/:id', 'BUS', 'GET', '2021-05-13 19:59:00.728', '2022-12-12 15:54:06.800', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (6, 'go-admin/app/admin/apis.SysOperaLog.GetPage-fm', '操作日志列表', '/api/v1/sys-opera-log', 'BUS', 'GET', '2021-05-13 19:59:00.778', '2022-12-12 15:54:06.800', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (7, 'go-admin/app/admin/apis.SysOperaLog.Get-fm', '操作日志通过id获取', '/api/v1/sys-opera-log/:id', 'BUS', 'GET', '2021-05-13 19:59:00.821', '2022-12-12 15:54:06.800', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (8, 'go-admin/common/actions.IndexAction.func1', '分类列表', '/api/v1/syscategory', 'BUS', 'GET', '2021-05-13 19:59:00.870', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (9, 'go-admin/common/actions.ViewAction.func1', '分类通过id获取', '/api/v1/syscategory/:id', 'BUS', 'GET', '2021-05-13 19:59:00.945', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (10, 'go-admin/common/actions.IndexAction.func1', '内容列表', '/api/v1/syscontent', 'BUS', 'GET', '2021-05-13 19:59:01.005', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (11, 'go-admin/common/actions.ViewAction.func1', '内容通过id获取', '/api/v1/syscontent/:id', 'BUS', 'GET', '2021-05-13 19:59:01.056', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (15, 'go-admin/common/actions.IndexAction.func1', 'job列表', '/api/v1/sysjob', 'BUS', 'GET', '2021-05-13 19:59:01.248', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (16, 'go-admin/common/actions.ViewAction.func1', 'job通过id获取', '/api/v1/sysjob/:id', 'BUS', 'GET', '2021-05-13 19:59:01.298', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (21, 'go-admin/app/admin/apis.SysDictType.GetPage-fm', '字典类型列表', '/api/v1/dict/type', 'BUS', 'GET', '2021-05-13 19:59:01.525', '2022-12-12 15:56:12.423', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (22, 'go-admin/app/admin/apis.SysDictType.GetAll-fm', '字典类型查询【代码生成】', '/api/v1/dict/type-option-select', 'SYS', 'GET', '2021-05-13 19:59:01.582', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (23, 'go-admin/app/admin/apis.SysDictType.Get-fm', '字典类型通过id获取', '/api/v1/dict/type/:id', 'BUS', 'GET', '2021-05-13 19:59:01.632', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (24, 'go-admin/app/admin/apis.SysDictData.GetPage-fm', '字典数据列表', '/api/v1/dict/data', 'BUS', 'GET', '2021-05-13 19:59:01.684', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (25, 'go-admin/app/admin/apis.SysDictData.Get-fm', '字典数据通过code获取', '/api/v1/dict/data/:dictCode', 'BUS', 'GET', '2021-05-13 19:59:01.732', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (26, 'go-admin/app/admin/apis.SysDictData.GetSysDictDataAll-fm', '数据字典根据key获取', '/api/v1/dict-data/option-select', 'SYS', 'GET', '2021-05-13 19:59:01.832', '2022-12-12 15:56:12.423', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (27, 'go-admin/app/admin/apis.SysDept.GetPage-fm', '部门列表', '/api/v1/dept', 'BUS', 'GET', '2021-05-13 19:59:01.940', '2022-12-12 15:56:04.621', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (28, 'go-admin/app/admin/apis.SysDept.Get-fm', '部门通过id获取', '/api/v1/dept/:id', 'BUS', 'GET', '2021-05-13 19:59:02.009', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (29, 'go-admin/app/admin/apis.SysDept.Get2Tree-fm', '查询部门下拉树【角色权限-自定权限】', '/api/v1/deptTree', 'SYS', 'GET', '2021-05-13 19:59:02.050', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (30, 'go-admin/app/admin/apis/tools.(*Gen).GetDBTableList-fm', '数据库表列表', '/api/v1/db/tables/page', 'SYS', 'GET', '2021-05-13 19:59:02.098', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (31, 'go-admin/app/admin/apis/tools.(*Gen).GetDBColumnList-fm', '数据表列列表', '/api/v1/db/columns/page', 'SYS', 'GET', '2021-05-13 19:59:02.140', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (32, 'go-admin/app/admin/apis/tools.Gen.GenCode-fm', '数据库表生成到项目', '/api/v1/gen/toproject/:tableId', 'SYS', 'GET', '2021-05-13 19:59:02.183', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (33, 'go-admin/app/admin/apis/tools.Gen.GenMenuAndApi-fm', '数据库表生成到DB', '/api/v1/gen/todb/:tableId', 'SYS', 'GET', '2021-05-13 19:59:02.227', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (34, 'go-admin/app/admin/apis/tools.(*SysTable).GetSysTablesTree-fm', '关系表数据【代码生成】', '/api/v1/gen/tabletree', 'SYS', 'GET', '2021-05-13 19:59:02.271', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (35, 'go-admin/app/admin/apis/tools.Gen.Preview-fm', '生成预览通过id获取', '/api/v1/gen/preview/:tableId', 'SYS', 'GET', '2021-05-13 19:59:02.315', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (36, 'go-admin/app/admin/apis/tools.Gen.GenApiToFile-fm', '生成api带文件', '/api/v1/gen/apitofile/:tableId', 'SYS', 'GET', '2021-05-13 19:59:02.357', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (37, 'go-admin/app/admin/apis.System.GenerateCaptchaHandler-fm', '验证码获取', '/api/v1/getCaptcha', 'SYS', 'GET', '2021-05-13 19:59:02.405', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (38, 'go-admin/app/admin/apis.SysUser.GetInfo-fm', '用户信息获取', '/api/v1/getinfo', 'SYS', 'GET', '2021-05-13 19:59:02.447', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (39, 'go-admin/app/admin/apis.SysMenu.GetPage-fm', '菜单列表', '/api/v1/menu', 'BUS', 'GET', '2021-05-13 19:59:02.497', '2022-12-12 18:01:08.337', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (40, 'go-admin/app/admin/apis.SysMenu.GetMenuTreeSelect-fm', '查询菜单下拉树结构【废弃】', '/api/v1/menuTreeselect', 'SYS', 'GET', '2021-05-13 19:59:02.542', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (41, 'go-admin/app/admin/apis.SysMenu.Get-fm', '菜单通过id获取', '/api/v1/menu/:id', 'BUS', 'GET', '2021-05-13 19:59:02.584', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (42, 'go-admin/app/admin/apis.SysMenu.GetMenuRole-fm', '角色菜单【顶部左侧菜单】', '/api/v1/menurole', 'SYS', 'GET', '2021-05-13 19:59:02.630', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (43, 'go-admin/app/admin/apis.SysMenu.GetMenuIDS-fm', '获取角色对应的菜单id数组【废弃】', '/api/v1/menuids', 'SYS', 'GET', '2021-05-13 19:59:02.675', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (44, 'go-admin/app/admin/apis.SysRole.GetPage-fm', '角色列表', '/api/v1/role', 'BUS', 'GET', '2021-05-13 19:59:02.720', '2022-12-12 15:55:45.052', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (45, 'go-admin/app/admin/apis.SysMenu.GetMenuTreeSelect-fm', '菜单权限列表【角色配菜单使用】', '/api/v1/roleMenuTreeselect/:roleId', 'SYS', 'GET', '2021-05-13 19:59:02.762', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (46, 'go-admin/app/admin/apis.SysDept.GetDeptTreeRoleSelect-fm', '角色部门结构树【自定义数据权限】', '/api/v1/roleDeptTreeselect/:roleId', 'SYS', 'GET', '2021-05-13 19:59:02.809', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (47, 'go-admin/app/admin/apis.SysRole.Get-fm', '角色通过id获取', '/api/v1/role/:id', 'BUS', 'GET', '2021-05-13 19:59:02.850', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (48, 'github.com/go-admin-team/go-admin-core/sdk/pkg/jwtauth.(*GinJWTMiddleware).RefreshHandler-fm', '刷新token', '/api/v1/refresh_token', 'SYS', 'GET', '2021-05-13 19:59:02.892', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (53, 'go-admin/app/admin/apis.SysConfig.GetPage-fm', '参数列表', '/api/v1/config', 'BUS', 'GET', '2021-05-13 19:59:03.116', '2022-12-12 15:56:20.259', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (54, 'go-admin/app/admin/apis.SysConfig.Get-fm', '参数通过id获取', '/api/v1/config/:id', 'BUS', 'GET', '2021-05-13 19:59:03.157', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (55, 'go-admin/app/admin/apis.SysConfig.GetSysConfigByKEYForService-fm', '参数通过键名搜索【基础默认配置】', '/api/v1/configKey/:configKey', 'SYS', 'GET', '2021-05-13 19:59:03.198', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (57, 'go-admin/app/jobs/apis.SysJob.RemoveJobForService-fm', 'job移除', '/api/v1/job/remove/:id', 'BUS', 'GET', '2021-05-13 19:59:03.295', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (58, 'go-admin/app/jobs/apis.SysJob.StartJobForService-fm', 'job启动', '/api/v1/job/start/:id', 'BUS', 'GET', '2021-05-13 19:59:03.339', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (59, 'go-admin/app/admin/apis.SysPost.GetPage-fm', '岗位列表', '/api/v1/post', 'BUS', 'GET', '2021-05-13 19:59:03.381', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (60, 'go-admin/app/admin/apis.SysPost.Get-fm', '岗位通过id获取', '/api/v1/post/:id', 'BUS', 'GET', '2021-05-13 19:59:03.433', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (62, 'go-admin/app/admin/apis.SysConfig.GetSysConfigBySysApp-fm', '系统前端参数', '/api/v1/app-config', 'SYS', 'GET', '2021-05-13 19:59:03.526', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (63, 'go-admin/app/admin/apis.SysUser.GetProfile-fm', '*用户信息获取', '/api/v1/user/profile', 'SYS', 'GET', '2021-05-13 19:59:03.567', '2022-12-12 15:51:18.423', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (66, 'github.com/go-admin-team/go-admin-core/sdk/pkg/ws.(*Manager).WsClient-fm', '链接ws【定时任务log】', '/ws/:id/:channel', 'BUS', 'GET', '2021-05-13 19:59:03.705', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (67, 'github.com/go-admin-team/go-admin-core/sdk/pkg/ws.(*Manager).UnWsClient-fm', '退出ws【定时任务log】', '/wslogout/:id/:channel', 'BUS', 'GET', '2021-05-13 19:59:03.756', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (68, 'go-admin/common/middleware/handler.Ping', '*用户基本信息', '/info', 'SYS', 'GET', '2021-05-13 19:59:03.800', '2022-12-12 15:50:39.654', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (72, 'go-admin/common/actions.CreateAction.func1', '分类创建', '/api/v1/syscategory', 'BUS', 'POST', '2021-05-13 19:59:03.982', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (73, 'go-admin/common/actions.CreateAction.func1', '内容创建', '/api/v1/syscontent', 'BUS', 'POST', '2021-05-13 19:59:04.027', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (76, 'go-admin/common/actions.CreateAction.func1', 'job创建', '/api/v1/sysjob', 'BUS', 'POST', '2021-05-13 19:59:04.164', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (80, 'go-admin/app/admin/apis.SysDictData.Insert-fm', '字典数据创建', '/api/v1/dict/data', 'BUS', 'POST', '2021-05-13 19:59:04.347', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (81, 'go-admin/app/admin/apis.SysDictType.Insert-fm', '字典类型创建', '/api/v1/dict/type', 'BUS', 'POST', '2021-05-13 19:59:04.391', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (82, 'go-admin/app/admin/apis.SysDept.Insert-fm', '部门创建', '/api/v1/dept', 'BUS', 'POST', '2021-05-13 19:59:04.435', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (85, 'github.com/go-admin-team/go-admin-core/sdk/pkg/jwtauth.(*GinJWTMiddleware).LoginHandler-fm', '*登录', '/api/v1/login', 'SYS', 'POST', '2021-05-13 19:59:04.597', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (86, 'go-admin/common/middleware/handler.LogOut', '*退出', '/api/v1/logout', 'SYS', 'POST', '2021-05-13 19:59:04.642', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (87, 'go-admin/app/admin/apis.SysConfig.Insert-fm', '参数创建', '/api/v1/config', 'BUS', 'POST', '2021-05-13 19:59:04.685', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (88, 'go-admin/app/admin/apis.SysMenu.Insert-fm', '菜单创建', '/api/v1/menu', 'BUS', 'POST', '2021-05-13 19:59:04.777', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (89, 'go-admin/app/admin/apis.SysPost.Insert-fm', '岗位创建', '/api/v1/post', 'BUS', 'POST', '2021-05-13 19:59:04.886', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (90, 'go-admin/app/admin/apis.SysRole.Insert-fm', '角色创建', '/api/v1/role', 'BUS', 'POST', '2021-05-13 19:59:04.975', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (91, 'go-admin/app/admin/apis.SysUser.InsetAvatar-fm', '*用户头像编辑', '/api/v1/user/avatar', 'SYS', 'POST', '2021-05-13 19:59:05.058', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (92, 'go-admin/app/admin/apis.SysApi.Update-fm', '接口编辑', '/api/v1/sys-api/:id', 'BUS', 'PUT', '2021-05-13 19:59:05.122', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (95, 'go-admin/common/actions.UpdateAction.func1', '分类编辑', '/api/v1/syscategory/:id', 'BUS', 'PUT', '2021-05-13 19:59:05.255', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (96, 'go-admin/common/actions.UpdateAction.func1', '内容编辑', '/api/v1/syscontent/:id', 'BUS', 'PUT', '2021-05-13 19:59:05.299', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (97, 'go-admin/common/actions.UpdateAction.func1', 'job编辑', '/api/v1/sysjob', 'BUS', 'PUT', '2021-05-13 19:59:05.343', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (101, 'go-admin/app/admin/apis.SysDictData.Update-fm', '字典数据编辑', '/api/v1/dict/data/:dictCode', 'BUS', 'PUT', '2021-05-13 19:59:05.519', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (102, 'go-admin/app/admin/apis.SysDictType.Update-fm', '字典类型编辑', '/api/v1/dict/type/:id', 'BUS', 'PUT', '2021-05-13 19:59:05.569', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (103, 'go-admin/app/admin/apis.SysDept.Update-fm', '部门编辑', '/api/v1/dept/:id', 'BUS', 'PUT', '2021-05-13 19:59:05.613', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (104, 'go-admin/app/other/apis.SysFileDir.Update-fm', '文件夹编辑', '/api/v1/file-dir/:id', 'BUS', 'PUT', '2021-05-13 19:59:05.662', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (105, 'go-admin/app/other/apis.SysFileInfo.Update-fm', '文件编辑', '/api/v1/file-info/:id', 'BUS', 'PUT', '2021-05-13 19:59:05.709', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (106, 'go-admin/app/admin/apis.SysRole.Update-fm', '角色编辑', '/api/v1/role/:id', 'BUS', 'PUT', '2021-05-13 19:59:05.752', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (107, 'go-admin/app/admin/apis.SysRole.Update2DataScope-fm', '角色数据权限修改', '/api/v1/roledatascope', 'BUS', 'PUT', '2021-05-13 19:59:05.803', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (108, 'go-admin/app/admin/apis.SysConfig.Update-fm', '参数编辑', '/api/v1/config/:id', 'BUS', 'PUT', '2021-05-13 19:59:05.848', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (109, 'go-admin/app/admin/apis.SysMenu.Update-fm', '编辑菜单', '/api/v1/menu/:id', 'BUS', 'PUT', '2021-05-13 19:59:05.891', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (110, 'go-admin/app/admin/apis.SysPost.Update-fm', '岗位编辑', '/api/v1/post/:id', 'BUS', 'PUT', '2021-05-13 19:59:05.934', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (111, 'go-admin/app/admin/apis.SysUser.UpdatePwd-fm', '*用户修改密码', '/api/v1/user/pwd', 'SYS', 'PUT', '2021-05-13 19:59:05.987', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (112, 'go-admin/common/actions.DeleteAction.func1', '分类删除', '/api/v1/syscategory', 'BUS', 'DELETE', '2021-05-13 19:59:06.030', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (113, 'go-admin/common/actions.DeleteAction.func1', '内容删除', '/api/v1/syscontent', 'BUS', 'DELETE', '2021-05-13 19:59:06.076', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (114, 'go-admin/app/admin/apis.SysLoginLog.Delete-fm', '登录日志删除', '/api/v1/sys-login-log', 'BUS', 'DELETE', '2021-05-13 19:59:06.118', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (115, 'go-admin/app/admin/apis.SysOperaLog.Delete-fm', '操作日志删除', '/api/v1/sys-opera-log', 'BUS', 'DELETE', '2021-05-13 19:59:06.162', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (116, 'go-admin/common/actions.DeleteAction.func1', 'job删除', '/api/v1/sysjob', 'BUS', 'DELETE', '2021-05-13 19:59:06.206', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (117, 'go-admin/app/other/apis.SysChinaAreaData.Delete-fm', '行政区删除', '/api/v1/sys-area-data', 'BUS', 'DELETE', '2021-05-13 19:59:06.249', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (120, 'go-admin/app/admin/apis.SysDictData.Delete-fm', '字典数据删除', '/api/v1/dict/data', 'BUS', 'DELETE', '2021-05-13 19:59:06.387', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (121, 'go-admin/app/admin/apis.SysDictType.Delete-fm', '字典类型删除', '/api/v1/dict/type', 'BUS', 'DELETE', '2021-05-13 19:59:06.432', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (122, 'go-admin/app/admin/apis.SysDept.Delete-fm', '部门删除', '/api/v1/dept/:id', 'BUS', 'DELETE', '2021-05-13 19:59:06.475', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (123, 'go-admin/app/other/apis.SysFileDir.Delete-fm', '文件夹删除', '/api/v1/file-dir/:id', 'BUS', 'DELETE', '2021-05-13 19:59:06.520', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (124, 'go-admin/app/other/apis.SysFileInfo.Delete-fm', '文件删除', '/api/v1/file-info/:id', 'BUS', 'DELETE', '2021-05-13 19:59:06.566', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (125, 'go-admin/app/admin/apis.SysConfig.Delete-fm', '参数删除', '/api/v1/config', 'BUS', 'DELETE', '2021-05-13 19:59:06.612', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (126, 'go-admin/app/admin/apis.SysMenu.Delete-fm', '删除菜单', '/api/v1/menu', 'BUS', 'DELETE', '2021-05-13 19:59:06.654', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (127, 'go-admin/app/admin/apis.SysPost.Delete-fm', '岗位删除', '/api/v1/post/:id', 'BUS', 'DELETE', '2021-05-13 19:59:06.702', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (128, 'go-admin/app/admin/apis.SysRole.Delete-fm', '角色删除', '/api/v1/role', 'BUS', 'DELETE', '2021-05-13 19:59:06.746', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (131, 'github.com/go-admin-team/go-admin-core/tools/transfer.Handler.func1', '系统指标', '/api/v1/metrics', 'SYS', 'GET', '2021-05-17 22:13:55.933', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (132, 'go-admin/app/other/router.registerMonitorRouter.func1', '健康状态', '/api/v1/health', 'SYS', 'GET', '2021-05-17 22:13:56.285', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (133, 'go-admin/app/admin/apis.HelloWorld', '项目默认接口', '/', 'SYS', 'GET', '2021-05-24 10:30:44.553', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (134, 'go-admin/app/other/apis.ServerMonitor.ServerInfo-fm', '服务器基本状态', '/api/v1/server-monitor', 'SYS', 'GET', '2021-05-24 10:30:44.937', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (135, 'go-admin/app/admin/apis.SysApi.GetPage-fm', '接口列表', '/api/v1/sys-api', 'BUS', 'GET', '2021-05-24 11:37:53.303', '2022-12-12 18:01:08.337', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (136, 'go-admin/app/admin/apis.SysApi.Get-fm', '接口通过id获取', '/api/v1/sys-api/:id', 'BUS', 'GET', '2021-05-24 11:37:53.359', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (137, 'go-admin/app/admin/apis.SysLoginLog.GetPage-fm', '登录日志列表', '/api/v1/sys-login-log', 'BUS', 'GET', '2021-05-24 11:47:30.397', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (138, 'go-admin/app/other/apis.File.UploadFile-fm', '文件上传', '/api/v1/public/uploadFile', 'SYS', 'POST', '2021-05-25 19:16:18.493', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (139, 'go-admin/app/admin/apis.SysConfig.Update2Set-fm', '参数信息修改【参数配置】', '/api/v1/set-config', 'BUS', 'PUT', '2021-05-27 09:45:14.853', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (140, 'go-admin/app/admin/apis.SysConfig.Get2Set-fm', '参数获取全部【配置使用】', '/api/v1/set-config', 'BUS', 'GET', '2021-05-27 11:54:14.384', '2022-12-12 15:52:40.372', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (141, 'go-admin/app/admin/apis.SysUser.GetPage-fm', '管理员列表', '/api/v1/sys-user', 'BUS', 'GET', '2021-06-13 19:24:57.111', '2022-12-12 18:00:30.100', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (142, 'go-admin/app/admin/apis.SysUser.Get-fm', '管理员通过id获取', '/api/v1/sys-user/:id', 'BUS', 'GET', '2021-06-13 19:24:57.188', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (143, 'go-admin/app/admin/apis/tools.(*SysTable).GetSysTablesInfo-fm', '', '/api/v1/sys/tables/info', '', 'GET', '2021-06-13 19:24:57.437', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (144, 'go-admin/app/admin/apis/tools.(*SysTable).GetSysTables-fm', '', '/api/v1/sys/tables/info/:tableId', '', 'GET', '2021-06-13 19:24:57.510', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (145, 'go-admin/app/admin/apis/tools.(*SysTable).GetSysTableList-fm', '', '/api/v1/sys/tables/page', '', 'GET', '2021-06-13 19:24:57.582', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (146, 'github.com/gin-gonic/gin.(*RouterGroup).createStaticHandler.func1', '', '/static/*filepath', '', 'GET', '2021-06-13 19:24:59.641', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (147, 'github.com/swaggo/gin-swagger.CustomWrapHandler.func1', '', '/swagger/*any', '', 'GET', '2021-06-13 19:24:59.713', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (148, 'github.com/gin-gonic/gin.(*RouterGroup).createStaticHandler.func1', '', '/form-generator/*filepath', '', 'GET', '2021-06-13 19:24:59.914', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (149, 'go-admin/app/admin/apis/tools.(*SysTable).InsertSysTable-fm', '', '/api/v1/sys/tables/info', '', 'POST', '2021-06-13 19:25:00.163', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (150, 'go-admin/app/admin/apis.SysUser.Insert-fm', '管理员创建', '/api/v1/sys-user', 'BUS', 'POST', '2021-06-13 19:25:00.233', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (151, 'go-admin/app/admin/apis.SysUser.Update-fm', '管理员编辑', '/api/v1/sys-user', 'BUS', 'PUT', '2021-06-13 19:25:00.986', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (152, 'go-admin/app/admin/apis/tools.(*SysTable).UpdateSysTable-fm', '', '/api/v1/sys/tables/info', '', 'PUT', '2021-06-13 19:25:01.149', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (153, 'go-admin/app/admin/apis.SysRole.Update2Status-fm', '', '/api/v1/role-status', '', 'PUT', '2021-06-13 19:25:01.446', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (154, 'go-admin/app/admin/apis.SysUser.ResetPwd-fm', '', '/api/v1/user/pwd/reset', '', 'PUT', '2021-06-13 19:25:01.601', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (155, 'go-admin/app/admin/apis.SysUser.UpdateStatus-fm', '', '/api/v1/user/status', '', 'PUT', '2021-06-13 19:25:01.671', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (156, 'go-admin/app/admin/apis.SysUser.Delete-fm', '管理员删除', '/api/v1/sys-user', 'BUS', 'DELETE', '2021-06-13 19:25:02.043', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (157, 'go-admin/app/admin/apis/tools.(*SysTable).DeleteSysTables-fm', '', '/api/v1/sys/tables/info/:tableId', '', 'DELETE', '2021-06-13 19:25:02.283', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (158, 'github.com/gin-gonic/gin.(*RouterGroup).createStaticHandler.func1', '', '/static/*filepath', '', 'HEAD', '2021-06-13 19:25:02.734', '2022-12-12 15:37:24.757', NULL, 0, 0);
INSERT INTO `sys_api` VALUES (159, 'github.com/gin-gonic/gin.(*RouterGroup).createStaticHandler.func1', '', '/form-generator/*filepath', '', 'HEAD', '2021-06-13 19:25:02.808', '2022-12-12 15:37:24.757', NULL, 0, 0);

-- ----------------------------
-- Table structure for sys_casbin_rule
-- ----------------------------
DROP TABLE IF EXISTS `sys_casbin_rule`;
CREATE TABLE `sys_casbin_rule`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ptype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v0` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v3` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v4` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v5` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v6` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v7` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_sys_casbin_rule`(`ptype`, `v0`, `v1`, `v2`, `v3`, `v4`, `v5`, `v6`, `v7`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 138 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_casbin_rule
-- ----------------------------

-- ----------------------------
-- Table structure for sys_columns
-- ----------------------------
DROP TABLE IF EXISTS `sys_columns`;
CREATE TABLE `sys_columns`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `table_id` bigint(20) NULL DEFAULT NULL,
  `column_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column_comment` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `go_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `go_field` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `json_field` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_pk` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_increment` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_required` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_insert` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_edit` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_list` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_query` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `query_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `html_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dict_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sort` bigint(20) NULL DEFAULT NULL,
  `list` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pk` tinyint(1) NULL DEFAULT NULL,
  `required` tinyint(1) NULL DEFAULT NULL,
  `super_column` tinyint(1) NULL DEFAULT NULL,
  `usable_column` tinyint(1) NULL DEFAULT NULL,
  `increment` tinyint(1) NULL DEFAULT NULL,
  `insert` tinyint(1) NULL DEFAULT NULL,
  `edit` tinyint(1) NULL DEFAULT NULL,
  `query` tinyint(1) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fk_table_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `fk_table_name_class` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `fk_table_name_package` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `fk_label_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `fk_label_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) NULL DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) NULL DEFAULT NULL COMMENT '删除时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`column_id`) USING BTREE,
  INDEX `idx_sys_columns_deleted_at`(`deleted_at`) USING BTREE,
  INDEX `idx_sys_columns_create_by`(`create_by`) USING BTREE,
  INDEX `idx_sys_columns_update_by`(`update_by`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_columns
-- ----------------------------
INSERT INTO `sys_columns` VALUES (1, 1, 'id', '', 'int(11) unsigned', 'int', 'Id', 'id', '1', '', '1', '1', '', '', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 11:52:33.299', '2022-12-12 11:52:33.299', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (2, 1, 'name', '人设名称', 'varchar(20)', 'string', 'Name', 'name', '0', '', '1', '1', '', '1', '1', 'EQ', 'input', '', 2, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 11:52:33.450', '2022-12-12 11:58:40.267', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (3, 1, 'metaphor_rate', '比喻事物的比率', 'decimal(8,4)', 'string', 'MetaphorRate', 'metaphorRate', '0', '', '1', '1', '', '1', '', 'EQ', 'input', '', 3, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 11:52:33.608', '2022-12-12 11:58:40.461', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (4, 2, 'id', '', 'int(11)', 'int', 'Id', 'id', '1', '', '1', '1', '', '', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 12:08:56.533', '2022-12-12 12:08:56.533', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (5, 2, 'user_id', '如祺用户ID', 'int(11)', 'string', 'UserId', 'userId', '0', '', '1', '1', '', '1', '1', 'EQ', 'input', '', 2, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 12:08:56.678', '2022-12-12 14:02:25.084', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (6, 2, 'identity_id', '人设ID', 'int(11)', 'string', 'IdentityId', 'identityId', '0', '', '1', '1', '', '1', '1', 'EQ', 'select', '', 3, '', 0, 1, 0, 0, 0, 1, 0, 0, '', 'user_identity', 'UserIdentity', 'user-identity', 'id', 'name', '2022-12-12 12:08:56.809', '2022-12-12 14:02:25.269', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (7, 3, 'id', '', 'int(11)', 'int', 'Id', 'id', '1', '', '1', '1', '', '', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 14:20:25.832', '2022-12-12 14:20:25.832', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (8, 3, 'user_id', '如祺用户ID', 'int(11)', 'string', 'UserId', 'userId', '0', '', '1', '1', '', '', '', 'EQ', 'input', '', 2, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 14:20:25.972', '2022-12-12 14:20:25.972', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (9, 3, 'identity_id', '人设ID', 'int(11)', 'string', 'IdentityId', 'identityId', '0', '', '1', '1', '', '', '', 'EQ', 'input', '', 3, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 14:20:26.107', '2022-12-12 14:20:26.107', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (10, 3, 'created_at', '创建时间', 'datetime(3)', 'time.Time', 'CreatedAt', 'createdAt', '0', '', '0', '1', '', '', '', 'EQ', 'datetime', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 14:20:26.239', '2022-12-12 14:20:26.239', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (11, 3, 'updated_at', '最后更新时间', 'datetime(3)', 'time.Time', 'UpdatedAt', 'updatedAt', '0', '', '0', '1', '', '', '', 'EQ', 'datetime', '', 5, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 14:20:26.374', '2022-12-12 14:20:26.374', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (12, 3, 'deleted_at', '删除时间', 'datetime(3)', 'time.Time', 'DeletedAt', 'deletedAt', '0', '', '0', '1', '', '', '', 'EQ', 'datetime', '', 6, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 14:20:26.506', '2022-12-12 14:20:26.506', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (13, 3, 'create_by', '创建者', 'bigint(20)', 'string', 'CreateBy', 'createBy', '0', '', '0', '1', '', '', '', 'EQ', 'input', '', 7, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 14:20:26.640', '2022-12-12 14:20:26.640', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (14, 3, 'update_by', '更新者', 'bigint(20)', 'string', 'UpdateBy', 'updateBy', '0', '', '0', '1', '', '', '', 'EQ', 'input', '', 8, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 14:20:26.776', '2022-12-12 14:20:26.776', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (15, 3, 'nickname', '微信昵称', 'varchar(50)', 'string', 'Nickname', 'nickname', '0', '', '1', '1', '', '', '', 'EQ', 'input', '', 9, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 14:20:26.925', '2022-12-12 14:20:26.925', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (16, 3, 'register_city', '注册城市：地级市', 'varchar(30)', 'string', 'RegisterCity', 'registerCity', '0', '', '1', '1', '', '', '', 'EQ', 'input', '', 10, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 14:20:27.058', '2022-12-12 14:20:27.058', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (17, 3, 'register_time', '注册时间：年/月/日', 'datetime', 'time.Time', 'RegisterTime', 'registerTime', '0', '', '1', '1', '', '', '', 'EQ', 'datetime', '', 11, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 14:20:27.189', '2022-12-12 14:20:27.189', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (18, 3, 'regular_point_t2', '常用上/下车点Top2，英文逗号分割', 'varchar(50)', 'string', 'RegularPointT2', 'regularPointT2', '0', '', '0', '1', '', '', '', 'EQ', 'input', '', 12, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 14:20:27.317', '2022-12-12 14:20:27.317', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (19, 3, 'total_mileage', '22年里程总公里数，无需小数点，四舍五入原则', 'smallint(1) unsigned', 'string', 'TotalMileage', 'totalMileage', '0', '', '1', '1', '', '', '', 'EQ', 'input', '', 13, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 14:20:27.448', '2022-12-12 14:20:27.448', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (20, 3, 'total_amount', '22年订单折前流水总金额', 'decimal(10,2)', 'string', 'TotalAmount', 'totalAmount', '0', '', '1', '1', '', '', '', 'EQ', 'input', '', 14, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 14:20:27.581', '2022-12-12 14:20:27.581', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (21, 3, 'actually_amount', '22年订单实际支付总金额', 'decimal(10,2)', 'string', 'ActuallyAmount', 'actuallyAmount', '0', '', '1', '1', '', '', '', 'EQ', 'input', '', 15, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 14:20:27.710', '2022-12-12 14:20:27.710', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (22, 3, 'latest_order_time', '22年最晚成单时间（03:00:00前下单数据）', 'varchar(20)', 'string', 'LatestOrderTime', 'latestOrderTime', '0', '', '1', '1', '', '', '', 'EQ', 'input', '', 16, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 14:20:27.842', '2022-12-12 14:20:27.842', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (23, 3, 'mileage_rank_rate', '22年总里程数排行，超越X%用户', 'decimal(3,2)', 'string', 'MileageRankRate', 'mileageRankRate', '0', '', '1', '1', '', '', '', 'EQ', 'input', '', 17, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 14:20:27.972', '2022-12-12 14:20:27.972', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (24, 3, 'member_level', '如祺会员等级', 'varchar(15)', 'string', 'MemberLevel', 'memberLevel', '0', '', '1', '1', '', '', '', 'EQ', 'input', '', 18, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 14:20:28.103', '2022-12-12 14:20:28.103', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (25, 3, 'user_type', '用户类型：1新用户、2老用户22年未成单、3老用户已成单', 'bigint(1) unsigned', 'string', 'UserType', 'userType', '0', '', '1', '1', '', '', '', 'EQ', 'input', '', 19, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 14:20:28.235', '2022-12-12 14:20:28.235', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (26, 4, 'id', '', 'int(11)', 'int', 'Id', 'id', '1', '', '1', '1', '', '', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 14:23:20.369', '2022-12-12 14:23:20.369', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (27, 4, 'user_id', '如祺用户ID', 'int(11)', 'string', 'UserId', 'userId', '0', '', '1', '1', '', '1', '1', 'EQ', 'input', '', 2, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 14:23:20.498', '2022-12-12 14:31:45.496', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (28, 4, 'identity_id', '人设ID', 'int(11)', 'string', 'IdentityId', 'identityId', '0', '', '1', '1', '', '1', '1', 'EQ', 'select', '', 3, '', 0, 1, 0, 0, 0, 1, 0, 0, '', 'user_identity', 'UserIdentity', 'user-identity', 'id', 'name', '2022-12-12 14:23:20.626', '2022-12-12 14:31:45.686', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (29, 4, 'created_at', '创建时间', 'datetime(3)', 'time.Time', 'CreatedAt', 'createdAt', '0', '', '0', '1', '', '', '', 'EQ', 'datetime', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 14:23:20.767', '2022-12-12 14:23:20.767', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (30, 4, 'updated_at', '最后更新时间', 'datetime(3)', 'time.Time', 'UpdatedAt', 'updatedAt', '0', '', '0', '1', '', '', '', 'EQ', 'datetime', '', 5, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 14:23:20.897', '2022-12-12 14:23:20.897', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (31, 4, 'deleted_at', '删除时间', 'datetime(3)', 'time.Time', 'DeletedAt', 'deletedAt', '0', '', '0', '1', '', '', '', 'EQ', 'datetime', '', 6, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 14:23:21.036', '2022-12-12 14:23:21.036', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (32, 4, 'create_by', '创建者', 'bigint(20)', 'string', 'CreateBy', 'createBy', '0', '', '0', '1', '', '', '', 'EQ', 'input', '', 7, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 14:23:21.168', '2022-12-12 14:23:21.168', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (33, 4, 'update_by', '更新者', 'bigint(20)', 'string', 'UpdateBy', 'updateBy', '0', '', '0', '1', '', '', '', 'EQ', 'input', '', 8, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 14:23:21.301', '2022-12-12 14:23:21.301', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (34, 4, 'nickname', '微信昵称', 'varchar(50)', 'string', 'Nickname', 'nickname', '0', '', '1', '1', '', '1', '1', 'LIKE', 'input', '', 9, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 14:23:21.435', '2022-12-12 14:31:45.874', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (35, 4, 'register_city', '注册城市：地级市', 'varchar(30)', 'string', 'RegisterCity', 'registerCity', '0', '', '1', '1', '', '1', '1', 'LIKE', 'input', '', 10, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 14:23:21.567', '2022-12-12 14:31:46.063', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (36, 4, 'register_time', '注册时间：年/月/日', 'datetime', 'time.Time', 'RegisterTime', 'registerTime', '0', '', '1', '1', '', '1', '0', 'EQ', 'datetime', '', 11, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 14:23:21.698', '2022-12-12 14:31:46.257', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (37, 4, 'regular_point_t2', '常用上/下车点Top2，英文逗号分割', 'varchar(50)', 'string', 'RegularPointT2', 'regularPointT2', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 12, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 14:23:21.829', '2022-12-12 14:31:46.450', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (38, 4, 'total_mileage', '22年里程总公里数，无需小数点，四舍五入原则', 'smallint(1) unsigned', 'int64', 'TotalMileage', 'totalMileage', '0', '', '1', '1', '', '1', '', 'EQ', 'input', '', 13, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 14:23:21.963', '2022-12-12 14:31:46.638', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (39, 4, 'total_amount', '22年订单折前流水总金额', 'decimal(10,2)', 'string', 'TotalAmount', 'totalAmount', '0', '', '1', '1', '', '1', '', 'EQ', 'input', '', 14, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 14:23:22.097', '2022-12-12 14:31:46.827', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (40, 4, 'actually_amount', '22年订单实际支付总金额', 'decimal(10,2)', 'string', 'ActuallyAmount', 'actuallyAmount', '0', '', '1', '1', '', '1', '', 'EQ', 'input', '', 15, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 14:23:22.230', '2022-12-12 14:31:47.023', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (41, 4, 'latest_order_time', '22年最晚成单时间（03:00:00前下单数据）', 'varchar(20)', 'string', 'LatestOrderTime', 'latestOrderTime', '0', '', '1', '1', '', '1', '', 'EQ', 'input', '', 16, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 14:23:22.364', '2022-12-12 14:31:47.218', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (42, 4, 'mileage_rank_rate', '22年总里程数排行，超越X%用户', 'decimal(3,2)', 'string', 'MileageRankRate', 'mileageRankRate', '0', '', '1', '1', '', '1', '1', 'GT', 'input', '', 17, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 14:23:22.495', '2022-12-12 14:31:47.410', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (43, 4, 'member_level', '如祺会员等级', 'varchar(15)', 'string', 'MemberLevel', 'memberLevel', '0', '', '1', '1', '', '1', '1', 'LIKE', 'input', '', 18, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 14:23:22.633', '2022-12-12 14:31:47.605', NULL, 0, 0);
INSERT INTO `sys_columns` VALUES (44, 4, 'user_type', '用户类型：1新用户、2老用户22年未成单、3老用户已成单', 'bigint(1) unsigned', 'int64', 'UserType', 'userType', '0', '', '1', '1', '', '1', '', 'EQ', 'input', '', 19, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', '2022-12-12 14:23:22.762', '2022-12-12 14:31:47.801', NULL, 0, 0);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键编码',
  `config_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ConfigName',
  `config_key` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ConfigKey',
  `config_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ConfigValue',
  `config_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ConfigType',
  `is_frontend` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否前台',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Remark',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `created_at` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) NULL DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_config_create_by`(`create_by`) USING BTREE,
  INDEX `idx_sys_config_update_by`(`update_by`) USING BTREE,
  INDEX `idx_sys_config_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '皮肤样式', 'sys_index_skinName', 'skin-green', 'Y', '0', '主框架页-默认皮肤样式名称:蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow', 1, 1, '2021-05-13 19:56:37.913', '2021-06-05 13:50:13.123', NULL);
INSERT INTO `sys_config` VALUES (2, '初始密码', 'sys_user_initPassword', '1234qwer', 'Y', '0', '用户管理-账号初始密码:123456', 1, 1, '2021-05-13 19:56:37.913', '2022-12-12 14:50:58.965', NULL);
INSERT INTO `sys_config` VALUES (3, '侧栏主题', 'sys_index_sideTheme', 'theme-dark', 'Y', '0', '主框架页-侧边栏主题:深色主题theme-dark，浅色主题theme-light', 1, 1, '2021-05-13 19:56:37.913', '2021-05-13 19:56:37.913', NULL);
INSERT INTO `sys_config` VALUES (4, '系统名称', 'sys_app_name', '2022年如祺年度账单后台', 'Y', '1', '', 1, 0, '2021-03-17 08:52:06.067', '2022-12-12 14:45:55.182', NULL);
INSERT INTO `sys_config` VALUES (5, '系统logo', 'sys_app_logo', 'https://doc-image.zhangwj.com/img/go-admin.png', 'Y', '1', '', 1, 0, '2021-03-17 08:53:19.462', '2021-03-17 08:53:19.462', NULL);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  `dept_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dept_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sort` tinyint(4) NULL DEFAULT NULL,
  `leader` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `created_at` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) NULL DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`dept_id`) USING BTREE,
  INDEX `idx_sys_dept_create_by`(`create_by`) USING BTREE,
  INDEX `idx_sys_dept_update_by`(`update_by`) USING BTREE,
  INDEX `idx_sys_dept_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, 0, '/0/1/', '如祺年度账单', 0, 'admin', '13800000000', 'admin@qq.com', 2, 1, 1, '2021-05-13 19:56:37.913', '2022-12-12 15:03:00.970', NULL);
INSERT INTO `sys_dept` VALUES (7, 1, '/0/1/7/', '研发部', 1, 'aituo', '13782218188', 'atuo@aituo.com', 2, 1, 1, '2021-05-13 19:56:37.913', '2021-06-16 21:35:00.109', '2022-12-12 11:21:46.086');
INSERT INTO `sys_dept` VALUES (8, 1, '/0/1/8/', '运营部', 0, 'admin', '13800000000', 'admin@qq.com', 2, 1, 1, '2021-05-13 19:56:37.913', '2022-12-12 15:03:00.970', NULL);
INSERT INTO `sys_dept` VALUES (9, 1, '/0/1/9/', '客服部', 0, 'aituo', '13782218188', 'atuo@aituo.com', 2, 1, 1, '2021-05-13 19:56:37.913', '2021-06-05 17:07:05.993', '2022-12-12 11:21:48.756');
INSERT INTO `sys_dept` VALUES (10, 1, '/0/1/10/', '人力资源', 3, 'aituo', '13782218188', 'atuo@aituo.com', 1, 1, 1, '2021-05-13 19:56:37.913', '2021-06-05 17:07:08.503', '2022-12-12 11:21:50.513');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT,
  `dict_sort` bigint(20) NULL DEFAULT NULL,
  `dict_label` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dict_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dict_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `css_class` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `list_class` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_default` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  `default` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `created_at` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) NULL DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`dict_code`) USING BTREE,
  INDEX `idx_sys_dict_data_create_by`(`create_by`) USING BTREE,
  INDEX `idx_sys_dict_data_update_by`(`update_by`) USING BTREE,
  INDEX `idx_sys_dict_data_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 0, '正常', '2', 'sys_normal_disable', '', '', '', 2, '', '系统正常', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:40.168', NULL);
INSERT INTO `sys_dict_data` VALUES (2, 0, '停用', '1', 'sys_normal_disable', '', '', '', 2, '', '系统停用', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (3, 0, '男', '0', 'sys_user_sex', '', '', '', 2, '', '性别男', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (4, 0, '女', '1', 'sys_user_sex', '', '', '', 2, '', '性别女', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (5, 0, '未知', '2', 'sys_user_sex', '', '', '', 2, '', '性别未知', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (6, 0, '显示', '0', 'sys_show_hide', '', '', '', 2, '', '显示菜单', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (7, 0, '隐藏', '1', 'sys_show_hide', '', '', '', 2, '', '隐藏菜单', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (8, 0, '是', 'Y', 'sys_yes_no', '', '', '', 2, '', '系统默认是', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (9, 0, '否', 'N', 'sys_yes_no', '', '', '', 2, '', '系统默认否', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (10, 0, '正常', '2', 'sys_job_status', '', '', '', 2, '', '正常状态', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (11, 0, '停用', '1', 'sys_job_status', '', '', '', 2, '', '停用状态', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (12, 0, '默认', 'DEFAULT', 'sys_job_group', '', '', '', 2, '', '默认分组', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (13, 0, '系统', 'SYSTEM', 'sys_job_group', '', '', '', 2, '', '系统分组', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (14, 0, '通知', '1', 'sys_notice_type', '', '', '', 2, '', '通知', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (15, 0, '公告', '2', 'sys_notice_type', '', '', '', 2, '', '公告', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (16, 0, '正常', '2', 'sys_common_status', '', '', '', 2, '', '正常状态', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (17, 0, '关闭', '1', 'sys_common_status', '', '', '', 2, '', '关闭状态', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (18, 0, '新增', '1', 'sys_oper_type', '', '', '', 2, '', '新增操作', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (19, 0, '修改', '2', 'sys_oper_type', '', '', '', 2, '', '修改操作', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (20, 0, '删除', '3', 'sys_oper_type', '', '', '', 2, '', '删除操作', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (21, 0, '授权', '4', 'sys_oper_type', '', '', '', 2, '', '授权操作', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (22, 0, '导出', '5', 'sys_oper_type', '', '', '', 2, '', '导出操作', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (23, 0, '导入', '6', 'sys_oper_type', '', '', '', 2, '', '导入操作', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (24, 0, '强退', '7', 'sys_oper_type', '', '', '', 2, '', '强退操作', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (25, 0, '生成代码', '8', 'sys_oper_type', '', '', '', 2, '', '生成操作', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (26, 0, '清空数据', '9', 'sys_oper_type', '', '', '', 2, '', '清空操作', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (27, 0, '成功', '0', 'sys_notice_status', '', '', '', 2, '', '成功状态', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (28, 0, '失败', '1', 'sys_notice_status', '', '', '', 2, '', '失败状态', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (29, 0, '登录', '10', 'sys_oper_type', '', '', '', 2, '', '登录操作', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (30, 0, '退出', '11', 'sys_oper_type', '', '', '', 2, '', '', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (31, 0, '获取验证码', '12', 'sys_oper_type', '', '', '', 2, '', '获取验证码', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_data` VALUES (32, 0, '正常', '1', 'sys_content_status', '', '', '', 1, '', '', 1, 1, '2021-05-13 19:56:40.845', '2021-05-13 19:56:40.845', NULL);
INSERT INTO `sys_dict_data` VALUES (33, 1, '禁用', '2', 'sys_content_status', '', '', '', 1, '', '', 1, 1, '2021-05-13 19:56:40.845', '2021-05-13 19:56:40.845', NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dict_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dict_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `created_at` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) NULL DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`dict_id`) USING BTREE,
  INDEX `idx_sys_dict_type_create_by`(`create_by`) USING BTREE,
  INDEX `idx_sys_dict_type_update_by`(`update_by`) USING BTREE,
  INDEX `idx_sys_dict_type_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '系统开关', 'sys_normal_disable', 2, '系统开关列表', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_type` VALUES (2, '用户性别', 'sys_user_sex', 2, '用户性别列表', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_type` VALUES (3, '菜单状态', 'sys_show_hide', 2, '菜单状态列表', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_type` VALUES (4, '系统是否', 'sys_yes_no', 2, '系统是否列表', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_type` VALUES (5, '任务状态', 'sys_job_status', 2, '任务状态列表', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_type` VALUES (6, '任务分组', 'sys_job_group', 2, '任务分组列表', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', 2, '通知类型列表', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_type` VALUES (8, '系统状态', 'sys_common_status', 2, '登录状态列表', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', 2, '操作类型列表', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_type` VALUES (10, '通知状态', 'sys_notice_status', 2, '通知状态列表', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:37.914', NULL);
INSERT INTO `sys_dict_type` VALUES (11, '内容状态', 'sys_content_status', 2, '', 1, 1, '2021-05-13 19:56:40.813', '2021-05-13 19:56:40.813', NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `job_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `job_type` tinyint(4) NULL DEFAULT NULL,
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `invoke_target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `args` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `misfire_policy` bigint(20) NULL DEFAULT NULL,
  `concurrent` tinyint(4) NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  `entry_id` smallint(6) NULL DEFAULT NULL,
  `created_at` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) NULL DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) NULL DEFAULT NULL COMMENT '删除时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`job_id`) USING BTREE,
  INDEX `idx_sys_job_deleted_at`(`deleted_at`) USING BTREE,
  INDEX `idx_sys_job_create_by`(`create_by`) USING BTREE,
  INDEX `idx_sys_job_update_by`(`update_by`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '接口测试', 'DEFAULT', 1, '0/5 * * * * ', 'http://localhost:8000', '', 1, 1, 1, 0, '2021-05-13 19:56:37.914', '2021-06-14 20:59:55.417', NULL, 1, 1);
INSERT INTO `sys_job` VALUES (2, '函数测试', 'DEFAULT', 2, '0/5 * * * * ', 'ExamplesOne', '参数', 1, 1, 1, 0, '2021-05-13 19:56:37.914', '2021-05-31 23:55:37.221', NULL, 1, 1);

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键编码',
  `username` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `status` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `ipaddr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属地',
  `browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览器',
  `os` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统',
  `platform` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '固件',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '登录时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '信息',
  `created_at` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) NULL DEFAULT NULL COMMENT '最后更新时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_login_log_create_by`(`create_by`) USING BTREE,
  INDEX `idx_sys_login_log_update_by`(`update_by`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `icon` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `path` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `paths` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `menu_type` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `action` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `parent_id` smallint(6) NULL DEFAULT NULL,
  `no_cache` tinyint(1) NULL DEFAULT NULL,
  `breadcrumb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sort` tinyint(4) NULL DEFAULT NULL,
  `visible` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_frame` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `created_at` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) NULL DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`menu_id`) USING BTREE,
  INDEX `idx_sys_menu_deleted_at`(`deleted_at`) USING BTREE,
  INDEX `idx_sys_menu_create_by`(`create_by`) USING BTREE,
  INDEX `idx_sys_menu_update_by`(`update_by`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 585 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (2, 'Admin', '系统管理', 'api-server', '/server', '/0/2', 'M', '无', '', 0, 1, '', 'Layout', 10, '0', '1', 0, 1, '2021-05-20 21:58:45.679', '2022-12-12 16:53:37.986', '2022-12-13 10:00:48.000');
INSERT INTO `sys_menu` VALUES (3, 'SysUserManage', '用户管理', 'user', '/server/sys-user', '/0/2/3', 'C', '无', 'admin:sysUser:list', 2, 0, '', '/admin/sys-user/index', 10, '0', '1', 0, 1, '2021-05-20 22:08:44.526', '2022-12-12 18:00:30.295', NULL);
INSERT INTO `sys_menu` VALUES (43, '', '新增管理员', 'app-group-fill', '', '/0/2/3/43', 'F', 'POST', 'admin:sysUser:add', 3, 0, '', '', 10, '0', '1', 0, 1, '2021-05-20 22:08:44.526', '2022-12-12 18:00:30.356', NULL);
INSERT INTO `sys_menu` VALUES (44, '', '查询管理员', 'app-group-fill', '', '/0/2/3/44', 'F', 'GET', 'admin:sysUser:query', 3, 0, '', '', 40, '0', '1', 0, 1, '2021-05-20 22:08:44.526', '2022-12-12 18:00:30.419', NULL);
INSERT INTO `sys_menu` VALUES (45, '', '修改管理员', 'app-group-fill', '', '/0/2/3/45', 'F', 'PUT', 'admin:sysUser:edit', 3, 0, '', '', 30, '0', '1', 0, 1, '2021-05-20 22:08:44.526', '2022-12-12 18:00:30.488', NULL);
INSERT INTO `sys_menu` VALUES (46, '', '删除管理员', 'app-group-fill', '', '/0/2/3/46', 'F', 'DELETE', 'admin:sysUser:remove', 3, 0, '', '', 20, '0', '1', 0, 1, '2021-05-20 22:08:44.526', '2022-12-12 18:00:30.554', NULL);
INSERT INTO `sys_menu` VALUES (51, 'SysMenuManage', '菜单管理', 'tree-table', '/server/sys-menu', '/0/2/51', 'C', '无', 'admin:sysMenu:list', 2, 1, '', '/admin/sys-menu/index', 30, '0', '1', 0, 1, '2021-05-20 22:08:44.526', '2022-12-12 18:01:08.543', NULL);
INSERT INTO `sys_menu` VALUES (52, 'SysRoleManage', '角色管理', 'peoples', '/admin/sys-role', '/0/2/52', 'C', '无', 'admin:sysRole:list', 2, 1, '', '/admin/sys-role/index', 20, '1', '1', 0, 1, '2021-05-20 22:08:44.526', '2022-12-12 16:53:38.555', NULL);
INSERT INTO `sys_menu` VALUES (56, 'SysDeptManage', '部门管理', 'tree', '/admin/sys-dept', '/0/2/56', 'C', '无', 'admin:sysDept:list', 2, 0, '', '/admin/sys-dept/index', 40, '1', '1', 0, 1, '2021-05-20 22:08:44.526', '2022-12-12 16:53:38.634', NULL);
INSERT INTO `sys_menu` VALUES (57, 'SysPostManage', '岗位管理', 'pass', '/admin/sys-post', '/0/2/57', 'C', '无', 'admin:sysPost:list', 2, 0, '', '/admin/sys-post/index', 50, '1', '1', 0, 1, '2021-05-20 22:08:44.526', '2022-12-12 16:53:38.720', NULL);
INSERT INTO `sys_menu` VALUES (58, 'Dict', '字典管理', 'education', '/admin/dict', '/0/2/58', 'C', '无', 'admin:sysDictType:list', 2, 0, '', '/admin/dict/index', 60, '1', '1', 0, 1, '2021-05-20 22:08:44.526', '2022-12-12 16:53:38.801', NULL);
INSERT INTO `sys_menu` VALUES (59, 'SysDictDataManage', '字典数据', 'education', '/admin/dict/data/:dictId', '/0/2/59', 'C', '无', 'admin:sysDictData:list', 2, 0, '', '/admin/dict/data', 100, '1', '1', 0, 1, '2021-05-20 22:08:44.526', '2022-12-12 16:53:38.883', NULL);
INSERT INTO `sys_menu` VALUES (60, 'Tools', '开发工具', 'dev-tools', '/dev-tools', '/0/60', 'M', '无', '', 0, 0, '', 'Layout', 40, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2022-12-12 09:56:26.739', '2022-12-13 10:00:53.000');
INSERT INTO `sys_menu` VALUES (61, 'Swagger', '系统接口', 'guide', '/dev-tools/swagger', '/0/60/61', 'C', '无', '', 60, 0, '', '/dev-tools/swagger/index', 1, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2022-12-12 09:56:32.090', NULL);
INSERT INTO `sys_menu` VALUES (62, 'SysConfigManage', '参数管理', 'swagger', '/admin/sys-config', '/0/2/62', 'C', '无', 'admin:sysConfig:list', 2, 0, '', '/admin/sys-config/index', 70, '1', '1', 0, 1, '2021-05-20 22:08:44.526', '2022-12-12 16:53:38.966', NULL);
INSERT INTO `sys_menu` VALUES (211, 'Log', '日志管理', 'log', '/log', '/0/2/211', 'M', '', '', 2, 0, '', '/log/index', 80, '1', '1', 0, 1, '2021-05-20 22:08:44.526', '2022-12-12 16:53:39.047', NULL);
INSERT INTO `sys_menu` VALUES (212, 'SysLoginLogManage', '登录日志', 'logininfor', '/admin/sys-login-log', '/0/2/211/212', 'C', '', 'admin:sysLoginLog:list', 211, 0, '', '/admin/sys-login-log/index', 1, '0', '1', 0, 1, '2021-05-20 22:08:44.526', '2022-12-12 16:53:39.125', NULL);
INSERT INTO `sys_menu` VALUES (216, 'OperLog', '操作日志', 'skill', '/admin/sys-oper-log', '/0/2/211/216', 'C', '', 'admin:sysOperLog:list', 211, 0, '', '/admin/sys-oper-log/index', 1, '0', '1', 0, 1, '2021-05-20 22:08:44.526', '2022-12-12 16:53:39.202', NULL);
INSERT INTO `sys_menu` VALUES (220, '', '新增菜单', 'app-group-fill', '', '/0/2/51/220', 'F', '', 'admin:sysMenu:add', 51, 0, '', '', 1, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2022-12-12 18:01:08.622', NULL);
INSERT INTO `sys_menu` VALUES (221, '', '修改菜单', 'app-group-fill', '', '/0/2/51/221', 'F', '', 'admin:sysMenu:edit', 51, 0, '', '', 1, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2022-12-12 18:01:08.689', NULL);
INSERT INTO `sys_menu` VALUES (222, '', '查询菜单', 'app-group-fill', '', '/0/2/51/222', 'F', '', 'admin:sysMenu:query', 51, 0, '', '', 1, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2022-12-12 18:01:08.755', NULL);
INSERT INTO `sys_menu` VALUES (223, '', '删除菜单', 'app-group-fill', '', '/0/2/51/223', 'F', '', 'admin:sysMenu:remove', 51, 0, '', '', 1, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2022-12-12 18:01:08.821', NULL);
INSERT INTO `sys_menu` VALUES (224, '', '新增角色', 'app-group-fill', '', '/0/2/52/224', 'F', '', 'admin:sysRole:add', 52, 0, '', '', 1, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2022-12-12 16:53:39.601', NULL);
INSERT INTO `sys_menu` VALUES (225, '', '查询角色', 'app-group-fill', '', '/0/2/52/225', 'F', '', 'admin:sysRole:query', 52, 0, '', '', 1, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2022-12-12 16:53:39.682', NULL);
INSERT INTO `sys_menu` VALUES (226, '', '修改角色', 'app-group-fill', '', '/0/2/52/226', 'F', '', 'admin:sysRole:update', 52, 0, '', '', 1, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2022-12-12 16:53:39.768', NULL);
INSERT INTO `sys_menu` VALUES (227, '', '删除角色', 'app-group-fill', '', '/0/2/52/227', 'F', '', 'admin:sysRole:remove', 52, 0, '', '', 1, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2022-12-12 16:53:39.847', NULL);
INSERT INTO `sys_menu` VALUES (228, '', '查询部门', 'app-group-fill', '', '/0/2/56/228', 'F', '', 'admin:sysDept:query', 56, 0, '', '', 40, '0', '1', 0, 1, '2021-05-20 22:08:44.526', '2022-12-12 16:53:39.933', NULL);
INSERT INTO `sys_menu` VALUES (229, '', '新增部门', 'app-group-fill', '', '/0/2/56/229', 'F', '', 'admin:sysDept:add', 56, 0, '', '', 10, '0', '1', 0, 1, '2021-05-20 22:08:44.526', '2022-12-12 16:53:40.016', NULL);
INSERT INTO `sys_menu` VALUES (230, '', '修改部门', 'app-group-fill', '', '/0/2/56/230', 'F', '', 'admin:sysDept:edit', 56, 0, '', '', 30, '0', '1', 0, 1, '2021-05-20 22:08:44.526', '2022-12-12 16:53:40.099', NULL);
INSERT INTO `sys_menu` VALUES (231, '', '删除部门', 'app-group-fill', '', '/0/2/56/231', 'F', '', 'admin:sysDept:remove', 56, 0, '', '', 20, '0', '1', 0, 1, '2021-05-20 22:08:44.526', '2022-12-12 16:53:40.178', NULL);
INSERT INTO `sys_menu` VALUES (232, '', '查询岗位', 'app-group-fill', '', '/0/2/57/232', 'F', '', 'admin:sysPost:query', 57, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2022-12-12 16:53:40.258', NULL);
INSERT INTO `sys_menu` VALUES (233, '', '新增岗位', 'app-group-fill', '', '/0/2/57/233', 'F', '', 'admin:sysPost:add', 57, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2022-12-12 16:53:40.338', NULL);
INSERT INTO `sys_menu` VALUES (234, '', '修改岗位', 'app-group-fill', '', '/0/2/57/234', 'F', '', 'admin:sysPost:edit', 57, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2022-12-12 16:53:40.418', NULL);
INSERT INTO `sys_menu` VALUES (235, '', '删除岗位', 'app-group-fill', '', '/0/2/57/235', 'F', '', 'admin:sysPost:remove', 57, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2022-12-12 16:53:40.496', NULL);
INSERT INTO `sys_menu` VALUES (236, '', '查询字典', 'app-group-fill', '', '/0/2/58/236', 'F', '', 'admin:sysDictType:query', 58, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2022-12-12 16:53:40.578', NULL);
INSERT INTO `sys_menu` VALUES (237, '', '新增类型', 'app-group-fill', '', '/0/2/58/237', 'F', '', 'admin:sysDictType:add', 58, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2022-12-12 16:53:40.656', NULL);
INSERT INTO `sys_menu` VALUES (238, '', '修改类型', 'app-group-fill', '', '/0/2/58/238', 'F', '', 'admin:sysDictType:edit', 58, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2022-12-12 16:53:40.736', NULL);
INSERT INTO `sys_menu` VALUES (239, '', '删除类型', 'app-group-fill', '', '/0/2/58/239', 'F', '', 'system:sysdicttype:remove', 58, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2022-12-12 16:53:40.815', NULL);
INSERT INTO `sys_menu` VALUES (240, '', '查询数据', 'app-group-fill', '', '/0/2/59/240', 'F', '', 'admin:sysDictData:query', 59, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2022-12-12 16:53:40.900', NULL);
INSERT INTO `sys_menu` VALUES (241, '', '新增数据', 'app-group-fill', '', '/0/2/59/241', 'F', '', 'admin:sysDictData:add', 59, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2022-12-12 16:53:40.981', NULL);
INSERT INTO `sys_menu` VALUES (242, '', '修改数据', 'app-group-fill', '', '/0/2/59/242', 'F', '', 'admin:sysDictData:edit', 59, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2022-12-12 16:53:41.065', NULL);
INSERT INTO `sys_menu` VALUES (243, '', '删除数据', 'app-group-fill', '', '/0/2/59/243', 'F', '', 'admin:sysDictData:remove', 59, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2022-12-12 16:53:41.146', NULL);
INSERT INTO `sys_menu` VALUES (244, '', '查询参数', 'app-group-fill', '', '/0/2/62/244', 'F', '', 'admin:sysConfig:query', 62, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2022-12-12 16:53:41.227', NULL);
INSERT INTO `sys_menu` VALUES (245, '', '新增参数', 'app-group-fill', '', '/0/2/62/245', 'F', '', 'admin:sysConfig:add', 62, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2022-12-12 16:53:41.310', NULL);
INSERT INTO `sys_menu` VALUES (246, '', '修改参数', 'app-group-fill', '', '/0/2/62/246', 'F', '', 'admin:sysConfig:edit', 62, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2022-12-12 16:53:41.390', NULL);
INSERT INTO `sys_menu` VALUES (247, '', '删除参数', 'app-group-fill', '', '/0/2/62/247', 'F', '', 'admin:sysConfig:remove', 62, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2022-12-12 16:53:41.470', NULL);
INSERT INTO `sys_menu` VALUES (248, '', '查询登录日志', 'app-group-fill', '', '/0/2/211/212/248', 'F', '', 'admin:sysLoginLog:query', 212, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2022-12-12 16:53:41.551', NULL);
INSERT INTO `sys_menu` VALUES (249, '', '删除登录日志', 'app-group-fill', '', '/0/2/211/212/249', 'F', '', 'admin:sysLoginLog:remove', 212, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2022-12-12 16:53:41.629', NULL);
INSERT INTO `sys_menu` VALUES (250, '', '查询操作日志', 'app-group-fill', '', '/0/2/211/216/250', 'F', '', 'admin:sysOperLog:query', 216, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2022-12-12 16:53:41.706', NULL);
INSERT INTO `sys_menu` VALUES (251, '', '删除操作日志', 'app-group-fill', '', '/0/2/211/216/251', 'F', '', 'admin:sysOperLog:remove', 216, 0, '', '', 0, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2022-12-12 16:53:41.785', NULL);
INSERT INTO `sys_menu` VALUES (261, 'Gen', '代码生成', 'code', '/dev-tools/gen', '/0/60/261', 'C', '', '', 60, 0, '', '/dev-tools/gen/index', 2, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2022-12-12 09:56:32.218', NULL);
INSERT INTO `sys_menu` VALUES (262, 'EditTable', '代码生成修改', 'build', '/dev-tools/editTable', '/0/60/262', 'C', '', '', 60, 0, '', '/dev-tools/gen/editTable', 100, '1', '1', 1, 1, '2020-04-11 15:52:48.000', '2022-12-12 09:56:32.345', NULL);
INSERT INTO `sys_menu` VALUES (264, 'Build', '表单构建', 'build', '/dev-tools/build', '/0/60/264', 'C', '', '', 60, 0, '', '/dev-tools/build/index', 1, '0', '1', 1, 1, '2020-04-11 15:52:48.000', '2022-12-12 09:56:32.470', NULL);
INSERT INTO `sys_menu` VALUES (269, 'ServerMonitor', '服务监控', 'druid', '/sys-tools/monitor', '/0/537/269', 'C', '', 'sysTools:serverMonitor:list', 537, 0, '', '/sys-tools/monitor', 0, '0', '1', 1, 1, '2020-04-14 00:28:19.000', '2022-12-12 15:44:19.274', NULL);
INSERT INTO `sys_menu` VALUES (459, 'Schedule', '定时任务', 'time-range', '/schedule', '/0/459', 'M', '无', '', 0, 0, '', 'Layout', 20, '1', '1', 1, 1, '2020-08-03 09:17:37.000', '2022-12-12 15:53:58.700', '2022-12-13 10:00:56.000');
INSERT INTO `sys_menu` VALUES (460, 'ScheduleManage', 'Schedule', 'job', '/schedule/manage', '/0/459/460', 'C', '无', 'job:sysJob:list', 459, 0, '', '/schedule/index', 0, '1', '1', 1, 1, '2020-08-03 09:17:37.000', '2022-12-12 15:53:58.776', NULL);
INSERT INTO `sys_menu` VALUES (461, 'sys_job', '分页获取定时任务', 'app-group-fill', '', '/0/459/460/461', 'F', '无', 'job:sysJob:query', 460, 0, '', '', 0, '0', '1', 1, 1, '2020-08-03 09:17:37.000', '2022-12-12 15:53:58.854', NULL);
INSERT INTO `sys_menu` VALUES (462, 'sys_job', '创建定时任务', 'app-group-fill', '', '/0/459/460/462', 'F', '无', 'job:sysJob:add', 460, 0, '', '', 0, '0', '1', 1, 1, '2020-08-03 09:17:37.000', '2022-12-12 15:53:58.928', NULL);
INSERT INTO `sys_menu` VALUES (463, 'sys_job', '修改定时任务', 'app-group-fill', '', '/0/459/460/463', 'F', '无', 'job:sysJob:edit', 460, 0, '', '', 0, '0', '1', 1, 1, '2020-08-03 09:17:37.000', '2022-12-12 15:53:59.003', NULL);
INSERT INTO `sys_menu` VALUES (464, 'sys_job', '删除定时任务', 'app-group-fill', '', '/0/459/460/464', 'F', '无', 'job:sysJob:remove', 460, 0, '', '', 0, '0', '1', 1, 1, '2020-08-03 09:17:37.000', '2022-12-12 15:53:59.079', NULL);
INSERT INTO `sys_menu` VALUES (471, 'JobLog', '日志', 'bug', '/schedule/log', '/0/459/471', 'C', '', '', 459, 0, '', '/schedule/log', 0, '1', '1', 1, 1, '2020-08-05 21:24:46.000', '2022-12-12 15:53:59.157', NULL);
INSERT INTO `sys_menu` VALUES (528, 'SysApiManage', '接口管理', 'api-doc', '/admin/sys-api', '/0/2/528', 'C', '无', 'admin:sysApi:list', 2, 0, '', '/admin/sys-api/index', 0, '1', '0', 0, 1, '2021-05-20 22:08:44.526', '2022-12-12 16:53:41.863', NULL);
INSERT INTO `sys_menu` VALUES (529, '', '查询接口', 'app-group-fill', '', '/0/2/528/529', 'F', '无', 'admin:sysApi:query', 528, 0, '', '', 40, '0', '0', 0, 1, '2021-05-20 22:08:44.526', '2022-12-12 16:53:41.942', NULL);
INSERT INTO `sys_menu` VALUES (531, '', '修改接口', 'app-group-fill', '', '/0/2/528/531', 'F', '无', 'admin:sysApi:edit', 528, 0, '', '', 30, '0', '0', 0, 1, '2021-05-20 22:08:44.526', '2022-12-12 16:53:42.020', NULL);
INSERT INTO `sys_menu` VALUES (537, 'SysTools', '系统工具', 'system-tools', '/sys-tools', '/0/537', 'M', '', '', 0, 0, '', 'Layout', 30, '0', '1', 1, 1, '2021-05-21 11:13:32.166', '2022-12-12 15:44:19.274', '2022-12-13 10:01:01.000');
INSERT INTO `sys_menu` VALUES (540, 'SysConfigSet', '参数设置', 'system-tools', '/admin/sys-config/set', '/0/2/540', 'C', '', 'admin:sysConfigSet:list', 2, 0, '', '/admin/sys-config/set', 0, '1', '1', 1, 1, '2021-05-25 16:06:52.560', '2022-12-12 16:53:42.098', NULL);
INSERT INTO `sys_menu` VALUES (542, '', '修改', 'upload', '', '/0/2/540/542', 'F', '', 'admin:sysConfigSet:update', 540, 0, '', '', 0, '0', '1', 1, 1, '2021-06-13 11:45:48.670', '2022-12-12 16:53:42.177', NULL);
INSERT INTO `sys_menu` VALUES (543, 'Admin', '运营', 'pass', '/admin', '/0/543', 'M', '无', '', 0, 0, '', 'Layout', 0, '0', '0', 1, 1, '2022-12-12 11:57:42.538', '2022-12-12 16:53:57.058', NULL);
INSERT INTO `sys_menu` VALUES (544, 'UserIdentityManage', '用户人设表', 'pass', '/admin/user-identity', '/0/543/544', 'C', '无', 'admin:userIdentity:list', 543, 0, '', '/admin/user-identity/index', 0, '0', '0', 1, 2, '2022-12-12 11:57:42.781', '2022-12-12 16:53:57.124', NULL);
INSERT INTO `sys_menu` VALUES (545, '', '分页获取用户身份字典表', '', 'user_identity', '/0/543/544/545', 'F', '无', 'admin:userIdentity:query', 544, 0, '', '', 0, '0', '0', 1, 1, '2022-12-12 11:57:43.086', '2022-12-12 16:53:57.189', NULL);
INSERT INTO `sys_menu` VALUES (546, '', '创建用户身份字典表', '', 'user_identity', '/0/543/544/546', 'F', '无', 'admin:userIdentity:add', 544, 0, '', '', 0, '0', '0', 1, 1, '2022-12-12 11:57:43.414', '2022-12-12 16:53:57.253', NULL);
INSERT INTO `sys_menu` VALUES (547, '', '修改用户身份字典表', '', 'user_identity', '/0/543/544/547', 'F', '无', 'admin:userIdentity:edit', 544, 0, '', '', 0, '0', '0', 1, 1, '2022-12-12 11:57:43.734', '2022-12-12 16:53:57.332', NULL);
INSERT INTO `sys_menu` VALUES (548, '', '删除用户身份字典表', '', 'user_identity', '/0/543/544/548', 'F', '无', 'admin:userIdentity:remove', 544, 0, '', '', 0, '0', '0', 1, 1, '2022-12-12 11:57:44.054', '2022-12-12 16:53:57.406', NULL);
INSERT INTO `sys_menu` VALUES (549, '', '用户身份字典表', 'pass', '/user-identity', '/0/549', 'M', '无', '', 0, 0, '', 'Layout', 0, '0', '0', 1, 0, '2022-12-12 11:57:44.770', '2022-12-12 11:57:44.842', '2022-12-12 11:59:33.211');
INSERT INTO `sys_menu` VALUES (550, 'UserIdentityManage', '用户身份字典表', 'pass', '/admin/user-identity', '/0/549/550', 'C', '无', 'admin:userIdentity:list', 549, 0, '', '/admin/user-identity/index', 0, '0', '0', 1, 1, '2022-12-12 11:57:45.009', '2022-12-12 11:57:45.146', NULL);
INSERT INTO `sys_menu` VALUES (551, '', '分页获取用户身份字典表', '', 'user_identity', '/0/549/550/551', 'F', '无', 'admin:userIdentity:query', 550, 0, '', '', 0, '0', '0', 1, 1, '2022-12-12 11:57:45.315', '2022-12-12 11:57:45.453', NULL);
INSERT INTO `sys_menu` VALUES (552, '', '创建用户身份字典表', '', 'user_identity', '/0/549/550/552', 'F', '无', 'admin:userIdentity:add', 550, 0, '', '', 0, '0', '0', 1, 1, '2022-12-12 11:57:45.623', '2022-12-12 11:57:45.760', NULL);
INSERT INTO `sys_menu` VALUES (553, '', '修改用户身份字典表', '', 'user_identity', '/0/549/550/553', 'F', '无', 'admin:userIdentity:edit', 550, 0, '', '', 0, '0', '0', 1, 1, '2022-12-12 11:57:45.928', '2022-12-12 11:57:46.066', NULL);
INSERT INTO `sys_menu` VALUES (554, '', '删除用户身份字典表', '', 'user_identity', '/0/549/550/554', 'F', '无', 'admin:userIdentity:remove', 550, 0, '', '', 0, '0', '0', 1, 1, '2022-12-12 11:57:46.241', '2022-12-12 11:57:46.380', NULL);
INSERT INTO `sys_menu` VALUES (555, '', '用户人设', 'pass', '/user-identity-bind', '/0/555', 'C', '无', '', 0, 0, '', 'Layout', 0, '0', '0', 1, 1, '2022-12-12 12:14:35.223', '2022-12-12 12:15:24.125', '2022-12-12 12:17:49.049');
INSERT INTO `sys_menu` VALUES (556, 'UserIdentityBindManage', 'UserIdentityBind', 'pass', '/admin/user-identity-bind', '/0/555/556', 'C', '无', 'admin:userIdentityBind:list', 555, 0, '', '/admin/user-identity-bind/index', 0, '0', '0', 1, 1, '2022-12-12 12:14:35.496', '2022-12-12 12:15:24.194', NULL);
INSERT INTO `sys_menu` VALUES (557, '', '分页获取UserIdentityBind', '', 'user_identity_bind', '/0/555/556/557', 'F', '无', 'admin:userIdentityBind:query', 556, 0, '', '', 0, '0', '0', 1, 1, '2022-12-12 12:14:35.825', '2022-12-12 12:15:24.259', NULL);
INSERT INTO `sys_menu` VALUES (558, '', '创建UserIdentityBind', '', 'user_identity_bind', '/0/555/556/558', 'F', '无', 'admin:userIdentityBind:add', 556, 0, '', '', 0, '0', '0', 1, 1, '2022-12-12 12:14:36.245', '2022-12-12 12:15:24.336', NULL);
INSERT INTO `sys_menu` VALUES (559, '', '修改UserIdentityBind', '', 'user_identity_bind', '/0/555/556/559', 'F', '无', 'admin:userIdentityBind:edit', 556, 0, '', '', 0, '0', '0', 1, 1, '2022-12-12 12:14:36.624', '2022-12-12 12:15:24.402', NULL);
INSERT INTO `sys_menu` VALUES (560, '', '删除UserIdentityBind', '', 'user_identity_bind', '/0/555/556/560', 'F', '无', 'admin:userIdentityBind:remove', 556, 0, '', '', 0, '0', '0', 1, 1, '2022-12-12 12:14:36.941', '2022-12-12 12:15:24.469', NULL);
INSERT INTO `sys_menu` VALUES (561, '', '用户人设', 'pass', '/user-identity-bind', '/0/561', 'M', '无', '', 0, 0, '', 'Layout', 0, '0', '0', 1, 0, '2022-12-12 12:18:21.417', '2022-12-12 12:18:21.479', '2022-12-12 13:59:19.702');
INSERT INTO `sys_menu` VALUES (562, 'UserIdentityBindManage', '用户人设', 'pass', '/admin/user-identity-bind', '/0/561/562', 'C', '无', 'admin:userIdentityBind:list', 543, 0, '', '/admin/user-identity-bind/index', 0, '0', '0', 1, 1, '2022-12-12 12:18:21.637', '2022-12-12 13:59:15.885', '2022-12-12 14:29:18.123');
INSERT INTO `sys_menu` VALUES (563, '', '分页获取用户人设', '', 'user_identity_bind', '/0/561/562/563', 'F', '无', 'admin:userIdentityBind:query', 562, 0, '', '', 0, '0', '0', 1, 1, '2022-12-12 12:18:21.919', '2022-12-12 13:59:15.951', NULL);
INSERT INTO `sys_menu` VALUES (564, '', '创建用户人设', '', 'user_identity_bind', '/0/561/562/564', 'F', '无', 'admin:userIdentityBind:add', 562, 0, '', '', 0, '0', '0', 1, 1, '2022-12-12 12:18:22.204', '2022-12-12 13:59:16.012', NULL);
INSERT INTO `sys_menu` VALUES (565, '', '修改用户人设', '', 'user_identity_bind', '/0/561/562/565', 'F', '无', 'admin:userIdentityBind:edit', 562, 0, '', '', 0, '0', '0', 1, 1, '2022-12-12 12:18:22.488', '2022-12-12 13:59:16.077', NULL);
INSERT INTO `sys_menu` VALUES (566, '', '删除用户人设', '', 'user_identity_bind', '/0/561/562/566', 'F', '无', 'admin:userIdentityBind:remove', 562, 0, '', '', 0, '0', '0', 1, 1, '2022-12-12 12:18:22.811', '2022-12-12 13:59:16.140', NULL);
INSERT INTO `sys_menu` VALUES (567, '', '用户基本信息', 'pass', '/user', '/0/567', 'M', '无', '', 0, 0, '', 'Layout', 0, '0', '0', 1, 0, '2022-12-12 14:28:02.207', '2022-12-12 14:28:02.277', '2022-12-12 14:28:38.629');
INSERT INTO `sys_menu` VALUES (568, 'UserManage', '用户基本信息', 'pass', '/admin/user', '/0/567/568', 'C', '无', 'admin:user:list', 543, 0, '', '/admin/user/index', 0, '0', '0', 1, 1, '2022-12-12 14:28:02.456', '2022-12-12 14:28:34.686', '2022-12-12 14:32:12.060');
INSERT INTO `sys_menu` VALUES (569, '', '分页获取用户基本信息', '', 'user', '/0/567/568/569', 'F', '无', 'admin:user:query', 568, 0, '', '', 0, '0', '0', 1, 1, '2022-12-12 14:28:02.778', '2022-12-12 14:28:34.749', NULL);
INSERT INTO `sys_menu` VALUES (570, '', '创建用户基本信息', '', 'user', '/0/567/568/570', 'F', '无', 'admin:user:add', 568, 0, '', '', 0, '0', '0', 1, 1, '2022-12-12 14:28:03.096', '2022-12-12 14:28:34.817', NULL);
INSERT INTO `sys_menu` VALUES (571, '', '修改用户基本信息', '', 'user', '/0/567/568/571', 'F', '无', 'admin:user:edit', 568, 0, '', '', 0, '0', '0', 1, 1, '2022-12-12 14:28:03.429', '2022-12-12 14:28:34.877', NULL);
INSERT INTO `sys_menu` VALUES (572, '', '删除用户基本信息', '', 'user', '/0/567/568/572', 'F', '无', 'admin:user:remove', 568, 0, '', '', 0, '0', '0', 1, 1, '2022-12-12 14:28:03.744', '2022-12-12 14:28:34.942', NULL);
INSERT INTO `sys_menu` VALUES (573, '', '用户基本信息', 'pass', '/user-info', '/0/573', 'M', '无', '', 0, 0, '', 'Layout', 0, '0', '0', 1, 0, '2022-12-12 14:31:52.731', '2022-12-12 14:31:52.793', '2022-12-12 14:32:26.128');
INSERT INTO `sys_menu` VALUES (574, 'UserInfoManage', '用户基本信息', 'pass', '/admin/user-info', '/0/573/574', 'C', '无', 'admin:userInfo:list', 543, 0, '', '/admin/user-info/index', 0, '0', '0', 1, 1, '2022-12-12 14:31:52.967', '2022-12-12 15:52:13.879', NULL);
INSERT INTO `sys_menu` VALUES (575, '', '分页获取用户基本信息', '', 'user_info', '/0/573/574/575', 'F', '无', 'admin:userInfo:query', 574, 0, '', '', 0, '0', '0', 1, 1, '2022-12-12 14:31:53.493', '2022-12-12 15:52:14.055', NULL);
INSERT INTO `sys_menu` VALUES (576, '', '创建用户基本信息', '', 'user_info', '/0/573/574/576', 'F', '无', 'admin:userInfo:add', 574, 0, '', '', 0, '0', '0', 1, 1, '2022-12-12 14:31:53.851', '2022-12-12 15:52:14.124', NULL);
INSERT INTO `sys_menu` VALUES (577, '', '修改用户基本信息', '', 'user_info', '/0/573/574/577', 'F', '无', 'admin:userInfo:edit', 574, 0, '', '', 0, '0', '0', 1, 1, '2022-12-12 14:31:54.137', '2022-12-12 15:52:14.196', NULL);
INSERT INTO `sys_menu` VALUES (578, '', '删除用户基本信息', '', 'user_info', '/0/573/574/578', 'F', '无', 'admin:userInfo:remove', 574, 0, '', '', 0, '0', '0', 1, 1, '2022-12-12 14:31:54.559', '2022-12-12 15:52:14.260', NULL);
INSERT INTO `sys_menu` VALUES (579, '', '用户身份字典表', 'pass', '/user-identity', '/0/579', 'M', '无', '', 0, 0, '', 'Layout', 0, '0', '0', 1, 0, '2022-12-12 15:42:04.721', '2022-12-12 15:42:04.795', '2022-12-12 15:43:53.913');
INSERT INTO `sys_menu` VALUES (580, 'UserIdentityManage', '用户身份字典表', 'pass', '/admin/user-identity', '/0/579/580', 'C', '无', 'admin:userIdentity:list', 579, 0, '', '/admin/user-identity/index', 0, '0', '0', 1, 1, '2022-12-12 15:42:04.988', '2022-12-12 15:42:05.151', NULL);
INSERT INTO `sys_menu` VALUES (581, '', '分页获取用户身份字典表', '', 'user_identity', '/0/579/580/581', 'F', '无', 'admin:userIdentity:query', 580, 0, '', '', 0, '0', '0', 1, 1, '2022-12-12 15:42:05.358', '2022-12-12 15:42:05.511', NULL);
INSERT INTO `sys_menu` VALUES (582, '', '创建用户身份字典表', '', 'user_identity', '/0/579/580/582', 'F', '无', 'admin:userIdentity:add', 580, 0, '', '', 0, '0', '0', 1, 1, '2022-12-12 15:42:05.696', '2022-12-12 15:42:05.849', NULL);
INSERT INTO `sys_menu` VALUES (583, '', '修改用户身份字典表', '', 'user_identity', '/0/579/580/583', 'F', '无', 'admin:userIdentity:edit', 580, 0, '', '', 0, '0', '0', 1, 1, '2022-12-12 15:42:06.035', '2022-12-12 15:42:06.185', NULL);
INSERT INTO `sys_menu` VALUES (584, '', '删除用户身份字典表', '', 'user_identity', '/0/579/580/584', 'F', '无', 'admin:userIdentity:remove', 580, 0, '', '', 0, '0', '0', 1, 1, '2022-12-12 15:42:06.366', '2022-12-12 15:42:06.511', NULL);

-- ----------------------------
-- Table structure for sys_menu_api_rule
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_api_rule`;
CREATE TABLE `sys_menu_api_rule`  (
  `sys_menu_menu_id` bigint(20) NOT NULL,
  `sys_api_id` bigint(20) NOT NULL COMMENT '主键编码',
  PRIMARY KEY (`sys_menu_menu_id`, `sys_api_id`) USING BTREE,
  INDEX `fk_sys_menu_api_rule_sys_api`(`sys_api_id`) USING BTREE,
  CONSTRAINT `fk_sys_menu_api_rule_sys_api` FOREIGN KEY (`sys_api_id`) REFERENCES `sys_api` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_sys_menu_api_rule_sys_menu` FOREIGN KEY (`sys_menu_menu_id`) REFERENCES `sys_menu` (`menu_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu_api_rule
-- ----------------------------
INSERT INTO `sys_menu_api_rule` VALUES (212, 5);
INSERT INTO `sys_menu_api_rule` VALUES (216, 5);
INSERT INTO `sys_menu_api_rule` VALUES (212, 6);
INSERT INTO `sys_menu_api_rule` VALUES (216, 6);
INSERT INTO `sys_menu_api_rule` VALUES (250, 6);
INSERT INTO `sys_menu_api_rule` VALUES (212, 7);
INSERT INTO `sys_menu_api_rule` VALUES (216, 7);
INSERT INTO `sys_menu_api_rule` VALUES (212, 8);
INSERT INTO `sys_menu_api_rule` VALUES (216, 8);
INSERT INTO `sys_menu_api_rule` VALUES (212, 9);
INSERT INTO `sys_menu_api_rule` VALUES (216, 9);
INSERT INTO `sys_menu_api_rule` VALUES (212, 10);
INSERT INTO `sys_menu_api_rule` VALUES (216, 10);
INSERT INTO `sys_menu_api_rule` VALUES (212, 11);
INSERT INTO `sys_menu_api_rule` VALUES (216, 11);
INSERT INTO `sys_menu_api_rule` VALUES (212, 15);
INSERT INTO `sys_menu_api_rule` VALUES (216, 15);
INSERT INTO `sys_menu_api_rule` VALUES (212, 16);
INSERT INTO `sys_menu_api_rule` VALUES (216, 16);
INSERT INTO `sys_menu_api_rule` VALUES (58, 21);
INSERT INTO `sys_menu_api_rule` VALUES (212, 21);
INSERT INTO `sys_menu_api_rule` VALUES (216, 21);
INSERT INTO `sys_menu_api_rule` VALUES (236, 21);
INSERT INTO `sys_menu_api_rule` VALUES (212, 22);
INSERT INTO `sys_menu_api_rule` VALUES (216, 22);
INSERT INTO `sys_menu_api_rule` VALUES (212, 23);
INSERT INTO `sys_menu_api_rule` VALUES (216, 23);
INSERT INTO `sys_menu_api_rule` VALUES (238, 23);
INSERT INTO `sys_menu_api_rule` VALUES (59, 24);
INSERT INTO `sys_menu_api_rule` VALUES (212, 24);
INSERT INTO `sys_menu_api_rule` VALUES (216, 24);
INSERT INTO `sys_menu_api_rule` VALUES (240, 24);
INSERT INTO `sys_menu_api_rule` VALUES (212, 25);
INSERT INTO `sys_menu_api_rule` VALUES (216, 25);
INSERT INTO `sys_menu_api_rule` VALUES (242, 25);
INSERT INTO `sys_menu_api_rule` VALUES (58, 26);
INSERT INTO `sys_menu_api_rule` VALUES (212, 26);
INSERT INTO `sys_menu_api_rule` VALUES (216, 26);
INSERT INTO `sys_menu_api_rule` VALUES (236, 26);
INSERT INTO `sys_menu_api_rule` VALUES (56, 27);
INSERT INTO `sys_menu_api_rule` VALUES (212, 27);
INSERT INTO `sys_menu_api_rule` VALUES (216, 27);
INSERT INTO `sys_menu_api_rule` VALUES (228, 27);
INSERT INTO `sys_menu_api_rule` VALUES (212, 28);
INSERT INTO `sys_menu_api_rule` VALUES (216, 28);
INSERT INTO `sys_menu_api_rule` VALUES (230, 28);
INSERT INTO `sys_menu_api_rule` VALUES (212, 29);
INSERT INTO `sys_menu_api_rule` VALUES (216, 29);
INSERT INTO `sys_menu_api_rule` VALUES (226, 29);
INSERT INTO `sys_menu_api_rule` VALUES (212, 30);
INSERT INTO `sys_menu_api_rule` VALUES (216, 30);
INSERT INTO `sys_menu_api_rule` VALUES (212, 31);
INSERT INTO `sys_menu_api_rule` VALUES (216, 31);
INSERT INTO `sys_menu_api_rule` VALUES (212, 32);
INSERT INTO `sys_menu_api_rule` VALUES (216, 32);
INSERT INTO `sys_menu_api_rule` VALUES (212, 33);
INSERT INTO `sys_menu_api_rule` VALUES (216, 33);
INSERT INTO `sys_menu_api_rule` VALUES (212, 34);
INSERT INTO `sys_menu_api_rule` VALUES (216, 34);
INSERT INTO `sys_menu_api_rule` VALUES (212, 35);
INSERT INTO `sys_menu_api_rule` VALUES (216, 35);
INSERT INTO `sys_menu_api_rule` VALUES (212, 36);
INSERT INTO `sys_menu_api_rule` VALUES (216, 36);
INSERT INTO `sys_menu_api_rule` VALUES (212, 37);
INSERT INTO `sys_menu_api_rule` VALUES (216, 37);
INSERT INTO `sys_menu_api_rule` VALUES (212, 38);
INSERT INTO `sys_menu_api_rule` VALUES (216, 38);
INSERT INTO `sys_menu_api_rule` VALUES (51, 39);
INSERT INTO `sys_menu_api_rule` VALUES (212, 39);
INSERT INTO `sys_menu_api_rule` VALUES (216, 39);
INSERT INTO `sys_menu_api_rule` VALUES (222, 39);
INSERT INTO `sys_menu_api_rule` VALUES (212, 40);
INSERT INTO `sys_menu_api_rule` VALUES (216, 40);
INSERT INTO `sys_menu_api_rule` VALUES (212, 41);
INSERT INTO `sys_menu_api_rule` VALUES (216, 41);
INSERT INTO `sys_menu_api_rule` VALUES (221, 41);
INSERT INTO `sys_menu_api_rule` VALUES (212, 42);
INSERT INTO `sys_menu_api_rule` VALUES (216, 42);
INSERT INTO `sys_menu_api_rule` VALUES (212, 43);
INSERT INTO `sys_menu_api_rule` VALUES (216, 43);
INSERT INTO `sys_menu_api_rule` VALUES (52, 44);
INSERT INTO `sys_menu_api_rule` VALUES (212, 44);
INSERT INTO `sys_menu_api_rule` VALUES (216, 44);
INSERT INTO `sys_menu_api_rule` VALUES (225, 44);
INSERT INTO `sys_menu_api_rule` VALUES (212, 45);
INSERT INTO `sys_menu_api_rule` VALUES (216, 45);
INSERT INTO `sys_menu_api_rule` VALUES (226, 45);
INSERT INTO `sys_menu_api_rule` VALUES (212, 46);
INSERT INTO `sys_menu_api_rule` VALUES (216, 46);
INSERT INTO `sys_menu_api_rule` VALUES (226, 46);
INSERT INTO `sys_menu_api_rule` VALUES (212, 47);
INSERT INTO `sys_menu_api_rule` VALUES (216, 47);
INSERT INTO `sys_menu_api_rule` VALUES (226, 47);
INSERT INTO `sys_menu_api_rule` VALUES (212, 48);
INSERT INTO `sys_menu_api_rule` VALUES (216, 48);
INSERT INTO `sys_menu_api_rule` VALUES (62, 53);
INSERT INTO `sys_menu_api_rule` VALUES (212, 53);
INSERT INTO `sys_menu_api_rule` VALUES (216, 53);
INSERT INTO `sys_menu_api_rule` VALUES (244, 53);
INSERT INTO `sys_menu_api_rule` VALUES (212, 54);
INSERT INTO `sys_menu_api_rule` VALUES (216, 54);
INSERT INTO `sys_menu_api_rule` VALUES (246, 54);
INSERT INTO `sys_menu_api_rule` VALUES (212, 55);
INSERT INTO `sys_menu_api_rule` VALUES (216, 55);
INSERT INTO `sys_menu_api_rule` VALUES (212, 57);
INSERT INTO `sys_menu_api_rule` VALUES (216, 57);
INSERT INTO `sys_menu_api_rule` VALUES (212, 58);
INSERT INTO `sys_menu_api_rule` VALUES (216, 58);
INSERT INTO `sys_menu_api_rule` VALUES (57, 59);
INSERT INTO `sys_menu_api_rule` VALUES (212, 59);
INSERT INTO `sys_menu_api_rule` VALUES (216, 59);
INSERT INTO `sys_menu_api_rule` VALUES (232, 59);
INSERT INTO `sys_menu_api_rule` VALUES (212, 60);
INSERT INTO `sys_menu_api_rule` VALUES (216, 60);
INSERT INTO `sys_menu_api_rule` VALUES (234, 60);
INSERT INTO `sys_menu_api_rule` VALUES (212, 62);
INSERT INTO `sys_menu_api_rule` VALUES (216, 62);
INSERT INTO `sys_menu_api_rule` VALUES (212, 63);
INSERT INTO `sys_menu_api_rule` VALUES (216, 63);
INSERT INTO `sys_menu_api_rule` VALUES (212, 66);
INSERT INTO `sys_menu_api_rule` VALUES (216, 66);
INSERT INTO `sys_menu_api_rule` VALUES (212, 67);
INSERT INTO `sys_menu_api_rule` VALUES (216, 67);
INSERT INTO `sys_menu_api_rule` VALUES (212, 68);
INSERT INTO `sys_menu_api_rule` VALUES (216, 68);
INSERT INTO `sys_menu_api_rule` VALUES (212, 72);
INSERT INTO `sys_menu_api_rule` VALUES (216, 72);
INSERT INTO `sys_menu_api_rule` VALUES (212, 73);
INSERT INTO `sys_menu_api_rule` VALUES (216, 73);
INSERT INTO `sys_menu_api_rule` VALUES (212, 76);
INSERT INTO `sys_menu_api_rule` VALUES (216, 76);
INSERT INTO `sys_menu_api_rule` VALUES (212, 80);
INSERT INTO `sys_menu_api_rule` VALUES (216, 80);
INSERT INTO `sys_menu_api_rule` VALUES (241, 80);
INSERT INTO `sys_menu_api_rule` VALUES (212, 81);
INSERT INTO `sys_menu_api_rule` VALUES (216, 81);
INSERT INTO `sys_menu_api_rule` VALUES (237, 81);
INSERT INTO `sys_menu_api_rule` VALUES (212, 82);
INSERT INTO `sys_menu_api_rule` VALUES (216, 82);
INSERT INTO `sys_menu_api_rule` VALUES (229, 82);
INSERT INTO `sys_menu_api_rule` VALUES (212, 85);
INSERT INTO `sys_menu_api_rule` VALUES (216, 85);
INSERT INTO `sys_menu_api_rule` VALUES (212, 86);
INSERT INTO `sys_menu_api_rule` VALUES (216, 86);
INSERT INTO `sys_menu_api_rule` VALUES (212, 87);
INSERT INTO `sys_menu_api_rule` VALUES (216, 87);
INSERT INTO `sys_menu_api_rule` VALUES (245, 87);
INSERT INTO `sys_menu_api_rule` VALUES (212, 88);
INSERT INTO `sys_menu_api_rule` VALUES (216, 88);
INSERT INTO `sys_menu_api_rule` VALUES (220, 88);
INSERT INTO `sys_menu_api_rule` VALUES (212, 89);
INSERT INTO `sys_menu_api_rule` VALUES (216, 89);
INSERT INTO `sys_menu_api_rule` VALUES (233, 89);
INSERT INTO `sys_menu_api_rule` VALUES (212, 90);
INSERT INTO `sys_menu_api_rule` VALUES (216, 90);
INSERT INTO `sys_menu_api_rule` VALUES (224, 90);
INSERT INTO `sys_menu_api_rule` VALUES (212, 91);
INSERT INTO `sys_menu_api_rule` VALUES (216, 91);
INSERT INTO `sys_menu_api_rule` VALUES (212, 92);
INSERT INTO `sys_menu_api_rule` VALUES (216, 92);
INSERT INTO `sys_menu_api_rule` VALUES (531, 92);
INSERT INTO `sys_menu_api_rule` VALUES (212, 95);
INSERT INTO `sys_menu_api_rule` VALUES (216, 95);
INSERT INTO `sys_menu_api_rule` VALUES (212, 96);
INSERT INTO `sys_menu_api_rule` VALUES (216, 96);
INSERT INTO `sys_menu_api_rule` VALUES (212, 97);
INSERT INTO `sys_menu_api_rule` VALUES (216, 97);
INSERT INTO `sys_menu_api_rule` VALUES (212, 101);
INSERT INTO `sys_menu_api_rule` VALUES (216, 101);
INSERT INTO `sys_menu_api_rule` VALUES (242, 101);
INSERT INTO `sys_menu_api_rule` VALUES (212, 102);
INSERT INTO `sys_menu_api_rule` VALUES (216, 102);
INSERT INTO `sys_menu_api_rule` VALUES (238, 102);
INSERT INTO `sys_menu_api_rule` VALUES (212, 103);
INSERT INTO `sys_menu_api_rule` VALUES (216, 103);
INSERT INTO `sys_menu_api_rule` VALUES (230, 103);
INSERT INTO `sys_menu_api_rule` VALUES (212, 104);
INSERT INTO `sys_menu_api_rule` VALUES (216, 104);
INSERT INTO `sys_menu_api_rule` VALUES (212, 105);
INSERT INTO `sys_menu_api_rule` VALUES (216, 105);
INSERT INTO `sys_menu_api_rule` VALUES (212, 106);
INSERT INTO `sys_menu_api_rule` VALUES (216, 106);
INSERT INTO `sys_menu_api_rule` VALUES (226, 106);
INSERT INTO `sys_menu_api_rule` VALUES (212, 107);
INSERT INTO `sys_menu_api_rule` VALUES (216, 107);
INSERT INTO `sys_menu_api_rule` VALUES (226, 107);
INSERT INTO `sys_menu_api_rule` VALUES (212, 108);
INSERT INTO `sys_menu_api_rule` VALUES (216, 108);
INSERT INTO `sys_menu_api_rule` VALUES (246, 108);
INSERT INTO `sys_menu_api_rule` VALUES (212, 109);
INSERT INTO `sys_menu_api_rule` VALUES (216, 109);
INSERT INTO `sys_menu_api_rule` VALUES (221, 109);
INSERT INTO `sys_menu_api_rule` VALUES (212, 110);
INSERT INTO `sys_menu_api_rule` VALUES (216, 110);
INSERT INTO `sys_menu_api_rule` VALUES (234, 110);
INSERT INTO `sys_menu_api_rule` VALUES (212, 111);
INSERT INTO `sys_menu_api_rule` VALUES (216, 111);
INSERT INTO `sys_menu_api_rule` VALUES (212, 112);
INSERT INTO `sys_menu_api_rule` VALUES (216, 112);
INSERT INTO `sys_menu_api_rule` VALUES (212, 113);
INSERT INTO `sys_menu_api_rule` VALUES (216, 113);
INSERT INTO `sys_menu_api_rule` VALUES (212, 114);
INSERT INTO `sys_menu_api_rule` VALUES (216, 114);
INSERT INTO `sys_menu_api_rule` VALUES (249, 114);
INSERT INTO `sys_menu_api_rule` VALUES (212, 115);
INSERT INTO `sys_menu_api_rule` VALUES (216, 115);
INSERT INTO `sys_menu_api_rule` VALUES (251, 115);
INSERT INTO `sys_menu_api_rule` VALUES (212, 116);
INSERT INTO `sys_menu_api_rule` VALUES (216, 116);
INSERT INTO `sys_menu_api_rule` VALUES (212, 117);
INSERT INTO `sys_menu_api_rule` VALUES (216, 117);
INSERT INTO `sys_menu_api_rule` VALUES (212, 120);
INSERT INTO `sys_menu_api_rule` VALUES (216, 120);
INSERT INTO `sys_menu_api_rule` VALUES (243, 120);
INSERT INTO `sys_menu_api_rule` VALUES (212, 121);
INSERT INTO `sys_menu_api_rule` VALUES (216, 121);
INSERT INTO `sys_menu_api_rule` VALUES (239, 121);
INSERT INTO `sys_menu_api_rule` VALUES (212, 122);
INSERT INTO `sys_menu_api_rule` VALUES (216, 122);
INSERT INTO `sys_menu_api_rule` VALUES (231, 122);
INSERT INTO `sys_menu_api_rule` VALUES (212, 123);
INSERT INTO `sys_menu_api_rule` VALUES (216, 123);
INSERT INTO `sys_menu_api_rule` VALUES (212, 124);
INSERT INTO `sys_menu_api_rule` VALUES (216, 124);
INSERT INTO `sys_menu_api_rule` VALUES (212, 125);
INSERT INTO `sys_menu_api_rule` VALUES (216, 125);
INSERT INTO `sys_menu_api_rule` VALUES (247, 125);
INSERT INTO `sys_menu_api_rule` VALUES (212, 126);
INSERT INTO `sys_menu_api_rule` VALUES (216, 126);
INSERT INTO `sys_menu_api_rule` VALUES (223, 126);
INSERT INTO `sys_menu_api_rule` VALUES (212, 127);
INSERT INTO `sys_menu_api_rule` VALUES (216, 127);
INSERT INTO `sys_menu_api_rule` VALUES (235, 127);
INSERT INTO `sys_menu_api_rule` VALUES (212, 128);
INSERT INTO `sys_menu_api_rule` VALUES (216, 128);
INSERT INTO `sys_menu_api_rule` VALUES (227, 128);
INSERT INTO `sys_menu_api_rule` VALUES (212, 131);
INSERT INTO `sys_menu_api_rule` VALUES (216, 131);
INSERT INTO `sys_menu_api_rule` VALUES (212, 132);
INSERT INTO `sys_menu_api_rule` VALUES (216, 132);
INSERT INTO `sys_menu_api_rule` VALUES (212, 133);
INSERT INTO `sys_menu_api_rule` VALUES (216, 133);
INSERT INTO `sys_menu_api_rule` VALUES (212, 134);
INSERT INTO `sys_menu_api_rule` VALUES (216, 134);
INSERT INTO `sys_menu_api_rule` VALUES (51, 135);
INSERT INTO `sys_menu_api_rule` VALUES (212, 135);
INSERT INTO `sys_menu_api_rule` VALUES (216, 135);
INSERT INTO `sys_menu_api_rule` VALUES (528, 135);
INSERT INTO `sys_menu_api_rule` VALUES (529, 135);
INSERT INTO `sys_menu_api_rule` VALUES (212, 136);
INSERT INTO `sys_menu_api_rule` VALUES (216, 136);
INSERT INTO `sys_menu_api_rule` VALUES (531, 136);
INSERT INTO `sys_menu_api_rule` VALUES (212, 137);
INSERT INTO `sys_menu_api_rule` VALUES (216, 137);
INSERT INTO `sys_menu_api_rule` VALUES (248, 137);
INSERT INTO `sys_menu_api_rule` VALUES (212, 138);
INSERT INTO `sys_menu_api_rule` VALUES (216, 138);
INSERT INTO `sys_menu_api_rule` VALUES (212, 139);
INSERT INTO `sys_menu_api_rule` VALUES (216, 139);
INSERT INTO `sys_menu_api_rule` VALUES (542, 139);
INSERT INTO `sys_menu_api_rule` VALUES (212, 140);
INSERT INTO `sys_menu_api_rule` VALUES (216, 140);
INSERT INTO `sys_menu_api_rule` VALUES (540, 140);
INSERT INTO `sys_menu_api_rule` VALUES (3, 141);
INSERT INTO `sys_menu_api_rule` VALUES (44, 141);
INSERT INTO `sys_menu_api_rule` VALUES (212, 141);
INSERT INTO `sys_menu_api_rule` VALUES (216, 141);
INSERT INTO `sys_menu_api_rule` VALUES (45, 142);
INSERT INTO `sys_menu_api_rule` VALUES (212, 142);
INSERT INTO `sys_menu_api_rule` VALUES (216, 142);
INSERT INTO `sys_menu_api_rule` VALUES (212, 143);
INSERT INTO `sys_menu_api_rule` VALUES (216, 143);
INSERT INTO `sys_menu_api_rule` VALUES (212, 144);
INSERT INTO `sys_menu_api_rule` VALUES (216, 144);
INSERT INTO `sys_menu_api_rule` VALUES (212, 145);
INSERT INTO `sys_menu_api_rule` VALUES (216, 145);
INSERT INTO `sys_menu_api_rule` VALUES (212, 146);
INSERT INTO `sys_menu_api_rule` VALUES (216, 146);
INSERT INTO `sys_menu_api_rule` VALUES (212, 147);
INSERT INTO `sys_menu_api_rule` VALUES (216, 147);
INSERT INTO `sys_menu_api_rule` VALUES (212, 148);
INSERT INTO `sys_menu_api_rule` VALUES (216, 148);
INSERT INTO `sys_menu_api_rule` VALUES (212, 149);
INSERT INTO `sys_menu_api_rule` VALUES (216, 149);
INSERT INTO `sys_menu_api_rule` VALUES (43, 150);
INSERT INTO `sys_menu_api_rule` VALUES (212, 150);
INSERT INTO `sys_menu_api_rule` VALUES (216, 150);
INSERT INTO `sys_menu_api_rule` VALUES (45, 151);
INSERT INTO `sys_menu_api_rule` VALUES (212, 151);
INSERT INTO `sys_menu_api_rule` VALUES (216, 151);
INSERT INTO `sys_menu_api_rule` VALUES (212, 152);
INSERT INTO `sys_menu_api_rule` VALUES (216, 152);
INSERT INTO `sys_menu_api_rule` VALUES (212, 153);
INSERT INTO `sys_menu_api_rule` VALUES (216, 153);
INSERT INTO `sys_menu_api_rule` VALUES (212, 154);
INSERT INTO `sys_menu_api_rule` VALUES (216, 154);
INSERT INTO `sys_menu_api_rule` VALUES (212, 155);
INSERT INTO `sys_menu_api_rule` VALUES (216, 155);
INSERT INTO `sys_menu_api_rule` VALUES (46, 156);
INSERT INTO `sys_menu_api_rule` VALUES (212, 156);
INSERT INTO `sys_menu_api_rule` VALUES (216, 156);
INSERT INTO `sys_menu_api_rule` VALUES (212, 157);
INSERT INTO `sys_menu_api_rule` VALUES (216, 157);
INSERT INTO `sys_menu_api_rule` VALUES (212, 158);
INSERT INTO `sys_menu_api_rule` VALUES (216, 158);
INSERT INTO `sys_menu_api_rule` VALUES (212, 159);
INSERT INTO `sys_menu_api_rule` VALUES (216, 159);

-- ----------------------------
-- Table structure for sys_migration
-- ----------------------------
DROP TABLE IF EXISTS `sys_migration`;
CREATE TABLE `sys_migration`  (
  `version` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `apply_time` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`version`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_migration
-- ----------------------------
INSERT INTO `sys_migration` VALUES ('1599190683659', '2022-12-12 09:56:26.455');
INSERT INTO `sys_migration` VALUES ('1653638869132', '2022-12-12 09:56:35.233');

-- ----------------------------
-- Table structure for sys_opera_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_opera_log`;
CREATE TABLE `sys_opera_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键编码',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作模块',
  `business_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作类型',
  `business_types` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'BusinessTypes',
  `method` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '函数',
  `request_method` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方式: GET POST PUT DELETE',
  `operator_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作类型',
  `oper_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作者',
  `dept_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问地址',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户端ip',
  `oper_location` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问位置',
  `oper_param` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求参数',
  `status` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作状态 1:正常 2:关闭',
  `oper_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  `json_result` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '返回数据',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `latency_time` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '耗时',
  `user_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ua',
  `created_at` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) NULL DEFAULT NULL COMMENT '最后更新时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_opera_log_create_by`(`create_by`) USING BTREE,
  INDEX `idx_sys_opera_log_update_by`(`update_by`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_opera_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `post_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `post_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sort` tinyint(4) NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `created_at` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) NULL DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`post_id`) USING BTREE,
  INDEX `idx_sys_post_update_by`(`update_by`) USING BTREE,
  INDEX `idx_sys_post_deleted_at`(`deleted_at`) USING BTREE,
  INDEX `idx_sys_post_create_by`(`create_by`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, '首席执行官', 'CEO', 0, 2, '首席执行官', 1, 1, '2021-05-13 19:56:37.913', '2021-05-13 19:56:37.913', '2022-12-12 14:49:22.209');
INSERT INTO `sys_post` VALUES (2, '首席技术执行官', 'CTO', 2, 2, '首席技术执行官', 1, 1, '2021-05-13 19:56:37.913', '2021-05-13 19:56:37.913', '2022-12-12 14:49:22.209');
INSERT INTO `sys_post` VALUES (3, '首席运营官', 'COO', 3, 2, '测试工程师', 1, 1, '2021-05-13 19:56:37.913', '2021-05-13 19:56:37.913', '2022-12-12 14:49:22.209');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role_key` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role_sort` bigint(20) NULL DEFAULT NULL,
  `flag` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `admin` tinyint(1) NULL DEFAULT NULL,
  `data_scope` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `created_at` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) NULL DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`role_id`) USING BTREE,
  INDEX `idx_sys_role_update_by`(`update_by`) USING BTREE,
  INDEX `idx_sys_role_deleted_at`(`deleted_at`) USING BTREE,
  INDEX `idx_sys_role_create_by`(`create_by`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '系统管理员', '2', 'admin', 1, '', '', 1, '1', 1, 1, '2021-05-13 19:56:37.913', '2022-12-12 12:02:29.397', NULL);
INSERT INTO `sys_role` VALUES (2, '运营', '2', 'yunying', 0, '', '', 0, '1', 0, 0, '2022-12-12 11:28:48.072', '2022-12-12 15:44:19.209', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` smallint(6) NOT NULL,
  `dept_id` smallint(6) NOT NULL,
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 1);
INSERT INTO `sys_role_dept` VALUES (2, 8);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE,
  INDEX `fk_sys_role_menu_sys_menu`(`menu_id`) USING BTREE,
  CONSTRAINT `fk_sys_role_menu_sys_menu` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`menu_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_sys_role_menu_sys_role` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 269);
INSERT INTO `sys_role_menu` VALUES (2, 537);
INSERT INTO `sys_role_menu` VALUES (2, 545);
INSERT INTO `sys_role_menu` VALUES (2, 575);
INSERT INTO `sys_role_menu` VALUES (2, 576);
INSERT INTO `sys_role_menu` VALUES (2, 578);

-- ----------------------------
-- Table structure for sys_tables
-- ----------------------------
DROP TABLE IF EXISTS `sys_tables`;
CREATE TABLE `sys_tables`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `table_comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `class_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tpl_category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `package_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `module_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `module_front_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '前端文件名',
  `business_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `function_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `function_author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pk_column` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pk_go_field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pk_json_field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `options` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tree_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tree_parent_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tree_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tree` tinyint(1) NULL DEFAULT 0,
  `crud` tinyint(1) NULL DEFAULT 1,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_data_scope` tinyint(4) NULL DEFAULT NULL,
  `is_actions` tinyint(4) NULL DEFAULT NULL,
  `is_auth` tinyint(4) NULL DEFAULT NULL,
  `is_logical_delete` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `logical_delete` tinyint(1) NULL DEFAULT NULL,
  `logical_delete_column` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) NULL DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) NULL DEFAULT NULL COMMENT '删除时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`table_id`) USING BTREE,
  INDEX `idx_sys_tables_create_by`(`create_by`) USING BTREE,
  INDEX `idx_sys_tables_update_by`(`update_by`) USING BTREE,
  INDEX `idx_sys_tables_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_tables
-- ----------------------------
INSERT INTO `sys_tables` VALUES (1, 'user_identity', '用户身份字典表', 'UserIdentity', 'crud', 'admin', 'user-identity', '', 'userIdentity', '用户身份字典表', 'admin', 'id', 'Id', 'id', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', '2022-12-12 11:52:33.144', '2022-12-12 11:58:40.057', NULL, 0, 0);
INSERT INTO `sys_tables` VALUES (4, 'user_info', '用户基本信息', 'UserInfo', 'crud', 'admin', 'user-info', '', 'userInfo', '用户基本信息', 'admin', 'id', 'Id', 'id', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', '2022-12-12 14:23:20.237', '2022-12-12 14:31:45.221', NULL, 0, 0);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编码',
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `nick_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '加盐',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门',
  `post_id` bigint(20) NULL DEFAULT NULL COMMENT '岗位',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `created_at` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) NULL DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `idx_sys_user_create_by`(`create_by`) USING BTREE,
  INDEX `idx_sys_user_update_by`(`update_by`) USING BTREE,
  INDEX `idx_sys_user_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '$2a$10$zNnDxi7ZLM265/3Ys/f0y.uCy2Qg8833uNTzqKmwHAjXJNVX2rHby', 'admin', '13800000000', 1, '', '', '0', 'admin@qq.com', 1, 1, '', '2', 1, 1, '2021-05-13 19:56:37.914', '2022-12-12 17:29:40.980', NULL);
INSERT INTO `sys_user` VALUES (2, 'ruqi2022', '$2a$10$r4srP29aXX2d8PUDv.AcSOcTAIQhs6GvutRlO4Rm8tn/tEpr2C38.', 'ruqi2022', '13800000000', 1, '', '', '2', 'ruqi2022@qq.com', 8, 0, '', '2', 1, 0, '2022-12-12 11:25:50.490', '2022-12-12 16:17:39.162', NULL);

-- ----------------------------
-- Table structure for tb_demo
-- ----------------------------
DROP TABLE IF EXISTS `tb_demo`;
CREATE TABLE `tb_demo`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键编码',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `created_at` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) NULL DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) NULL DEFAULT NULL COMMENT '删除时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tb_demo_deleted_at`(`deleted_at`) USING BTREE,
  INDEX `idx_tb_demo_create_by`(`create_by`) USING BTREE,
  INDEX `idx_tb_demo_update_by`(`update_by`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_demo
-- ----------------------------

-- ----------------------------
-- Table structure for user_identity
-- ----------------------------
DROP TABLE IF EXISTS `user_identity`;
CREATE TABLE `user_identity`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '人设名称',
  `metaphor_rate` decimal(8, 4) NOT NULL COMMENT '比喻事物的比率',
  `created_at` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) NULL DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) NULL DEFAULT NULL COMMENT '删除时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户身份字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_identity
-- ----------------------------
INSERT INTO `user_identity` VALUES (1, '包租大佬', 0.8500, '2022-12-12 16:35:27.000', '2022-12-12 16:35:27.000', NULL, NULL, NULL);
INSERT INTO `user_identity` VALUES (2, '朋克养生主唱', 1.0000, '2022-12-12 16:35:27.000', '2022-12-12 16:35:27.000', NULL, NULL, NULL);
INSERT INTO `user_identity` VALUES (3, '萌宠驯化师', 4.5000, '2022-12-12 16:35:27.000', '2022-12-12 16:35:27.000', NULL, NULL, NULL);
INSERT INTO `user_identity` VALUES (4, 'NFT收藏家', 1.0600, '2022-12-12 16:35:27.000', '2022-12-12 16:35:27.000', NULL, NULL, NULL);
INSERT INTO `user_identity` VALUES (5, '吃胡宗师', 0.0060, '2022-12-12 16:35:27.000', '2022-12-12 16:35:27.000', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '如祺用户ID',
  `identity_id` int(11) NOT NULL COMMENT '人设ID',
  `created_at` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) NULL DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) NULL DEFAULT NULL COMMENT '删除时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '微信昵称',
  `register_city` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '注册城市：地级市',
  `register_time` datetime NOT NULL COMMENT '注册时间：年/月/日',
  `regular_point_t2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '常用上/下车点Top2，英文逗号分割',
  `total_mileage` smallint(1) UNSIGNED NOT NULL COMMENT '22年里程总公里数，无需小数点，四舍五入原则',
  `total_amount` decimal(10, 2) NOT NULL COMMENT '22年订单折前流水总金额',
  `actually_amount` decimal(10, 2) NOT NULL COMMENT '22年订单实际支付总金额',
  `latest_order_time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '22年最晚成单时间（03:00:00前下单数据）',
  `mileage_rank_rate` decimal(3, 2) NOT NULL COMMENT '22年总里程数排行，超越X%用户',
  `member_level` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '如祺会员等级',
  `user_type` tinyint(1) UNSIGNED NOT NULL COMMENT '用户类型：1用户22年未成单、2用户22年有成单',
  `is_draw` tinyint(1) NULL DEFAULT 0 COMMENT '是否抽过奖',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_id`(`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_identity_id`(`identity_id`) USING BTREE,
  INDEX `idx_nickname`(`nickname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户基本信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, 1, 1, '2022-12-12 14:00:27.035', '2022-12-12 14:00:27.035', NULL, 0, 0, '喵小祺', '广州市', '2020-06-01 14:15:34', 'a,b', 100, 100.99, 89.99, '12月24日23时59分', 0.50, '神级知己', 2, 0);
INSERT INTO `user_info` VALUES (2, 2, 2, '2022-12-12 14:01:45.680', '2022-12-12 14:01:45.680', NULL, 0, 0, '测试用户', '深圳市', '2022-12-12 14:16:58', 'c,d', 10, 10.99, 8.99, '12月24日23时59分', 0.01, '未知', 1, 0);

SET FOREIGN_KEY_CHECKS = 1;
