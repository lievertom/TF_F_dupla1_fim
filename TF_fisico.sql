-- --------     << tf_f1 >>     ------------
-- 
--                    SCRIPT DE CRIACAO (DDL)
-- 
-- Data Criacao ...........: 20/11/2019
-- Autor(es) ..............: Lieverton, Welison
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: tf_f1
--
--
-- PROJETO => 01 Base de Dados
--         => 05 Tabelas
--         => 02 Usuarios
--
-- -----------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS tf_f1;

USE tf_f1;

CREATE TABLE MOVIE (
    idMovie INT NOT NULL,
    title VARCHAR(110) NOT NULL,
    genre JSON NOT NULL,
    overview VARCHAR(1000) NOT NULL,
    popularity DECIMAL(11,7) NOT NULL,
    releaseDate DATE NOT NULL,
    runtime INT NOT NULL,
    CONSTRAINT MOVIE_PK PRIMARY KEY (idMovie)
) ENGINE = InnoDB DEFAULT CHARSET UTF8;

CREATE TABLE CREDIT (
    idMovie INT NOT NULL,
    cast JSON NOT NULL,
    crew JSON NOT NULL,
    CONSTRAINT CREDIT_MOVIE_FK FOREIGN KEY (idMovie)
        REFERENCES MOVIE (idMovie)
        ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB DEFAULT CHARSET UTF8;

CREATE TABLE RATING (
    idMovie INT NOT NULL,
    rating DECIMAL(2,1) NOT NULL,
    user INT NOT NULL,
    CONSTRAINT RATING_MOVIE_FK FOREIGN KEY (idMovie)
        REFERENCES MOVIE (idMovie)
        ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB DEFAULT CHARSET UTF8;