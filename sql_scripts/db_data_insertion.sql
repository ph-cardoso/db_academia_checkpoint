/*
Author: Pedro Henrique Lima Cardoso
Github repository: https://github.com/ph-cardoso/db_academia_checkpoint
*/

-- Seleciona o esquema
USE db_academia_check2;

-- Inserção de dados na tabela 'tipo_aula'
INSERT INTO tipo_aula(tipo, descricao) VALUES 
("Spinning", "Exercício aeróbico feito com bicicletas estáticas. Queima gorduras, fortalece os músculos e aumenta a resistência cardiovascular e respiratória."), 
("Jumping", "Exercício aeróbico praticado em um mini trampolim ou cama elástica redonda."), 
("Treinamento Funcional", "Atividade física realizada sem aparelhos da academia, que tem como objetivo melhorar a condição física imitando movimentos normais do dia a dia."), 
("Zumba", "Exercício físico aeróbico baseado em movimentos de danças latinas"), 
("Yôga", "Prática que tem como objetivo trabalhar o corpo e a mente de forma interligada");

-- Inserção de dados na tabela 'tipo_cargo'
INSERT INTO tipo_cargo(cargo,  descricao) VALUES
("Gerente", "Gerente da academia. Tem liberdade para negociar descontos"),
("Instrutor", "Profissional responsável por ministrar as aulas coletivas e auxiliar alunos nos treinos."),
("Recepcionista", "Profissional responsável por recepcionar clientes e lidar com contratos e cobrança de mensalidades"),
("Auxiliar", "Responsável pela manutenção, limpeza e conservação da academia."),
("Nutricionista", "Responsável pelas avaliações dos clientes");

-- Inserção de dados na tabela 'tipo_situacao'
INSERT INTO tipo_situacao(situacao,  descricao) VALUES
("Aberta", "Mensalidade aberta dentro do prazo de vencimento"), ("Em atraso", "Mensalidade aberta em atraso"),
("Paga", "Mensalidade paga."), ("Paga com atraso", "Mensalidade paga com atraso."),
("Contestada", "Mensalidade contestada pelo cliente."), ("Cancelada", "Mensalidade cancelada.");

-- Inserção de dados na tabela 'cliente'
INSERT INTO cliente(ativo, nome, sobrenome, CPF, sexo, dt_nascimento, telefone_residencial, telefone_celular, email) VALUES
(true, "Lucas", "Morais Madruga", "12345678912", "M", "2000-06-12", NULL, "+5561999991010", "liomao@gmail.com"),
(true, "Miguel", "Leite Rocha", "12345678913", "M", "2001-07-13", NULL, NULL, "taibin@gmail.com"),
(false, "Caio", "Boaventura Gomes", "12345678914", "M", "1999-01-16", "+556140028922", "+5561999998989", "fayarn@hotmail.com"),
(false, "Lúcio", "Peres Queiroz", "12345678915", "M", "1998-11-19", NULL, "+5561999555544", "zaheon@hotmail.com"),
(false, "Arnoldo", "Takeda Melo", "12345678916", "M", "1998-11-21", NULL, "+5561944991010", "usvoel@gmail.com"),
(true, "Tiago", "Pinheiro de Matos", "12345678917", "M", "1999-12-22", "+552140028927", "+5561988991010", "kiziun@hotmail.com"),
(true, "Estela", "Leal de Souza", "12345678918", "F", "1988-05-23", NULL, "+5561997791010", "mexaul@gmail.com"),
(false, "Paula", "Guimarães Paim", "12345678919", "F", "1980-05-24", NULL, "+5561999997710", "moedis@gmail.com"),
(true, "Marlene", "Ferraz Prestes", "22345678912", "F", "1972-04-25", NULL, NULL, "cafles@gmail.com"),
(true, "Bianca", "Nascimento Madruga", "32345678912", "F", "1970-01-04", NULL, "+5561999778854", "viwuvu@gmail.com");

-- Inserção de dados na tabela 'funcionario'
INSERT INTO funcionario(ativo, nome, sobrenome, id_cargo, CPF, sexo, dt_nascimento, telefone_residencial, telefone_celular, email) VALUES
(true, "Armando", "Assunção dos Reis", 1, "12345678912", "M", "2000-11-12", NULL, "+5561999551010", "liomwdawdao@gmail.com"),
(true, "Cláudio", "Assis Marques", 2, "12345678913", "M", "1999-07-13", NULL, NULL, "taibiasdsan@gmail.com"),
(false, "Artur", "Maldonado da Costa", 2, "12345678914", "M", "1998-01-16", "+556140055922", "+5561999558989", "fayasadwrn@hotmail.com"),
(true, "Sebastião", "Vargas Vaz", 3, "12345678917", "M", "1880-11-22", "+552140028927", "+5561988955010", "kizidasddun@hotmail.com"),
(true, "Silvana", "Morais Vidal", 5, "12345678918", "F", "1882-03-23", NULL, "+5561997551010", "mexwadwaul@gmail.com"),
(false, "Olga", "Hamamura Ferraz", 3, "12345678919", "F", "1887-02-21", NULL, "+5561999557710", "moediwads@gmail.com"),
(true, "Benedita", "Castro Paim", 4, "22345678912", "F", "1889-04-17", NULL, NULL, "cafledsdws@gmail.com"),
(true, "Isadora", "Vale Ramos", 2, "32345678912", "F", "1995-01-04", NULL, "+5561999775554", "viwudassvu@gmail.com");

-- Inserção de dados na tabela 'aula'
INSERT INTO aula(id_tipoAula, id_funcionario, dt_encontro, horario) VALUES
(1, 2, "2021-08-30", "15:30:00"), (2, 8, "2021-10-02", "16:30:00"), (3, 8, "2021-11-10", "17:30:00"),
(4, 8, "2021-07-15", "18:30:00"), (5, 2, "2021-12-25", "15:30:00"), (1, 2, "2021-06-12", "18:30:00");

-- Inserção de dados na tabela 'aula_cliente'
INSERT INTO aula_cliente(id_cliente, id_aula) VALUES
(1, 1), (2, 1), (6, 1), (1, 2), (2, 2), (2, 3), 
(9, 3), (9, 4), (10, 4), (9, 5), (10, 5), (10, 6);

-- Inserção de dados na tabela 'contrato'
INSERT INTO contrato(id_cliente, id_funcionario, dt_negociacao, dt_validade, desconto, preco, observacao) VALUES
(1, 1, "2021-01-05", "2021-07-05", 0.50, 150.00, "Desconto de 50%."), (2, 4, "2021-02-04", "2021-08-04", 0.50, 150.00, "Desconto de 50%."),
(3, 1, "2021-02-15", "2021-08-15", 0, 300.00, "Preço padrão"), (4, 4, "2021-03-10", "2021-09-10", 0, 300.00, "Preço padrão"),
(5, 1, "2021-03-11", "2021-09-11", 0, 300.00, "Preço padrão"), (6, 4, "2021-04-12", "2021-10-12", 0, 300.00, "Preço padrão"),
(7, 1, "2021-04-13", "2021-10-13", 0.25, 225.00, "Desconto de 25%."), (8, 4, "2021-05-15", "2021-11-15", 0.25, 225.00, "Desconto de 25%."),
(9, 1, "2021-05-17", "2021-11-17", 0.25, 225.00, "Desconto de 25%."), (10, 4, "2021-05-18", "2021-11-18", 0.10, 270.00, "Desconto de 10%."),
(1, 1, "2021-07-06", "2021-07-05", 0.25, 225.00, "Desconto de 25%."), (2, 4, "2021-08-05", "2021-07-05", 0.25, 225.00, "Desconto de 25%.");

-- Inserção de dados na tabela 'mensalidade'
INSERT INTO mensalidade(id_cliente, id_contrato, id_situacao, preco, dt_pagamento, dt_vencimento) VALUES
(1, 1, 3, 150.00, "2021-02-10", "2021-02-15"),
(2, 2, 3, 150.00, "2021-03-10", "2021-03-15"),
(3, 3, 3, 300.00, "2021-03-10", "2021-03-15"),
(4, 4, 3, 300.00, "2021-04-10", "2021-04-15"),
(5, 5, 1, 300.00, NULL, "2021-05-25"),
(6, 6, 1, 300.00, NULL, "2021-05-25"),
(7, 7, 1, 225.00, NULL, "2021-05-25"),
(8, 8, 2, 225.00, NULL, "2021-02-15"),
(9, 9, 2, 225.00, NULL, "2021-02-15"),
(10, 10, 2, 270.00, NULL, "2021-02-15"),
(1, 1, 3, 225.00, "2021-08-10", "2021-08-15"),
(2, 2, 3, 225.00, "2021-08-10", "2021-08-15"),
(3, 3, 3, 300.00, "2021-04-10", "2021-04-15"),
(4, 4, 3, 300.00, "2021-05-10", "2021-05-15"),
(5, 5, 3, 300.00, "2021-05-10", "2021-05-15"),
(6, 6, 3, 300.00, "2021-06-10", "2021-06-15");

-- Inserção de dados na tabela 'fornecedor'
INSERT INTO fornecedor(nome_fantasia, CNPJ, telefone, email, cidade, UF) VALUES
("Maquinas e cia", "12345678910234", "+551134345050", "mcia@gmail.com", "São Paulo", "SP"),
("Fitness e cia", "12345621910234", "+556234444450", "fitandciasahdauwh@gmail.com", "Goiânia", "GO"),
("MFIT", "13345678910234", "+556134342250", "mfitcokmpanydasudwd@gmail.com", "Brasília", "DF"),
("MISTERFIT SA", "12345621910234", "+551135342250", "mfitsacompany@gmail.com", "São Paulo", "SP");

-- Inserção de dados na tabela 'tipo_maquina'
INSERT INTO tipo_maquina(tipo, descricao) VALUES
("Aerobico", "Exercícios físicos de leve e alta intensidade."),
("Musculação", "Ganho de massa muscular e hipertrofia."),
("Abdominal", "Músculos do Abdomen.");

-- Inserção de dados na tabela 'maquina'
INSERT INTO maquina(id_tipoMaquina, id_fornecedor, observacao) VALUES
(1, 1, NULL), (1, 2, "Com defeito"), (1, 3, NULL), (1, 4, "Contatar fornecedor para troca"),
(2, 1, NULL), (2, 3, NULL), (2, 2, "Com defeito"), (1, 3, NULL), (3, 4, NULL), (3, 2, NULL),
(3, 2, "Com defeito"), (1, 1, NULL), (2, 3, NULL), (3, 3, NULL);

-- Inserção de dados na tabela 'historico_manutencao'
INSERT INTO historico_manutencao(id_maquina, dt_manutencao, observacao) VALUES
(1, "2021-05-20", "Problema resolvido"), (2, "2021-05-20", "Problema resolvido"),
(3, "2021-05-20", "Aguardando reposicao de peça"), (1, "2021-05-20", "Equipamento será substituído"),
(2, "2021-05-20", "Problema resolvido"), (4, "2021-05-20", "Impossível reparar");

-- Inserção de dados na tabela 'historico_acesso'
INSERT INTO historico_acesso(tipo, dthora_acesso, id_cliente) VALUES
("E", "2021-06-05 06:50:00", 1), ("S", "2021-06-05 09:50:00", 1),
("E", "2021-07-06 20:00:00", 2), ("S", "2021-07-06 22:00:00", 2),
("E", "2021-08-20 21:00:31", 10), ("S", "2021-08-20 21:40:31", 10);