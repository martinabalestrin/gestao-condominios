USE condominio;

-- -------------------------------
-- alterações na db
-- -------------------------------

ALTER TABLE visita DROP COLUMN data;
ALTER TABLE visita DROP COLUMN hora;
ALTER TABLE visita ADD data_hora DATETIME;

UPDATE visita SET data_hora = '2022-06-18 15:15:15' WHERE id = 1;
UPDATE visita SET data_hora = '2022-08-26 13:24:54' WHERE id = 2;
UPDATE visita SET data_hora = '2022-10-17 09:56:34' WHERE id = 3;
UPDATE visita SET data_hora = '2023-02-25 23:02:15' WHERE id = 4;
UPDATE visita SET data_hora = '2023-03-04 12:45:56' WHERE id = 5;

-- -------------------------------
-- views
-- -------------------------------

CREATE VIEW morador_apartamento AS        
	SELECT m.nome, a.num, m.cpf, m.celular, m.proprietario FROM morador m
		JOIN apartamento_morador am ON m.id = am.id_morador
		JOIN apartamento a ON a.id = am.id_apartamento
			ORDER BY num;

CREATE VIEW visitas_log AS                  
	SELECT v.data_hora, a.num, vs.nome, vs.cpf FROM visita v
		JOIN visitante vs ON v.id_visitante = vs.id
		JOIN apartamento a ON v.id_apartamento = a.id
			ORDER BY data_hora;
            
CREATE VIEW reservas_apto AS               
	SELECT r.data, a.num FROM reserva_salao_festas r
		JOIN apartamento a ON r.id_apartamento = a.id
			ORDER BY data;
            
-- -------------------------------
-- procedure
-- -------------------------------

DELIMITER //
CREATE PROCEDURE log_entregas_apto(apto INT)
	BEGIN        
		SELECT e.data, e.descricao, e.quantidade FROM entregas e
			JOIN apartamento a ON a.id = e.id_apartamento       
			WHERE a.num = apto
            ORDER BY data DESC;
    END//
DELIMITER ;

-- -------------------------------
-- function
-- -------------------------------

DELIMITER //
CREATE FUNCTION num_visitas (visitante_id INT) RETURNS INT DETERMINISTIC
	BEGIN
		DECLARE v_num_visitas INT;      
        
        SET v_num_visitas := (SELECT COUNT(id) FROM visita v WHERE v.id_visitante = visitante_id);
        
		RETURN v_num_visitas;
	END//
DELIMITER ;

-- -------------------------------
-- trigger
-- -------------------------------

DELIMITER //
CREATE TRIGGER dia_hora BEFORE INSERT ON visita FOR EACH ROW
	BEGIN
		SET NEW.data_hora = NOW();
	END//
DELIMITER ;

-- -------------------------------
-- index
-- -------------------------------

CREATE INDEX idx_num_apto ON apartamento(num);