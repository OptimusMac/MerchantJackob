-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Авг 26 2022 г., 01:58
-- Версия сервера: 10.3.35-MariaDB
-- Версия PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `miamineo_miaconnectbd`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `server_id` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `gateway_freekassa`
--

CREATE TABLE `gateway_freekassa` (
  `id` int(8) NOT NULL,
  `name` varchar(250) NOT NULL,
  `fullname` varchar(200) DEFAULT NULL,
  `link` varchar(128) NOT NULL,
  `store_id` int(8) NOT NULL,
  `key_public` varchar(128) NOT NULL,
  `key_secret` varchar(128) NOT NULL,
  `description` varchar(128) NOT NULL DEFAULT 'Пополнение баланса',
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `gateway_freekassa`
--

INSERT INTO `gateway_freekassa` (`id`, `name`, `fullname`, `link`, `store_id`, `key_public`, `key_secret`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Free-Kassa', 'Free-Kassa.Ru', 'http://www.free-kassa.ru/merchant/cash.php', 0, '0', '0', 'Пополнение баланса', 0, '2020-11-06 14:50:06', '2020-11-06 14:50:06');

-- --------------------------------------------------------

--
-- Структура таблицы `gateway_paylogs`
--

CREATE TABLE `gateway_paylogs` (
  `id` int(8) NOT NULL,
  `user_id` int(8) NOT NULL,
  `money` int(8) NOT NULL,
  `bonus` int(8) NOT NULL,
  `system` varchar(128) NOT NULL DEFAULT 'Unknown',
  `status` int(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `gateway_transact`
--

CREATE TABLE `gateway_transact` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_balance` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `trx` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refund` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `gateway_transact`
--

INSERT INTO `gateway_transact` (`id`, `user_id`, `gateway`, `amount`, `user_balance`, `charge`, `type`, `trx`, `refund`, `created_at`, `updated_at`) VALUES
(3, '1', 'Admin', '7621', '0.00', NULL, 0, 'c791cad63881bc8c', 0, '2020-11-06 14:39:17', '2020-11-06 14:39:17'),
(4, '1', 'Admin', '7022', '0.00', NULL, 0, 'f80325ab7ab55642', 0, '2021-02-20 08:50:59', '2021-02-20 08:50:59'),
(5, '28', 'XionioX', '0', '0.00', NULL, 0, '0b33fd2db8b6c375', 0, '2022-08-25 23:14:43', '2022-08-25 23:14:43'),
(6, '31', 'XionioX', '0', '0.00', NULL, 0, '26ff16ae00c4b1a7', 0, '2022-08-26 05:13:02', '2022-08-26 05:13:02'),
(7, '31', 'XionioX', '0', '0.00', NULL, 0, '1311ad36094e45e3', 0, '2022-08-26 05:33:52', '2022-08-26 05:33:52'),
(8, '31', 'XionioX', '120', '0.00', NULL, 0, '96667c3dfa1ebbe8', 0, '2022-08-26 06:10:53', '2022-08-26 06:10:53');

-- --------------------------------------------------------

--
-- Структура таблицы `gateway_unitpay`
--

CREATE TABLE `gateway_unitpay` (
  `id` int(8) NOT NULL,
  `name` varchar(250) NOT NULL DEFAULT 'UnitPay',
  `fullname` varchar(200) DEFAULT NULL,
  `link` varchar(128) NOT NULL DEFAULT 'https://unitpay.ru/pay/',
  `key_public` varchar(200) NOT NULL DEFAULT 'key_public',
  `key_secret` varchar(200) NOT NULL DEFAULT 'key_secret',
  `description` varchar(128) NOT NULL DEFAULT 'Пополнение баланса',
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `gateway_unitpay`
--

INSERT INTO `gateway_unitpay` (`id`, `name`, `fullname`, `link`, `key_public`, `key_secret`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'UnitPay', 'UnitPay.Money', 'https://unitpay.money/pay', '0', '0', 'Пополнение баланса', 0, '2021-01-04 15:10:54', '2020-11-06 14:50:04');

-- --------------------------------------------------------

--
-- Структура таблицы `general_settings`
--

CREATE TABLE `general_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_offline` int(4) NOT NULL DEFAULT 0,
  `launcher_link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix_cmd` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pex user %player% set prefix %prefix%',
  `base_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `game_currency` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'COIN',
  `game_symbol` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'COIN',
  `exch_rubs_to_coin` int(4) NOT NULL DEFAULT 2,
  `vote_gift_type` int(4) NOT NULL DEFAULT 1,
  `vote_gift_count` int(8) NOT NULL DEFAULT 20,
  `gateway_use` int(4) NOT NULL DEFAULT 0,
  `reg` tinyint(4) DEFAULT NULL,
  `email_verification` tinyint(4) DEFAULT NULL,
  `email_notification` tinyint(4) DEFAULT NULL,
  `vk_client_id` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `vk_client_secret` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `vk_redirect_uri` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `vk_group_id` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '172494684',
  `vk_group_token` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '290e6f14206f0082fedae22d1bc4547b67676b7a36cae75cee21d5199100d045dd2e0afe3bdfd3fc15cf9',
  `vk_output_count` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '10',
  `launcher_link_jar` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discord_server_id` bigint(20) DEFAULT NULL,
  `currency_rate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e_admin` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e_sender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e_message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_desc` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `services_discount_status` int(4) NOT NULL DEFAULT 0,
  `services_discount_percent` int(3) NOT NULL DEFAULT 0,
  `services_discount_datetime` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `sw_exchange` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `sw_ratings` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `sw_banlist` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `sw_kits` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `sw_prefixes` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `sw_shop` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `invite_percent` int(4) NOT NULL DEFAULT 5,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `general_settings`
--

INSERT INTO `general_settings` (`id`, `title`, `description`, `site_offline`, `launcher_link`, `prefix_cmd`, `base_color`, `base_currency`, `currency_symbol`, `game_currency`, `game_symbol`, `exch_rubs_to_coin`, `vote_gift_type`, `vote_gift_count`, `gateway_use`, `reg`, `email_verification`, `email_notification`, `vk_client_id`, `vk_client_secret`, `vk_redirect_uri`, `vk_group_id`, `vk_group_token`, `vk_output_count`, `launcher_link_jar`, `discord_server_id`, `currency_rate`, `e_admin`, `e_sender`, `e_message`, `header_text`, `header_desc`, `services_discount_status`, `services_discount_percent`, `services_discount_datetime`, `sw_exchange`, `sw_ratings`, `sw_banlist`, `sw_kits`, `sw_prefixes`, `sw_shop`, `invite_percent`, `created_at`, `updated_at`) VALUES
(1, 'Made In Abyss', 'Игровой мод сервер на версии 1.18.2 с популярными модами, Create, AlexMobs, Quark и другие великолеп', 0, '/MIA.exe', 'pex user %player% set prefix %prefix%', '777777', 'руб', 'rubs', 'COIN', 'coin', 2, 1, 20, 0, 1, 0, 0, '7924280', 'osReLuZDUiDY6tsdbL9D', 'https://mia-mine.online/login/vk/auth', '196836801', 'vk1.a.Z7U7iE7m8nqijyyQh3Wir9sy3slqbSDDm1zRL8VZX7P7lBLKd3SGReUCB1eitt3vHFKC38pNr0eEUFYUq7wvPfEJj_cV_sUvlX9hjxGc3930gcXFSOEM4IP2E9Xq6VJocfFyMMgtT_93aC-ZZzT766QlUIGRzNoaay5essnvayHc3mooKd9mqnNwjJavX00W', '32', '/MIA.jar', 741294039973756929, '77.73', 'admin@hype-mc.ru', 'no-reply@mcstudio.su', 'Hi, {{name}},\r\n{{message}}', 'MCSTUDIO', 'Minecraft project', 0, 5, '2020-05-30T12:30', 'false', 'false', 'false', 'false', 'false', 'false', 5, '2018-06-04 00:06:40', '2022-08-25 19:16:17');

-- --------------------------------------------------------

--
-- Структура таблицы `hwids`
--

CREATE TABLE `hwids` (
  `id` bigint(20) NOT NULL,
  `publickey` blob DEFAULT NULL,
  `hwDiskId` varchar(255) DEFAULT NULL,
  `baseboardSerialNumber` varchar(255) DEFAULT NULL,
  `graphicCard` varchar(255) DEFAULT NULL,
  `displayId` blob DEFAULT NULL,
  `bitness` int(11) DEFAULT NULL,
  `totalMemory` bigint(20) DEFAULT NULL,
  `logicalProcessors` int(11) DEFAULT NULL,
  `physicalProcessors` int(11) DEFAULT NULL,
  `processorMaxFreq` bigint(11) DEFAULT NULL,
  `battery` tinyint(1) NOT NULL DEFAULT 0,
  `banned` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `hwids`
--

INSERT INTO `hwids` (`id`, `publickey`, `hwDiskId`, `baseboardSerialNumber`, `graphicCard`, `displayId`, `bitness`, `totalMemory`, `logicalProcessors`, `physicalProcessors`, `processorMaxFreq`, `battery`, `banned`) VALUES
(1, 0x3059301306072a8648ce3d020106082a8648ce3d03010703420004adb61d44c2bd63569cdbb47b489d527177b06e771de3ce1e5d1c60c656e98af62c203188b211e214a6a7b4f42419983746883f373d6b958c8aaf0049ac28f0b8, '     WD-WXA1E8860UXT', 'PF1RJ1Y1', 'NVIDIA GeForce GTX 1650', 0x00ffffffffffff000daee71500000000211a0104a52213780228659759548e271e505400000001010101010101010101010101010101b43b804a713834405036680058c110000018000000fe004e3135364843412d4541420a20000000fe00434d4e0a202020202020202020000000fe004e3135364843412d4541420a2000b20000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 64, 8464355328, 8, 4, 0, 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `items`
--

CREATE TABLE `items` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `server_id` int(8) NOT NULL,
  `category_id` int(8) NOT NULL,
  `item_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `count` int(32) NOT NULL,
  `price` int(32) NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `kits`
--

CREATE TABLE `kits` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `server_id` int(8) NOT NULL,
  `server_cmd` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `count` int(8) NOT NULL DEFAULT 1,
  `price` int(32) NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `kits`
--

INSERT INTO `kits` (`id`, `name`, `description`, `server_id`, `server_cmd`, `count`, `price`, `image`, `status`, `created_at`, `updated_at`) VALUES
(6, 'test', 'Набор ресурсов', 2, 'test', 1, 10, '7b1a5cb2011e9d4d22a2918b2b6d0ae6.png', 1, '2021-03-06 13:37:40', '2021-03-06 13:37:40');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2021_02_28_181913_create_sessions_table', 1),
(4, '2021_03_06_131209_create_promos_table', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `status`, `created_at`, `updated_at`) VALUES
('maximcska@gmail.com', '2wKzeuSFNnTMZqtF0uV4Iy5a8Pm193', 0, '2021-01-04 14:05:08', '2021-01-04 14:05:08'),
('admin@mcstudio.su', 'LVmJcy6RVkkoRpEsI8HnQ4ZmqgSCvj', 0, '2021-02-28 15:07:05', '2021-02-28 15:07:05'),
('slivetv01@gmail.com', '03STq8p85YQUHOHcvpHdn1IHwLE8AD', 0, '2022-08-25 18:23:35', '2022-08-25 18:23:35');

-- --------------------------------------------------------

--
-- Структура таблицы `privileges`
--

CREATE TABLE `privileges` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `server_id` int(8) NOT NULL,
  `term_days` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '30',
  `skin` int(4) NOT NULL DEFAULT 1,
  `skin_hd` int(4) NOT NULL DEFAULT 0,
  `cloak` int(4) NOT NULL DEFAULT 0,
  `cloak_hd` int(4) NOT NULL DEFAULT 0,
  `prefix` int(4) NOT NULL DEFAULT 0,
  `price` int(32) NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `promos`
--

CREATE TABLE `promos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `sales` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `promos`
--

INSERT INTO `promos` (`id`, `code`, `desc`, `type`, `value`, `active`, `sales`) VALUES
(2, 'SKIDKA10', 'Скидка 10%', 2, 10, 1, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `ratings_settings`
--

CREATE TABLE `ratings_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `vote_gift_type` int(4) NOT NULL DEFAULT 1,
  `vote_gift_count` int(8) NOT NULL DEFAULT 20,
  `vote_gift_kit` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT 'kit vote',
  `link_mcrate` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'http://mcrate.su/project/ID',
  `link_topcraft` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'https://topcraft.ru/servers/ID/',
  `link_minecraftrating` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT 'http://minecraftrating.ru/server/ID/',
  `secret_mcrate` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'secret_key',
  `secret_topcraft` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'secret_key',
  `secret_minecraftrating` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT 'secret_key',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `ratings_settings`
--

INSERT INTO `ratings_settings` (`id`, `vote_gift_type`, `vote_gift_count`, `vote_gift_kit`, `link_mcrate`, `link_topcraft`, `link_minecraftrating`, `secret_mcrate`, `secret_topcraft`, `secret_minecraftrating`, `created_at`, `updated_at`) VALUES
(4, 2, 1, 'kit vote', '1', 'Admin', '0', '1234561', '1', '0', '2021-01-04 14:52:57', '2021-02-25 16:35:09');

-- --------------------------------------------------------

--
-- Структура таблицы `servers`
--

CREATE TABLE `servers` (
  `id` int(16) NOT NULL,
  `name` varchar(32) DEFAULT 'Server',
  `description` varchar(250) DEFAULT 'Description',
  `ip` varchar(128) NOT NULL DEFAULT '127.0.0.1',
  `port` varchar(8) NOT NULL DEFAULT '25565',
  `online` int(8) NOT NULL DEFAULT 0,
  `slots` int(8) NOT NULL DEFAULT 0,
  `max_online` int(8) DEFAULT 0,
  `mysql_host` varchar(128) DEFAULT NULL,
  `mysql_base` varchar(128) DEFAULT NULL,
  `mysql_user` varchar(128) DEFAULT NULL,
  `mysql_pass` varchar(128) DEFAULT NULL,
  `mysql_port` varchar(128) DEFAULT NULL,
  `mysql_table_bans` varchar(128) DEFAULT NULL,
  `mysql_table_coin` varchar(128) DEFAULT NULL,
  `mysql_table_shop` varchar(128) DEFAULT NULL,
  `mysql_table_pref` varchar(128) DEFAULT NULL,
  `status` int(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `servers`
--

INSERT INTO `servers` (`id`, `name`, `description`, `ip`, `port`, `online`, `slots`, `max_online`, `mysql_host`, `mysql_base`, `mysql_user`, `mysql_pass`, `mysql_port`, `mysql_table_bans`, `mysql_table_coin`, `mysql_table_shop`, `mysql_table_pref`, `status`, `created_at`, `updated_at`) VALUES
(4, 'MIAEarth.png', 'Description', '185.200.244.57', '25565', 0, 0, 0, '148.163.69.161', 'miamineo_miaconnectbd', 'toor', 'l1u4b6', '3306', NULL, NULL, NULL, NULL, 1, '2022-08-26 07:10:58', '2022-08-26 07:10:58');

-- --------------------------------------------------------

--
-- Структура таблицы `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('2bN607zMtPY9jPtU4BQeUc1kHFbeZpo6rBTGoVhh', NULL, '51.222.253.20', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'ZXlKcGRpSTZJbk16WTJaVFQwdHJSa1pvZEdKWmJ6UnJXVzlvTDJjOVBTSXNJblpoYkhWbElqb2lVVWd4WnpORFpYZzBOSFprVjFkM2FuaGFkWG95Tld3M1ltUnliVEk1Y0ZoRFRtTlhVelJMUmk5a1dIaDRXbVpJTmpsMlVrdG9hVEUxUkRJMk9GaFlMM1J2T1dKUlNuQTBka3RqUmpsVFVHRjRRa2xTTW5sM2JsSkVlRlJ6YlVsR05uVkxUR3h6WkZaVmVtODJaWEZyVDBOMmIwZFRlWEpxZVZoUlIweHVjVmN5TURNek5tSmtTMUpEVTFodU5taHdZa1ZSVmpWQ00wNWlUVkpZV2k5bllsUnVWWFZQUmtGNmJtODJiV3AzVTFCV2FteHpOVVpLUldOWVdXWlNSRVl2YmxaS2JVNVVaVmxLUkVWS1oyczNTVTFNVldacFRqbEllRVJMVm05cVZ6TkZiMnhzVEhBMlp6WTFZbE5sWTFCMVpHVnBWa0pWTTFJeVExQkVhVkI1ZUhWUmVIZGtkREEyTkRCc2JEUTFXa0pzTWpKQ2RsRTlQU0lzSW0xaFl5STZJakEzWTJJek5qZ3hOR1k0TURFeU5EZGlOek5oTmpGbE5qWTBaR0l5WldFNE5qTmtOVEEzT1dRMVlUVmpaRGsyWTJabE5XVTBOemMwWVdZeE4ySmpaV01pZlE9PQ==', 1661496877),
('77syZ4KqmFQvRLJtDUbduIilFyLq6P2jXBqwWBu8', NULL, '128.199.170.37', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 'ZXlKcGRpSTZJaXRzVUdGQmRYWkVkRXBVVkdwQ2JFUm9NSGx3UW5jOVBTSXNJblpoYkhWbElqb2lTMnhNUzNrd1ZtZG9SbkJYUjI5Q2VGRk1XbU15UzJveVowWkxNWGxOYUZaaVEzWm9hbHBqYkhSUE9HSndlamxqV1Zod1NqZGFVbTVtVmxKTGJHZDBORTEwUzJsSlV6ZE5kMEUwVDNkUVZrZDBLMkp0WkVOaGIxUjRjMFJwZG00elMzVlhXV2g2VjJ4RVNVaERhRzVFSzBOMFdreExTRXd5UzNKbVNXaHBPVVYzZG1aSE0wUXlUMEpUY1d0NmNEWkpjMmcxUzFob1drd3llVEZzVGsxSWRscFFia3RhU1RFeGFEZ3JRMlJMTmpOUU9HZzJjVU5JTVRSbVJ6TkVMM2t3Ym5Ca1F6WlZlRTlwUjNaSFRWUldVR2M1YTBvNFVXZFhkRlpKTms1aVJGVm9WRWxJY1Voc2JsbDNLMDF4VUhseFJ6Vm5iWFUzTURsYWJrMHdjVTFYUWlJc0ltMWhZeUk2SW1WaVlqY3hOemd3TnpZME16TmpNVFkxWVROaE5qRTVNVGMwWW1SbVptVTVZakJqTUdNd09UQTFNR1F4Tm1FeU5tWm1ZV0V6TW1ReE0yVXlaREF5TkRjaWZRPT0=', 1661475683),
('aGdl1TVI5UzbtrnfFB1MPRHk7fcIv8f2D7wINfcN', NULL, '66.249.79.93', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ZXlKcGRpSTZJakpTU1ZkTWJuaEpZM1U1Y2xCdE1HRjNLMnRYTjFFOVBTSXNJblpoYkhWbElqb2lkakJyVUhrd01uSkRPSFZaWkZWalpHTk1TbVp0YUdad2FqaEJjMlZCVkd3emJETXdPRVZQVTBad2NHcE5RV2hrV0V0TVRraFpkRWQxVUdaWGJEQnVVMjV6Ympod1ozQnhaR3RRYjBGcWFWbHFhMnBoUmxZM1dWQnlkWFprU1d0bVNFdFRVMHA1VTFScWIxaFhSazVRYVVSM2IxUjBiV0Z3ZFZwQk9IZzFUM2xWTDFZMlFVMHdaU3RCYjFsTGFVOHllR05UV0ZodlZuVk9NSEZyWjNWaVVXRlBTVVJ4YWpGTE1FbFlRVTA0WjNWeWRuVmxURk50UTJSSGRXeFdiV05sYlhrd1duRnFlalo2TWpOMFZFMXhRbmh1TW1VdmVFb3hkVmhYUVZKb1VrdFFlR0ZETm0xWUsyNXhOSGhRVEZVemQxWnRUSG8zTVZRMFkyNHlNbEJ1VjFaQlQzZ3ZRbHBqVjAwclNUQk5hV2x0VjBwYU5VRTlQU0lzSW0xaFl5STZJamxqTkRobE9UTmxZVGxpWkRkaFl6bGtZMlJrWkdNNFpHVmlZalF6Wm1ZNE5HTTFPVEk0WVRrNE5EZ3dZMlk0WVdKaVpXUTFZV0UyTjJFeU9EWXlNVGNpZlE9PQ==', 1661477431),
('CMrJUitXOPbT2Ufn8sSM6V5l9pVumemkFa67a3To', NULL, '54.36.148.219', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'ZXlKcGRpSTZJalp6YzA1clZVTjJSRE56WVRWclJsSlFLMkZsTVZFOVBTSXNJblpoYkhWbElqb2lUa2t6Vm5KalNrUXpkQzlKYWtsMWEwRXdWakZLTlZabWJrdzBibllyUjNsVUwyNWtOREZtTlRSNlZuUm1PRVJwUTNOUWFtTktZMlp5Tm1wb2MybHlWbGRrTnpGNVFqVTVhakF5YWpGWlVHbE9Xa3BLY0dWaFZuSkNNbWMzWlRsbldXUk1WMFZXYURWaEt5dGtjRFV5WVM5TGNVVnFhRkZPYVdNMU5qVm1XVmhDWkhBM2R5OXNlV013TUU1dFJHZzVZMWhEU2xObWJtcFdhR2t6YW1SWWFrUm9VMHA0TVdoelJVaFFaRXBpYlVrMWNtaHRVemRaVWtaU05YbERRakp5T0ZSNVVrOVBVRTV5ZEVWS04zaExSelpNZEVkbU1sQnFXVmt2VERKaVJsWllZVms0UkdsVVExRTFiM3BsUmtwMFRtVlVWMEozU2toMlptTmxSbGhzTVU1T1pFeFNSRXd4TXpkM2QxWlRPRU4zYWxkR1NtYzlQU0lzSW0xaFl5STZJbUUzTUdJMU5qQmlNV1E0WXpFMk4yTXdZMk5pTkdKaU1UQmlOMkl3WlRNMU9HRTRZbVEwWTJKa09EZ3haVGMwWWpnek9ERTFZelJsTVRnellqTXdOR0lpZlE9PQ==', 1661491449),
('DGtVgtTegZjeHDlMiP86QGBzbASnFNbXCuj1Smbx', 34, '37.22.18.157', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:100.0) Gecko/20100101 Firefox/100.0', 'ZXlKcGRpSTZJakpNWmt0MVIwWTRZbW8yUmxvemJqWXhORWRCY0djOVBTSXNJblpoYkhWbElqb2liWE51Y1V0aVVtbzFhWEZLYVdsYWQxTmhVbTgwVW1ZckwwRlJjMUYxSzNsMWN6Vm5OV2gzZWpCVk16bE9iR3RHT0ZJcmJtVTNiazFhTXpWblYwZDRhVzFRTHpWU1lYbEJVbHBtWTNkb2JHSmFXVTVWT1dkeVRUZE9lbFJtYkVSQ1QweFNabFV2WTNaRVpuUlJPRTVqTXpjd016aEJjV1pJY25wNWVtUXZjekZzVjA1dmNYWnFNU3RKTDBGd1dVWjBaMUJLUXpKU2NERjNTVU5JVTFWMVpUUnFjVWRrWjBoaGMwSm1kVEpKUlhkSE5YbHBTMGRJVmt4dmJuRnBhMjlTZDJoWmR6bEJhMlkyTm1OMk5rNDFUVTVuZEV4S1lXaEdhSHB6VjBJclJYVjZkME01UVVaWmVWVlFXbk5KVmpkdkwxaGtVMUp5YjA1amVtcHBOR3BZUWpod1JISkVOVVpwVDJvM1JESXZPSFp0WWtSQmNYVmlObTVIVTA5TE5GaDZWbU5sTm10M1lTdFVTbG94YlRCdGFUUkROR1phZG0xME5VbDJMM0pzWjNkblIxZ3pOblI2Tm5GQlowSmtZazQxTm1FNVlWVmlWRkZDVWtkemNtUXpUblJGZW14eVVqbDZUVVpMY0dGM09GUjZibnBUUVU5MEswUlBhWGRoY21OSElpd2liV0ZqSWpvaU5tWmxOamM0WWpVMlpqTTJPVFJoTjJGbFpEYzFOMlJtTVdVeE9ETTVaR0ptT0RobU5qVXhOVFppWkdKaU5qSTVabVl6WXpreFl6SmlNVFU1WldaaE55Sjk=', 1661504161),
('EjwNyQoJV7M9Rf2k5TCag91WsmzSqd9ADyShVX5v', NULL, '20.210.235.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4240.193 Safari/537.36', 'ZXlKcGRpSTZJakJMYUN0SFZrbHFWSEZMZEhodWVsTlBkM0k0Vm1jOVBTSXNJblpoYkhWbElqb2liMFpHVkROck1FMXRVRkpMZVhsTE5rWTRUMlZxTkVkVlRXNDNXSEZJYzFKYUx6ZGFjM28zWkdkTVdpOHhZMEY2TUZBek1WSkNOblI2ZVU4dlFXeG5UbEJwVGsxcVZrbHZUVFp0TW1aNU1sRlljVmhZYW05RFdHdFhhbWR5YW1SaWVUUnpUSFJITVdOc1VVOHdhbkJLVlVwcmMwTk5OVUZWVkd4NFdsUmxjazFRU2pKdmRWTkZkVVJIYlRCV2FVaFpOR2d6YmtGRFRVTlphM0JDYUhOTmQxTllSa1EwYVd0amMxSnNNR3hUZGpVdk5HMVNUeXRUWkVGcFQzVnJSMU5YUlZkVmNIWmpTSFpHY1M5TlEyWnRUMmxhUWpGNFJ6YzVRMWhIUldRdmJtNXJVeloxZEhSbGFWQTRlWE5IYUd4UlVIZENURzFNYVZZMlpXazFRbFY2YWlJc0ltMWhZeUk2SW1GaE9EWTVOR05sTURZeU5UZ3lOalkwWlRZek5qVXlNbVZqWWpBNU5UVmpPV1psWmpFMFkyWTNabVJsT0dVd1lXTTRaVEpsWVdZMk5qSm1aRGRoT1dFaWZRPT0=', 1661500860),
('f0nxxREqHC20cDJegWTJcYMVYiQxaUqkUlDm4dIZ', NULL, '51.222.253.14', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'ZXlKcGRpSTZJbmhJU0dNMlNXWlhhbVpEU2pneVF5OXBSSHAyWTFFOVBTSXNJblpoYkhWbElqb2lNVXRIVlVKd2N6QlZaWFZEWldGM1JYWTFjRzlPV0dsRlQxbFVOVnAwTXk5V00xVkxURlEyYjFkNFVqZzVhV0pGYVRWaVdtaEdMMEpYVkRabWRtTmtZa3hzUTBNeGFHRnVVWFZRY1RNMFFsUjVURmxQZERaUmNHNU5aRGR5TW1kaVFscGxVa3RQVWtSVlIyeHFMekZ4ZFc1ak5GVnVTblpuT0hsbGQyMTZhVzFIZDNCbmRFTmtUV0ppVlVVMlFucG1iMHRhYmpCYWFEUmFSVVJWVkcxa1owdFlSMlJMV0ZoRGNVeFZWSFpRV2tSa2NGcEpOVWhTUTA5dmEyNVFTMk5wVUVkTWRVNW9hMU16TjJjeGJFTkdlblZsU2tSSE9XbE1OWEZSWTA5a09ETjRhRlY0Y1ZneVIzcHNUR1puUjFweFZGZDFUWE41YjJwMVIzZHRMMFJUVUU5V2VHWnVObU5rTVRaV2VERjNLMU4zYlhKeksyYzlQU0lzSW0xaFl5STZJbUl3WXpOaU9UVXhZMlExT1dRelptVTFPRGd5WW1Jd1lqQTBZVE5qT0dRek9EVTFOREJrTnpaaE16VXdZbUpoTTJSaU1HVXlPREJpTXpVM1ptSTFaRFlpZlE9PQ==', 1661496874),
('IZtGTsqgWzPRqfMpRbsf1yyvQwnJbzy4kiyKR1u9', NULL, '51.222.253.5', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'ZXlKcGRpSTZJbE5CUjBGcWFVWXhSbHBNT0hGSmFrTnFRbTkxTm5jOVBTSXNJblpoYkhWbElqb2lPSGt6VEZOMFQwVldOMGxSVDBZMFZtaHdaak5LZDNOR2NsaEhhRzlOZEVNMGNHbE9iM2xVVm5CRFVuZEhURWRtTDNOa1dWZFpOMlUxTkZkMlF6WXhiVnAzU1Zsa05FNDNSM2xoTDFGWFZEWkljVUZxVkROWVNqUldReTh6YkdWR1EwbFlOR0pVVWtVemQzaFRVVkp0ZHpaWE9FVnljR3czUlVzek9ITnVWM2QxWmxOS1FWZDJUWEpSYzFRMFFqTkRjWGhGWkcxVVpraEtPVFZvYkZOWU1GcHlaRkprU21aMVFXWTFhM00wUldwb1VXdzRUSFpsVnpZMlJtZzBjMUV6SzIwMlpHUklaMEZhVDA1Mk1IWmpibnAzY1Zvd0t6UndiVlpoYlVjMWRsSllkbGRGVGxwbk1ISm1LMDU1YWtoTmVFaG1PWE5OTmtkM1RreFNRak5PUlNJc0ltMWhZeUk2SWpVMllUQXlOVEk0WmpVNU16QmhaRFUwWXpFNVl6QmtNelE0TmpNeVltSmxZVFUxTjJGaU5tVTVOREpoTkRRM1l6TmxZek0yT0dVNVlqaGlZVGhpT0RFaWZRPT0=', 1661474658),
('Lq0uB6u9J1vDdGrW38vecWn6YFKjb246Xlh0WPWz', NULL, '51.222.253.11', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'ZXlKcGRpSTZJbUZUZEd3M01sZGhaa3RyVVZCV1pFazJiVFZyU0hjOVBTSXNJblpoYkhWbElqb2lRbFpEWWtsTksweHpTVzE1TldGaVpXaFplV2MzVkdVMGVIZHRUV05pVlRWd04wdDZSa2t3TTJGT2JITkZlRkZDWkZZMll6QkRkMHRpS3lzNFdXUlpORXhoZEUxV2VYQXpWbVJzUm5WR2JqSTVSV0V5VEVsb1NXbGlNbkF5Vm1adlMwZFBjV0pNSzA5eFpHb3JhMVkxZGpSME5qbFpOWFJ3T1M5M1RGSXlkMUp6WjNCT2VVNHpOV1ZJTVhvdmNXdE5kbFZJTDJwck1YWXZhM0ZyY3pVNVpYZEVabE0yUldSMmRtMDRXVVV2TVc1Q1JVb3ZSSGt3VHpKTmFtTnlTRUl2ZUhGUVUwVm5TVWRxTmtKQ2JuaFNTMjFKZFZrdlNXbDJXV0Z3VkhGYU5ITnlVa2xCU1hONVpsbENkR2RKU1ZKNFRrWlpRMlZyTlV4NFl6WktSR1ZOZEdORFZIQkpjR3RPWkRnMFZXZ3piM2RxTlVwWE1VRTlQU0lzSW0xaFl5STZJbUZrT1RWbE9HTXlaR0psWWpReFlXRXdaVFl5WXpabVpXVTRNVGMwT1Rnek5XVTNZMlV3WXpSbFpXWTVaamMzWkdKaU9EQmhPRGhoTWpSaU5EUXlOVFFpZlE9PQ==', 1661501776),
('QuFniFrQrMUajcjcGJEVUZJJ3I7XWIhg7gZR3sAS', NULL, '51.222.253.5', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'ZXlKcGRpSTZJa1JRUWxVMU5XTTJaVE54V0M5bGRtWjZSMEZQVVVFOVBTSXNJblpoYkhWbElqb2lXRmgzU1ZwRFJsbFBjRmRLUW1WVWJXbEdVR3hDVldOa2FrcDZhRkZUT1dSS2RFVXpWRlp2THpaalJISnpiSEJQS3l0RE1WRTBWakV6VG1aM1pqWTNVM1pTVlRkeVNITnZPSE5yTWk5M2JFWmtaMjl6ZG1oTVVsZEJVSEY0WTJaRFIxUlRhbnBxY0dGdWNFSm5RWGg2YkRGaVVFTm5ObE0zT1V0WlpHTnhiWEpPWVRNM1kycE5jMHRtT0dsRGFFTnRabVJNT0VaYWJXdDBlR2d5UjFSdVNEUldWWFJWUnpWWWFHMUVTazFTT0Roc1VtOU9PVEp1VFVaMlpUUk1SbFpTWjA1bGNVbzRhVGx1UldveFlXRjBOR05CWlZVcmRrMU5VWFZCVjJjNVkyWmhZV016ZFhOalQwcHdaR3R6YmpCSU4wRjNaRlJxVjJwVlMwcFRXVEZWTHlJc0ltMWhZeUk2SW1VeVpEQXpaR0kxWmpObFptSTFOMlV5TjJJNU5UZzFPV1E1TW1WalptWm1aVEUxWVROaVpEQmpNakkxWkRnMU9EQmhZMlZpTWpFeU5tVmlZall4TUdZaWZRPT0=', 1661474677),
('SPaBoQK0nLK14XYH9a1LRbjmjs7IhZg74p6MmEdW', NULL, '66.249.79.93', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.5112.79 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'ZXlKcGRpSTZJbkpYS3l0RlMwcE1lazlIYzBKb04zcG1jMlpYY25jOVBTSXNJblpoYkhWbElqb2lRV3hZYjJkU1NWcHVTMGRNT0dKNmRtSlpZM1JyVFU1bE5qRkRVME01UVdzMk9HcHhVRFkzUzFScVFuVkJNelFyVGxsUk9DdHNjSGRKTUhaQmJsWk1lbGRzU2l0NFEyOVVWaXRrUm5KcE0zbHJVVGRuUXpkTFNGQjBRWEZSVVRSMlJFMVdibVZyV1RocFVHOTBZbFF2YkdkSFNIaFhlVzVyTHk5V1NqaHhaRWwyU25KalRtZE1aSGQ1Y0VJMVZrbHVSV2hKYjI1cWVuSnBibEZ4Vms1b1JYWlROVmRtT0VoM1VVTlhOWGh1YmtsVVVWWkNXRmhrUkRWcFpFWTRRMGRNVWsxWFVtOUJOSEFyUkhJNVZ6Qm1XblJGZWxGTVUweFlaMjQyWlhwT2RFaEJLM2hRZVVkbUwyWlNVbWh5V1ZCdFZFUnhlakUwVVRRNE5XSnNTWFpxTVZKck4ySTBhbHBOY201WE5tNHJlQzh5UVVkclYwRTlQU0lzSW0xaFl5STZJakppWldOaVpUVmlaREZsTURJMk1UWmlaR1F4TVdaaVpEZ3daVFEyTVRJeE1qVmlOalV5WkdabE0yRmtNVEE0TURsa01UazNPR1ZoT1RFNE9HRmlNamNpZlE9PQ==', 1661477195),
('SyHlulTKXRVDW7Hzi4Vjxd3kwoo3FlpALm6ezeAX', NULL, '34.93.159.48', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'ZXlKcGRpSTZJbkl6VjBnNWFVVmpSM2xSVEdGaVNrOU1PV0l6UlZFOVBTSXNJblpoYkhWbElqb2lSSE5LVUVKUE5saDZkSFZKYWpWWVIxSkRWR1F6ZG1OSk5EaERjbkpRYzFsc01rWlpSR1J0VFROa01FcGthbGw2ZGpONVRVNUtRVE5JWWxKTmNVOVBPWGRwYkdKb2FrSXJla05uWms5R05rdHBhMjVJZWpOMVRUaFRSa2wyYmxCdFJrVlNhRlYxVTIxRVNERlNaMDlSU2pOSk5qWnlSa0pOTVVwMU9FTkpNV3hzWjI5UU1XMW1kMDF2YjFGR09WZEpNeTlXT0ZGUVpIVk9NRWsxVEU0eFpteFlOMFk1Wm5WeE5WaEVhWFl4YVVOVGFXbFBUa1ppYjNjdkwyOUpkMHhhZFhCNFlYbFVSbU5hVkZnelUyVnNNa3R2TjFWSFdXMVlNQ3Q0VEcxUWMyMDNURmxFWjNoVU1reG5kWGw2U25oT1JFWkVSMmxYZURFM1UxWTRZbmRUTVNJc0ltMWhZeUk2SW1ZM05tTTRZVEF5TkdRM01qaGhNREJrTTJZek56STBNREZtT1RrMk9XSTBOREJpWmpJeE16SmxNbVU0WTJGbE1tVmpPVEpoWkdReU5ERTRNR1psWmpVaWZRPT0=', 1661477418),
('tc2vdxUhGOBb5q6U1LpoJuDB2g7kPn7vXH7OSw94', 33, '46.211.110.113', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.134 Safari/537.36 OPR/89.0.4447.104', 'ZXlKcGRpSTZJa2hsUVZKa2IzVjJSWEJpZGtwR1ExaFBaVlowVFhjOVBTSXNJblpoYkhWbElqb2lXVzFrYWtrMWRIbEVOM1ZRWW1ReGMwSXhWbFYyZEM5YVUwWnFaR2MxTmpCbFJ6TndZVmRTWVhKTVVWUlBXblZyZUVaNVNHZGhOV0ZIZWtSQ09IcERjbWxrUVZSU1NVdEdiRmhMVmtkR2JHeE9OMEZ5TW1GRk4wVnBPVFJCWjNoVU1IZ3JPVlowUjFKV2RsaDFhWGhTWlZkT2RXUTNOVzEzWWtkQlJVeEllSEJtWkV4eFpHWnRTR0ZKVkVsdVpra3ZTMEZGV0dWM1MyOUdSeloyZEUxbFN6UkVjSFJ6YnpKeFpuUXhSWFYwU1ZoRU9WQlFPV3BNVmtwRmJGVlVhbVl3TWtaeGVEWnpaVEp1Y1hJdmRDdFRibWhtUjNJeFpraFdZbXhuVGk5RGVscG1RU3RVUjJWamNHOUxSMVZuWW1aTFVuSlpjak41TlRSUWNXWTBOSE40ZWpkdU1uWk5TbUU0YzFvdmNETTFiMDlqWjNkMU1ISmpRMGg0UmpSMlFUZEpaRWwzZHpseFRDOTVhaTgxYkZoYWF6SllNbFUxZDNkbFVVUnFjM2R0T1d0TUszWndaa3BOZURFclUyaFdiRmRXWjJGWVEyaDJTREJyVlZwU2JsbEpiMmszYlZkUWFsaE9aMUJCYm5GQmEyTkZXRnAwWkN0MWJFTkRVeTl1WlZwaklpd2liV0ZqSWpvaVpHWXpZbU5pWm1NeU1qZ3hNemM0T0dNd1lUa3pNVGM1WXpSa01EbGxNVFkzWWpjMllXSmhObVpsTWpFNFlqWTBaVFkxTURKaU9ETmhPVE5rTURGa1lTSjk=', 1661503885);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vk_id` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `vk_first_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `vk_last_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `access` int(4) NOT NULL DEFAULT 0,
  `verification_time` datetime DEFAULT NULL,
  `verification_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verify` int(4) NOT NULL DEFAULT 0,
  `balance_real` int(8) NOT NULL DEFAULT 0,
  `balance_game` int(16) NOT NULL DEFAULT 0,
  `kits_game` int(8) NOT NULL DEFAULT 0,
  `api_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auth_at` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `inviter_id` int(16) NOT NULL DEFAULT 0,
  `inviter_income` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `logout` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accessToken` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serverID` varchar(41) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hwidId` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password`, `vk_id`, `vk_first_name`, `vk_last_name`, `ip_address`, `image`, `remember_token`, `status`, `access`, `verification_time`, `verification_code`, `email_verify`, `balance_real`, `balance_game`, `kits_game`, `api_key`, `auth_at`, `password_at`, `created_at`, `updated_at`, `inviter_id`, `inviter_income`, `logout`, `uuid`, `accessToken`, `serverID`, `hwidId`) VALUES
(29, 'mogilinkola@gmail.com', 'Red_Assassin', '$2y$10$dgfdK7gxn5g3LKM/U9GqRutVNBReqA/zFDKVQtCrvSKxlU2v36GOK', '0', '0', '0', '154.28.188.237', NULL, NULL, 1, 0, '2022-08-25 12:46:51', NULL, 0, 0, 0, 0, '4gc5VVfGvPmJUHSboiyK4X1tRRDwi7', '1661420811', '0000-00-00 00:00:00', '2022-08-25 19:46:51', '2022-08-25 19:46:51', 0, '0', '0', '730d5abc-249e-11ed-95d4-002590afb77c', NULL, NULL, NULL),
(33, 'slivetv01@gmail.com', 'XionioX', '$2y$10$ZBjwVB9HFgiit9eNcv5eduP.txKXklRxAIp97M6QnRe/TcDD0XL7m', '0', '0', '0', '46.211.110.113', NULL, 'KdNLN0TnJyzhgub1Zlpf0s4rpmxMGM7MD8OaCnMAYwkjw7KsluiEwYd55SSW', 1, 0, '2022-08-26 00:16:56', NULL, 0, 0, 0, 0, 'nnf0NOlcIv4NALUpHmJGXt7GmokABl', '1661503858', '0000-00-00 00:00:00', '2022-08-26 07:16:56', '2022-08-26 18:50:58', 0, '0', '0', '613644f8-316a-3715-bdff-c0c5f9923a9f', NULL, NULL, NULL),
(34, 'verhovla@gmail.com', 'RileyBlair', '$2y$10$y9BDjdiF9kvGW5qS8RJwc.eph8pcwtJ4idQJ/oYag3m6yKr4hgqQO', '0', '0', '0', '37.22.18.157', NULL, NULL, 1, 0, '2022-08-26 11:54:29', NULL, 0, 0, 0, 0, 'uuYrcqPZ4bS5utQi0rlOoWvS2y0Lp0', '1661504069', '0000-00-00 00:00:00', '2022-08-26 18:54:29', '2022-08-26 18:54:29', 0, '0', '0', '1c40fc82-4ee0-344e-92c8-7e3bb93b3fbe', NULL, NULL, NULL);

--
-- Триггеры `users`
--
DELIMITER $$
CREATE TRIGGER `setUUID` BEFORE INSERT ON `users` FOR EACH ROW BEGIN
IF NEW.uuid IS NULL THEN
SET NEW.uuid = UUID();
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `users_auth`
--

CREATE TABLE `users_auth` (
  `id` int(8) NOT NULL,
  `user_id` int(8) NOT NULL,
  `user_ip` varchar(100) NOT NULL,
  `user_os` varchar(200) NOT NULL DEFAULT 'Unknown',
  `user_browser` varchar(200) NOT NULL DEFAULT 'Unknown',
  `type` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users_auth`
--

INSERT INTO `users_auth` (`id`, `user_id`, `user_ip`, `user_os`, `user_browser`, `type`, `created_at`, `updated_at`) VALUES
(43, 27, '127.0.0.1', 'Windows', 'Chrome', 1, '2020-11-17 18:13:13', '2020-11-17 18:13:13'),
(44, 1, '127.0.0.1', 'Windows', 'Chrome', 1, '2021-01-04 13:17:36', '2021-01-04 13:17:36'),
(45, 1, '127.0.0.1', 'Windows', 'Chrome', 1, '2021-01-04 14:20:05', '2021-01-04 14:20:05'),
(46, 1, '127.0.0.1', 'Windows', 'Chrome', 1, '2021-01-12 14:03:41', '2021-01-12 14:03:41'),
(47, 1, '127.0.0.1', 'Windows', 'Chrome', 1, '2021-01-15 11:22:47', '2021-01-15 11:22:47'),
(48, 1, '127.0.0.1', 'Windows', 'Chrome', 1, '2021-01-18 20:18:50', '2021-01-18 20:18:50'),
(49, 1, '127.0.0.1', 'Windows', 'Chrome', 1, '2021-02-12 13:55:55', '2021-02-12 13:55:55'),
(50, 1, '127.0.0.1', 'Windows', 'Chrome 88.0.4324.190', 1, '2021-02-28 14:57:18', '2021-02-28 14:57:18'),
(51, 1, '127.0.0.1', 'Windows', 'Chrome 88.0.4324.190', 1, '2021-02-28 15:04:43', '2021-02-28 15:04:43'),
(52, 1, '127.0.0.1', 'Windows', 'Chrome 88.0.4324.190', 1, '2021-02-28 15:08:36', '2021-02-28 15:08:36'),
(53, 1, '127.0.0.1', 'Windows', 'Chrome 88.0.4324.190', 1, '2021-02-28 15:21:07', '2021-02-28 15:21:07'),
(54, 1, '127.0.0.1', 'Windows', 'Chrome 88.0.4324.190', 1, '2021-02-28 15:21:56', '2021-02-28 15:21:56'),
(55, 1, '127.0.0.1', 'Windows', 'Chrome 88.0.4324.190', 1, '2021-02-28 15:23:18', '2021-02-28 15:23:18'),
(56, 1, '127.0.0.1', 'Windows', 'Chrome 88.0.4324.190', 1, '2021-02-28 15:55:28', '2021-02-28 15:55:28'),
(57, 1, '127.0.0.1', 'Windows', 'Chrome', 0, '2021-02-28 15:56:09', '2021-02-28 15:56:09'),
(58, 1, '127.0.0.1', 'Windows', 'Chrome 88.0.4324.190', 1, '2021-02-28 15:56:22', '2021-02-28 15:56:22'),
(59, 28, '46.211.235.48', 'Windows', 'Opera', 1, '2022-08-25 18:14:41', '2022-08-25 18:14:41'),
(60, 28, '46.211.235.48', 'Windows', 'Opera 89.0.4447.104', 1, '2022-08-25 18:25:08', '2022-08-25 18:25:08'),
(61, 29, '154.28.188.237', 'Windows', 'Opera', 1, '2022-08-25 19:46:51', '2022-08-25 19:46:51'),
(62, 28, '46.211.16.138', 'Windows', 'Chrome 104.0.0.0', 1, '2022-08-25 21:14:36', '2022-08-25 21:14:36'),
(63, 28, '77.111.244.29', 'Windows', 'Opera 89.0.4447.104', 1, '2022-08-25 22:26:49', '2022-08-25 22:26:49'),
(64, 28, '77.111.244.29', 'Windows', 'Opera 89.0.4447.104', 1, '2022-08-25 22:34:57', '2022-08-25 22:34:57'),
(65, 28, '77.111.244.29', 'Windows', 'Opera 89.0.4447.104', 1, '2022-08-25 22:35:39', '2022-08-25 22:35:39'),
(66, 30, '46.211.16.138', 'Windows', 'Opera', 1, '2022-08-26 00:33:45', '2022-08-26 00:33:45'),
(67, 31, '88.155.16.82', 'Windows', 'Opera', 1, '2022-08-26 03:52:31', '2022-08-26 03:52:31'),
(68, 32, '46.211.93.2', 'Windows', 'Opera', 1, '2022-08-26 07:08:19', '2022-08-26 07:08:19'),
(69, 33, '46.211.93.2', 'Windows', 'Opera', 1, '2022-08-26 07:16:56', '2022-08-26 07:16:56'),
(70, 33, '46.211.110.113', 'Windows', 'Opera 89.0.4447.104', 1, '2022-08-26 18:50:58', '2022-08-26 18:50:58'),
(71, 34, '37.22.18.157', 'Windows', 'Firefox', 1, '2022-08-26 18:54:29', '2022-08-26 18:54:29');

-- --------------------------------------------------------

--
-- Структура таблицы `users_prefixes`
--

CREATE TABLE `users_prefixes` (
  `id` int(8) UNSIGNED NOT NULL,
  `user_id` int(8) NOT NULL,
  `server_id` int(8) NOT NULL,
  `prefix_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `prefix_mine` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `prefix_full` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users_privileges`
--

CREATE TABLE `users_privileges` (
  `id` int(8) UNSIGNED NOT NULL,
  `user_id` int(8) NOT NULL,
  `server_id` int(8) NOT NULL,
  `privilege_id` int(8) UNSIGNED NOT NULL,
  `privilege_term` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '30',
  `privilege_price` int(32) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users_ratings`
--

CREATE TABLE `users_ratings` (
  `id` int(8) UNSIGNED NOT NULL,
  `user_id` int(8) NOT NULL,
  `votes` int(8) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `gateway_freekassa`
--
ALTER TABLE `gateway_freekassa`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `gateway_paylogs`
--
ALTER TABLE `gateway_paylogs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `gateway_transact`
--
ALTER TABLE `gateway_transact`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `gateway_unitpay`
--
ALTER TABLE `gateway_unitpay`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `hwids`
--
ALTER TABLE `hwids`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `publickey` (`publickey`(255));

--
-- Индексы таблицы `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `kits`
--
ALTER TABLE `kits`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `privileges`
--
ALTER TABLE `privileges`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `promos`
--
ALTER TABLE `promos`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ratings_settings`
--
ALTER TABLE `ratings_settings`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `servers`
--
ALTER TABLE `servers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `users_hwidfk` (`hwidId`);

--
-- Индексы таблицы `users_auth`
--
ALTER TABLE `users_auth`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users_prefixes`
--
ALTER TABLE `users_prefixes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users_privileges`
--
ALTER TABLE `users_privileges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `privilege_id` (`privilege_id`);

--
-- Индексы таблицы `users_ratings`
--
ALTER TABLE `users_ratings`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `gateway_freekassa`
--
ALTER TABLE `gateway_freekassa`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `gateway_paylogs`
--
ALTER TABLE `gateway_paylogs`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `gateway_transact`
--
ALTER TABLE `gateway_transact`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `gateway_unitpay`
--
ALTER TABLE `gateway_unitpay`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `hwids`
--
ALTER TABLE `hwids`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `items`
--
ALTER TABLE `items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `kits`
--
ALTER TABLE `kits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `privileges`
--
ALTER TABLE `privileges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `promos`
--
ALTER TABLE `promos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `ratings_settings`
--
ALTER TABLE `ratings_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `servers`
--
ALTER TABLE `servers`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT для таблицы `users_auth`
--
ALTER TABLE `users_auth`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT для таблицы `users_prefixes`
--
ALTER TABLE `users_prefixes`
  MODIFY `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users_privileges`
--
ALTER TABLE `users_privileges`
  MODIFY `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `users_ratings`
--
ALTER TABLE `users_ratings`
  MODIFY `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_hwidfk` FOREIGN KEY (`hwidId`) REFERENCES `hwids` (`id`);

--
-- Ограничения внешнего ключа таблицы `users_privileges`
--
ALTER TABLE `users_privileges`
  ADD CONSTRAINT `privileges_id` FOREIGN KEY (`privilege_id`) REFERENCES `privileges` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
