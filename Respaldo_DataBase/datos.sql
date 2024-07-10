-- Insertando comunas
INSERT INTO comuna (nombre) VALUES 
	('Punta Arenas'),
	('Alto Hospicio'),
	('Copiapó'),
	('Mejillones'),
	('General Lagos'),
	('Coelemu'),
	('Chillán'),
	('Pucon'),
	('Santiago'),
	('Valdivia');

-- Insertando tipos de servicio
INSERT INTO tipo_servicio (nombre) VALUES
    ('Tratamiento capilar'),
    ('Masajes'),
    ('Manicure'),
    ('Barbería'),
    ('Peluquería'),
    ('Depilación'),
    ('Maquillaje'),
   	('Tinte de cabello');

-- Insertando horarios (bloques de 1 hora desde las 9 de la mañana hasta las 9 de la noche)
INSERT INTO horario (hora_inicio, hora_fin) VALUES
    ('09:00:00', '10:00:00'),
    ('10:00:00', '11:00:00'),
    ('11:00:00', '12:00:00'),
    ('12:00:00', '13:00:00'),
    ('13:00:00', '14:00:00'),
    ('14:00:00', '15:00:00'),
    ('15:00:00', '16:00:00'),
    ('16:00:00', '17:00:00'),
    ('17:00:00', '18:00:00'),
    ('18:00:00', '19:00:00'),
    ('19:00:00', '20:00:00'),
    ('20:00:00', '21:00:00');

-- Insertando productos (para salones de belleza)
INSERT INTO producto (nombre) VALUES
    ('Champú'),
    ('Crema facial'),
    ('Aceite para masajes'),
    ('Esmalte de uñas'),
    ('Tijeras de peluquería'),
    ('Cera depilatoria'),
    ('Base de maquillaje');
   
INSERT INTO salon (nombre, id_comuna, rut_empresa) VALUES 
 ('Reflejos de Belleza', 1, 70549732),
 ('Style Splash', 1,69679347),
 ('Dreamy Aesthetics', 2,72788000),
 ('Magia y Encanto: Creando Belleza Única', 2,70367483),
 ('Belleza Boom', 3,65983467),
 ('Glamour Total', 4,72400998),
 ('Estilo Único', 4,63888786),
 ('Magia Pura', 5,59768221),
 ('Reflejos Chic', 5,84762493),
 ('Belleza Wow', 6,72394639),
 ('Encanto Plus', 7,78434234),
 ('Diva Glam', 7,77743849),
 ('Brillo Vivo', 8,75994332),
 ('Glamour Vivo', 8,79960001),
 ('Chispa y Glam', 9,84930283),
 ('Belleza Pop', 10,87392742),
 ('Magia Total', 10,77456392);

INSERT INTO cliente (nombre, apellido, rut, telefono, sexo, id_comuna) VALUES 
('María', 'González', 12012345, 912345678, 'Mujer', 1),
('Carlos', 'Pérez', 12023456, 922345678, 'Hombre', 1),
('Ana', 'Rodríguez', 12034567, 932345678, 'Mujer', 1),
('Luis', 'Fernández', 12045678, 942345678, 'Hombre', 1),
('Lucía', 'López', 12056789, 952345678, 'Mujer', 1),
('Jorge', 'Martínez', 12067890, 962345678, 'Hombre', 1),
('Elena', 'García', 12078901, 972345678, 'Mujer', 1),
('Raúl', 'Sánchez', 12089012, 982345678, 'Hombre', 1),
('Claudia', 'Díaz', 12090123, 992345678, 'Mujer', 1),
('Fernando', 'Torres', 12101234, 912345679, 'Hombre', 1),
('Sofía', 'Ramos', 12112345, 922345679, 'Mujer', 1),
('Alejandro', 'Romero', 12123456, 932345679, 'Hombre', 1),
('Natalia', 'Vázquez', 12134567, 942345679, 'Mujer', 1),
('Sergio', 'Morales', 12145678, 952345679, 'Hombre', 1),
('Paula', 'Suárez', 12156789, 962345679, 'Mujer', 1),
('Diego', 'Ortiz', 12167890, 972345679, 'Hombre', 1),
('Julia', 'Hernández', 12178901, 982345679, 'Mujer', 1),
('Héctor', 'Rubio', 12189012, 992345679, 'Hombre', 1),
('Marta', 'Castro', 12190123, 912345670, 'Mujer', 1),
('Andrés', 'Molina', 12201234, 922345670, 'Hombre', 1),
('Carmen', 'Jiménez', 12212345, 932345670, 'Mujer', 1),
('Esteban', 'Cruz', 12223456, 942345670, 'Hombre', 1),
('Patricia', 'Gutiérrez', 12234567, 952345670, 'Mujer', 1),
('Roberto', 'Iglesias', 12245678, 962345670, 'Hombre', 1),
('Laura', 'Navarro', 12256789, 972345670, 'Mujer', 1),
('David', 'Rojas', 12267890, 982345670, 'Hombre', 1),
('Angela', 'Gil', 12278901, 992345670, 'Mujer', 1),
('Jose', 'Peña', 12289012, 912345671, 'Hombre', 1),
('Teresa', 'Méndez', 12290123, 922345671, 'Mujer', 1),
('Francisco', 'Campos', 12301234, 932345671, 'Hombre', 1),
('Gabriela', 'Aguilar', 12312345, 942345671, 'Mujer', 1),
('Victor', 'Castillo', 12323456, 952345671, 'Hombre', 1),
('Cristina', 'Luna', 12334567, 962345671, 'Mujer', 1),
('Miguel', 'Garrido', 12345678, 972345671, 'Hombre', 1),
('Blanca', 'Soto', 12356789, 982345671, 'Mujer', 1),
('Gustavo', 'Mora', 12367890, 992345671, 'Hombre', 1),
('Lorena', 'Pascual', 12378901, 912345672, 'Mujer', 1),
('Ramón', 'Santos', 12389012, 922345672, 'Hombre', 1),
('Isabel', 'Reyes', 12390123, 932345672, 'Mujer', 1),
('Pedro', 'Campos', 12401234, 942345672, 'Hombre', 1),
('Beatriz', 'Fuentes', 12412345, 952345672, 'Mujer', 1),
('Felipe', 'Herrero', 12423456, 962345672, 'Hombre', 1),
('Sandra', 'Cano', 12434567, 972345672, 'Mujer', 1),
('Oscar', 'Gómez', 12445678, 982345672, 'Hombre', 1);

-- Comuna 2
INSERT INTO cliente (nombre, apellido, rut, telefono, sexo, id_comuna) VALUES 
('Laura', 'Blanco', 12456789, 912345678, 'Mujer', 2),
('Javier', 'Vidal', 12467890, 922345678, 'Hombre', 2),
('Carmen', 'León', 12478901, 932345678, 'Mujer', 2),
('Emilio', 'Marín', 12489012, 942345678, 'Hombre', 2),
('Isabel', 'Escudero', 12490123, 952345678, 'Mujer', 2),
('Alberto', 'Benítez', 12501234, 962345678, 'Hombre', 2),
('Rosa', 'Duarte', 12512345, 972345678, 'Mujer', 2),
('Jorge', 'Lara', 12523456, 982345678, 'Hombre', 2),
('Mónica', 'Vega', 12534567, 992345678, 'Mujer', 2),
('Ricardo', 'Cabrera', 12545678, 912345679, 'Hombre', 2),
('Sonia', 'Bermúdez', 12556789, 922345679, 'Mujer', 2),
('Guillermo', 'Segura', 12567890, 932345679, 'Hombre', 2),
('Diana', 'Carrasco', 12578901, 942345679, 'Mujer', 2),
('Hugo', 'Menéndez', 12589012, 952345679, 'Hombre', 2),
('Irene', 'Ferrero', 12590123, 962345679, 'Mujer', 2),
('Manuel', 'Pardo', 12601234, 972345679, 'Hombre', 2),
('Alicia', 'Martín', 12612345, 982345679, 'Mujer', 2),
('Antonio', 'Rey', 12623456, 992345679, 'Hombre', 2),
('Patricia', 'Sáez', 12634567, 912345670, 'Mujer', 2),
('Marcos', 'Riera', 12645678, 922345670, 'Hombre', 2),
('Raquel', 'Salazar', 12656789, 932345670, 'Mujer', 2),
('Vicente', 'Lara', 12667890, 942345670, 'Hombre', 2),
('Mercedes', 'Santos', 12678901, 952345670, 'Mujer', 2),
('Gonzalo', 'Delgado', 12689012, 962345670, 'Hombre', 2),
('Clara', 'Nieto', 12690123, 972345670, 'Mujer', 2),
('Alejandro', 'Pastor', 12701234, 982345670, 'Hombre', 2),
('Amparo', 'Lorenzo', 12712345, 992345670, 'Mujer', 2),
('Álvaro', 'Estevez', 12723456, 912345671, 'Hombre', 2),
('Teresa', 'Velasco', 12734567, 922345671, 'Mujer', 2),
('Enrique', 'Soto', 12745678, 932345671, 'Hombre', 2),
('Ana', 'Montero', 12756789, 942345671, 'Mujer', 2),
('Tomás', 'Navas', 12767890, 952345671, 'Hombre', 2),
('Blanca', 'Bello', 12778901, 962345671, 'Mujer', 2),
('Fernando', 'Moya', 12789012, 972345671, 'Hombre', 2),
('Pilar', 'Iglesias', 12790123, 982345671, 'Mujer', 2),
('Miguel', 'Solano', 12801234, 992345671, 'Hombre', 2),
('Silvia', 'Guerra', 12812345, 912345672, 'Mujer', 2),
('Óscar', 'Molina', 12823456, 922345672, 'Hombre', 2),
('Marina', 'Bernal', 12834567, 932345672, 'Mujer', 2),
('Daniel', 'Vidal', 12845678, 942345672, 'Hombre', 2),
('Irene', 'Prado', 12856789, 952345672, 'Mujer', 2),
('Julio', 'Franco', 12867890, 962345672, 'Hombre', 2),
('Carmen', 'Sánchez', 12878901, 972345672, 'Mujer', 2),
('Eduardo', 'Romero', 12889012, 982345672, 'Hombre', 2);

-- Comuna 3
INSERT INTO cliente (nombre, apellido, rut, telefono, sexo, id_comuna) VALUES 
('Marta', 'Márquez', 12890123, 912345678, 'Mujer', 3),
('Laura', 'Martínez', 12978901, 992345678, 'Mujer', 3),
('Emilio', 'Hernández', 12989012, 912345679, 'Hombre', 3),
('Patricia', 'Rubio', 12990123, 922345679, 'Mujer', 3),
('Luis', 'López', 13001234, 932345679, 'Hombre', 3),
('Elena', 'Rodríguez', 13012345, 942345679, 'Mujer', 3),
('Álvaro', 'Vázquez', 13023456, 952345679, 'Hombre', 3),
('Cristina', 'Fernández', 13034567, 962345679, 'Mujer', 3),
('Víctor', 'Santos', 13045678, 972345679, 'Hombre', 3),
('Mónica', 'Serrano', 13056789, 982345679, 'Mujer', 3),
('Miguel', 'García', 13067890, 992345679, 'Hombre', 3),
('Silvia', 'Gómez', 13078901, 912345670, 'Mujer', 3),
('Fernando', 'Martínez', 13089012, 922345670, 'Hombre', 3),
('Isabel', 'Hernández', 13090123, 932345670, 'Mujer', 3),
('Ricardo', 'Rubio', 13101234, 942345670, 'Hombre', 3),
('Ramón', 'Santos', 13267890, 922345672, 'Hombre', 3),
('Clara', 'Serrano', 13278901, 932345672, 'Mujer', 3),
('Gabriel', 'García', 13289012, 942345672, 'Hombre', 3),
('Raquel', 'Gómez', 13290123, 952345672, 'Mujer', 3),
('Alejandro', 'Martínez', 13301234, 962345672, 'Hombre', 3),
('Verónica', 'Hernández', 13312345, 972345672, 'Mujer', 3),
('Vicente', 'Rubio', 13323456, 982345672, 'Hombre', 3);

-- Comuna 4
INSERT INTO cliente (nombre, apellido, rut, telefono, sexo, id_comuna) VALUES 
('Carmen', 'López', 13334567, 912345678, 'Mujer', 4),
('Santiago', 'Gómez', 13345678, 922345678, 'Hombre', 4),
('Elena', 'Martínez', 13356789, 932345678, 'Mujer', 4),
('David', 'Hernández', 13367890, 942345678, 'Hombre', 4),
('Ana', 'Rubio', 13378901, 952345678, 'Mujer', 4),
('Fernando', 'López', 13389012, 962345678, 'Hombre', 4),
('Clara', 'Rodríguez', 13390123, 972345678, 'Mujer', 4),
('Miguel', 'Vázquez', 13401234, 982345678, 'Hombre', 4),
('Laura', 'Fernández', 13412345, 992345678, 'Mujer', 4),
('Emilio', 'Santos', 13423456, 912345679, 'Hombre', 4),
('Rosa', 'Serrano', 13434567, 922345679, 'Mujer', 4),
('Jorge', 'García', 13445678, 932345679, 'Hombre', 4),
('Patricia', 'Gómez', 13456789, 942345679, 'Mujer', 4),
('Luis', 'Martínez', 13467890, 952345679, 'Hombre', 4),
('Silvia', 'Hernández', 13478901, 962345679, 'Mujer', 4),
('Antonio', 'Rubio', 13489012, 972345679, 'Hombre', 4),
('Marta', 'López', 13490123, 982345679, 'Mujer', 4),
('Alejandro', 'Rodríguez', 13501234, 992345679, 'Hombre', 4),
('Sofía', 'Vázquez', 13512345, 912345670, 'Mujer', 4),
('Javier', 'Fernández', 13523456, 922345670, 'Hombre', 4),
('Cristina', 'Santos', 13534567, 932345670, 'Mujer', 4),
('Manuel', 'Serrano', 13545678, 942345670, 'Hombre', 4),
('Pilar', 'García', 13556789, 952345670, 'Mujer', 4),
('Esteban', 'Gómez', 13567890, 962345670, 'Hombre', 4),
('Teresa', 'Martínez', 13578901, 972345670, 'Mujer', 4),
('Álvaro', 'Hernández', 13589012, 982345670, 'Hombre', 4),
('Rocío', 'Rubio', 13590123, 992345670, 'Mujer', 4),
('Carlos', 'López', 13601234, 912345671, 'Hombre', 4),
('Julia', 'Rodríguez', 13612345, 922345671, 'Mujer', 4),
('Raúl', 'Vázquez', 13623456, 932345671, 'Hombre', 4),
('Mercedes', 'Fernández', 13634567, 942345671, 'Mujer', 4),
('José', 'Santos', 13645678, 952345671, 'Hombre', 4),
('Elena', 'Serrano', 13656789, 962345671, 'Mujer', 4),
('Tomás', 'García', 13667890, 972345671, 'Hombre', 4),
('Ángela', 'Gómez', 13678901, 982345671, 'Mujer', 4),
('Hugo', 'Martínez', 13689012, 992345671, 'Hombre', 4),
('Lucía', 'Hernández', 13690123, 912345672, 'Mujer', 4),
('Daniel', 'Rubio', 13701234, 922345672, 'Hombre', 4),
('Paula', 'López', 13712345, 932345672, 'Mujer', 4),
('Luis', 'Rodríguez', 13723456, 942345672, 'Hombre', 4),
('Raquel', 'Vázquez', 13734567, 952345672, 'Mujer', 4),
('Fernando', 'Fernández', 13745678, 962345672, 'Hombre', 4),
('Carmen', 'Santos', 13756789, 972345672, 'Mujer', 4),
('José', 'Serrano', 13767890, 982345672, 'Hombre', 4),
('Pilar', 'García', 13778901, 992345672, 'Mujer', 4);

-- Comuna 5
INSERT INTO cliente (nombre, apellido, rut, telefono, sexo, id_comuna) VALUES 
('Jorge', 'Gómez', 13789012, 912345678, 'Hombre', 5),
('María', 'Martínez', 13790123, 922345678, 'Mujer', 5),
('Pablo', 'Hernández', 13801234, 932345678, 'Hombre', 5),
('Carmen', 'Rubio', 13812345, 942345678, 'Mujer', 5),
('Santiago', 'López', 13823456, 952345678, 'Hombre', 5),
('Mónica', 'Rodríguez', 13834567, 962345678, 'Mujer', 5),
('Miguel', 'Vázquez', 13845678, 972345678, 'Hombre', 5),
('Ana', 'Fernández', 13856789, 982345678, 'Mujer', 5),
('David', 'Santos', 13867890, 992345678, 'Hombre', 5),
('Laura', 'Serrano', 13878901, 912345679, 'Mujer', 5),
('Antonio', 'García', 13889012, 922345679, 'Hombre', 5),
('Patricia', 'Gómez', 13890123, 932345679, 'Mujer', 5),
('Álvaro', 'Martínez', 13901234, 942345679, 'Hombre', 5),
('Isabel', 'Hernández', 13912345, 952345679, 'Mujer', 5),
('Francisco', 'Rubio', 13923456, 962345679, 'Hombre', 5),
('Silvia', 'López', 13934567, 972345679, 'Mujer', 5),
('Ricardo', 'Rodríguez', 13945678, 982345679, 'Hombre', 5),
('Marta', 'Vázquez', 13956789, 992345679, 'Mujer', 5),
('Javier', 'Fernández', 13967890, 912345670, 'Hombre', 5),
('Elena', 'Santos', 13978901, 922345670, 'Mujer', 5),
('Fernando', 'Serrano', 13989012, 932345670, 'Hombre', 5),
('Pilar', 'García', 13990123, 942345670, 'Mujer', 5),
('Luis', 'Gómez', 14001234, 952345670, 'Hombre', 5),
('Clara', 'Martínez', 14012345, 962345670, 'Mujer', 5),
('Ramón', 'Hernández', 14023456, 972345670, 'Hombre', 5),
('Ángela', 'Rubio', 14034567, 982345670, 'Mujer', 5),
('Hugo', 'López', 14045678, 992345670, 'Hombre', 5),
('Sofía', 'Rodríguez', 14056789, 912345671, 'Mujer', 5),
('Daniel', 'Vázquez', 14067890, 922345671, 'Hombre', 5),
('Carmen', 'Fernández', 14078901, 932345671, 'Mujer', 5),
('Alejandro', 'Santos', 14089012, 942345671, 'Hombre', 5),
('Raquel', 'Serrano', 14090123, 952345671, 'Mujer', 5),
('Antonio', 'García', 14101234, 962345671, 'Hombre', 5),
('Patricia', 'Gómez', 14112345, 972345671, 'Mujer', 5),
('Álvaro', 'Martínez', 14123456, 982345671, 'Hombre', 5),
('Isabel', 'Hernández', 14134567, 992345671, 'Mujer', 5),
('Francisco', 'Rubio', 14145678, 912345672, 'Hombre', 5),
('Silvia', 'López', 14156789, 922345672, 'Mujer', 5),
('Ricardo', 'Rodríguez', 14167890, 932345672, 'Hombre', 5),
('Marta', 'Vázquez', 14178901, 942345672, 'Mujer', 5),
('Javier', 'Fernández', 14189012, 952345672, 'Hombre', 5),
('Elena', 'Santos', 14190123, 962345672, 'Mujer', 5),
('Fernando', 'Serrano', 14201234, 972345672, 'Hombre', 5),
('Pilar', 'García', 14212345, 982345672, 'Mujer', 5);

-- Comuna 6
INSERT INTO cliente (nombre, apellido, rut, telefono, sexo, id_comuna) VALUES 
('Rosa', 'García', 14223456, 912345678, 'Mujer', 6),
('David', 'Gómez', 14234567, 922345678, 'Hombre', 6),
('Ana', 'Martínez', 14245678, 932345678, 'Mujer', 6),
('Luis', 'Hernández', 14256789, 942345678, 'Hombre', 6),
('Clara', 'Rubio', 14267890, 952345678, 'Mujer', 6),
('Jorge', 'López', 14278901, 962345678, 'Hombre', 6),
('Isabel', 'Rodríguez', 14289012, 972345678, 'Mujer', 6),
('Fernando', 'Vázquez', 14290123, 982345678, 'Hombre', 6),
('María', 'Fernández', 14301234, 992345678, 'Mujer', 6),
('Pablo', 'Santos', 14312345, 912345679, 'Hombre', 6),
('Patricia', 'Serrano', 14323456, 922345679, 'Mujer', 6),
('Santiago', 'García', 14334567, 932345679, 'Hombre', 6),
('Mónica', 'Gómez', 14345678, 942345679, 'Mujer', 6),
('Emilio', 'Martínez', 14356789, 952345679, 'Hombre', 6),
('Lucía', 'Hernández', 14367890, 962345679, 'Mujer', 6),
('Tomás', 'Rubio', 14378901, 972345679, 'Hombre', 6),
('Laura', 'Vázquez', 14623456, 952345672, 'Mujer', 6),
('Santiago', 'Fernández', 14634567, 962345672, 'Hombre', 6),
('Lucía', 'Santos', 14645678, 972345672, 'Mujer', 6),
('Javier', 'Serrano', 14656789, 982345672, 'Hombre', 6),
('Rosa', 'García', 14667890, 992345672, 'Mujer', 6),
('Pablo', 'Gómez', 14678901, 912345673, 'Hombre', 6),
('Cristina', 'Martínez', 14689012, 922345673, 'Mujer', 6),
('Carlos', 'Hernández', 14690123, 932345673, 'Hombre', 6),
('Mónica', 'Rubio', 14701234, 942345673, 'Mujer', 6),
('Emilio', 'López', 14712345, 952345673, 'Hombre', 6);

-- Comuna 7
INSERT INTO cliente (nombre, apellido, rut, telefono, sexo, id_comuna) VALUES 
('Ana', 'Rodríguez', 14723456, 962345673, 'Mujer', 7),
('David', 'Vázquez', 14734567, 972345673, 'Hombre', 7),
('Isabel', 'Fernández', 14745678, 982345673, 'Mujer', 7),
('Miguel', 'Santos', 14756789, 992345673, 'Hombre', 7),
('Laura', 'Serrano', 14767890, 912345674, 'Mujer', 7),
('Pablo', 'García', 14778901, 922345674, 'Hombre', 7),
('Silvia', 'Gómez', 14789012, 932345674, 'Mujer', 7),
('Luis', 'Martínez', 14790123, 942345674, 'Hombre', 7),
('Clara', 'Hernández', 14801234, 952345674, 'Mujer', 7),
('Ramón', 'Rubio', 14812345, 962345674, 'Hombre', 7),
('Patricia', 'López', 14823456, 972345674, 'Mujer', 7),
('Jorge', 'Rodríguez', 14834567, 982345674, 'Hombre', 7),
('Raquel', 'Vázquez', 14845678, 992345674, 'Mujer', 7),
('Antonio', 'Fernández', 14856789, 912345675, 'Hombre', 7),
('Cristina', 'Santos', 14867890, 922345675, 'Mujer', 7),
('José', 'Serrano', 14878901, 932345675, 'Hombre', 7),
('Teresa', 'García', 14889012, 942345675, 'Mujer', 7),
('Víctor', 'Gómez', 14890123, 952345675, 'Hombre', 7),
('Pilar', 'Martínez', 14901234, 962345675, 'Mujer', 7),
('Raúl', 'Hernández', 14912345, 972345675, 'Hombre', 7),
('Sandra', 'Rubio', 14923456, 982345675, 'Mujer', 7),
('Javier', 'López', 14934567, 992345675, 'Hombre', 7),
('Elena', 'Rodríguez', 14945678, 912345676, 'Mujer', 7),
('Fernando', 'Vázquez', 14956789, 922345676, 'Hombre', 7),
('Patricia', 'Fernández', 14967890, 932345676, 'Mujer', 7),
('Miguel', 'Santos', 14978901, 942345676, 'Hombre', 7),
('Laura', 'Serrano', 14989012, 952345676, 'Mujer', 7),
('Pablo', 'García', 14990123, 962345676, 'Hombre', 7),
('Silvia', 'Gómez', 15001234, 972345676, 'Mujer', 7),
('Luis', 'Martínez', 15012345, 982345676, 'Hombre', 7),
('Clara', 'Hernández', 15023456, 992345676, 'Mujer', 7),
('Ramón', 'Rubio', 15034567, 912345677, 'Hombre', 7),
('Patricia', 'López', 15045678, 922345677, 'Mujer', 7),
('Jorge', 'Rodríguez', 15056789, 932345677, 'Hombre', 7),
('Raquel', 'Vázquez', 15067890, 942345677, 'Mujer', 7),
('Antonio', 'Fernández', 15078901, 952345677, 'Hombre', 7),
('Cristina', 'Santos', 15089012, 962345677, 'Mujer', 7),
('José', 'Serrano', 15090123, 972345677, 'Hombre', 7),
('Teresa', 'García', 15101234, 982345677, 'Mujer', 7),
('Víctor', 'Gómez', 15112345, 992345677, 'Hombre', 7),
('Pilar', 'Martínez', 15123456, 912345678, 'Mujer', 7),
('Raúl', 'Hernández', 15134567, 922345678, 'Hombre', 7),
('Sandra', 'Rubio', 15145678, 932345678, 'Mujer', 7),
('Javier', 'López', 15156789, 942345678, 'Hombre', 7),
('Elena', 'Rodríguez', 15167890, 952345678, 'Mujer', 7),
('Fernando', 'Vázquez', 15178901, 962345678, 'Hombre', 7),
('Patricia', 'Fernández', 15189012, 972345678, 'Mujer', 7),
('Miguel', 'Santos', 15190123, 982345678, 'Hombre', 7),
('Laura', 'Serrano', 15201234, 992345678, 'Mujer', 7);

-- Comuna 8
INSERT INTO cliente (nombre, apellido, rut, telefono, sexo, id_comuna) VALUES 
('Pablo', 'García', 15212345, 912345678, 'Hombre', 8),
('Laura', 'Gómez', 15223456, 922345678, 'Mujer', 8),
('Santiago', 'Martínez', 15234567, 932345678, 'Hombre', 8),
('María', 'Hernández', 15245678, 942345678, 'Mujer', 8),
('Raúl', 'Rubio', 15256789, 952345678, 'Hombre', 8),
('Patricia', 'López', 15267890, 962345678, 'Mujer', 8),
('Ramón', 'Rodríguez', 15278901, 972345678, 'Hombre', 8),
('Cristina', 'Vázquez', 15289012, 982345678, 'Mujer', 8),
('José', 'Fernández', 15290123, 992345678, 'Hombre', 8),
('Teresa', 'Santos', 15301234, 912345679, 'Mujer', 8),
('Víctor', 'Serrano', 15312345, 922345679, 'Hombre', 8),
('Pilar', 'García', 15323456, 932345679, 'Mujer', 8),
('Luis', 'Gómez', 15334567, 942345679, 'Hombre', 8),
('Ana', 'Martínez', 15345678, 952345679, 'Mujer', 8),
('Fernando', 'Hernández', 15356789, 962345679, 'Hombre', 8),
('Rosa', 'Rubio', 15367890, 972345679, 'Mujer', 8),
('David', 'López', 15378901, 982345679, 'Hombre', 8),
('Isabel', 'Rodríguez', 15389012, 992345679, 'Mujer', 8),
('Jorge', 'Vázquez', 15390123, 912345670, 'Hombre', 8),
('Sandra', 'Fernández', 15401234, 922345670, 'Mujer', 8),
('Javier', 'Santos', 15412345, 932345670, 'Hombre', 8),
('Elena', 'Serrano', 15423456, 942345670, 'Mujer', 8),
('Tomás', 'García', 15434567, 952345670, 'Hombre', 8),
('María', 'Gómez', 15445678, 962345670, 'Mujer', 8),
('Hugo', 'Martínez', 15456789, 972345670, 'Hombre', 8),
('Lucía', 'Hernández', 15467890, 982345670, 'Mujer', 8),
('Álvaro', 'Rubio', 15478901, 992345670, 'Hombre', 8),
('Raquel', 'López', 15489012, 912345671, 'Mujer', 8),
('Fernando', 'Rodríguez', 15490123, 922345671, 'Hombre', 8),
('Marta', 'Vázquez', 15501234, 932345671, 'Mujer', 8),
('Antonio', 'Fernández', 15512345, 942345671, 'Hombre', 8),
('Patricia', 'Santos', 15523456, 952345671, 'Mujer', 8),
('Santiago', 'Serrano', 15534567, 962345671, 'Hombre', 8),
('Ana', 'García', 15545678, 972345671, 'Mujer', 8),
('David', 'Gómez', 15556789, 982345671, 'Hombre', 8),
('Laura', 'Martínez', 15567890, 992345671, 'Mujer', 8),
('Cristina', 'Hernández', 15578901, 912345672, 'Mujer', 8),
('Luis', 'Rubio', 15589012, 922345672, 'Hombre', 8),
('Patricia', 'López', 15590123, 932345672, 'Mujer', 8),
('Ramón', 'Rodríguez', 15601234, 942345672, 'Hombre', 8),
('Cristina', 'Vázquez', 15612345, 952345672, 'Mujer', 8),
('José', 'Fernández', 15623456, 962345672, 'Hombre', 8),
('Teresa', 'Santos', 15634567, 972345672, 'Mujer', 8),
('Víctor', 'Serrano', 15645678, 982345672, 'Hombre', 8),
('Pilar', 'García', 15656789, 992345672, 'Mujer', 8),
('Luis', 'Gómez', 15667890, 912345673, 'Hombre', 8),
('Ana', 'Martínez', 15678901, 922345673, 'Mujer', 8),
('Fernando', 'Hernández', 15689012, 932345673, 'Hombre', 8),
('Rosa', 'Rubio', 15690123, 942345673, 'Mujer', 8),
('David', 'López', 15701234, 952345673, 'Hombre', 8);

-- Comuna 9
INSERT INTO cliente (nombre, apellido, rut, telefono, sexo, id_comuna) VALUES 
('Isabel', 'Rodríguez', 15712345, 962345673, 'Mujer', 9),
('Jorge', 'Vázquez', 15723456, 972345673, 'Hombre', 9),
('Sandra', 'Fernández', 15734567, 982345673, 'Mujer', 9),
('Javier', 'Santos', 15745678, 992345673, 'Hombre', 9),
('Elena', 'Serrano', 15756789, 912345674, 'Mujer', 9),
('Tomás', 'García', 15767890, 922345674, 'Hombre', 9),
('María', 'Gómez', 15778901, 932345674, 'Mujer', 9),
('Hugo', 'Martínez', 15789012, 942345674, 'Hombre', 9),
('Lucía', 'Hernández', 15790123, 952345674, 'Mujer', 9),
('Álvaro', 'Rubio', 15801234, 962345674, 'Hombre', 9),
('Elena', 'Serrano', 16089012, 972345677, 'Mujer', 9),
('Tomás', 'García', 16090123, 982345677, 'Hombre', 9),
('María', 'Gómez', 16101234, 992345677, 'Mujer', 9),
('Hugo', 'Martínez', 16112345, 912345678, 'Hombre', 9),
('Lucía', 'Hernández', 16123456, 922345678, 'Mujer', 9),
('Álvaro', 'Rubio', 16134567, 932345678, 'Hombre', 9),
('Raquel', 'López', 16145678, 942345678, 'Mujer', 9),
('Fernando', 'Rodríguez', 16156789, 952345678, 'Hombre', 9),
('Marta', 'Vázquez', 16167890, 962345678, 'Mujer', 9),
('Antonio', 'Fernández', 16178901, 972345678, 'Hombre', 9),
('Patricia', 'Santos', 16189012, 982345678, 'Mujer', 9),
('Santiago', 'Serrano', 16190123, 992345678, 'Hombre', 9);

-- Comuna 10
INSERT INTO cliente (nombre, apellido, rut, telefono, sexo, id_comuna) VALUES 
('Ana', 'García', 16201234, 912345678, 'Mujer', 10),
('David', 'Gómez', 16212345, 922345678, 'Hombre', 10),
('Laura', 'Martínez', 16223456, 932345678, 'Mujer', 10),
('Cristina', 'Hernández', 16234567, 942345678, 'Mujer', 10),
('Luis', 'Rubio', 16245678, 952345678, 'Hombre', 10),
('Patricia', 'López', 16256789, 962345678, 'Mujer', 10),
('Ramón', 'Rodríguez', 16267890, 972345678, 'Hombre', 10),
('Cristina', 'Vázquez', 16278901, 982345678, 'Mujer', 10),
('José', 'Fernández', 16289012, 992345678, 'Hombre', 10),
('Teresa', 'Santos', 16290123, 912345679, 'Mujer', 10),
('Víctor', 'Serrano', 16301234, 922345679, 'Hombre', 10),
('Pilar', 'García', 16312345, 932345679, 'Mujer', 10),
('Luis', 'Gómez', 16323456, 942345679, 'Hombre', 10),
('Ana', 'Martínez', 16334567, 952345679, 'Mujer', 10),
('Fernando', 'Hernández', 16345678, 962345679, 'Hombre', 10),
('Rosa', 'Rubio', 16356789, 972345679, 'Mujer', 10),
('David', 'López', 16367890, 982345679, 'Hombre', 10),
('Isabel', 'Rodríguez', 16378901, 992345679, 'Mujer', 10),
('Jorge', 'Vázquez', 16389012, 912345670, 'Hombre', 10),
('Sandra', 'Fernández', 16390123, 922345670, 'Mujer', 10),
('Javier', 'Santos', 16401234, 932345670, 'Hombre', 10),
('Elena', 'Serrano', 16412345, 942345670, 'Mujer', 10),
('Tomás', 'García', 16423456, 952345670, 'Hombre', 10),
('María', 'Gómez', 16434567, 962345670, 'Mujer', 10),
('Hugo', 'Martínez', 16445678, 972345670, 'Hombre', 10),
('Lucía', 'Hernández', 16456789, 982345670, 'Mujer', 10),
('Álvaro', 'Rubio', 16467890, 992345670, 'Hombre', 10),
('Raquel', 'López', 16478901, 912345671, 'Mujer', 10),
('Fernando', 'Rodríguez', 16489012, 922345671, 'Hombre', 10),
('Marta', 'Vázquez', 16490123, 932345671, 'Mujer', 10),
('Antonio', 'Fernández', 16501234, 942345671, 'Hombre', 10),
('Patricia', 'Santos', 16512345, 952345671, 'Mujer', 10),
('Santiago', 'Serrano', 16523456, 962345671, 'Hombre', 10),
('Ana', 'García', 16534567, 972345671, 'Mujer', 10),
('David', 'Gómez', 16545678, 982345671, 'Hombre', 10),
('Laura', 'Martínez', 16556789, 992345671, 'Mujer', 10),
('Cristina', 'Hernández', 16567890, 912345672, 'Mujer', 10),
('Luis', 'Rubio', 16578901, 922345672, 'Hombre', 10),
('Patricia', 'López', 16589012, 932345672, 'Mujer', 10),
('Ramón', 'Rodríguez', 16590123, 942345672, 'Hombre', 10),
('Cristina', 'Vázquez', 16601234, 952345672, 'Mujer', 10),
('José', 'Fernández', 16612345, 962345672, 'Hombre', 10),
('Teresa', 'Santos', 16623456, 972345672, 'Mujer', 10),
('Víctor', 'Serrano', 16634567, 982345672, 'Hombre', 10),
('Pilar', 'García', 16645678, 992345672, 'Mujer', 10),
('Luis', 'Gómez', 16656789, 912345673, 'Hombre', 10),
('Ana', 'Martínez', 16667890, 922345673, 'Mujer', 10),
('Fernando', 'Hernández', 16678901, 932345673, 'Hombre', 10),
('Rosa', 'Rubio', 16689012, 942345673, 'Mujer', 10),
('David', 'López', 16690123, 952345673, 'Hombre', 10);


DO
$$
DECLARE
    salon_id INT;
    servicio_id INT;
    costo INT;
BEGIN
    FOR salon_id IN 1..17 LOOP
        FOR servicio_id IN 1..8 LOOP
            -- Generar un costo aleatorio entre 1000 y 10000
            costo := FLOOR(RANDOM() * (10000 - 1000 + 1)) + 1000;
            INSERT INTO costo_servicio (id_salon, id_servicio, costo)
            VALUES (salon_id, servicio_id, costo);
        END LOOP;
    END LOOP;
END
$$;

DO
$$
DECLARE
    salon_id INT;
    producto_ids INT[] := ARRAY[1, 2, 3, 4, 5, 6, 7];
    selected_products INT[];
    producto_id INT;
    precio_compra INT;
    precio_venta INT;
    cantidad_stock INT;
BEGIN
    FOR salon_id IN 1..17 LOOP
        -- Seleccionar aleatoriamente entre 4 y 7 productos
        selected_products := ARRAY(
            SELECT UNNEST(producto_ids) ORDER BY RANDOM() LIMIT (4 + FLOOR(RANDOM() * 4))
        );
 
        -- Insertar productos seleccionados en detalle_producto
        FOREACH producto_id IN ARRAY selected_products LOOP
            -- Generar valores aleatorios para precio_compra, precio_venta y cantidad_stock
            precio_compra := FLOOR(RANDOM() * (5000 - 1000 + 1)) + 1000;  -- entre 1000 y 5000
            precio_venta := precio_compra + FLOOR(RANDOM() * (2000 - 500 + 1)) + 500;  -- entre precio_compra + 500 y precio_compra + 2000
            cantidad_stock := FLOOR(RANDOM() * (100 - 10 + 1)) + 10;  -- entre 10 y 100

            INSERT INTO detalle_producto (id_salon, id_producto, precio_compra, precio_venta, cantidad_stock)
            VALUES (salon_id, producto_id, precio_compra, precio_venta, cantidad_stock);
        END LOOP;
    END LOOP;
END
$$;

-- Salón 1
INSERT INTO empleados (id_salon, nombre, apellido, rut) VALUES
(1, 'Juan', 'García', 10000001),
(1, 'María', 'López', 10000002),
(1, 'Pedro', 'Martínez', 10000003),
(1, 'Ana', 'Rodríguez', 10000004),
(1, 'Carlos', 'Pérez', 10000005),
(1, 'Laura', 'González', 10000006),
(1, 'Luis', 'Hernández', 10000007);

-- Salón 2
INSERT INTO empleados (id_salon, nombre, apellido, rut) VALUES
(2, 'Sofía', 'Sánchez', 10000008),
(2, 'José', 'Ramírez', 10000009),
(2, 'Elena', 'Cruz', 10000010),
(2, 'Miguel', 'Torres', 10000011),
(2, 'Marta', 'Flores', 10000012),
(2, 'Diego', 'Rivera', 10000013),
(2, 'Lucía', 'Gómez', 10000014),
(2, 'Fernando', 'Díaz', 10000015);

-- Salón 3
INSERT INTO empleados (id_salon, nombre, apellido, rut) VALUES
(3, 'Patricia', 'Álvarez', 10000016),
(3, 'Andrés', 'Morales', 10000017),
(3, 'Paula', 'Vargas', 10000018),
(3, 'Javier', 'Ortiz', 10000019),
(3, 'Isabel', 'Ramírez', 10000020),
(3, 'Juan', 'García', 10000021),
(3, 'María', 'López', 10000022),
(3, 'Pedro', 'Martínez', 10000023);

-- Salón 4
INSERT INTO empleados (id_salon, nombre, apellido, rut) VALUES
(4, 'Ana', 'Rodríguez', 10000024),
(4, 'Carlos', 'Pérez', 10000025),
(4, 'Laura', 'González', 10000026),
(4, 'Luis', 'Hernández', 10000027),
(4, 'Sofía', 'Sánchez', 10000028),
(4, 'José', 'Ramírez', 10000029),
(4, 'Elena', 'Cruz', 10000030);

-- Salón 5
INSERT INTO empleados (id_salon, nombre, apellido, rut) VALUES
(5, 'Miguel', 'Torres', 10000031),
(5, 'Marta', 'Flores', 10000032),
(5, 'Diego', 'Rivera', 10000033),
(5, 'Lucía', 'Gómez', 10000034),
(5, 'Fernando', 'Díaz', 10000035),
(5, 'Patricia', 'Álvarez', 10000036),
(5, 'Andrés', 'Morales', 10000037),
(5, 'Paula', 'Vargas', 10000038);

-- Salón 6
INSERT INTO empleados (id_salon, nombre, apellido, rut) VALUES
(6, 'Javier', 'Ortiz', 10000039),
(6, 'Isabel', 'Ramírez', 10000040),
(6, 'Juan', 'García', 10000041),
(6, 'María', 'López', 10000042),
(6, 'Pedro', 'Martínez', 10000043),
(6, 'Ana', 'Rodríguez', 10000044),
(6, 'Carlos', 'Pérez', 10000045);

-- Salón 7
INSERT INTO empleados (id_salon, nombre, apellido, rut) VALUES
(7, 'Laura', 'González', 10000046),
(7, 'Luis', 'Hernández', 10000047),
(7, 'Sofía', 'Sánchez', 10000048),
(7, 'José', 'Ramírez', 10000049),
(7, 'Elena', 'Cruz', 10000050),
(7, 'Miguel', 'Torres', 10000051),
(7, 'Marta', 'Flores', 10000052);

-- Salón 8
INSERT INTO empleados (id_salon, nombre, apellido, rut) VALUES
(8, 'Diego', 'Rivera', 10000053),
(8, 'Lucía', 'Gómez', 10000054),
(8, 'Fernando', 'Díaz', 10000055),
(8, 'Patricia', 'Álvarez', 10000056),
(8, 'Andrés', 'Morales', 10000057),
(8, 'Paula', 'Vargas', 10000058),
(8, 'Javier', 'Ortiz', 10000059);

-- Salón 9
INSERT INTO empleados (id_salon, nombre, apellido, rut) VALUES
(9, 'Isabel', 'Ramírez', 10000060),
(9, 'Juan', 'García', 10000061),
(9, 'María', 'López', 10000062),
(9, 'Pedro', 'Martínez', 10000063),
(9, 'Ana', 'Rodríguez', 10000064),
(9, 'Carlos', 'Pérez', 10000065),
(9, 'Laura', 'González', 10000066);

-- Salón 10
INSERT INTO empleados (id_salon, nombre, apellido, rut) VALUES
(10, 'Luis', 'Hernández', 10000067),
(10, 'Sofía', 'Sánchez', 10000068),
(10, 'José', 'Ramírez', 10000069),
(10, 'Elena', 'Cruz', 10000070),
(10, 'Miguel', 'Torres', 10000071),
(10, 'Marta', 'Flores', 10000072),
(10, 'Diego', 'Rivera', 10000073);

-- Salón 11
INSERT INTO empleados (id_salon, nombre, apellido, rut) VALUES
(11, 'Lucía', 'Gómez', 10000074),
(11, 'Fernando', 'Díaz', 10000075),
(11, 'Patricia', 'Álvarez', 10000076),
(11, 'Andrés', 'Morales', 10000077),
(11, 'Paula', 'Vargas', 10000078),
(11, 'Javier', 'Ortiz', 10000079),
(11, 'Isabel', 'Ramírez', 10000080);

-- Salón 12
INSERT INTO empleados (id_salon, nombre, apellido, rut) VALUES
(12, 'Juan', 'García', 10000081),
(12, 'María', 'López', 10000082),
(12, 'Pedro', 'Martínez', 10000083),
(12, 'Ana', 'Rodríguez', 10000084),
(12, 'Carlos', 'Pérez', 10000085),
(12, 'Laura', 'González', 10000086),
(12, 'Luis', 'Hernández', 10000087);

-- Salón 13
INSERT INTO empleados (id_salon, nombre, apellido, rut) VALUES
(13, 'Sofía', 'Sánchez', 10000088),
(13, 'José', 'Ramírez', 10000089),
(13, 'Elena', 'Cruz', 10000090),
(13, 'Miguel', 'Torres', 10000091),
(13, 'Marta', 'Flores', 10000092),
(13, 'Diego', 'Rivera', 10000093),
(13, 'Lucía', 'Gómez', 10000094);

-- Salón 14
INSERT INTO empleados (id_salon, nombre, apellido, rut) VALUES
(14, 'Fernando', 'Díaz', 10000095),
(14, 'Patricia', 'Álvarez', 10000096),
(14, 'Andrés', 'Morales', 10000097),
(14, 'Paula', 'Vargas', 10000098),
(14, 'Javier', 'Ortiz', 10000099),
(14, 'Isabel', 'Ramírez', 10000100),
(14, 'Juan', 'García', 10000101);

-- Salón 15
INSERT INTO empleados (id_salon, nombre, apellido, rut) VALUES
(15, 'María', 'López', 10000102),
(15, 'Pedro', 'Martínez', 10000103),
(15, 'Ana', 'Rodríguez', 10000104),
(15, 'Carlos', 'Pérez', 10000105),
(15, 'Laura', 'González', 10000106),
(15, 'Luis', 'Hernández', 10000107),
(15, 'Sofía', 'Sánchez', 10000108);

-- Salón 16
INSERT INTO empleados (id_salon, nombre, apellido, rut) VALUES
(16, 'José', 'Ramírez', 10000109),
(16, 'Elena', 'Cruz', 10000110),
(16, 'Miguel', 'Torres', 10000111),
(16, 'Marta', 'Flores', 10000112),
(16, 'Diego', 'Rivera', 10000113),
(16, 'Lucía', 'Gómez', 10000114),
(16, 'Fernando', 'Díaz', 10000115);

-- Salón 17
INSERT INTO empleados (id_salon, nombre, apellido, rut) VALUES
(17, 'Patricia', 'Álvarez', 10000116),
(17, 'Andrés', 'Morales', 10000117),
(17, 'Paula', 'Vargas', 10000118),
(17, 'Javier', 'Ortiz', 10000119),
(17, 'Isabel', 'Ramírez', 10000120),
(17, 'Juan', 'García', 10000121),
(17, 'María', 'López', 10000122);

CREATE OR REPLACE FUNCTION generar_citas(num_citas INT, j INT)
RETURNS VOID AS $$
DECLARE
    i INT := 0;
    salon_id CONSTANT INT := j;  -- Aquí defines el id_salon que quieres utilizar (en este caso, será 1)
    id_cliente INT;
   comuna_salon INT;
    id_empleado INT;
    id_servicio INT;
    id_horario INT;
    fecha DATE := '2019-10-01';
BEGIN
    WHILE i < num_citas loop
	    -- Obtener la comuna del salón seleccionado
        SELECT s.id_comuna INTO comuna_salon FROM salon s WHERE s.id = salon_id;
       
        -- Seleccionar un cliente aleatoriamente
        SELECT c.id INTO id_cliente FROM cliente c WHERE c.id_comuna = comuna_salon ORDER BY RANDOM() LIMIT 1;
        
        -- Seleccionar un empleado del mismo salón aleatoriamente
        SELECT id INTO id_empleado FROM empleados e WHERE e.id_salon = salon_id ORDER BY RANDOM() LIMIT 1;
        
        -- Seleccionar un servicio aleatoriamente
        SELECT id INTO id_servicio FROM tipo_servicio ORDER BY RANDOM() LIMIT 1;
        
        -- Seleccionar un horario aleatoriamente
        SELECT id INTO id_horario FROM horario ORDER BY RANDOM() LIMIT 1;
        
       -- Incrementar la fecha para cada iteración
        fecha := fecha + 1;
        
        -- Insertar la cita en la tabla de citas
        INSERT INTO cita (id_salon, id_servicio, id_cliente, id_horario, id_empleado, fecha)
        VALUES (salon_id, id_servicio, id_cliente, id_horario, id_empleado, fecha);
        
        i := i + 1;
    END LOOP;
END;
$$ LANGUAGE plpgsql;


DO $$
BEGIN
    FOR j IN 1..17 LOOP
        PERFORM generar_citas(1200, j);
    END LOOP;
END $$;

/*
delete from cita;
-- Supongamos que la secuencia para la columna id de la tabla cita se llama cita_id_seq
-- Reiniciar la secuencia a 1
ALTER SEQUENCE cita_id_seq RESTART WITH 1;
*/

DO $$
DECLARE
    i INT := 1;
    salon_id INT;
    comuna_cliente INT;
    fecha_aleatoria DATE := '2019-10-01';
BEGIN
    WHILE i < 397 LOOP
        FOR j IN 1..2 LOOP
            -- Seleccionar un cliente aleatoriamente
            SELECT c.id_comuna INTO comuna_cliente FROM cliente c WHERE c.id = i;

            -- Obtener el id del salón seleccionado
            SELECT s.id INTO salon_id FROM salon s WHERE s.id_comuna = comuna_cliente ORDER BY RANDOM() LIMIT 1;

            -- Generar una fecha aleatoria entre '2019-10-01' y '2023-03-01'
            fecha_aleatoria := fecha_aleatoria + cast(FLOOR(RANDOM() * 1301) as integer);

            -- Insertar la boleta de venta en la tabla boleta_venta
            INSERT INTO boleta_venta (id_cliente, id_salon, fecha)
            VALUES (i, salon_id, fecha_aleatoria);
           fecha_aleatoria := '2019-10-01';
        END LOOP;

        i := i + 1;
    END LOOP;
END $$;

DO $$
DECLARE
    i INT := 1;
    n INT := (SELECT COUNT(id) FROM boleta_venta);
    numeroProductos INT;
    numero_seleccionado INT;
    numeros_arr INTEGER[] := '{1, 2, 3, 4, 5, 6, 7}';
BEGIN
    WHILE i <= n LOOP
        numeroProductos := 1 + CAST(FLOOR(RANDOM() * 4) AS INTEGER);
        

        FOR j IN 1..numeroProductos LOOP
            numero_seleccionado := numeros_arr[1 + FLOOR(RANDOM() * array_length(numeros_arr, 1))];
            INSERT INTO producto_boleta (id_producto, id_boleta) VALUES (numero_seleccionado, i);
            numeros_arr := array_remove(numeros_arr, numero_seleccionado);
        END LOOP;

        i := i + 1;
        -- Reiniciar el arreglo para cada iteración del bucle exterior
        numeros_arr := '{1, 2, 3, 4, 5, 6, 7}';
    END LOOP;
END $$;