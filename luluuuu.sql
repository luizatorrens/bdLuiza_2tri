-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE tipo_usuario (
cod_tipuser int auto_increment unique PRIMARY KEY,
desc_tipuser varchar(250) not null
);

CREATE TABLE midia (
titulo_midia varchar(100) not null,
caminho_midia varchar(250) not null,
cod_midia int auto_increment unique PRIMARY KEY,
cod_postagem int not null
);

CREATE TABLE ong (
email_ong varchar(250) not null unique,
telefone_ong varchar(14) not null unique,
nome_ong varchar(100) not null unique,
cod_ong int auto_increment unique PRIMARY KEY
);

CREATE TABLE usuario (
idade int not null,
nome varchar(250) not null,
email varchar(250) not null unique,
cod_usuario int auto_increment unique PRIMARY KEY,
telefone varchar(14) not null,
cod_tipuser int not null,
FOREIGN KEY(cod_tipuser) REFERENCES tipo_usuario (cod_tipuser)
);

CREATE TABLE postagem (
titulo_postagem varchar(100) not null,
categoria varchar(100),
cod_postagem int auto_increment unique PRIMARY KEY,
texto_postagem varchar(1000) not null,
cod_usuario int not null,
cod_ong int not null,
FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario),
FOREIGN KEY(cod_ong) REFERENCES ong (cod_ong)
);

CREATE TABLE comenta (
cod_postagem int auto_increment unique,
cod_usuario int not null,
dathora_coment timestamp current_time,
texto_coment varchar(250) not null,
FOREIGN KEY(cod_postagem) REFERENCES postagem (cod_postagem),
FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario)
);

CREATE TABLE curtir (
cod_postagem int not null,
cod_usuario int not null,
dathora_curtir timestamp current_time,
FOREIGN KEY(cod_postagem) REFERENCES postagem (cod_postagem),
FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario)
);

CREATE TABLE doacao (
cod_ong int not null,
cod_usuario int not null,
dt_doacao date current_date,
valor_doacao decimal(10,2) not null,
FOREIGN KEY(cod_ong) REFERENCES ong (cod_ong),
FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario)
);

CREATE TABLE voluntario (
cod_ong int not null,
cod_usuario int not null,
dt_voluntario date current_date,
FOREIGN KEY(cod_ong) REFERENCES ong (cod_ong),
FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario)
);

ALTER TABLE midia ADD FOREIGN KEY(cod_postagem) REFERENCES postagem (cod_postagem);
