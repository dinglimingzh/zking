DROP TABLE IF EXISTS `error_replace_dict`;
CREATE TABLE `error_replace_dict`(
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `robot_id` char(36) NOT NULL,
  `wrong_word` varchar(50) NOT NULL,
  `right_word` varchar(50) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
UNIQUE KEY (`robot_id`, `wrong_word`)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4;
