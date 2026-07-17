-- Mobile Push API setup (run once in phpMyAdmin / MySQL)
-- Safe to re-run: uses IF NOT EXISTS / conditional adds where possible

-- 1) API Bearer tokens for mobile app login
CREATE TABLE IF NOT EXISTS `user_api_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT 'mobile',
  `token` char(64) NOT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_api_tokens_token_unique` (`token`),
  KEY `user_api_tokens_user_id_index` (`user_id`),
  KEY `user_api_tokens_name_index` (`user_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 2) Ensure fcm_tokens exists (multi-device)
CREATE TABLE IF NOT EXISTS `fcm_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(512) NOT NULL,
  `device_label` varchar(255) DEFAULT NULL,
  `platform` varchar(20) NOT NULL DEFAULT 'web',
  `device_id` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fcm_tokens_user_token_unique` (`user_id`,`token`),
  KEY `fcm_tokens_user_id_index` (`user_id`),
  KEY `fcm_tokens_device_id_index` (`user_id`,`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 3) Add platform / device_id if table already existed without them
-- (Ignore errors if columns already exist)

ALTER TABLE `fcm_tokens`
  ADD COLUMN `platform` varchar(20) NOT NULL DEFAULT 'web' AFTER `device_label`;

ALTER TABLE `fcm_tokens`
  ADD COLUMN `device_id` varchar(191) DEFAULT NULL AFTER `platform`;

-- 4) Optional: users.fcm_token legacy column
-- ALTER TABLE `users` ADD COLUMN `fcm_token` TEXT NULL AFTER `remember_token`;
