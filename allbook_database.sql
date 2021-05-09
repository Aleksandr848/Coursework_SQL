DROP
DATABASE IF EXISTS allbooks;
CREATE
DATABASE allbooks;
USE
allbooks;

DROP TABLE IF EXISTS users;
CREATE TABLE users
(
    id            BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    email         VARCHAR(100),
    signed_up_at  TIMESTAMP DEFAULT now(),
    password_hash VARCHAR(100),
    PRIMARY KEY (id)
) ENGINE=InnoDB;

INSERT INTO `users` (`id`, `email`, `signed_up_at`, `password_hash`)
VALUES (''1'', ''hmurphy@example.com'', ''2016-07-18 17:20:17'', ''790db818b07de148eaa9d767e71ec70a79070bc1'');
INSERT INTO `users` (`id`, `email`, `signed_up_at`, `password_hash`)
VALUES (''2'', ''monique09@example.com'', ''2016-02-04 10:17:55'', ''56d29a516e4fd7a53f327e254e0608d973cedcba'');
INSERT INTO `users` (`id`, `email`, `signed_up_at`, `password_hash`)
VALUES (''3'', ''milo.huels@example.com'', ''1982-05-06 13:26:06'', ''9bc4048c66a9df27c9b0cdd458ec949f6e226e92'');
INSERT INTO `users` (`id`, `email`, `signed_up_at`, `password_hash`)
VALUES (''4'', ''zelda.pollich@example.org'', ''1996-09-18 01:24:59'', ''e446c8e5d0b33dc2dbe4fa8bf2d62118cb52b090'');
INSERT INTO `users` (`id`, `email`, `signed_up_at`, `password_hash`)
VALUES (''5'', ''umertz@example.net'', ''1982-01-22 14:46:19'', ''6515c515e5d16eeecad3ed12a0662642c29de1de'');
INSERT INTO `users` (`id`, `email`, `signed_up_at`, `password_hash`)
VALUES (''6'', ''thiel.hildegard@example.org'', ''2018-07-09 14:15:00'', ''9040790e0885d632c0949fc2796a7313408f1a2b'');
INSERT INTO `users` (`id`, `email`, `signed_up_at`, `password_hash`)
VALUES (''7'', ''igleason@example.com'', ''1989-08-10 15:42:43'', ''ae39d02752e11f896b8d5e2dd971a26b07a61904'');
INSERT INTO `users` (`id`, `email`, `signed_up_at`, `password_hash`)
VALUES (''8'', ''farrell.austin@example.net'', ''1990-06-12 22:10:44'', ''cf841fa9d6863f779bc3ab90493ec4d9dad0702a'');
INSERT INTO `users` (`id`, `email`, `signed_up_at`, `password_hash`)
VALUES (''9'', ''kobe.carter@example.net'', ''1991-12-12 05:32:41'', ''9e62f2814ebbcd5a53b5e58c76007b4124ca7745'');
INSERT INTO `users` (`id`, `email`, `signed_up_at`, `password_hash`)
VALUES (''10'', ''herzog.dominique@example.com'', ''2015-06-28 08:40:27'', ''0d0576d91cecdc8b6fc3550ce5b6dd7467ee5416'');
INSERT INTO `users` (`id`, `email`, `signed_up_at`, `password_hash`)
VALUES (''11'', ''franz.schmeler@example.net'', ''2019-08-10 16:40:32'', ''d9865d5d438d30123445dcabdf8a234609c01062'');


DROP TABLE IF EXISTS countries;
CREATE TABLE countries
(
    countries_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    country      VARCHAR(200) UNIQUE NOT NULL,
    PRIMARY KEY (countries_id)
) ENGINE=InnoDB;

INSERT INTO `countries` (`countries_id`, `country`)
VALUES (1, ''Russia'');
INSERT INTO `countries` (`countries_id`, `country`)
VALUES (2, ''USA'');
INSERT INTO `countries` (`countries_id`, `country`)
VALUES (3, ''Poland'');
INSERT INTO `countries` (`countries_id`, `country`)
VALUES (4, ''Great Britain'');
INSERT INTO `countries` (`countries_id`, `country`)
VALUES (5, ''Andorra'');
INSERT INTO `countries` (`countries_id`, `country`)
VALUES (6, ''Anguilla'');
INSERT INTO `countries` (`countries_id`, `country`)
VALUES (7, ''France'');
INSERT INTO `countries` (`countries_id`, `country`)
VALUES (8, ''Antigua and Barbuda'');
INSERT INTO `countries` (`countries_id`, `country`)
VALUES (9, ''Argentina'');
INSERT INTO `countries` (`countries_id`, `country`)
VALUES (10, ''Australia'');


DROP TABLE IF EXISTS languages;
CREATE TABLE languages
(
    language_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    language    VARCHAR(200) UNIQUE NOT NULL,
    PRIMARY KEY (language_id)
) ENGINE=InnoDB;

INSERT INTO `languages` (`language_id`, `language`)
VALUES (1, ''rus'');
INSERT INTO `languages` (`language_id`, `language`)
VALUES (2, ''eng'');
INSERT INTO `languages` (`language_id`, `language`)
VALUES (3, ''ger'');
INSERT INTO `languages` (`language_id`, `language`)
VALUES (4, ''fra'');

DROP TABLE IF EXISTS user_profiles;
CREATE TABLE user_profiles
(
    user_id           BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    updated_at        TIMESTAMP    DEFAULT now(),
    photo_id          BIGINT UNSIGNED DEFAULT NULL,
    first_name        VARCHAR(100) NOT NULL,
    last_name         VARCHAR(100) NOT NULL,
    gender            enum('' f '','' m '','' x'') NOT NULL,
    date_of_birth     DATE,
    country_id        INT UNSIGNED NOT NULL,
    about_me          VARCHAR(350) DEFAULT NULL,
    phone_number      char(11)     DEFAULT NULL,
    payment_method    VARCHAR(100),
    users_language_id SMALLINT UNSIGNED NOT NULL DEFAULT 1,
    PRIMARY KEY (`user_id`),
    CONSTRAINT `fk_user_profiles_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
    CONSTRAINT `fk_user_profiles_countries` FOREIGN KEY (`country_id`) REFERENCES `countries` (`countries_id`),
    CONSTRAINT `fk_user_profiles_languages` FOREIGN KEY (`users_language_id`) REFERENCES `languages` (`language_id`)
) ENGINE=InnoDB;

INSERT INTO `user_profiles` (`user_id`, `updated_at`, `photo_id`, `first_name`, `last_name`, `gender`, `date_of_birth`,
                             `country_id`, `about_me`, `phone_number`, `payment_method`, `users_language_id`)
VALUES (''1'', ''1985-04-14 05:55:46'', ''12'', ''Christop'', ''Armstrong'', ''m'', ''1972-02-15'', 1, ''Soluta in ut eos est. Est porro voluptates repudiandae aut. Voluptatum delectus est est in autem.'', ''(253)398-09'', ''893617014756'', 1);
INSERT INTO `user_profiles` (`user_id`, `updated_at`, `photo_id`, `first_name`, `last_name`, `gender`, `date_of_birth`,
                             `country_id`, `about_me`, `phone_number`, `payment_method`, `users_language_id`)
VALUES (''2'', ''1977-12-21 08:02:16'', ''39'', ''Gina'', ''Schultz'', '' x'', ''2010-03-17'', 1, ''Id voluptatibus est quisquam nihil ea similique. In optio voluptatem sit totam. Quis molestias et aut ad omnis.'', ''(170)373-07'', ''975946659355'', 1);
INSERT INTO `user_profiles` (`user_id`, `updated_at`, `photo_id`, `first_name`, `last_name`, `gender`, `date_of_birth`,
                             `country_id`, `about_me`, `phone_number`, `payment_method`, `users_language_id`)
VALUES (''3'', ''2008-08-19 03:42:43'', ''15'', ''Rosalee'', ''Eichmann'', ''m'', ''2005-11-04'', 2, ''Temporibus ut id quaerat. Laudantium voluptatum accusantium qui velit consequatur.'', ''1-067-003-1'', ''949807405958'', 1);
INSERT INTO `user_profiles` (`user_id`, `updated_at`, `photo_id`, `first_name`, `last_name`, `gender`, `date_of_birth`,
                             `country_id`, `about_me`, `phone_number`, `payment_method`, `users_language_id`)
VALUES (''4'', ''1970-01-17 19:26:41'', ''14'', ''Thora'', ''Crist'', ''m'', ''1983-06-23'', 3, ''Quia sint dolorem beatae delectus recusandae nesciunt. Ratione assumenda dolorem sequi blanditiis esse et.'', ''06813050819'', ''990109172779'', 4);
INSERT INTO `user_profiles` (`user_id`, `updated_at`, `photo_id`, `first_name`, `last_name`, `gender`, `date_of_birth`,
                             `country_id`, `about_me`, `phone_number`, `payment_method`, `users_language_id`)
VALUES (''5'', ''1992-10-19 06:15:17'', ''16'', ''Clemmie'', ''Fahey'', ''m'', ''2015-02-16'', 4, ''Sunt quae iusto est omnis. Facilis quia id in. Velit labore et ea ea.'', ''383.457.844'', ''755423814164'', 2);
INSERT INTO `user_profiles` (`user_id`, `updated_at`, `photo_id`, `first_name`, `last_name`, `gender`, `date_of_birth`,
                             `country_id`, `about_me`, `phone_number`, `payment_method`, `users_language_id`)
VALUES (''6'', ''1997-02-15 07:01:57'', ''89'', ''Elian'', ''Larkin'', '' x'', ''1993-02-19'', 4, ''Nemo dolores nesciunt est fugit dolore dolor. Commodi rerum qui praesentium magnam.'', ''1-830-066-9'', ''422914643441'', 2);
INSERT INTO `user_profiles` (`user_id`, `updated_at`, `photo_id`, `first_name`, `last_name`, `gender`, `date_of_birth`,
                             `country_id`, `about_me`, `phone_number`, `payment_method`, `users_language_id`)
VALUES (''7'', ''2005-01-10 19:00:57'', ''71'', ''Neal'', ''Harris'', ''f'', ''2007-11-22'', 4, ''Modi minima quae dolores odit nihil odio fuga. Possimus et at voluptatem minus. Voluptatum aut in eos id.'', ''1-184-599-2'', ''957754474165'', 1);
INSERT INTO `user_profiles` (`user_id`, `updated_at`, `photo_id`, `first_name`, `last_name`, `gender`, `date_of_birth`,
                             `country_id`, `about_me`, `phone_number`, `payment_method`, `users_language_id`)
VALUES (''8'', ''2006-08-09 17:09:46'', ''26'', ''Zackary'', ''Herman'', '' x'', ''1980-07-07'', 8, ''Laboriosam deleniti accusantium quae. Aut labore ad sint ut.'', '' + 04(1)68793'', ''868255751431'', 1);
INSERT INTO `user_profiles` (`user_id`, `updated_at`, `photo_id`, `first_name`, `last_name`, `gender`, `date_of_birth`,
                             `country_id`, `about_me`, `phone_number`, `payment_method`, `users_language_id`)
VALUES (''9'', ''1979-01-08 13:07:06'', ''44'', ''Evie'', ''Daniel'', ''f'', ''1995-11-05'', 8, ''Omnis placeat minus dolores vitae sit qui. Incidunt nisi ab voluptatem necessitatibus non iure.'', ''450.639.402'', ''858869511896'', 1);
INSERT INTO `user_profiles` (`user_id`, `updated_at`, `photo_id`, `first_name`, `last_name`, `gender`, `date_of_birth`,
                             `country_id`, `about_me`, `phone_number`, `payment_method`, `users_language_id`)
VALUES (''10'', ''2001-10-25 13:02:37'', ''76'', ''Camilla'', ''Hayes'', ''m'', ''2008-02-15'', 1, ''Amet blanditiis vitae natus nihil enim inventore quia. Ducimus quae voluptatem ut asperiores doloremque.'', ''1-270-660-1'', ''880562485845'', 1);
INSERT INTO `user_profiles` (`user_id`, `updated_at`, `photo_id`, `first_name`, `last_name`, `gender`, `date_of_birth`,
                             `country_id`, `about_me`, `phone_number`, `payment_method`, `users_language_id`)
VALUES (''11'', ''1985-01-03 08:10:46'', ''92'', ''Carley'', ''White'', ''m'', ''2007-11-02'', 4, ''Sapiente omnis deleniti sed dolorum. Fuga ut repudiandae qui numquam laborum.'', ''(692)211-14'', ''339426087835'', 3);

DROP TABLE IF EXISTS authors;
CREATE TABLE authors
(
    author_id        INT UNSIGNED NOT NULL AUTO_INCREMENT,
    author_firstname VARCHAR(50),
    author_lastname  VARCHAR(50) NOT NULL,
    country_id       INT UNSIGNED NOT NULL,
    year_of_birth    DATE        NOT NULL,
    year_of_death    DATE DEFAULT NULL,
    gender           enum('' f '','' m '','' x'') NOT NULL,
    PRIMARY KEY (author_id),
    CONSTRAINT `fk_authors_countries` FOREIGN KEY (`country_id`) REFERENCES `countries` (`countries_id`)
) ENGINE=InnoDB;

INSERT INTO `authors` (`author_id`, `author_firstname`, `author_lastname`, `year_of_birth`, `year_of_death`,
                       `country_id`, `gender`)
VALUES (1, ''Alden'', ''Trantow'', ''0000-00-00'', ''0000-00-00'', 10, '' x'');
INSERT INTO `authors` (`author_id`, `author_firstname`, `author_lastname`, `year_of_birth`, `year_of_death`,
                       `country_id`, `gender`)
VALUES (2, ''Heber'', ''Runolfsdottir'', ''0000-00-00'', ''0000-00-00'', 1, ''m'');
INSERT INTO `authors` (`author_id`, `author_firstname`, `author_lastname`, `year_of_birth`, `year_of_death`,
                       `country_id`, `gender`)
VALUES (3, ''Federico'', ''Prohaska'', ''0000-00-00'', ''0000-00-00'', 1, ''m'');
INSERT INTO `authors` (`author_id`, `author_firstname`, `author_lastname`, `year_of_birth`, `year_of_death`,
                       `country_id`, `gender`)
VALUES (4, ''Stephania'', ''Windler'', ''0000-00-00'', ''0000-00-00'', 1, '' x'');
INSERT INTO `authors` (`author_id`, `author_firstname`, `author_lastname`, `year_of_birth`, `year_of_death`,
                       `country_id`, `gender`)
VALUES (5, ''Tianna'', ''Gibson'', ''0000-00-00'', ''0000-00-00'', 1, ''m'');
INSERT INTO `authors` (`author_id`, `author_firstname`, `author_lastname`, `year_of_birth`, `year_of_death`,
                       `country_id`, `gender`)
VALUES (6, ''Ignacio'', ''Balistreri'', ''0000-00-00'', ''0000-00-00'', 2, ''f'');
INSERT INTO `authors` (`author_id`, `author_firstname`, `author_lastname`, `year_of_birth`, `year_of_death`,
                       `country_id`, `gender`)
VALUES (7, ''Danika'', ''Abernathy'', ''0000-00-00'', ''0000-00-00'', 4, ''m'');
INSERT INTO `authors` (`author_id`, `author_firstname`, `author_lastname`, `year_of_birth`, `year_of_death`,
                       `country_id`, `gender`)
VALUES (8, ''Jaiden'', ''King'', ''0000-00-00'', ''0000-00-00'', 6, '' x'');
INSERT INTO `authors` (`author_id`, `author_firstname`, `author_lastname`, `year_of_birth`, `year_of_death`,
                       `country_id`, `gender`)
VALUES (9, ''Baron'', ''Cassin'', ''0000-00-00'', ''0000-00-00'', 4, ''f'');
INSERT INTO `authors` (`author_id`, `author_firstname`, `author_lastname`, `year_of_birth`, `year_of_death`,
                       `country_id`, `gender`)
VALUES (10, ''Cielo'', ''Schmidt'', ''0000-00-00'', ''0000-00-00'', 5, '' x'');
INSERT INTO `authors` (`author_id`, `author_firstname`, `author_lastname`, `year_of_birth`, `year_of_death`,
                       `country_id`, `gender`)
VALUES (11, ''Carole'', ''Thiel'', ''0000-00-00'', ''0000-00-00'', 6, ''f'');
INSERT INTO `authors` (`author_id`, `author_firstname`, `author_lastname`, `year_of_birth`, `year_of_death`,
                       `country_id`, `gender`)
VALUES (12, ''Alan'', ''Kling'', ''0000-00-00'', ''0000-00-00'', 4, ''m'');
INSERT INTO `authors` (`author_id`, `author_firstname`, `author_lastname`, `year_of_birth`, `year_of_death`,
                       `country_id`, `gender`)
VALUES (13, ''Marta'', ''Spencer'', ''0000-00-00'', ''0000-00-00'', 1, ''f'');
INSERT INTO `authors` (`author_id`, `author_firstname`, `author_lastname`, `year_of_birth`, `year_of_death`,
                       `country_id`, `gender`)
VALUES (14, ''Aiden'', ''Bogan'', ''0000-00-00'', ''0000-00-00'', 1, '' x'');
INSERT INTO `authors` (`author_id`, `author_firstname`, `author_lastname`, `year_of_birth`, `year_of_death`,
                       `country_id`, `gender`)
VALUES (15, ''Braeden'', ''Johnson'', ''0000-00-00'', ''0000-00-00'', 7, ''f'');
INSERT INTO `authors` (`author_id`, `author_firstname`, `author_lastname`, `year_of_birth`, `year_of_death`,
                       `country_id`, `gender`)
VALUES (16, ''Maxie'', ''Jacobson'', ''0000-00-00'', ''0000-00-00'', 4, ''f'');
INSERT INTO `authors` (`author_id`, `author_firstname`, `author_lastname`, `year_of_birth`, `year_of_death`,
                       `country_id`, `gender`)
VALUES (17, ''Zoey'', ''Muller'', ''0000-00-00'', ''0000-00-00'', 2, '' x'');
INSERT INTO `authors` (`author_id`, `author_firstname`, `author_lastname`, `year_of_birth`, `year_of_death`,
                       `country_id`, `gender`)
VALUES (18, ''Syble'', ''Kovacek'', ''0000-00-00'', ''0000-00-00'', 2, ''m'');
INSERT INTO `authors` (`author_id`, `author_firstname`, `author_lastname`, `year_of_birth`, `year_of_death`,
                       `country_id`, `gender`)
VALUES (19, ''Eldora'', ''Swaniawski'', ''0000-00-00'', ''0000-00-00'', 1, ''m'');
INSERT INTO `authors` (`author_id`, `author_firstname`, `author_lastname`, `year_of_birth`, `year_of_death`,
                       `country_id`, `gender`)
VALUES (20, ''Laisha'', ''Robel'', ''0000-00-00'', ''0000-00-00'', 9, ''f'');

DROP TABLE IF EXISTS translators;
CREATE TABLE translators
(
    translator_id     INT UNSIGNED NOT NULL AUTO_INCREMENT,
    translator_f_name VARCHAR(50),
    translator_l_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (translator_id)
) ENGINE=InnoDB;

INSERT INTO `translators` (`translator_id`, `translator_f_name`, `translator_l_name`)
VALUES (1, ''Santiago'', ''Rice'');
INSERT INTO `translators` (`translator_id`, `translator_f_name`, `translator_l_name`)
VALUES (2, ''Allison'', ''Kub'');
INSERT INTO `translators` (`translator_id`, `translator_f_name`, `translator_l_name`)
VALUES (3, ''Isabelle'', ''Cummings'');
INSERT INTO `translators` (`translator_id`, `translator_f_name`, `translator_l_name`)
VALUES (4, ''Ebba'', ''Dickinson'');
INSERT INTO `translators` (`translator_id`, `translator_f_name`, `translator_l_name`)
VALUES (5, ''Emmet'', ''McGlynn'');
INSERT INTO `translators` (`translator_id`, `translator_f_name`, `translator_l_name`)
VALUES (6, ''Bryce'', ''Jones'');
INSERT INTO `translators` (`translator_id`, `translator_f_name`, `translator_l_name`)
VALUES (7, ''Derrick'', ''Krajcik'');
INSERT INTO `translators` (`translator_id`, `translator_f_name`, `translator_l_name`)
VALUES (8, ''Valentina'', ''Auer'');
INSERT INTO `translators` (`translator_id`, `translator_f_name`, `translator_l_name`)
VALUES (9, ''Camilla'', ''Fay'');
INSERT INTO `translators` (`translator_id`, `translator_f_name`, `translator_l_name`)
VALUES (10, ''Hank'', ''Greenfelder'');

DROP TABLE IF EXISTS book_types;
CREATE TABLE book_types
(
    type_id TINYINT NOT NULL AUTO_INCREMENT,
    type    VARCHAR(20) UNIQUE,
    PRIMARY KEY (type_id)
) ENGINE=InnoDB;

INSERT INTO `book_types`
VALUES (1, ''paper'');
INSERT INTO `book_types`
VALUES (2, ''audio'');
INSERT INTO `book_types`
VALUES (3, ''electronic'');

DROP TABLE IF EXISTS books;
CREATE TABLE books
(
    book_id           BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    author_id         INT UNSIGNED NOT NULL,
    title             VARCHAR(300) NOT NULL,
    books_language_id SMALLINT UNSIGNED NOT NULL,
    description       VARCHAR(500) NOT NULL,
    age_limit         TINYINT,
    date_of_writing   DATE         NOT NULL,
    translator        INT UNSIGNED DEFAULT NULL,
    ISBN              VARCHAR(25) DEFAULT NULL,
    PRIMARY KEY (book_id),
    CONSTRAINT `fk_books_languages` FOREIGN KEY (`books_language_id`) REFERENCES `languages` (`language_id`),
    CONSTRAINT `fk_books_authors` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`),
    CONSTRAINT `fk_books_translators` FOREIGN KEY (`translator`) REFERENCES `translators` (`translator_id`)
) ENGINE=InnoDB;

INSERT INTO `books` (`book_id`, `author_id`, `title`, `books_language_id`, `description`, `age_limit`,
                     `date_of_writing`, `translator`, `ISBN`)
VALUES (''1'', 4, ''Error perspiciatis ut dolores exercitationem.'', 3, ''Nostrum quasi iste non illo doloribus earum. Fuga vel vel nam itaque. Velit repellat ut placeat autem aut libero.'', 5, ''2017-02-18'', 4, ''12365478954ccc122222'');
INSERT INTO `books` (`book_id`, `author_id`, `title`, `books_language_id`, `description`, `age_limit`,
                     `date_of_writing`, `translator`, `ISBN`)
VALUES (''2'', 1, ''Non dolorum nisi a beatae ipsa et maxime vero.'', 1, ''Quae sapiente fuga fugiat numquam. Velit inventore voluptatum quia quis incidunt enim. Error culpa doloremque eveniet est.'', 8, ''1973-12-14'', 4, ''1236xxx5478954122222'');
INSERT INTO `books` (`book_id`, `author_id`, `title`, `books_language_id`, `description`, `age_limit`,
                     `date_of_writing`, `translator`, `ISBN`)
VALUES (''3'', 3, ''Ullam deserunt omnis quod molestiae hic nisi.'', 1, ''Sed quo omnis magni veniam. Sunt doloribus tempora quos laboriosam. Ea eos voluptatum ea in animi sit.'', 7, ''1989-11-14'', 4, ''123654789541zzz22222'');
INSERT INTO `books` (`book_id`, `author_id`, `title`, `books_language_id`, `description`, `age_limit`,
                     `date_of_writing`, `translator`, `ISBN`)
VALUES (''4'', 4, ''Cumque voluptas consequuntur illo.'', 1, ''Fuga facere ipsam adipisci illum. Id omnis id qui voluptas et perspiciatis. Est culpa nostrum in aut voluptas. Pariatur ut sed ad consequatur consequatur odio velit.'', 6, ''2017-09-18'', 9, ''12fff365478954122222'');
INSERT INTO `books` (`book_id`, `author_id`, `title`, `books_language_id`, `description`, `age_limit`,
                     `date_of_writing`, `translator`, `ISBN`)
VALUES (''5'', 7, ''Illum sed excepturi ut minima tenetur sunt.'', 1, ''Laudantium saepe ut provident voluptatem odio earum alias quidem. Vitae aperiam deleniti nihil qui est eos. Adipisci veritatis mollitia amet quia maxime.'', 9, ''2013-10-05'', 9, ''123654ggg78954122222'');
INSERT INTO `books` (`book_id`, `author_id`, `title`, `books_language_id`, `description`, `age_limit`,
                     `date_of_writing`, `translator`, `ISBN`)
VALUES (''6'', 6, ''Blanditiis quidem necessitatibus aspernatur.'', 1, ''Accusamus itaque illo omnis quia. Explicabo non et et aperiam aliquam mollitia quaerat nulla. Et voluptatum aut voluptates sit et id voluptatem.'', 6, ''2015-04-20'', 3, ''12365478954hhh122222'');
INSERT INTO `books` (`book_id`, `author_id`, `title`, `books_language_id`, `description`, `age_limit`,
                     `date_of_writing`, `translator`, `ISBN`)
VALUES (''7'', 1, ''Ducimus quae maiores sed sit.'', 3, ''Nihil incidunt aliquid harum quisquam quod voluptatem incidunt. Et voluptas aut eveniet quaerat sit animi. Dolorum voluptas tempore libero in veritatis adipisci.'', 12, ''2009-08-05'', 8, ''12365478jjj954122222'');
INSERT INTO `books` (`book_id`, `author_id`, `title`, `books_language_id`, `description`, `age_limit`,
                     `date_of_writing`, `translator`, `ISBN`)
VALUES (''8'', 2, ''Mollitia vel sed pariatur aut nemo.'', 2, ''Praesentium voluptate quas rerum laboriosam dolores et cupiditate. Et officiis consequatur nemo pariatur. Fugiat beatae eos distinctio nulla quas et. Et quibusdam consequatur repellendus quis.'', 5, ''2013-02-26'', 4, ''123kkk65478954122222'');
INSERT INTO `books` (`book_id`, `author_id`, `title`, `books_language_id`, `description`, `age_limit`,
                     `date_of_writing`, `translator`, `ISBN`)
VALUES (''9'', 7, ''Qui sit incidunt voluptates aut vel fugiat.'', 1, ''Quaerat similique eveniet suscipit magni quis. Et facilis ut commodi rem repellat recusandae quas. Exercitationem qui saepe veniam blanditiis.'', 10, ''1988-07-23'', 3, ''123654ll78954122222'');
INSERT INTO `books` (`book_id`, `author_id`, `title`, `books_language_id`, `description`, `age_limit`,
                     `date_of_writing`, `translator`, `ISBN`)
VALUES (''10'', 7, ''Tenetur cum omnis voluptatem officia.'', 3, ''Nostrum dicta qui deleniti alias impedit. Placeat ut in nihil commodi. Corporis voluptate quidem nobis deleniti porro. Ullam doloribus dicta sunt debitis placeat hic.'', 11, ''2011-06-11'', 6, ''12365478pp954122222'');
INSERT INTO `books` (`book_id`, `author_id`, `title`, `books_language_id`, `description`, `age_limit`,
                     `date_of_writing`, `translator`, `ISBN`)
VALUES (''11'', 3, ''Eius facilis hic sit rerum consequatur sed.'', 3, ''Suscipit id iste et accusamus. Repellendus fugiat sed voluptatum qui quia ea adipisci tempore. Quos sit iure et sit soluta neque dignissimos. Ut fugiat pariatur et quos voluptas.'', 6, ''1988-10-15'', 1, ''12365oo478954122222'');
INSERT INTO `books` (`book_id`, `author_id`, `title`, `books_language_id`, `description`, `age_limit`,
                     `date_of_writing`, `translator`, `ISBN`)
VALUES (''12'', 3, ''Beatae qui praesentium quis sint ut id labore.'', 1, ''Quis molestiae et et iure. Autem impedit laudantium iusto aut totam. Ratione est necessitatibus ut labore vel.'', 8, ''1988-01-23'', 4, ''12365478954122ii222'');
INSERT INTO `books` (`book_id`, `author_id`, `title`, `books_language_id`, `description`, `age_limit`,
                     `date_of_writing`, `translator`, `ISBN`)
VALUES (''13'', 4, ''Modi ut et quis aut.'', 1, ''Fugiat reiciendis ad et quia autem beatae. Quasi dignissimos nulla quidem ducimus quidem ea. Quasi voluptatem natus dolor rem aut sit sed.'', 13, ''1975-07-20'', 9, ''1236547895uu4122222'');
INSERT INTO `books` (`book_id`, `author_id`, `title`, `books_language_id`, `description`, `age_limit`,
                     `date_of_writing`, `translator`, `ISBN`)
VALUES (''14'', 3, ''Aut id quas quibusdam voluptatem velit quasi aspernatur.'', 1, ''Modi pariatur veniam nam et. Aut error est voluptatem quibusdam in error. Sit saepe facilis aut nihil. Quae vel quia voluptate numquam perferendis voluptatem.'', 7, ''1989-05-29'', 5, ''12365478yy954122222'');
INSERT INTO `books` (`book_id`, `author_id`, `title`, `books_language_id`, `description`, `age_limit`,
                     `date_of_writing`, `translator`, `ISBN`)
VALUES (''15'', 7, ''Sed qui fugit asperiores unde dignissimos.'', 2, ''Maxime saepe fuga quas in. Natus illum consectetur mollitia beatae doloremque. Et quaerat id aut laudantium.'', 8, ''2018-04-02'', 8, ''123654789541tt22222'');
INSERT INTO `books` (`book_id`, `author_id`, `title`, `books_language_id`, `description`, `age_limit`,
                     `date_of_writing`, `translator`, `ISBN`)
VALUES (''16'', 7, ''Sint sed ut similique natus provident odit quo.'', 1, ''Voluptatum perspiciatis voluptates optio. Provident in porro qui in velit sequi dolores. Aut sed facilis porro voluptas.'', 8, ''1973-05-06'', 8, ''1236rr5478954122222'');
INSERT INTO `books` (`book_id`, `author_id`, `title`, `books_language_id`, `description`, `age_limit`,
                     `date_of_writing`, `translator`, `ISBN`)
VALUES (''17'', 7, ''Sit occaecati ex nostrum autem.'', 1, ''Ut quis nesciunt omnis qui earum. Quod reiciendis voluptate repudiandae error. Nisi quod at corrupti eveniet est est accusamus. Blanditiis voluptates quasi in facilis sed cupiditate explicabo aut.'', 12, ''1994-07-24'', 8, ''12ee365478954122222'');
INSERT INTO `books` (`book_id`, `author_id`, `title`, `books_language_id`, `description`, `age_limit`,
                     `date_of_writing`, `translator`, `ISBN`)
VALUES (''18'', 4, ''Deleniti quia perferendis qui reprehenderit possimus vel.'', 1, ''Quos magnam voluptates et consectetur rem. Minus et sequi ducimus occaecati tempore rerum cupiditate.'', 10, ''2017-04-25'', 9, ''1236547ww8954122222'');
INSERT INTO `books` (`book_id`, `author_id`, `title`, `books_language_id`, `description`, `age_limit`,
                     `date_of_writing`, `translator`, `ISBN`)
VALUES (''19'', 7, ''Ut consequatur ullam id doloremque laborum asperiores.'', 2, ''Debitis dolores impedit modi nisi non autem. Voluptas est minima quasi ea consequatur. Molestiae omnis optio eaque voluptatibus id provident.'', 13, ''1975-02-20'', 3, ''12qq365478954122222'');
INSERT INTO `books` (`book_id`, `author_id`, `title`, `books_language_id`, `description`, `age_limit`,
                     `date_of_writing`, `translator`, `ISBN`)
VALUES (''20'', 4, ''Dolor sit deserunt aut molestiae quo quia.'', 4, ''Hic tempore optio provident praesentium et aut voluptatum. Ea eligendi et cupiditate sequi odit facilis voluptatem. Dolorum mollitia nesciunt mollitia voluptatem.'', 10, ''1976-06-30'', 9, ''1236547895412kk2222'');
INSERT INTO `books` (`book_id`, `author_id`, `title`, `books_language_id`, `description`, `age_limit`,
                     `date_of_writing`, `translator`, `ISBN`)
VALUES (''21'', 5, ''Labore eos saepe nemo quibusdam.'', 1, ''Asperiores dolores repudiandae nobis non. Natus laborum est eveniet labore at aut vel. Voluptatem rerum rerum ut ut. Laborum quo quis et porro ex sit voluptas.'', 12, ''1992-04-23'', 4, ''1236547yy8954122222'');
INSERT INTO `books` (`book_id`, `author_id`, `title`, `books_language_id`, `description`, `age_limit`,
                     `date_of_writing`, `translator`, `ISBN`)
VALUES (''22'', 8, ''Corrupti temporibus atque et et eius reiciendis.'', 1, ''Consequatur aliquid accusamus accusamus. Esse exercitationem dicta vero eum.'', 13, ''1975-05-28'', 7, ''123654789541jj22222'');
INSERT INTO `books` (`book_id`, `author_id`, `title`, `books_language_id`, `description`, `age_limit`,
                     `date_of_writing`, `translator`, `ISBN`)
VALUES (''23'', 6, ''Unde magnam voluptatem magnam ea qui.'', 1, ''Eos dolore magni ullam. Nobis sit totam tenetur ea temporibus deserunt. Minus ipsa sunt nostrum necessitatibus earum. Tempora ea dolorum delectus alias et velit consequuntur.'', 14, ''1995-04-21'', 7, ''123654789hh54122222'');
INSERT INTO `books` (`book_id`, `author_id`, `title`, `books_language_id`, `description`, `age_limit`,
                     `date_of_writing`, `translator`, `ISBN`)
VALUES (''24'', 4, ''Nam voluptas aliquam autem non labore nostrum.'', 1, ''Eveniet et neque eveniet qui incidunt. Tempora tenetur numquam itaque maiores quod amet saepe. Voluptatem et eos aut.\nLibero aliquam officiis quos velit rerum qui itaque. Quo quo maiores odit.'', 16, ''1995-05-28'', 6, ''1236gg5478954122222'');
INSERT INTO `books` (`book_id`, `author_id`, `title`, `books_language_id`, `description`, `age_limit`,
                     `date_of_writing`, `translator`, `ISBN`)
VALUES (''25'', 6, ''Iure dolor libero neque rerum omnis repellendus voluptatem.'', 1, ''Soluta magni aut ut ut. Id consequatur omnis id.\nEos ut odio consequatur enim. Quia similique est dolorum et maxime quis. A aliquid excepturi ipsam inventore fugit optio unde et.'', 11, ''2010-02-24'', 6, ''12365ff78954122222'');
INSERT INTO `books` (`book_id`, `author_id`, `title`, `books_language_id`, `description`, `age_limit`,
                     `date_of_writing`, `translator`, `ISBN`)
VALUES (''26'', 7, ''Veniam rerum tenetur eaque illo.'', 2, ''Facere perferendis blanditiis eligendi reprehenderit velit. Et dolorum eius numquam debitis id facilis repellat. Delectus quam soluta illum. Impedit corrupti dolores et.'', 6, ''2017-05-21'', 6, ''1236547894522222'');
INSERT INTO `books` (`book_id`, `author_id`, `title`, `books_language_id`, `description`, `age_limit`,
                     `date_of_writing`, `translator`, `ISBN`)
VALUES (''27'', 4, ''Non unde dolorum qui.'', 1, ''Magni alias quas omnis officia. Et tempora aut adipisci voluptas sint. Praesentium unde nihil omnis.'', 10, ''1988-07-23'', 6, ''12365777884122222'');
INSERT INTO `books` (`book_id`, `author_id`, `title`, `books_language_id`, `description`, `age_limit`,
                     `date_of_writing`, `translator`, `ISBN`)
VALUES (''28'', 5, ''Et natus labore repellat ratione error cum.'', 1, ''Magnam nobis atque aliquam in. Et dolores nulla id quis. Quam nulla aut omnis.'', 14, ''1986-11-17'', 6, ''1236774789544422222'');
INSERT INTO `books` (`book_id`, `author_id`, `title`, `books_language_id`, `description`, `age_limit`,
                     `date_of_writing`, `translator`, `ISBN`)
VALUES (''29'', 6, ''Nihil corporis fuga vel sequi.'', 1, ''Unde perspiciatis provident maiores dicta. Non vel assumenda quas eos.'', 8, ''1976-01-10'', 1, ''123654745954122222'');
INSERT INTO `books` (`book_id`, `author_id`, `title`, `books_language_id`, `description`, `age_limit`,
                     `date_of_writing`, `translator`, `ISBN`)
VALUES (''30'', 1, ''Magnam ea alias rerum qui voluptas natus.'', 1, ''Omnis rerum non iure nam temporibus. Quasi excepturi assumenda fugit fugit quia. Et est quo nihil. Suscipit omnis sed sed quia.'', 16, ''2016-07-25'', 5, ''123445478954122222'');
INSERT INTO `books` (`book_id`, `author_id`, `title`, `books_language_id`, `description`, `age_limit`,
                     `date_of_writing`, `translator`, `ISBN`)
VALUES (''31'', 1, ''Ipsum quia perspiciatis natus molestiae.'', 2, ''Voluptatem perspiciatis voluptatem cumque sunt doloremque omnis quia id. Vel tempore quos et nihil fugit repellat tempore eos. Maxime rerum sed ut rerum minus nihil debitis aliquam.'', 8, ''1974-08-28'', 4, ''123655478954122222'');
, `ISBN`
DROP TABLE IF EXISTS genres;
CREATE TABLE genres
(
    genre_id TINYINT      NOT NULL AUTO_INCREMENT,
    genre    VARCHAR(100) NOT NULL,
    PRIMARY KEY (genre_id)
) ENGINE=InnoDB;

INSERT INTO `genres` (`genre_id`, `genre`)
VALUES (1, ''Consequatur ut maiores.'');
INSERT INTO `genres` (`genre_id`, `genre`)
VALUES (2, ''Maiores et.'');
INSERT INTO `genres` (`genre_id`, `genre`)
VALUES (3, ''Quo odio quaerat.'');
INSERT INTO `genres` (`genre_id`, `genre`)
VALUES (4, ''Quo dolorum nemo.'');
INSERT INTO `genres` (`genre_id`, `genre`)
VALUES (5, ''Eius numquam illo.'');
INSERT INTO `genres` (`genre_id`, `genre`)
VALUES (6, ''Exercitationem voluptatem quaerat.'');
INSERT INTO `genres` (`genre_id`, `genre`)
VALUES (7, ''Nobis qui et.'');

DROP TABLE IF EXISTS tags;
CREATE TABLE tags
(
    tag_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    tag    VARCHAR(100) NOT NULL UNIQUE,
    PRIMARY KEY (tag_id)
) ENGINE=InnoDB;

INSERT INTO `tags` (`tag_id`, `tag`)
VALUES (1, ''Suscipit quia.'');
INSERT INTO `tags` (`tag_id`, `tag`)
VALUES (2, ''Dolor similique.'');
INSERT INTO `tags` (`tag_id`, `tag`)
VALUES (3, ''Itaque itaque et.'');
INSERT INTO `tags` (`tag_id`, `tag`)
VALUES (4, ''Qui odio aperiam.'');
INSERT INTO `tags` (`tag_id`, `tag`)
VALUES (5, ''Perspiciatis accusantium.'');
INSERT INTO `tags` (`tag_id`, `tag`)
VALUES (6, ''Laboriosam rerum.'');
INSERT INTO `tags` (`tag_id`, `tag`)
VALUES (7, ''Optio laudantium.'');

DROP TABLE IF EXISTS books_genre;
CREATE TABLE books_genre
(
    books_genre_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    book_id        BIGINT UNSIGNED NOT NULL,
    genre_id       TINYINT NOT NULL,
    PRIMARY KEY (books_genre_id),
    CONSTRAINT `fk_booksgenre_books` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
    CONSTRAINT `fk_booksgenre_genres` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`)
) ENGINE=InnoDB;

INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (1, ''3'', 2);
INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (2, ''3'', 7);
INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (3, ''3'', 5);
INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (4, ''4'', 1);
INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (5, ''4'', 7);
INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (6, ''5'', 2);
INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (7, ''7'', 3);
INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (8, ''8'', 1);
INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (9, ''8'', 2);
INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (10, ''9'', 1);
INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (11, ''9'', 4);
INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (12, ''10'', 2);
INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (13, ''10'', 3);
INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (14, ''10'', 5);
INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (15, ''12'', 2);
INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (16, ''13'', 7);
INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (17, ''13'', 4);
INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (18, ''14'', 5);
INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (19, ''15'', 1);
INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (20, ''15'', 2);
INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (21, ''15'', 5);
INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (22, ''16'', 2);
INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (23, ''16'', 3);
INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (24, ''16'', 4);
INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (25, ''16'', 5);
INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (26, ''19'', 5);
INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (27, ''22'', 2);
INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (28, ''24'', 4);
INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (29, ''25'', 3);
INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (30, ''25'', 4);
INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (31, ''25'', 5);
INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (32, ''25'', 6);
INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (33, ''27'', 4);
INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (34, ''30'', 4);
INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (35, ''31'', 1);
INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (36, ''31'', 2);
INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (37, ''3'', 1);
INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (38, ''5'', 5);
INSERT INTO `books_genre` (`books_genre_id`, `book_id`, `genre_id`)
VALUES (39, ''6'', 6);

DROP TABLE IF EXISTS readers;
CREATE TABLE readers
(
    reader_id     SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    reader_f_name VARCHAR(50),
    reader_l_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (reader_id)
) ENGINE=InnoDB;

INSERT INTO `readers` (`reader_id`, `reader_f_name`, `reader_l_name`)
VALUES (1, ''Guido'', ''Mohr'');
INSERT INTO `readers` (`reader_id`, `reader_f_name`, `reader_l_name`)
VALUES (2, ''Cloyd'', ''Wehner'');
INSERT INTO `readers` (`reader_id`, `reader_f_name`, `reader_l_name`)
VALUES (3, ''Addison'', ''Considine'');
INSERT INTO `readers` (`reader_id`, `reader_f_name`, `reader_l_name`)
VALUES (4, ''Magali'', ''Prohaska'');
INSERT INTO `readers` (`reader_id`, `reader_f_name`, `reader_l_name`)
VALUES (5, ''Seth'', ''Balistreri'');
INSERT INTO `readers` (`reader_id`, `reader_f_name`, `reader_l_name`)
VALUES (6, ''Dallin'', ''Witting'');
INSERT INTO `readers` (`reader_id`, `reader_f_name`, `reader_l_name`)
VALUES (7, ''Donnell'', ''Streich'');
INSERT INTO `readers` (`reader_id`, `reader_f_name`, `reader_l_name`)
VALUES (8, ''Kris'', ''Torphy'');
INSERT INTO `readers` (`reader_id`, `reader_f_name`, `reader_l_name`)
VALUES (9, ''Everette'', ''Walker'');
INSERT INTO `readers` (`reader_id`, `reader_f_name`, `reader_l_name`)
VALUES (10, ''Keely'', ''Bruen'');

DROP TABLE IF EXISTS audiobooks;
CREATE TABLE audiobooks
(
    audiobook_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    reader_id    SMALLINT UNSIGNED NOT NULL,
    duration     VARCHAR(15),
    availability BOOL,
    PRIMARY KEY (audiobook_id),
    CONSTRAINT `fk_audiobooks_books` FOREIGN KEY (`audiobook_id`) REFERENCES `books` (`book_id`),
    CONSTRAINT `fk_audiobooks_readers` FOREIGN KEY (`reader_id`) REFERENCES `readers` (`reader_id`)
) ENGINE=InnoDB;

INSERT INTO `audiobooks` (`audiobook_id`, `reader_id`, `duration`, `availability`)
VALUES (''1'', 3, ''22'', 1);
INSERT INTO `audiobooks` (`audiobook_id`, `reader_id`, `duration`, `availability`)
VALUES (''2'', 1, ''12'', 1);
INSERT INTO `audiobooks` (`audiobook_id`, `reader_id`, `duration`, `availability`)
VALUES (''3'', 5, ''15'', 0);
INSERT INTO `audiobooks` (`audiobook_id`, `reader_id`, `duration`, `availability`)
VALUES (''4'', 8, ''20'', 1);
INSERT INTO `audiobooks` (`audiobook_id`, `reader_id`, `duration`, `availability`)
VALUES (''5'', 10, ''15'', 1);
INSERT INTO `audiobooks` (`audiobook_id`, `reader_id`, `duration`, `availability`)
VALUES (''6'', 10, ''15'', 0);
INSERT INTO `audiobooks` (`audiobook_id`, `reader_id`, `duration`, `availability`)
VALUES (''7'', 1, ''38'', 1);
INSERT INTO `audiobooks` (`audiobook_id`, `reader_id`, `duration`, `availability`)
VALUES (''8'', 8, ''10'', 1);
INSERT INTO `audiobooks` (`audiobook_id`, `reader_id`, `duration`, `availability`)
VALUES (''9'', 1, ''22'', 1);
INSERT INTO `audiobooks` (`audiobook_id`, `reader_id`, `duration`, `availability`)
VALUES (''10'', 1, ''27'', 0);
INSERT INTO `audiobooks` (`audiobook_id`, `reader_id`, `duration`, `availability`)
VALUES (''11'', 5, ''26'', 1);
INSERT INTO `audiobooks` (`audiobook_id`, `reader_id`, `duration`, `availability`)
VALUES (''12'', 1, ''30'', 1);
INSERT INTO `audiobooks` (`audiobook_id`, `reader_id`, `duration`, `availability`)
VALUES (''13'', 7, ''20'', 1);
INSERT INTO `audiobooks` (`audiobook_id`, `reader_id`, `duration`, `availability`)
VALUES (''14'', 2, ''12'', 1);
INSERT INTO `audiobooks` (`audiobook_id`, `reader_id`, `duration`, `availability`)
VALUES (''15'', 4, ''13'', 1);
INSERT INTO `audiobooks` (`audiobook_id`, `reader_id`, `duration`, `availability`)
VALUES (''16'', 6, ''28'', 1);

DROP TABLE IF EXISTS electronic_book_format;
CREATE TABLE electronic_book_format
(
    format_id   TINYINT     NOT NULL AUTO_INCREMENT,
    book_format VARCHAR(10) NOT NULL UNIQUE,
    PRIMARY KEY (format_id)
) ENGINE=InnoDB;

INSERT INTO `electronic_book_format` (`format_id`, `book_format`)
VALUES (1, ''epub'');
INSERT INTO `electronic_book_format` (`format_id`, `book_format`)
VALUES (2, ''rtf'');
INSERT INTO `electronic_book_format` (`format_id`, `book_format`)
VALUES (3, ''pdf'');
INSERT INTO `electronic_book_format` (`format_id`, `book_format`)
VALUES (4, ''txt'');
INSERT INTO `electronic_book_format` (`format_id`, `book_format`)
VALUES (5, ''fb2'');

DROP TABLE IF EXISTS electronic_books;
CREATE TABLE electronic_books
(
    elbook_id     BIGINT UNSIGNED NOT NULL,
    elbook_format TINYINT NOT NULL,
    availability  BOOL,
    PRIMARY KEY (elbook_id),
    CONSTRAINT `fk_elbooks_books` FOREIGN KEY (`elbook_id`) REFERENCES `books` (`book_id`),
    CONSTRAINT `fk_elbooks_format` FOREIGN KEY (`elbook_format`) REFERENCES `electronic_book_format` (`format_id`)
) ENGINE=InnoDB;

INSERT INTO `electronic_books` (`elbook_id`, `elbook_format`, `availability`)
VALUES (''1'', 4, 1);
INSERT INTO `electronic_books` (`elbook_id`, `elbook_format`, `availability`)
VALUES (''2'', 3, 1);
INSERT INTO `electronic_books` (`elbook_id`, `elbook_format`, `availability`)
VALUES (''3'', 5, 1);
INSERT INTO `electronic_books` (`elbook_id`, `elbook_format`, `availability`)
VALUES (''4'', 2, 0);
INSERT INTO `electronic_books` (`elbook_id`, `elbook_format`, `availability`)
VALUES (''5'', 2, 1);
INSERT INTO `electronic_books` (`elbook_id`, `elbook_format`, `availability`)
VALUES (''6'', 2, 1);
INSERT INTO `electronic_books` (`elbook_id`, `elbook_format`, `availability`)
VALUES (''7'', 1, 1);
INSERT INTO `electronic_books` (`elbook_id`, `elbook_format`, `availability`)
VALUES (''8'', 5, 1);
INSERT INTO `electronic_books` (`elbook_id`, `elbook_format`, `availability`)
VALUES (''9'', 5, 1);
INSERT INTO `electronic_books` (`elbook_id`, `elbook_format`, `availability`)
VALUES (''10'', 1, 1);
INSERT INTO `electronic_books` (`elbook_id`, `elbook_format`, `availability`)
VALUES (''11'', 5, 1);
INSERT INTO `electronic_books` (`elbook_id`, `elbook_format`, `availability`)
VALUES (''12'', 1, 0);
INSERT INTO `electronic_books` (`elbook_id`, `elbook_format`, `availability`)
VALUES (''13'', 3, 1);
INSERT INTO `electronic_books` (`elbook_id`, `elbook_format`, `availability`)
VALUES (''14'', 4, 1);

DROP TABLE IF EXISTS paper_books;
CREATE TABLE paper_books
(
    paper_book_id   BIGINT UNSIGNED NOT NULL,
    number_of_pages SMALLINT UNSIGNED NOT NULL,
    availability    SMALLINT UNSIGNED NOT NULL,
    ISBN            VARCHAR(25),
    PRIMARY KEY (paper_book_id),
    CONSTRAINT `fk_paperbooks_books` FOREIGN KEY (`paper_book_id`) REFERENCES `books` (`book_id`)
) ENGINE=InnoDB;

INSERT INTO `paper_books` (`paper_book_id`, `number_of_pages`, `availability`, `ISBN`)
VALUES (''1'', 207, 4, ''95600731525'');
INSERT INTO `paper_books` (`paper_book_id`, `number_of_pages`, `availability`, `ISBN`)
VALUES (''2'', 337, 4, ''49154375527'');
INSERT INTO `paper_books` (`paper_book_id`, `number_of_pages`, `availability`, `ISBN`)
VALUES (''3'', 124, 5, ''77498403092'');
INSERT INTO `paper_books` (`paper_book_id`, `number_of_pages`, `availability`, `ISBN`)
VALUES (''4'', 101, 1, ''97629654220'');
INSERT INTO `paper_books` (`paper_book_id`, `number_of_pages`, `availability`, `ISBN`)
VALUES (''5'', 331, 0, ''42301877941'');
INSERT INTO `paper_books` (`paper_book_id`, `number_of_pages`, `availability`, `ISBN`)
VALUES (''6'', 342, 1, ''30202202297'');
INSERT INTO `paper_books` (`paper_book_id`, `number_of_pages`, `availability`, `ISBN`)
VALUES (''7'', 219, 1, ''13386351256'');
INSERT INTO `paper_books` (`paper_book_id`, `number_of_pages`, `availability`, `ISBN`)
VALUES (''8'', 387, 4, ''30508608383'');
INSERT INTO `paper_books` (`paper_book_id`, `number_of_pages`, `availability`, `ISBN`)
VALUES (''9'', 136, 2, ''40980983795'');
INSERT INTO `paper_books` (`paper_book_id`, `number_of_pages`, `availability`, `ISBN`)
VALUES (''10'', 444, 2, ''65072418075'');
INSERT INTO `paper_books` (`paper_book_id`, `number_of_pages`, `availability`, `ISBN`)
VALUES (''11'', 381, 3, ''90497246313'');
INSERT INTO `paper_books` (`paper_book_id`, `number_of_pages`, `availability`, `ISBN`)
VALUES (''12'', 306, 3, ''71656646744'');
INSERT INTO `paper_books` (`paper_book_id`, `number_of_pages`, `availability`, `ISBN`)
VALUES (''13'', 265, 11, ''33545015705'');
INSERT INTO `paper_books` (`paper_book_id`, `number_of_pages`, `availability`, `ISBN`)
VALUES (''14'', 249, 8, ''77780946031'');
INSERT INTO `paper_books` (`paper_book_id`, `number_of_pages`, `availability`, `ISBN`)
VALUES (''15'', 316, 2, ''14981749101'');
INSERT INTO `paper_books` (`paper_book_id`, `number_of_pages`, `availability`, `ISBN`)
VALUES (''16'', 75, 1, ''72543613301'');
INSERT INTO `paper_books` (`paper_book_id`, `number_of_pages`, `availability`, `ISBN`)
VALUES (''17'', 347, 0, ''95242800615'');
INSERT INTO `paper_books` (`paper_book_id`, `number_of_pages`, `availability`, `ISBN`)
VALUES (''18'', 399, 7, ''54619514722'');
INSERT INTO `paper_books` (`paper_book_id`, `number_of_pages`, `availability`, `ISBN`)
VALUES (''19'', 318, 4, ''74146136017'');
INSERT INTO `paper_books` (`paper_book_id`, `number_of_pages`, `availability`, `ISBN`)
VALUES (''20'', 60, 5, ''72201891422'');

DROP TABLE IF EXISTS publishing_houses;
CREATE TABLE publishing_houses
(
    publishing_house_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    publishing_house    VARCHAR(100) UNIQUE NOT NULL,
    PRIMARY KEY (publishing_house_id)
) ENGINE=InnoDB;

INSERT INTO `publishing_houses`
VALUES (''1'', ''Москва'');
INSERT INTO `publishing_houses`
VALUES (''2'', ''Питер'');
INSERT INTO `publishing_houses`
VALUES (''3'', ''Ромашка'');
INSERT INTO `publishing_houses`
VALUES (''4'', ''Русская Книга'');
INSERT INTO `publishing_houses`
VALUES (''5'', ''Перфект'');

DROP TABLE IF EXISTS books_publishing_house;
CREATE TABLE books_publishing_house
(
    bph_id              BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    book_id             BIGINT UNSIGNED NOT NULL,
    publishing_house_id SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (bph_id),
    CONSTRAINT `fk_bph_paperbooks` FOREIGN KEY (`book_id`) REFERENCES `paper_books` (`paper_book_id`),
    CONSTRAINT `fk_bph_publishinghouses` FOREIGN KEY (`publishing_house_id`) REFERENCES `publishing_houses` (`publishing_house_id`)
) ENGINE=InnoDB;

INSERT INTO `books_publishing_house`
VALUES (1, 1, 1);
INSERT INTO `books_publishing_house`
VALUES (2, 1, 2);
INSERT INTO `books_publishing_house`
VALUES (3, 1, 5);
INSERT INTO `books_publishing_house`
VALUES (4, 2, 4);
INSERT INTO `books_publishing_house`
VALUES (5, 2, 5);
INSERT INTO `books_publishing_house`
VALUES (6, 3, 1);
INSERT INTO `books_publishing_house`
VALUES (7, 4, 1);
INSERT INTO `books_publishing_house`
VALUES (8, 4, 2);
INSERT INTO `books_publishing_house`
VALUES (9, 4, 3);
INSERT INTO `books_publishing_house`
VALUES (10, 4, 4);
INSERT INTO `books_publishing_house`
VALUES (11, 5, 2);
INSERT INTO `books_publishing_house`
VALUES (12, 6, 4);
INSERT INTO `books_publishing_house`
VALUES (13, 7, 1);
INSERT INTO `books_publishing_house`
VALUES (14, 8, 1);
INSERT INTO `books_publishing_house`
VALUES (15, 9, 5);
INSERT INTO `books_publishing_house`
VALUES (16, 10, 3);
INSERT INTO `books_publishing_house`
VALUES (17, 11, 1);
INSERT INTO `books_publishing_house`
VALUES (18, 11, 5);
INSERT INTO `books_publishing_house`
VALUES (19, 12, 4);
INSERT INTO `books_publishing_house`
VALUES (20, 12, 5);
INSERT INTO `books_publishing_house`
VALUES (21, 13, 5);
INSERT INTO `books_publishing_house`
VALUES (22, 14, 5);
INSERT INTO `books_publishing_house`
VALUES (23, 15, 5);
INSERT INTO `books_publishing_house`
VALUES (24, 16, 1);
INSERT INTO `books_publishing_house`
VALUES (25, 16, 2);
INSERT INTO `books_publishing_house`
VALUES (26, 17, 5);
INSERT INTO `books_publishing_house`
VALUES (27, 18, 3);
INSERT INTO `books_publishing_house`
VALUES (28, 19, 3);
INSERT INTO `books_publishing_house`
VALUES (29, 20, 3);

DROP TABLE IF EXISTS quotes;
CREATE TABLE quotes
(
    quotes_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    quote     VARCHAR(500),
    PRIMARY KEY (quotes_id),
    CONSTRAINT `fk_quotes_books` FOREIGN KEY (`quotes_id`) REFERENCES `books` (`book_id`)
) ENGINE=InnoDB;

INSERT INTO `quotes` (`quotes_id`, `quote`)
VALUES (''1'', ''Et ut fuga tempora alias placeat vel. Voluptatem facere ipsa voluptatum cumque nemo impedit. Porro est rerum ea corporis. Fugit vitae soluta ut.'');
INSERT INTO `quotes` (`quotes_id`, `quote`)
VALUES (''2'', ''Molestiae qui beatae iure alias nostrum voluptates porro inventore. Et autem ullam consectetur earum quia sapiente. Aut quas aut molestias corrupti est et voluptatibus.'');
INSERT INTO `quotes` (`quotes_id`, `quote`)
VALUES (''3'', ''Dolor aut quae qui dolorem. Expedita vitae ratione itaque vero. In perferendis dolorem eos. Et nobis nisi et minus.'');
INSERT INTO `quotes` (`quotes_id`, `quote`)
VALUES (''4'', ''Earum molestiae quod ut aut sit tempore ipsum. Nulla doloremque sit numquam sunt. Debitis rerum ab id rem.'');
INSERT INTO `quotes` (`quotes_id`, `quote`)
VALUES (''5'', ''Quae optio id excepturi et a. Voluptatem sequi cum velit dolore vel cupiditate.'');
INSERT INTO `quotes` (`quotes_id`, `quote`)
VALUES (''6'', ''Deserunt quia ullam repellendus quis nihil. Accusantium omnis tenetur est architecto est nam vel exercitationem. Ipsam cum recusandae sunt eum fugiat velit suscipit.'');
INSERT INTO `quotes` (`quotes_id`, `quote`)
VALUES (''7'', ''Et ut maiores velit eveniet nemo. Ducimus et doloribus unde incidunt. Alias ipsam aut veritatis qui et. Est assumenda voluptatem ex ut autem.'');
INSERT INTO `quotes` (`quotes_id`, `quote`)
VALUES (''8'', ''Sit totam maxime incidunt quisquam. Occaecati dolorem maiores autem expedita. Nihil et nobis voluptatibus voluptas fugit numquam et aut.'');
INSERT INTO `quotes` (`quotes_id`, `quote`)
VALUES (''9'', ''Quis porro molestiae at sit numquam molestias. Est itaque et nisi autem ullam modi voluptas. Dolorem voluptatem quaerat culpa. Et harum laudantium ea sed aut.'');
INSERT INTO `quotes` (`quotes_id`, `quote`)
VALUES (''10'', ''Culpa rerum fuga mollitia alias beatae perspiciatis at. Maiores ducimus fuga dolores voluptatem odio praesentium odit.'');
INSERT INTO `quotes` (`quotes_id`, `quote`)
VALUES (''11'', ''Molestiae saepe quis sed harum. Tempore et dolores aut explicabo iste. Qui qui ducimus non autem aut magnam. Ut laboriosam pariatur cupiditate.'');
INSERT INTO `quotes` (`quotes_id`, `quote`)
VALUES (''12'', ''Nisi et repudiandae doloremque ea qui dolor expedita. Similique quam quo iste facere quia ut ut. Dolorem architecto ex architecto consectetur dolores.'');
INSERT INTO `quotes` (`quotes_id`, `quote`)
VALUES (''13'', ''Ea est beatae nesciunt dignissimos. Doloribus placeat tempore perspiciatis et eos consequatur quasi. Omnis dignissimos nihil qui deserunt. Ut voluptas qui praesentium provident eos libero et.'');
INSERT INTO `quotes` (`quotes_id`, `quote`)
VALUES (''14'', ''Quis error ullam aut quibusdam. Magni ut quod suscipit soluta. Iure consequatur fugiat iure exercitationem quo.'');
INSERT INTO `quotes` (`quotes_id`, `quote`)
VALUES (''15'', ''Sunt reiciendis a voluptatem molestiae laudantium laudantium. Harum quia ratione suscipit odio autem eaque enim. Odio animi animi esse. Repellendus natus assumenda neque et.'');
INSERT INTO `quotes` (`quotes_id`, `quote`)
VALUES (''16'', ''Ad sunt sit ut et dolores a fuga. Nihil enim aliquam harum recusandae nostrum. Explicabo enim et et.'');
INSERT INTO `quotes` (`quotes_id`, `quote`)
VALUES (''17'', ''Et nobis nam sint. Impedit voluptas dolorum ut temporibus delectus. Occaecati nisi ut et dolores.'');
INSERT INTO `quotes` (`quotes_id`, `quote`)
VALUES (''18'', ''Praesentium aut a quia ea. Mollitia nisi et rerum voluptatem distinctio et. Ipsum repudiandae ullam ullam esse.'');
INSERT INTO `quotes` (`quotes_id`, `quote`)
VALUES (''19'', ''Eaque ut blanditiis dolores velit quod ad omnis. Provident praesentium consectetur quo ipsum deleniti. Aut tempora animi sit. Non quas soluta qui ut animi.'');
INSERT INTO `quotes` (`quotes_id`, `quote`)
VALUES (''20'', ''Reiciendis non nihil minima asperiores qui. Labore et accusamus sit commodi quisquam. Alias minus blanditiis corporis nulla voluptatem.'');

DROP TABLE IF EXISTS rating;
CREATE TABLE rating
(
    rating_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id   BIGINT UNSIGNED NOT NULL,
    book_id   BIGINT UNSIGNED NOT NULL,
    rating    ENUM(''1'', ''2'', ''3'', ''4'', ''5'') NOT NULL,
    PRIMARY KEY (rating_id),
    CONSTRAINT `fk_rating_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
    CONSTRAINT `fk_rating_books` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`)
) ENGINE=InnoDB;

INSERT INTO `rating` (`rating_id`, `user_id`, `book_id`, `rating`)
VALUES (1, ''1'', ''31'', ''3'');
INSERT INTO `rating` (`rating_id`, `user_id`, `book_id`, `rating`)
VALUES (2, ''1'', ''22'', ''3'');
INSERT INTO `rating` (`rating_id`, `user_id`, `book_id`, `rating`)
VALUES (3, ''2'', ''25'', ''2'');
INSERT INTO `rating` (`rating_id`, `user_id`, `book_id`, `rating`)
VALUES (4, ''2'', ''14'', ''4'');
INSERT INTO `rating` (`rating_id`, `user_id`, `book_id`, `rating`)
VALUES (5, ''8'', ''5'', ''4'');
INSERT INTO `rating` (`rating_id`, `user_id`, `book_id`, `rating`)
VALUES (6, ''9'', ''16'', ''2'');
INSERT INTO `rating` (`rating_id`, `user_id`, `book_id`, `rating`)
VALUES (7, ''9'', ''23'', ''1'');
INSERT INTO `rating` (`rating_id`, `user_id`, `book_id`, `rating`)
VALUES (8, ''10'', ''3'', ''2'');
INSERT INTO `rating` (`rating_id`, `user_id`, `book_id`, `rating`)
VALUES (9, ''10'', ''7'', ''4'');
INSERT INTO `rating` (`rating_id`, `user_id`, `book_id`, `rating`)
VALUES (10, ''10'', ''22'', ''1'');
INSERT INTO `rating` (`rating_id`, `user_id`, `book_id`, `rating`)
VALUES (11, ''11'', ''23'', ''5'');
INSERT INTO `rating` (`rating_id`, `user_id`, `book_id`, `rating`)
VALUES (12, ''10'', ''12'', ''3'');
INSERT INTO `rating` (`rating_id`, `user_id`, `book_id`, `rating`)
VALUES (13, ''6'', ''8'', ''3'');
INSERT INTO `rating` (`rating_id`, `user_id`, `book_id`, `rating`)
VALUES (14, ''8'', ''8'', ''5'');
INSERT INTO `rating` (`rating_id`, `user_id`, `book_id`, `rating`)
VALUES (15, ''8'', ''6'', ''2'');
INSERT INTO `rating` (`rating_id`, `user_id`, `book_id`, `rating`)
VALUES (16, ''9'', ''2'', ''5'');
INSERT INTO `rating` (`rating_id`, `user_id`, `book_id`, `rating`)
VALUES (17, ''2'', ''2'', ''3'');
INSERT INTO `rating` (`rating_id`, `user_id`, `book_id`, `rating`)
VALUES (18, ''2'', ''4'', ''1'');
INSERT INTO `rating` (`rating_id`, `user_id`, `book_id`, `rating`)
VALUES (19, ''2'', ''5'', ''3'');
INSERT INTO `rating` (`rating_id`, `user_id`, `book_id`, `rating`)
VALUES (20, ''2'', ''19'', ''1'');
INSERT INTO `rating` (`rating_id`, `user_id`, `book_id`, `rating`)
VALUES (21, ''8'', ''7'', ''2'');
INSERT INTO `rating` (`rating_id`, `user_id`, `book_id`, `rating`)
VALUES (22, ''8'', ''9'', ''5'');
INSERT INTO `rating` (`rating_id`, `user_id`, `book_id`, `rating`)
VALUES (23, ''3'', ''6'', ''1'');
INSERT INTO `rating` (`rating_id`, `user_id`, `book_id`, `rating`)
VALUES (24, ''3'', ''9'', ''5'');
INSERT INTO `rating` (`rating_id`, `user_id`, `book_id`, `rating`)
VALUES (25, ''4'', ''9'', ''1'');
INSERT INTO `rating` (`rating_id`, `user_id`, `book_id`, `rating`)
VALUES (26, ''4'', ''7'', ''2'');
INSERT INTO `rating` (`rating_id`, `user_id`, `book_id`, `rating`)
VALUES (27, ''6'', ''6'', ''4'');
INSERT INTO `rating` (`rating_id`, `user_id`, `book_id`, `rating`)
VALUES (28, ''8'', ''7'', ''2'');
INSERT INTO `rating` (`rating_id`, `user_id`, `book_id`, `rating`)
VALUES (29, ''8'', ''8'', ''3'');
INSERT INTO `rating` (`rating_id`, `user_id`, `book_id`, `rating`)
VALUES (30, ''9'', ''9'', ''1'');
INSERT INTO `rating` (`rating_id`, `user_id`, `book_id`, `rating`)
VALUES (31, ''3'', ''9'', ''5'');
INSERT INTO `rating` (`rating_id`, `user_id`, `book_id`, `rating`)
VALUES (32, ''3'', ''3'', ''5'');
INSERT INTO `rating` (`rating_id`, `user_id`, `book_id`, `rating`)
VALUES (33, ''11'', ''8'', ''5'');
INSERT INTO `rating` (`rating_id`, `user_id`, `book_id`, `rating`)
VALUES (34, ''10'', ''6'', ''3'');
INSERT INTO `rating` (`rating_id`, `user_id`, `book_id`, `rating`)
VALUES (35, ''10'', ''7'', ''2'');
INSERT INTO `rating` (`rating_id`, `user_id`, `book_id`, `rating`)
VALUES (36, ''10'', ''5'', ''4'');

DROP TABLE IF EXISTS reviews;
CREATE TABLE reviews
(
    user_id BIGINT UNSIGNED NOT NULL,
    book_id BIGINT UNSIGNED NOT NULL,
    review  VARCHAR(500),
    rating  BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (user_id, book_id),
    KEY     `user_idx` (`user_id`),
    KEY     `book_idx` (`book_id`),
    CONSTRAINT `fk_reviews_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
    CONSTRAINT `fk_reviews_books` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
    CONSTRAINT `fk_reviews_rating` FOREIGN KEY (`rating`) REFERENCES `rating` (`rating_id`)
) ENGINE=InnoDB;

INSERT INTO `reviews` (`user_id`, `book_id`, `review`, `rating`)
VALUES (''1'', ''31'', ''Magni quia pariatur ipsum ratione eveniet ab aut. Est optio aut rem culpa. Magni ad quibusdam qui autem debitis.\nUt qui amet architecto sunt sequi maiores. Nam fugiat voluptatem neque et. Aut illo iure voluptatem magni tempore. Voluptate sint omnis ea ut dolorem placeat.'', 5);
INSERT INTO `reviews` (`user_id`, `book_id`, `review`, `rating`)
VALUES (''1'', ''5'', ''Dolor blanditiis molestiae quae dolorem qui voluptatem velit. Deleniti aut repellat saepe sed earum. Veritatis sed mollitia autem est sit maxime. Sunt quia consequatur officia temporibus quis minus rem.'', 1);
INSERT INTO `reviews` (`user_id`, `book_id`, `review`, `rating`)
VALUES (''2'', ''3'', ''Soluta velit sequi aut quaerat nihil aliquid. Quidem quidem explicabo nihil libero similique voluptate fugiat repellendus. Officiis eos sed et error corrupti.'', 2);
INSERT INTO `reviews` (`user_id`, `book_id`, `review`, `rating`)
VALUES (''4'', ''1'', ''Voluptatem quo eaque asperiores placeat. Et rerum temporibus dolor rem. Impedit id repudiandae quia rerum iste odit.\nAspernatur quidem sit suscipit nisi doloremque. Aspernatur voluptatum nulla nostrum. Voluptates beatae minus sed. Magnam natus sequi delectus aliquam laudantium et.'', 12);
INSERT INTO `reviews` (`user_id`, `book_id`, `review`, `rating`)
VALUES (''5'', ''1'', ''Dolores soluta voluptate perferendis sapiente. Exercitationem ratione nemo perferendis optio inventore.\nEst dolores a recusandae hic labore aut alias. Quis consequatur voluptatem ut libero ducimus. Eius aliquid sapiente magni.'', 11);
INSERT INTO `reviews` (`user_id`, `book_id`, `review`, `rating`)
VALUES (''5'', ''4'', ''Neque rerum dolor rerum esse. Molestiae fuga est est odit. Voluptate sit omnis praesentium. Sint iusto eum aut labore molestiae.\nAtque quisquam dolorem ut quia expedita. Laborum veniam qui a. Iusto recusandae quasi cumque quam eaque.'', 11);
INSERT INTO `reviews` (`user_id`, `book_id`, `review`, `rating`)
VALUES (''7'', ''27'', ''Fuga molestiae quas architecto fuga ipsum. At dolor sunt praesentium expedita aspernatur qui. Doloremque laborum voluptatem vel magni a dolorum.\nCumque facere quas eveniet repellendus nobis doloribus cupiditate. Neque ipsum illum delectus libero error a aut.'', 5);
INSERT INTO `reviews` (`user_id`, `book_id`, `review`, `rating`)
VALUES (''7'', ''28'', ''Aut veritatis saepe non explicabo tempora cum. Consequuntur et sed et dignissimos aut minus aliquam. Fuga ut exercitationem sed. Animi doloremque voluptatem molestiae repellendus sunt.'', 7);
INSERT INTO `reviews` (`user_id`, `book_id`, `review`, `rating`)
VALUES (''8'', ''30'', ''Sunt officia in ea consectetur sed rem accusantium. Ratione dolorem minima ipsam ut sit debitis temporibus. Sequi est animi possimus reprehenderit et perspiciatis. Harum explicabo delectus cum rem nemo veniam.'', 8);
INSERT INTO `reviews` (`user_id`, `book_id`, `review`, `rating`)
VALUES (''8'', ''3'', ''Ex repellendus itaque modi est ducimus ex. Aut vel et et dolor. Esse et iure sequi voluptatum facere earum eos.\nId iste vero aut accusamus ad alias. Qui sunt aut doloremque distinctio explicabo ea. Quae incidunt expedita neque expedita quos quis veritatis.'', 9);
INSERT INTO `reviews` (`user_id`, `book_id`, `review`, `rating`)
VALUES (''9'', ''15'', ''Perspiciatis non ducimus excepturi est est commodi atque molestiae. Voluptatum officiis est eum molestiae aperiam. Omnis necessitatibus qui voluptatibus optio et. Molestias totam distinctio aut. Eveniet nihil deserunt vel provident est.'', 4);
INSERT INTO `reviews` (`user_id`, `book_id`, `review`, `rating`)
VALUES (''9'', ''30'', ''Ab sit magni rerum ut provident voluptas sequi. Laboriosam velit amet dolorem reprehenderit magni dolor. Nostrum debitis aut dignissimos officia nisi.'', 2);
INSERT INTO `reviews` (`user_id`, `book_id`, `review`, `rating`)
VALUES (''9'', ''4'', ''Ut ipsum consequatur ut quia sint omnis necessitatibus. Nesciunt blanditiis placeat nam praesentium facilis. Animi ut at aut est debitis modi rem consequuntur. Dicta sint molestias vero facilis sapiente explicabo saepe non. Rerum autem natus dolores neque et.'', 8);
INSERT INTO `reviews` (`user_id`, `book_id`, `review`, `rating`)
VALUES (''10'', ''1'', ''Et expedita reiciendis atque similique voluptatem dolores. Aliquid sunt provident consectetur. Rerum aut eius voluptatem consequuntur culpa in qui. Magni quas sit est eius aut.'', 8);
INSERT INTO `reviews` (`user_id`, `book_id`, `review`, `rating`)
VALUES (''11'', ''22'', ''Eius vero eos blanditiis alias alias aut quod nemo. Praesentium quis voluptatem similique itaque aut nihil ea. Molestiae excepturi dolor officiis placeat ducimus tenetur vel.\nQuae nemo nostrum aut doloribus. Repudiandae error adipisci facere ut.'', 8);
INSERT INTO `reviews` (`user_id`, `book_id`, `review`, `rating`)
VALUES (''11'', ''6'', ''Corrupti quia id ea voluptas consequatur est odio. Eum nulla earum repudiandae sunt aut dolorem sunt reprehenderit. Quae tempora voluptatem omnis facere odit consequatur praesentium autem.'', 8);
INSERT INTO `reviews` (`user_id`, `book_id`, `review`, `rating`)
VALUES (''2'', ''6'', ''Ut consectetur deleniti et vero ipsa nemo qui. Fuga atque corrupti in provident neque dignissimos. Sed voluptatem sit commodi cum deleniti labore. Omnis amet accusamus quia sed veniam sit atque sed.'', 8);
INSERT INTO `reviews` (`user_id`, `book_id`, `review`, `rating`)
VALUES (''8'', ''5'', ''Iure cumque incidunt fuga qui. Nostrum atque et illo qui ipsam ut. Reiciendis similique autem nostrum sunt. Laudantium dolore dolor qui eius ut. Corporis ab aliquid iste non eum magni magni.'', 8);
INSERT INTO `reviews` (`user_id`, `book_id`, `review`, `rating`)
VALUES (''3'', ''5'', ''In dolores accusantium aut molestias animi doloribus eum corrupti. Quas molestias autem et qui aut ex. Qui et impedit velit unde aut omnis ut incidunt.\nFugiat facilis eum quos quo ullam. Quod corrupti fuga voluptates ea. Ad pariatur ut commodi modi.'', 8);
INSERT INTO `reviews` (`user_id`, `book_id`, `review`, `rating`)
VALUES (''4'', ''7'', ''Et officiis libero dolores ducimus deleniti. Est aut modi eligendi nostrum amet. Non ea praesentium rerum.\nEt sunt qui sed velit mollitia dolores. Aut ipsam ducimus recusandae officia voluptas quidem. Itaque excepturi assumenda ipsum minus vel ut. Hic laborum fugiat soluta ipsum.'', 8);
INSERT INTO `reviews` (`user_id`, `book_id`, `review`, `rating`)
VALUES (''6'', ''9'', ''Qui et est quisquam consequatur sequi unde. Laudantium laborum sunt quia et maxime suscipit non. Corrupti voluptas voluptas voluptatem repellendus autem similique aut quaerat.'', 8);
INSERT INTO `reviews` (`user_id`, `book_id`, `review`, `rating`)
VALUES (''9'', ''5'', ''Sint nihil ut quam quibusdam accusantium id. Nam fugit dicta atque enim veritatis est exercitationem labore. Error ut aut iusto ea consequuntur.'', 8);
INSERT INTO `reviews` (`user_id`, `book_id`, `review`, `rating`)
VALUES (''2'', ''8'', ''Explicabo consequatur exercitationem explicabo vel quo. Et aut dolores eos dignissimos assumenda assumenda cupiditate praesentium. Odit iusto delectus consequuntur. Architecto nulla reiciendis iure qui.'', 8);
INSERT INTO `reviews` (`user_id`, `book_id`, `review`, `rating`)
VALUES (''1'', ''8'', ''Est voluptatum maiores asperiores quis. Ab et doloremque at voluptate aliquam facere amet. Fuga quisquam vero ad quo. Distinctio quia omnis qui qui autem reprehenderit.\nNisi esse et explicabo quos. Consequatur molestiae quam praesentium iste. Delectus doloremque numquam deserunt.'', 8);

DROP TABLE IF EXISTS books_tag;
CREATE TABLE books_tag
(
    book_id BIGINT UNSIGNED NOT NULL,
    tag_id  SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (book_id, tag_id),
    KEY     `book_idx` (`book_id`),
    KEY     `tag_idx` (`tag_id`),
    CONSTRAINT `fk_bookstag_books` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
    CONSTRAINT `fk_bookstag_tags` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tag_id`)
) ENGINE=InnoDB;

INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''2'', 1);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''3'', 2);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''4'', 1);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''4'', 3);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''5'', 4);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''5'', 3);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''6'', 1);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''7'', 1);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''7'', 2);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''9'', 5);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''10'', 1);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''11'', 5);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''12'', 7);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''13'', 7);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''14'', 4);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''15'', 3);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''15'', 4);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''15'', 6);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''17'', 7);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''18'', 4);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''21'', 5);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''22'', 2);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''22'', 5);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''22'', 6);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''23'', 4);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''24'', 3);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''25'', 4);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''26'', 1);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''26'', 2);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''26'', 4);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''26'', 5);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''26'', 7);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''26'', 3);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''29'', 3);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''30'', 5);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''31'', 5);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''31'', 6);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''31'', 7);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''3'', 1);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''4'', 6);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''4'', 2);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''5'', 1);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''5'', 2);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''8'', 6);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''9'', 7);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''4'', 4);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''2'', 3);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''2'', 2);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''4'', 5);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''5'', 5);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''6'', 2);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''7'', 3);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''7'', 4);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''5'', 6);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''3'', 4);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''5'', 7);
INSERT INTO `books_tag` (`book_id`, `tag_id`)
VALUES (''8'', 4);

DROP TABLE IF EXISTS books_genre;
CREATE TABLE books_genre
(
    book_id  BIGINT UNSIGNED NOT NULL,
    genre_id TINYINT NOT NULL,
    PRIMARY KEY (book_id, genre_id),
    KEY      `book_idx` (`book_id`),
    KEY      `tag_idx` (`genre_id`),
    CONSTRAINT `fk_booksgenre_books` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
    CONSTRAINT `fk_booksgenre_genres` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`)
) ENGINE=InnoDB;

INSERT INTO `books_genre` (`book_id`, `genre_id`)
VALUES (''2'', 1);
INSERT INTO `books_genre` (`book_id`, `genre_id`)
VALUES (''3'', 6);
INSERT INTO `books_genre` (`book_id`, `genre_id`)
VALUES (''6'', 3);
INSERT INTO `books_genre` (`book_id`, `genre_id`)
VALUES (''8'', 7);
INSERT INTO `books_genre` (`book_id`, `genre_id`)
VALUES (''10'', 5);
INSERT INTO `books_genre` (`book_id`, `genre_id`)
VALUES (''11'', 5);
INSERT INTO `books_genre` (`book_id`, `genre_id`)
VALUES (''12'', 1);
INSERT INTO `books_genre` (`book_id`, `genre_id`)
VALUES (''17'', 6);
INSERT INTO `books_genre` (`book_id`, `genre_id`)
VALUES (''18'', 5);
INSERT INTO `books_genre` (`book_id`, `genre_id`)
VALUES (''23'', 2);
INSERT INTO `books_genre` (`book_id`, `genre_id`)
VALUES (''25'', 1);
INSERT INTO `books_genre` (`book_id`, `genre_id`)
VALUES (''26'', 7);
INSERT INTO `books_genre` (`book_id`, `genre_id`)
VALUES (''27'', 4);
INSERT INTO `books_genre` (`book_id`, `genre_id`)
VALUES (''28'', 3);
INSERT INTO `books_genre` (`book_id`, `genre_id`)
VALUES (''30'', 1);
INSERT INTO `books_genre` (`book_id`, `genre_id`)
VALUES (''31'', 2);
INSERT INTO `books_genre` (`book_id`, `genre_id`)
VALUES (''2'', 3);
INSERT INTO `books_genre` (`book_id`, `genre_id`)
VALUES (''3'', 3);
INSERT INTO `books_genre` (`book_id`, `genre_id`)
VALUES (''4'', 5);
INSERT INTO `books_genre` (`book_id`, `genre_id`)
VALUES (''6'', 5);
INSERT INTO `books_genre` (`book_id`, `genre_id`)
VALUES (''7'', 1);
INSERT INTO `books_genre` (`book_id`, `genre_id`)
VALUES (''9'', 6);

DROP TABLE IF EXISTS users_purchases;
CREATE TABLE users_purchases
(
    deal_id          BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id          BIGINT UNSIGNED NOT NULL,
    book_id          BIGINT UNSIGNED NOT NULL,
    type_id          TINYINT NOT NULL,
    time_of_purchase TIMESTAMP DEFAULT now(),
    PRIMARY KEY (deal_id),
    CONSTRAINT `userspurshases_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
    CONSTRAINT `userspurshases_books` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
    CONSTRAINT `userspurshases_booktypes` FOREIGN KEY (`type_id`) REFERENCES `book_types` (`type_id`)
) ENGINE=InnoDB;

INSERT INTO `users_purchases`
VALUES (1, 1, 11, 2, ''2016-07-18 17:20:17'');
INSERT INTO `users_purchases`
VALUES (2, 1, 12, 2, ''2016-07-18 17:20:17'');
INSERT INTO `users_purchases`
VALUES (3, 1, 22, 2, ''2016-07-18 17:20:17'');
INSERT INTO `users_purchases`
VALUES (4, 1, 8, 2, ''2016-07-18 17:20:17'');
INSERT INTO `users_purchases`
VALUES (5, 1, 7, 2, ''2016-07-18 17:20:17'');
INSERT INTO `users_purchases`
VALUES (6, 2, 1, 2, ''2016-07-18 17:20:17'');
INSERT INTO `users_purchases`
VALUES (7, 2, 2, 1, ''2016-07-18 17:20:17'');
INSERT INTO `users_purchases`
VALUES (8, 3, 3, 3, ''2016-07-18 17:20:17'');
INSERT INTO `users_purchases`
VALUES (9, 3, 15, 3, ''2016-07-18 17:20:17'');
INSERT INTO `users_purchases`
VALUES (10, 3, 12, 3, ''2016-07-18 17:20:17'');
INSERT INTO `users_purchases`
VALUES (11, 3, 16, 3, ''2016-07-18 17:20:17'');
INSERT INTO `users_purchases`
VALUES (12, 9, 4, 1, ''2016-07-18 17:20:17'');
INSERT INTO `users_purchases`
VALUES (13, 9, 5, 1, ''2016-07-18 17:20:17'');
INSERT INTO `users_purchases`
VALUES (14, 9, 6, 1, ''2016-07-18 17:20:17'');
INSERT INTO `users_purchases`
VALUES (15, 9, 7, 1, ''2016-07-18 17:20:17'');
INSERT INTO `users_purchases`
VALUES (16, 9, 7, 2, ''2016-07-18 17:20:17'');
INSERT INTO `users_purchases`
VALUES (17, 9, 13, 1, ''2016-07-18 17:20:17'');
INSERT INTO `users_purchases`
VALUES (18, 9, 12, 1, ''2016-07-18 17:20:17'');
INSERT INTO `users_purchases`
VALUES (19, 10, 8, 3, ''2016-07-18 17:20:17'');
INSERT INTO `users_purchases`
VALUES (20, 10, 9, 3, ''2016-07-18 17:20:17'');
INSERT INTO `users_purchases`
VALUES (21, 10, 9, 1, ''2016-07-18 17:20:17'');
INSERT INTO `users_purchases`
VALUES (22, 10, 10, 3, ''2016-07-18 17:20:17'');
INSERT INTO `users_purchases`
VALUES (23, 10, 10, 3, ''2016-07-18 17:20:17'');
INSERT INTO `users_purchases`
VALUES (24, 10, 19, 1, ''2016-07-18 17:20:17'');
INSERT INTO `users_purchases`
VALUES (25, 8, 23, 1, ''2016-07-18 17:20:17'');
INSERT INTO `users_purchases`
VALUES (26, 8, 2, 1, ''2016-07-18 17:20:17'');
INSERT INTO `users_purchases`
VALUES (27, 11, 4, 2, ''2016-07-18 17:20:17'');
INSERT INTO `users_purchases`
VALUES (28, 1, 4, 3, ''2016-07-18 17:20:17'');
INSERT INTO `users_purchases`
VALUES (29, 8, 1, 1, ''2016-07-18 17:20:17'');
INSERT INTO `users_purchases`
VALUES (30, 8, 11, 3, ''2016-07-18 17:20:17'');

