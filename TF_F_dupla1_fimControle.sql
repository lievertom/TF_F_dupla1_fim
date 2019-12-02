-- --------     << tf_f_dupla1_fim >>     ------------
-- 
--                    SCRIPT DE CONTROLE (DDL)
-- 
-- Data Criacao ...........: 02/12/2019
-- Autor(es) ..............: Lieverton, Welison
-- Banco de Dados .........: MySQL
-- Base de Dados(nome) ...: tf_f_dupla1_fim
--
--
-- PROJETO => 01 Base de Dados
--         => 03 Tabelas
--         => 02 Usuarios
--         => 01 View
--
-- -----------------------------------------------------------------

CREATE USER 'admin' IDENTIFIED BY '@d2019';
GRANT ALL PRIVILEGES ON tf_f_dupla1_fim.* TO admin;

CREATE USER 'user' IDENTIFIED BY 'uso2019';
GRANT SELECT ON tf_f_dupla1_fim.* TO user;