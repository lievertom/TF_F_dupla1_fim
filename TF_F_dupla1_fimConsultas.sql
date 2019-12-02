-- --------     << tf_f_dupla1_fim >>     ------------
-- 
--                    SCRIPT CONSULTA(DML)
-- 
-- Data Criacao ...........: 01/12/2019
-- Autor(es) ..............: Lieverton, Welison
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: tf_f_dupla1_fim
-- 
-- PROJETO => 1 Base de Dados
--         => 3 Tabelas
--         => 2 usuários
--         => 1 View
-- 
-- -----------------------------------------------------------------

USE tf_f_dupla1_fim;

-- Propósito:
-- Tem como objetivo aforecer ao o usuário o nome dos 10 filmes mais bem avaliados,
-- sendo que para entrar nesse ranking o filme deve ter sido avaliado no mínimo
-- 100 vezes.

CREATE OR REPLACE VIEW v_MOVIE_RATING AS
SELECT M.idMovie, title, sumRating/`number of ratings` AS rating, `number of ratings`
    FROM MOVIE AS M
        INNER JOIN 
        (
            SELECT idMovie, count(idMovie) AS `number of ratings`, sum(rating) AS sumRating
                FROM RATING
                GROUP BY idMovie
        ) AS R
            ON M.idMovie = R.idMovie
    ORDER BY rating DESC, `number of ratings` DESC;

SELECT title, rating, `number of ratings` 
    FROM v_MOVIE_RATING
    WHERE `number of ratings` >= 100 
    LIMIT 10;

-- ------------------------------------------------------------------------------------------------

-- Propósito:
-- Tem como objetivo oforecer ao o usuário o nome dos 20 filmes mais populares,
-- além das respectivas avaliações


CREATE INDEX popularity_idx ON MOVIE (popularity);

SELECT M.title, popularity, rating
    FROM MOVIE AS M
        INNER JOIN v_MOVIE_RATING AS V
            ON M.idMovie = V.idMovie
    ORDER BY popularity DESC, rating DESC
    LIMIT 20;

-- ------------------------------------------------------------------------------------------------

-- Propósito:
-- Tem como objetivo ofercer ao o usuário o nome dos 10 filmes melhores avaliados
-- com a participação de um determinado ator

SELECT title, rating
    FROM CREDIT AS C
        LEFT JOIN v_MOVIE_RATING AS V
            ON C.idMovie = V.idMovie
    WHERE JSON_SEARCH(cast, 'one', "Tom Hanks") IS NOT NULL
    ORDER BY rating DESC
    LIMIT 10;
