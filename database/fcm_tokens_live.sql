-- Live phpMyAdmin: drop failed table if partially created, then run this full SQL

DROP TABLE IF EXISTS `fcm_tokens`;

CREATE TABLE `fcm_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(512) NOT NULL,
  `device_label` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fcm_tokens_user_token_unique` (`user_id`,`token`),
  KEY `fcm_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
