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
SELECT title, sumRating/`number of ratings` AS rating, `number of ratings`
    FROM MOVIE AS M
        INNER JOIN 
        (
            SELECT idMovie, count(idMovie) AS `number of ratings`, sum(rating) AS sumRating
                FROM RATING
                GROUP BY idMovie
        ) AS R
            ON M.idMovie = R.idMovie
    WHERE `number of ratings` >= 100
    ORDER BY rating DESC, `number of ratings` DESC;

SELECT * FROM v_MOVIE_RATING LIMIT 10;

-- ------------------------------------------------------------------------------------------------

-- Propósito:
-- Tem como objetivo aforecer ao o usuário o nome dos 20 filmes mais populares,
-- além das respectivas avaliações

SELECT M.title, popularity, rating
    FROM MOVIE AS M
        INNER JOIN v_MOVIE_RATING AS V
            ON M.title = V.title
    ORDER BY popularity DESC, rating DESC
    LIMIT 20;
