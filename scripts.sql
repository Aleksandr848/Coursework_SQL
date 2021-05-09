


--      Выводим все книги, у которых жанр "детектив", возрастное ограничение больше 7 лет, есть формат "аудио" и на
--      русском языке.



USE allbooks;

SELECT author_id, title FROM books
WHERE /*book_id IN ((SELECT book_id FROM books_genre WHERE genre_id = 1) OR (SELECT audiobook_id FROM audiobooks))
AND*/ books_language_id = 1 AND age_limit > 7 AND book_id IN (
    SELECT book_id FROM books_genre WHERE genre_id = 1
    ) AND book_id IN (SELECT audiobook_id FROM audiobooks
    );



--      Выводим все книги с жанром "детектив" с сортировкой по рейтингу



SELECT book_id,
       title AS `Название книги`,
       (SELECT author_firstname FROM authors WHERE authors.author_id = books.author_id) AS `Имя`,
       (SELECT author_lastname FROM authors WHERE authors.author_id = books.author_id) AS `Фамилия`,
       (SELECT round(avg(rating),1) FROM rating WHERE books.book_id = rating.book_id) AS `Средний рейтинг`
FROM books WHERE book_id IN (SELECT book_id FROM books_genre WHERE genre_id = 1)
ORDER BY `Средний рейтинг` DESC;



--      Выводим книги, которые есть в трёх форматах (бумажный, аудио и электронка)



SELECT book_id,
       title AS `Название книги`,
       (SELECT author_firstname FROM authors WHERE authors.author_id = books.author_id) AS `Имя`,
       (SELECT author_lastname FROM authors WHERE authors.author_id = books.author_id) AS `Фамилия`
FROM books
JOIN audiobooks a ON books.book_id = a.audiobook_id
JOIN electronic_books eb ON books.book_id = eb.elbook_id
JOIN paper_books pb ON books.book_id = pb.paper_book_id;



--      представление со списком книг, цитат к ним, отзывов пользователей и средним рейтингом.



CREATE or replace VIEW view_books
AS
    SELECT book_id,
           title AS `Название книги`,
           (SELECT author_firstname FROM authors WHERE authors.author_id = b.author_id) AS `Имя`,
           (SELECT author_lastname FROM authors WHERE authors.author_id = b.author_id) AS `Фамилия`,
           (SELECT quote FROM quotes WHERE quotes.quotes_id = b.book_id) AS `Цитата`,
           (SELECT GROUP_CONCAT(review separator '\n') FROM reviews WHERE reviews.book_id = b.book_id) AS `Отзыв`,
           (SELECT round(avg(rating),1) FROM rating WHERE rating.book_id = b.book_id) AS `Средний рейтинг`
    FROM books AS b;

SELECT * FROM view_books;

DROP VIEW view_books;



--      Представление со списком жанров книг их количества по жанрам и рейтинг жанра.



CREATE or REPLACE VIEW view_genres_rating
AS
    SELECT genre,
           (SELECT COUNT(book_id) FROM books_genre WHERE genres.genre_id = books_genre.genre_id) AS `Всего книг этого жанра`,
           (SELECT round(avg(rating),1) FROM rating WHERE book_id IN
                                                          (SELECT book_id FROM books_genre WHERE genres.genre_id = books_genre.genre_id)) AS `Средний рейтинг жанра`
    FROM genres;

SELECT * FROM view_genres_rating;

DROP VIEW;



--      Задача: Вывести список рекомендованных книг для пользователя исходя из писателей купленных книг.



DROP PROCEDURE IF EXISTS sp_book_recommendations;

DELIMITER //

CREATE PROCEDURE sp_book_recommendations (IN for_user_id BIGINT UNSIGNED)
BEGIN
    SELECT title AS `Название книги`,
    (SELECT CONCAT(author_firstname, ' ', author_lastname) FROM authors WHERE author_id = books.author_id) AS `Писатель`
    FROM books WHERE book_id NOT IN
                     (SELECT book_id FROM users_purchases WHERE user_id = 1) AND author_id IN
                        (SELECT author_id FROM books WHERE book_id IN
                                                           (SELECT book_id FROM users_purchases WHERE user_id = 1))
    ORDER BY RAND() LIMIT 5;
END //

DELIMITER ;

CALL sp_book_recommendations(2);




--      Делаем триггер. При добавлении новой записи в users_purchases в таблицу purchased_books добавляется новая запись
--      book_id. На основе этой таблицы можно делать статистику по продажам книг.



DROP TABLE IF EXISTS purchased_books;

CREATE TABLE purchased_books(
    purch_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    purchased_book_id BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (purch_id)
) ENGINE=InnoDB;

DELIMITER //
CREATE TRIGGER purchased_book BEFORE INSERT ON users_purchases
  FOR EACH ROW BEGIN
    INSERT INTO purchased_books SET purchased_book_id = NEW.book_id;
  END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS check_is_not_empty;

DELIMITER //

