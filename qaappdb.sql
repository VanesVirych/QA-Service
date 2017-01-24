-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.6.10 - MySQL Community Server (GPL)
-- ОС Сервера:                   Win64
-- HeidiSQL Версия:              7.0.0.4328
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Дамп структуры базы данных qaappdb
CREATE DATABASE IF NOT EXISTS `qaappdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `qaappdb`;


-- Dumping structure for таблица qaappdb.answers
CREATE TABLE IF NOT EXISTS `answers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `questionid` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userid` int(10) unsigned DEFAULT NULL,
  `votes` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы qaappdb.answers: ~8 rows (приблизительно)
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` (`id`, `questionid`, `description`, `created_at`, `updated_at`, `userid`, `votes`) VALUES
	(11, 5, 'Если вы метите в джуниоры, то вам нужно несколько изменить порядок книг в вашей очереди.\r\n\r\nОтложите алгоритмы и TDD на последнюю очередь -- это безусловно очень важные темы, но для вашей цели не первоочередные.\r\nПознакомьтесь с паттернами (GoF) и "Рефакторингом" Фаулера.\r\nПрочитайте вдумчиво английское издание Effective Java Джошуа Блоха. Не загромождайте (поначалу) голову паззлерами.\r\nНу и, наконец, сформируйте то, что нужно работодателю -- кругозор. Получите представление о вещах, вращающихся вокруг Java. Вот вам набор ключевых слов: Java Collections Framework, Java EE, Spring Framework, Maven, Glassfish, JDBC... Не нужно углубляться. Осознайте, что это такое. Изучите туториалы.\r\n\r\nЯ считаю, для поставленной цели этого достаточно.', '2014-03-25 13:54:38', '2014-03-25 12:44:37', 1, 0),
	(12, 5, 'Если собираетесь идти в энтерпрайз, то обязательно изучите SQL, хотя бы основы. И любую систему ORM, наиболее распространена Hibernate.', '2014-03-25 13:54:36', '2014-03-25 12:44:37', 1, 0),
	(13, 5, 'В джентльменский набор входит практика. Шлите уже резюме на джуниора, если и не возьмут на работу - узнаете вопросы, ответ на которые интересен работодателю - погуглите, на следующем собеседовании будете более компетентны.', '2014-03-25 13:54:35', '2014-03-25 12:44:37', 1, 0),
	(18, 5, 'Да я смотрю я не один Java учу :) От себя добавлю: \r\ngoo.gl/2HwyP1 \r\nhttp://www.quizful.net/test/java_se_basic', '2014-03-25 12:44:37', '2014-03-25 12:44:37', 1, 0);
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;


-- Dumping structure for таблица qaappdb.answers_likes
CREATE TABLE IF NOT EXISTS `answers_likes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `answerid` int(10) unsigned NOT NULL,
  `userid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы qaappdb.answers_likes: ~6 rows (приблизительно)
/*!40000 ALTER TABLE `answers_likes` DISABLE KEYS */;
INSERT INTO `answers_likes` (`id`, `answerid`, `userid`) VALUES
	(153, 12, 76),
	(160, 18, 2),
	(162, 11, 1),
	(164, 12, 1);
/*!40000 ALTER TABLE `answers_likes` ENABLE KEYS */;


-- Dumping structure for таблица qaappdb.favorites
CREATE TABLE IF NOT EXISTS `favorites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `questionid` int(10) unsigned NOT NULL,
  `userid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы qaappdb.favorites: ~4 rows (приблизительно)
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` (`id`, `questionid`, `userid`) VALUES
	(7, 5, 2),
	(8, 8, 2),
	(9, 8, 1),
	(10, 26, 1);
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;


-- Dumping structure for таблица qaappdb.questions
CREATE TABLE IF NOT EXISTS `questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userid` int(10) unsigned DEFAULT NULL,
  `votes` int(10) unsigned DEFAULT NULL,
  `answers` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `title` (`title`,`description`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы qaappdb.questions: ~4 rows (приблизительно)
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` (`id`, `title`, `description`, `created_at`, `updated_at`, `userid`, `votes`, `answers`) VALUES
	(5, 'Учу Java. Как развиваться? ', 'Добрый день!<br>Неординарный вопрос - за сжатый срок времени (около полугода) мне необходимо получить объем знаний, позволяющий устроиться на работу джуниор девелопером. Пройдены Head First Java, Second Edition, вдумчиво читаю Эккеля, потом на очереди Седжвик "Алгоритмы", TDD Кента Бека и что нибудь по паттернам проектирования. Что еще входит в джентльменский набор? Что-то по Spring и Hibernate?', '2014-03-25 10:54:44', '2014-04-12 02:49:24', 74, NULL, NULL),
	(7, 'Какими русскими ресурсами по Twitter Bootstrap лучше воспользоваться?', 'Всем привет.\r\nХочу научиться верстке сайтов в Twitter Bootstrap.\r\nИмеются минимальные знания HTML.\r\nПосоветуйте с чего начать, какими ресурсами лучше воспользоваться?', '2014-03-25 10:54:49', '2014-03-18 18:12:15', 1, NULL, NULL),
	(8, 'Фронт-энд и... фриланс? Как развиваться начинающему разработчику в условиях провинции? ', 'Здравствуйте!\r\n\r\nХочу поделиться небольшой предысторией. С программированием я знаком достаточно давно - сначала это был Pascal в школе, потом C# в техникуме и институте, далее попытки изучить PHP. Однако, пытаясь изучить каждый из перечисленных выше языков, я чувствовал, что он мне не подходит, быстро перегорал и откладывал учебники в сторону. Однако, несколько месяцев назад, читая статьи на Хабре, все больше стал замечать, что мне интересен фронт-энд. Я начал читать книжки по верстке, открыл для себя препроцессоры, далее переключился на Javascript - прочитал полное руководство Флэнэгана, руководство по Бибо и Каца jQuery и дочитываю сейчас "секреты Javascript-ниндзя". И с каждой новой главой я понимаю, что это действительно мое. Мне нравятся оперировать замыканиями, прототипированием, манипулировать элементами DOM. Однако, я понимаю, что главная работа разработчика - решать задачи. Все было бы немного проще, если бы не географическое положение - я живу в небольшом городке с 200-тысячным населением и полным отсутствием IT-сферы. Переехать ближайший год я также не могу.\r\n\r\nТак вот, хочу обратится к разработчикам, которые, возможно, находились в подобной ситуации - как поступить максимально прагматично и не потерять это время впустую?\r\nКуда стоит дальше копать? Backbone? Angular?\r\nНу и, конечно же, где искать работу? Фриланс? Стоит ли браться за верстку?', '2014-03-25 10:54:42', '2014-03-25 13:05:42', 2, NULL, NULL),
	(26, 'Изучение javascript c чего начать', 'Не так давно занялся версткой сайтов, т.е. знаю html и css, но не знаю \r\nникаких языков программирования. Иногда возникает потребность переписать\r\n какие-то готовые решения под себя но упираюсь в отсутствие знаний. И в \r\nтаких случаях приходиться полагаться на интуицию.\r\n\r\n<br>Посоветуйте какие-нибудь уроки по js, желательно на русском.\r\nИли может надо начинать не с js, а с чего-то другого?<br>', '2014-04-12 15:55:22', '2014-04-12 15:55:33', 2, NULL, NULL);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;


-- Dumping structure for таблица qaappdb.questions_likes
CREATE TABLE IF NOT EXISTS `questions_likes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `questionid` int(10) unsigned NOT NULL,
  `userid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы qaappdb.questions_likes: ~5 rows (приблизительно)
/*!40000 ALTER TABLE `questions_likes` DISABLE KEYS */;
INSERT INTO `questions_likes` (`id`, `questionid`, `userid`) VALUES
	(28, 5, 2),
	(96, 7, 1),
	(106, 7, 2),
	(107, 8, 2),
	(108, 26, 1);
/*!40000 ALTER TABLE `questions_likes` ENABLE KEYS */;


-- Dumping structure for таблица qaappdb.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы qaappdb.roles: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`) VALUES
	(1, 'Admin'),
	(2, 'User');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;


-- Dumping structure for таблица qaappdb.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` varchar(10) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `points` int(11) DEFAULT '0',
  `moderator` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `lastactivity` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы qaappdb.users: ~15 rows (приблизительно)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `password`, `status`, `email`, `points`, `moderator`, `created_at`, `lastactivity`) VALUES
	(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'ACTIVE', 'email@gmail.com', 2, 122, '2014-03-24 11:34:33', '2013-11-01 19:58:15'),
	(2, 'ivan', '2c42e5cf1cdbafea04ed267018ef1511', 'ACTIVE', 'email', 0, 4, '2014-03-25 01:27:07', '0000-00-00 00:00:00'),
	(3, 'test', '098f6bcd4621d373cade4e832627b4f6', 'ACTIVE', 'Email', 0, NULL, '2014-03-25 14:02:37', '0000-00-00 00:00:00'),
	(74, 'r', '4b43b0aee35624cd95b910189b3dc231', 'ACTIVE', 'ffffffff', 0, NULL, '2014-03-25 10:54:44', '2014-04-12 13:47:05'),
	(75, 'mm', 'b3cd915d758008bd19d0f2428fbb354a', 'ACTIVE', 'mm@mm.com', 0, NULL, '2014-03-25 10:54:44', '2014-04-12 03:06:20'),
	(76, 'new', '21232f297a57a5a743894a0e4a801fc3', 'ACTIVE', 'new@gmail.com', 0, NULL, '2014-03-25 10:54:44', '2014-04-12 14:51:24'),
	(78, 'van', '957d2fa52c19a5aff4ccf5d9a959adab', 'ACTIVE', 'van', 0, NULL, NULL, '2014-04-12 13:56:06'),
	(79, 'h', '2510c39011c5be704182423e3a695e91', 'ACTIVE', 'h', 0, NULL, NULL, '2014-04-12 13:57:45'),
	(80, 'j', '363b122c528f54df4a0446b6bab05515', 'ACTIVE', 'j', 0, NULL, NULL, '2014-04-12 13:59:33'),
	(81, 'l', '2db95e8e1a9267b7a1188556b2013b33', 'ACTIVE', 'l', 0, NULL, '2014-04-12 06:40:30', '2014-04-12 14:10:30'),
	(82, 'K', 'a5f3c6a11b03839d46af9fb43c97c188', 'ACTIVE', 'K', 0, NULL, '2014-04-12 06:44:05', '2014-04-12 14:14:05'),
	(83, 'oo', 'e47ca7a09cf6781e29634502345930a7', 'ACTIVE', 'oo', 0, NULL, '2014-04-12 06:54:34', '2014-04-12 14:24:34'),
	(84, 'vk', '5d44a032652974c3e53644945a95b126', 'ACTIVE', 'vk', 0, NULL, '2014-04-12 06:55:51', '2014-04-12 14:25:51'),
	(85, 't', 'e358efa489f58062f10dd7316b65649e', 'ACTIVE', 't', 0, NULL, '2014-04-12 11:37:39', '2014-04-12 19:07:39'),
	(86, 'q', '7694f4a66316e53c8cdd9d9954bd611d', 'ACTIVE', 'q', 0, NULL, '2014-04-12 15:39:36', '2014-04-12 23:09:36');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


-- Dumping structure for таблица qaappdb.users_roles
CREATE TABLE IF NOT EXISTS `users_roles` (
  `userid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`roleid`),
  KEY `roleid` (`roleid`),
  CONSTRAINT `users_roles_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `users_roles_ibfk_2` FOREIGN KEY (`roleid`) REFERENCES `roles` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы qaappdb.users_roles: ~16 rows (приблизительно)
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` (`userid`, `roleid`) VALUES
	(1, 1),
	(3, 1),
	(1, 2),
	(2, 2),
	(74, 2),
	(75, 2),
	(76, 2),
	(78, 2),
	(79, 2),
	(80, 2),
	(81, 2),
	(82, 2),
	(83, 2),
	(84, 2),
	(85, 2),
	(86, 2);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
