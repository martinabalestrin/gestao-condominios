USE condominio;

INSERT INTO apartamento (num) VALUES
	(101), 
    (102),
    (201), 
    (202), 
    (301), 
    (302), 
    (401), 
    (402);

INSERT INTO visitante (nome, cpf, data_reg) VALUES
	('Bae Joohyun', NULL, '2022-01-01'), 
    ('Kang Seulgi', NULL, '2022-02-02'),
    ('Son Seungwan', '123.456.789-00', '2022-03-03'), 
    ('Park Sooyoung', NULL, '2022-04-04'),
    ('Kim Yerim', NULL, '2022-05-05');
    
INSERT INTO morador (nome, cpf, celular, proprietario) VALUES
	('Lily Jin Morrow', '111.111.111-11', '(11) 11111-1111', 'S'),
    ('Oh Haewon', '222.222.222-22', '(22) 22222-2222', 'S'),
    ('Seol Yoona', '333.333.333-33', '(33) 33333-3333', 'S'),
    ('Choi Yunjin', '777.777.777-77', '(77) 77777-7777', 'N'), 
    ('Bae Jinsol', '444.444.444-44', '(44) 44444-4444', 'S'),
    ('Kim Jiwoo', '555.555.555-55', '(55) 55555-5555', 'S'),
    ('Jang Kyujin', '666.666.666-66', '(66) 66666-6666', 'S');

INSERT INTO visita (id_visitante, id_apartamento, data, hora) VALUES
	(1, 3, '2022-06-18', '15:15:15'),
    (5, 6, '2022-08-26', '13:24:54'),
    (4, 1, '2022-10-17', '09:56:34'),
    (2, 2, '2023-02-25', '23:02:15'),
    (1, 5, '2023-03-04', '12:45:56');
    
INSERT INTO entregas (id_apartamento, descricao, quantidade, data) VALUES
	(3, 'envelope', 1, '2022-03-05'),
    (2, 'caixa grande', 2, '2022-05-01'),
    (5, 'caixa grande', 1, '2022-07-30'),
    (1, 'encomenda', 2, '2022-10-06'),
    (7, 'carta', 4, '2022-12-08'),
    (6, 'caixa pequena', 2, '2023-01-24'),
    (4, 'caixa', 1, '2023-02-07');
    
INSERT INTO reserva_salao_festas (data, id_apartamento) VALUES
	('2022-02-22', 4),
    ('2022-05-26', 5),
    ('2022-12-08', 2),
    ('2023-03-29', 1),
    ('2023-07-11', 3),
    ('2023-07-14', 7);
    
INSERT INTO apartamento_morador (id_apartamento, id_morador) VALUES
	(1,1),
    (2,2),
    (3,3),
    (7,4),
    (4,5),
    (5,6),
    (6,7);