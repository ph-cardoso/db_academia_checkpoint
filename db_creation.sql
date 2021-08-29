-- Criaçao do Schema 'db_academia_check2' caso ainda não exista
CREATE DATABASE IF NOT EXISTS db_academia_check2;

-- Seleção do schema 'db_academia_check2'
USE db_academia_check2;

-- Exclusão de tabelas caso já existam no schema para recriação
DROP TABLE IF EXISTS historico_acesso;
DROP TABLE IF EXISTS aula_cliente;
DROP TABLE IF EXISTS aula;
DROP TABLE IF EXISTS tipo_aula;
DROP TABLE IF EXISTS mensalidade;
DROP TABLE IF EXISTS contrato;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS funcionario;
DROP TABLE IF EXISTS tipo_cargo;
DROP TABLE IF EXISTS tipo_situacao;
DROP TABLE IF EXISTS historico_manutencao;
DROP TABLE IF EXISTS maquina;
DROP TABLE IF EXISTS fornecedor;
DROP TABLE IF EXISTS tipo_maquina;

-- Estrutura de criação da tabela 'tipo_cargo'
CREATE TABLE tipo_cargo(
	id_cargo INT AUTO_INCREMENT PRIMARY KEY,
    cargo VARCHAR(50) NOT NULL,
    descricao VARCHAR(1500)
);

-- Estrutura de criação da tabela 'tipo_aula'
CREATE TABLE tipo_aula(
	id_tipoAula INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    descricao VARCHAR(1500)
);

-- Estrutura de criação da tabela 'cliente'
CREATE TABLE cliente(
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    ativo BOOLEAN NOT NULL,
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(150) NOT NULL,
    CPF VARCHAR(11) NOT NULL,
    sexo ENUM('M','F') NOT NULL,
    dt_nascimento DATE NOT NULL,
    telefone_residencial VARCHAR(14),
    telefone_celular VARCHAR(14),
    email VARCHAR(14) NOT NULL
);

-- Estrutura de criação da tabela 'historico_acesso'
CREATE TABLE historico_acesso(
	id_acesso INT AUTO_INCREMENT PRIMARY KEY,
    tipo ENUM('E','S') NOT NULL,
    dthora_acesso TIMESTAMP NOT NULL,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

-- Estrutura de criação da tabela 'funcionario'
CREATE TABLE funcionario(
	id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    ativo BOOLEAN NOT NULL,
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(150) NOT NULL,
    id_cargo INT NOT NULL,
    CPF VARCHAR(11) NOT NULL,
    sexo ENUM('M','F') NOT NULL,
    dt_nascimento DATE NOT NULL,
    telefone_residencial VARCHAR(14),
    telefone_celular VARCHAR(14),
    email VARCHAR(14) NOT NULL,
    FOREIGN KEY (id_cargo) REFERENCES tipo_cargo(id_cargo)
);

-- Estrutura de criação da tabela 'aula'
CREATE TABLE aula(
	id_aula INT AUTO_INCREMENT PRIMARY KEY,
    id_tipoAula INT NOT NULL,
    id_funcionario INT NOT NULL,
    dt_encontro DATE NOT NULL,
    horario TIME NOT NULL,
    FOREIGN KEY (id_tipoAula) REFERENCES tipo_aula(id_tipoAula),
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
);

-- Estrutura de criação da tabela 'aula_cliente'
CREATE TABLE aula_cliente(
	id_aulaCliente INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_aula INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_aula) REFERENCES aula(id_aula)
);

-- Estrutura de criação da tabela 'contrato'
CREATE TABLE contrato(
	id_contrato INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_funcionario INT NOT NULL,
    dt_negociacao DATE NOT NULL,
    dt_validade DATE NOT NULL,
    desconto DECIMAL(3,2) CHECK(desconto<=1 AND desconto>0) DEFAULT(0),
    preco DECIMAL(6,2) CHECK(preco>0) NOT NULL,
    observacao VARCHAR(4000),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
);

-- Estrutura de criação da tabela 'tipo_situacao'
CREATE TABLE tipo_situacao(
	id_situacao INT AUTO_INCREMENT PRIMARY KEY,
	situacao VARCHAR(50),
	descricao VARCHAR(1000)
);

-- Estrutura de criação da tabela 'mensalidade'
CREATE TABLE mensalidade(
	id_mensalidade INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_contrato INT NOT NULL,
    id_situacao INT NOT NULL,
	preco DECIMAL(6,2) CHECK(preco>0) NOT NULL,
    dt_pagamento DATE,
    dt_vencimento DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_contrato) REFERENCES contrato(id_contrato),
    FOREIGN KEY (id_situacao) REFERENCES tipo_situacao(id_situacao)
);

-- Estrutura de criação da tabela 'fornecedor'
CREATE TABLE fornecedor(
	id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome_fantasia VARCHAR(150) NOT NULL,
    CNPJ VARCHAR(14) NOT NULL,
    telefone VARCHAR(14),
	email VARCHAR(50) NOT NULL,
    cidade VARCHAR(35) NOT NULL,
    UF CHAR(2) NOT NULL
);

-- Estrutura de criação da tabela 'tipo_maquina'
CREATE TABLE tipo_maquina(
	id_tipoMaquina INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    descricao VARCHAR(1500)
);

-- Estrutura de criação da tabela 'maquina'
CREATE TABLE maquina(
	id_maquina INT AUTO_INCREMENT PRIMARY KEY,
    id_tipoMaquina INT NOT NULL,
    id_fornecedor INT NOT NULL,
    observacao VARCHAR(1500),
    FOREIGN KEY (id_tipoMaquina) REFERENCES tipo_maquina(id_tipoMaquina),
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id_fornecedor)
);

-- Estrutura de criação da tabela 'historico_manutencao'
CREATE TABLE historico_manutencao(
	id_manutencao INT AUTO_INCREMENT PRIMARY KEY,
    id_maquina INT NOT NULL,
    dt_manutencao DATE NOT NULL,
    observacao VARCHAR(4000),
    FOREIGN KEY (id_maquina) REFERENCES maquina(id_maquina)
);