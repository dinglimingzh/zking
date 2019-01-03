
CREATE TABLE IF NOT EXISTS robot_manufacturer (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
    `tenantId` int(11) NOT NULL COMMENT '租户id',
    `name` varchar(100) NOT NULL COMMENT '名称',
    `dispatcherClass` varchar(255) NOT NULL COMMENT 'dispatcher class',
    `remark` varchar(100) DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`),
    KEY idx_tenantId_name (tenantId, name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS robot_parameter (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
    `paramKey` varchar(100) NOT NULL,
    `paramValue` varchar(100) NOT NULL,
    `robotId` char(36) NOT NULL COMMENT '机器人ID',
    `tenantId` int(11) NOT NULL COMMENT '租户id',
    `remark` varchar(100) DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`),
    KEY idx_tenantId_robotId (tenantId, robotId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `robot` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `robotId` char(36) NOT NULL COMMENT '机器人ID',
  `tenantId` int(11) NOT NULL COMMENT '租户ID',
  `name` varchar(128) NOT NULL COMMENT '机器人昵称',
  `manufacturerId` int(11) NOT NULL COMMENT '厂商id',
  `status` varchar(20) NOT NULL DEFAULT 'ENABLED' COMMENT '状态(ENABLED、DISABLED)',
  `digitalMenu` TINYINT(1) NOT NULL DEFAULT '0' COMMENT '是否使用数字菜单(0-disable, 1-enable)',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `createdTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdatedTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid_UNIQUE` (`robotId`),
  KEY `idx_tenantId_robotId` (`tenantId`,`robotId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
ALTER TABLE robot_manufacturer ADD COLUMN url varchar(255) NOT NULL;

DROP TABLE IF EXISTS `robot_user_transferKf`;
CREATE TABLE `robot_user_transferKf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenantId` int(11) NOT NULL,
  `robotId` char(36) DEFAULT NULL,
  `dutyType` char(36) NOT NULL DEFAULT 'alldisable',
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  `dutyWeekScope` char(32) DEFAULT NULL,
  `enableTransferReply` varchar(1024) NOT NULL DEFAULT '马上为您转接人工客服，请稍后…',
  `disableTransferReply` varchar(1024) NOT NULL DEFAULT '现在是下班时间，不能转人工哟，有问题您还是问我吧~',
  `transferKfButtonText` varchar(512) NOT NULL DEFAULT '转人工客服',
  `scheduleId` int(11) null default '0',
  `agentQueueId` int(11) DEFAULT NULL,
  `transformToKefuQueuing` int(11),
  `transformToKefuQueuingTime` int(11),
  `autoTransformToKefuEnable` TINYINT(1),
  `createdTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdatedTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



DROP TABLE IF EXISTS `robot_predefined_reply`;
CREATE TABLE IF NOT EXISTS `robot_predefined_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `replyId` char(36) NOT NULL,
  `tenantId` int(11) NOT NULL,
  `robotId` char(36) DEFAULT NULL,
  `type` tinyint(1) NOT NULL COMMENT '0: default\n1: repeat\n2: timeout',
  `contentType` TINYINT(1) NOT NULL DEFAULT '0' COMMENT '0: plain text\n1: menu',
  `content` varchar(1024) DEFAULT NULL,
  `hasTransferSubmenu` TINYINT(1) NOT NULL DEFAULT '0' COMMENT '',
  `createdTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdatedTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `autoReplyId_UNIQUE` (`replyId`),
  INDEX IDX_TENANT_TYPE (tenantId, type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


ALTER TABLE robot ADD COLUMN `timeout` int(11) NOT NULL DEFAULT '600';



ALTER table robot add COLUMN robotRouteId CHAR(36) NOT NULL;

ALTER table robot add COLUMN robotAgentId CHAR(36) NOT NULL;


alter table robot add UNIQUE IDX_UNIQUE_RROBOT_ROUTE_ID (robotRouteId);
