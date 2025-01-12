USE condominio;

CREATE ROLE 'morador', 'porteiro', 'sindico';

GRANT SELECT ON condominio.entregas TO 'morador';
GRANT SELECT ON condominio.reserva_salao_festas TO 'morador';
FLUSH PRIVILEGES;

GRANT SELECT ON condominio.* TO 'porteiro';
GRANT INSERT ON condominio.entregas TO 'porteiro';
GRANT INSERT ON condominio.visita TO 'porteiro';
GRANT INSERT ON condominio.visitante TO 'porteiro';
FLUSH PRIVILEGES;

GRANT SELECT ON condominio.* TO 'sindico';
GRANT INSERT, UPDATE ON condominio.morador TO 'sindico';
GRANT DELETE ON condominio.reserva_salao_festas TO 'sindico';
FLUSH PRIVILEGES;

CREATE USER 'user_morador'@'localhost';
CREATE USER 'user_porteiro'@'localhost';
CREATE USER 'user_sindico'@'localhost';

GRANT 'morador' TO 'user_morador'@'localhost';
GRANT 'porteiro' TO 'user_porteiro'@'localhost';
GRANT 'sindico' TO 'user_sindico'@'localhost';