-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Окт 01 2018 г., 00:31
-- Версия сервера: 5.7.23
-- Версия PHP: 7.1.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- База данных: `yee2_loc`
--

-- --------------------------------------------------------

--
-- Структура таблицы `auditory`
--

CREATE TABLE `auditory` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `building_id` mediumint(8) UNSIGNED NOT NULL,
  `cat_id` mediumint(8) UNSIGNED DEFAULT NULL,
  `study_flag` enum('0','1') NOT NULL,
  `num` int(3) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `slug` varchar(64) DEFAULT NULL,
  `floor` varchar(32) NOT NULL,
  `area` float NOT NULL,
  `capacity` mediumint(3) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `order` mediumint(8) UNSIGNED NOT NULL,
  `status` int(8) NOT NULL DEFAULT '10'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Аудитории школы';

--
-- Дамп данных таблицы `auditory`
--

INSERT INTO `auditory` (`id`, `building_id`, `cat_id`, `study_flag`, `num`, `name`, `slug`, `floor`, `area`, `capacity`, `description`, `order`, `status`) VALUES
(1, 1, 9, '1', 0, 'По классам', NULL, '', 0, 0, '', 43, 10),
(36, 1, 11, '1', 1, 'Класс архитектуры', NULL, '1', 20.3, 10, '', 0, 10),
(37, 1, 11, '1', 10, 'Класс скульптуры', NULL, '1', 20, 10, 'Художественная керамика', 0, 10),
(38, 1, 11, '1', 11, 'ИЗО', NULL, '1', 20.1, 12, '', 0, 10),
(39, 1, 11, '1', 12, 'ИЗО', NULL, '1', 19.9, 12, '', 0, 10),
(40, 1, 11, '1', 2, 'Класс развития', NULL, '1', 20.3, 6, 'Мандариновое детство', 0, 10),
(41, 1, 11, '1', 3, 'Класс развития', NULL, '1', 21.2, 8, 'Мандариновое детство', 0, 10),
(42, 1, 11, '1', 4, 'Класс развития', NULL, '1', 14.8, 7, 'Мандариновое детство', 0, 10),
(43, 1, 11, '0', 5, 'Администраторы', NULL, '1', 12.2, 0, '', 0, 10),
(44, 1, 11, '0', 6, 'Учительская', NULL, '1', 12.3, 0, '', 0, 10),
(45, 1, 11, '0', 7, 'Лаборатория', NULL, '1', 9.7, 0, 'Художественная керамика', 0, 10),
(46, 1, 11, '1', 8, 'ИЗО', NULL, '1', 21.1, 12, '', 0, 10),
(47, 1, 11, '1', 9, 'ИЗО', NULL, '1', 14.8, 8, '', 0, 10),
(52, 1, 1, '1', 106, 'Класс композиции', NULL, '1', 32.9, 14, '', 0, 10),
(53, 1, 1, '1', 107, 'Класс скульптуры', NULL, '1', 31.9, 14, '', 0, 10),
(54, 1, 1, '1', 109, 'Класс живописи', NULL, '1', 42, 14, '', 0, 10),
(55, 1, 1, '1', 110, 'Класс живописи', NULL, '1', 35.8, 14, '', 0, 10),
(56, 1, 1, '1', 111, 'Класс рисунка', NULL, '1', 40.9, 14, '', 0, 10),
(57, 1, 1, '1', 114, 'Класс теоретических дисциплин', NULL, '1', 27.5, 14, '', 0, 10),
(58, 1, 1, '1', 115, 'Класс теоретических дисциплин', NULL, '1', 39.6, 14, '', 0, 10),
(59, 1, 1, '1', 116, 'Класс теоретических дисциплин', NULL, '1', 38.1, 14, '', 0, 10),
(60, 1, 1, '1', 117, 'Хоровой класс', NULL, '1', 50.3, 0, 'Музыкальный фольклор', 0, 10),
(61, 1, 1, '0', 119, 'Художественный фонд', NULL, '1', 13.2, 0, '', 0, 10),
(62, 1, 1, '1', 120, 'Класс теоретических дисциплин', NULL, '1', 25.5, 14, '', 0, 10),
(63, 1, 1, '1', 121, 'Класс теоретических дисциплин', NULL, '1', 35.9, 14, '', 0, 10),
(64, 1, 2, '1', 103, 'Малый зал', NULL, '1', 93.8, 0, '', 168, 10),
(65, 1, 3, '1', 201, 'Кабинет директора', NULL, '2', 29, 0, '', 0, 10),
(66, 1, 1, '1', 205, 'Класс индивидуальных занятий', NULL, '2', 29.6, 0, '', 0, 10),
(67, 1, 1, '1', 206, 'Класс индивидуальных занятий', NULL, '2', 28.2, 0, 'Фортепиано', 0, 10),
(68, 1, 1, '1', 207, 'Класс индивидуальных занятий', NULL, '2', 26.7, 0, 'Фортепиано', 0, 10),
(69, 1, 1, '1', 208, 'Класс индивидуальных занятий', NULL, '2', 28, 0, 'Фортепиано', 0, 10),
(70, 1, 1, '1', 209, 'Класс индивидуальных занятий', NULL, '2', 27.9, 0, 'Фортепиано', 0, 10),
(71, 1, 1, '1', 210, 'Класс индивидуальных занятий', NULL, '2', 16.5, 0, 'Арфа', 0, 10),
(72, 1, 1, '1', 211, 'Класс индивидуальных занятий', NULL, '2', 21.2, 0, 'Фортепиано', 0, 10),
(73, 1, 1, '1', 212, 'Класс ансамбля', NULL, '2', 46.6, 0, 'Народные инструменты', 0, 10),
(74, 1, 1, '1', 213, 'Класс индивидуальных занятий', NULL, '2', 25.2, 0, 'Духовые инструменты', 0, 10),
(75, 1, 1, '1', 214, 'Класс индивидуальных занятий', NULL, '2', 25.7, 0, 'Духовые инструменты', 0, 10),
(76, 1, 1, '1', 215, 'Класс индивидуальных занятий', NULL, '2', 26.9, 0, 'Духовые инструменты', 0, 10),
(77, 1, 1, '1', 216, 'Класс ансамбля', NULL, '2', 30.2, 0, 'Струнные инструменты', 0, 10),
(78, 1, 1, '1', 217, 'Класс индивидуальных занятий', NULL, '2', 10.7, 0, '', 0, 10),
(79, 1, 1, '1', 220, 'Класс индивидуальных занятий', NULL, '2', 15.3, 0, '', 0, 10),
(81, 1, 1, '1', 219, 'Класс индивидуальных занятий', NULL, '2', 12, 0, '', 0, 10),
(82, 1, 1, '1', 218, 'Класс индивидуальных занятий', NULL, '2', 29.2, 0, '', 0, 10),
(83, 1, 1, '1', 221, 'Класс духового оркестра', NULL, '2', 64.9, 0, '', 0, 10),
(84, 1, 3, '0', 222, 'Инженерная служба', NULL, '2', 19.3, 0, '', 0, 10),
(85, 1, 3, '0', 104, 'Кабинет зам. директора по АХР', NULL, '1', 23, 0, '', 0, 10),
(86, 1, 3, '0', 105, 'Кабинет зам. директора', NULL, '1', 36, 0, '', 0, 10),
(87, 1, 3, '0', 122, 'Кабинет зам. директора по кадрам', NULL, '1', 16, 0, '', 0, 10),
(88, 1, 3, '0', 202, 'Кабинет зам. директора по оргвопросам', NULL, '2', 12, 0, '', 0, 10),
(89, 1, 3, '0', 203, 'Кабинет главного бухгалтера', NULL, '2', 16, 0, '', 0, 10),
(90, 1, 3, '0', 204, 'Бухгалтерия', NULL, '2', 37, 0, '', 0, 10),
(91, 1, 2, '1', 302, 'Большой Зал', NULL, '3', 362, 283, '', 105, 10),
(92, 1, 1, '1', 303, 'Хоровой класс', NULL, '3', 85, 0, '', 0, 10),
(93, 1, 1, '1', 304, 'Класс индивидуальных занятий', NULL, '3', 23.9, 0, 'Фортепиано', 0, 10),
(94, 1, 1, '1', 305, 'Класс индивидуальных занятий', NULL, '3', 23.8, 0, 'Фортепиано', 0, 10),
(95, 1, 1, '1', 306, 'Класс индивидуальных занятий', NULL, '3', 23.1, 0, 'Фортепиано', 0, 10),
(96, 1, 3, '1', 312, 'Компьютерный класс', NULL, '3', 37.3, 14, '', 0, 10),
(97, 1, 3, '0', 313, 'Библиотека', NULL, '3', 19.6, 0, '', 0, 10),
(98, 1, 1, '1', 314, 'Класс индивидуальных занятий', NULL, '3', 15.8, 0, 'Вокал', 0, 10),
(99, 1, 1, '1', 317, 'Класс хореографии', NULL, '3', 85, 0, '', 0, 10),
(100, 1, 1, '1', 333, 'Класс индивидуальных занятий', NULL, '3', 20, 0, 'Фортепиано', 0, 10),
(101, 1, 1, '1', 336, 'Класс хореографии', NULL, '3', 77.9, 0, '', 0, 10),
(102, 1, 1, '1', 350, 'Класс индивидуальных занятий', NULL, '3', 20, 0, '', 0, 10),
(103, 1, 1, '1', 351, 'Класс индивидуальных занятий', NULL, '3', 15.9, 0, 'Народные инструменты', 0, 10),
(104, 1, 1, '1', 358, 'Класс индивидуальных занятий', NULL, '3', 11.3, 0, '', 0, 10),
(105, 1, 1, '1', 357, 'Класс индивидуальных занятий', NULL, '3', 12.1, 0, '', 0, 10),
(106, 1, 1, '1', 356, 'Класс индивидуальных занятий', NULL, '3', 15, 0, 'Фортепиано', 0, 10),
(107, 1, 1, '1', 355, 'Класс индивидуальных занятий', NULL, '3', 10, 0, '', 0, 10),
(108, 1, 1, '1', 347, 'Класс эстрадно-джазового оркестра', NULL, '3', 37.7, 0, '', 0, 10),
(109, 1, 1, '1', 346, 'Класс ударных инструментов', NULL, '3', 26.7, 0, '', 0, 10),
(110, 1, 4, '', 401, 'Помещение множительной техники', NULL, '4', 0, 0, '', 0, 10),
(111, 1, 4, '', 232, 'Серверная', NULL, '2', 0, 0, '', 0, 10),
(112, 1, 7, '1', 102, 'Вестибюль 1-го этажа', NULL, '1', 0, 0, '', 0, 10),
(113, 1, 7, '0', 101, 'Помещение охраны', NULL, '1', 0, 0, '', 0, 10),
(114, 1, 7, '1', 200, 'Вестибюль 2-го этажа', NULL, '2', 0, 0, '', 0, 10),
(115, 1, 7, '1', 301, 'Вестибюль 3-го этажа', NULL, '3', 0, 0, 'Музей', 0, 10),
(116, 1, 10, '', 515, 'Мастерская', NULL, '0', 0, 0, '', 0, 10),
(117, 1, 8, '', 112, 'Буфет', NULL, '1', 0, 0, '', 0, 10),
(118, 1, 7, '1', 141, 'Холл 1-го этажа', NULL, '1', 0, 0, 'Для выставок ИЗО', 0, 10),
(119, 1, 7, '1', 241, 'Холл 2-го этажа', NULL, '2', 0, 0, 'Для выставок ИЗО', 0, 10),
(120, 1, 7, '1', 332, 'Холл 3-го этажа', NULL, '3', 0, 0, 'Для высавок ИЗО', 0, 10),
(121, 1, 3, '0', 503, 'Массажный кабинет', NULL, '0', 0, 0, '', 0, 10),
(122, 1, 2, '', 501, 'Тренажерный зал', NULL, '0', 81.1, 0, '', 0, 10),
(123, 1, 3, '', 502, 'Тренерская', NULL, '0', 6.1, 0, '', 0, 10),
(124, 1, 3, '', 513, 'Кабинет', NULL, '0', 0, 0, '', 0, 10),
(125, 1, 4, '', 511, 'Тоновая студии звукозаписи', NULL, '0', 0, 0, '', 0, 10),
(126, 1, 4, '', 512, 'Студия звукозаписи', NULL, '0', 0, 0, '', 0, 10),
(127, 1, 10, '', 514, 'Мастерская', NULL, '0', 0, 0, '', 0, 10),
(128, 1, 5, '', 516, 'Складское помещение', NULL, '0', 0, 0, '', 0, 10),
(129, 1, 5, '', 517, 'Складское помещение', NULL, '0', 0, 0, '', 0, 10),
(130, 1, 7, '0', 0, 'Лестничные марши и пролеты 1-3 эт', NULL, '', 0, 0, '', 0, 10),
(131, 1, 7, '0', 23, 'ИЗО', NULL, '1', 0, 20, 'Холл', 0, 10),
(132, 1, 4, '0', 401, 'Помещение звукооператора', '', '4', 0, 2, '', 0, 10);

-- --------------------------------------------------------

--
-- Структура таблицы `auditory_building`
--

CREATE TABLE `auditory_building` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `slug` varchar(64) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Здания школы';

--
-- Дамп данных таблицы `auditory_building`
--

INSERT INTO `auditory_building` (`id`, `name`, `slug`, `address`) VALUES
(1, 'Основное здание', 'ОЗ', 'Митинская ул. д.47, кор.1');

-- --------------------------------------------------------

--
-- Структура таблицы `auditory_cat`
--

CREATE TABLE `auditory_cat` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` varchar(256) NOT NULL,
  `study_flag` enum('0','1') NOT NULL,
  `order` mediumint(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='false=условный';

--
-- Дамп данных таблицы `auditory_cat`
--

INSERT INTO `auditory_cat` (`id`, `name`, `description`, `study_flag`, `order`) VALUES
(1, 'Аудитории и классы', '', '1', 0),
(2, 'Залы', '', '1', 0),
(3, 'Кабинеты', '', '1', 0),
(4, 'Служебные помещения', '', '0', 0),
(5, 'Складские помещения', '', '0', 0),
(6, 'Подсобные помещения', '', '0', 0),
(7, 'Коридоры и холлы', '', '1', 0),
(8, 'Другие помещения', '', '0', 0),
(9, 'Условные классы', '', '1', 0),
(10, 'Технические помещения', '', '0', 0),
(11, 'Филиал школы', 'помещения Художественного отделения', '1', 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `auditory`
--
ALTER TABLE `auditory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`),
  ADD KEY `building_id` (`building_id`);

--
-- Индексы таблицы `auditory_building`
--
ALTER TABLE `auditory_building`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `auditory_cat`
--
ALTER TABLE `auditory_cat`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `auditory`
--
ALTER TABLE `auditory`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT для таблицы `auditory_building`
--
ALTER TABLE `auditory_building`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `auditory_cat`
--
ALTER TABLE `auditory_cat`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `auditory`
--
ALTER TABLE `auditory`
  ADD CONSTRAINT `auditory_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `auditory_cat` (`id`),
  ADD CONSTRAINT `auditory_ibfk_2` FOREIGN KEY (`building_id`) REFERENCES `auditory_building` (`id`);
