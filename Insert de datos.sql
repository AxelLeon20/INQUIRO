USE InquiroDB;	
GO

INSERT INTO Usuarios (NombreUsuario, Contrasena)
VALUES
('Axel', '123'), ('Moises', '456'), ('Leon', '789'), ('Quele', '111'), ('LuisRodriguez', 'pass05'),
('PedroHernandez', 'pass06'), ('SofiaTorres', 'pass07'), ('DiegoRamirez', 'pass08'), ('ElenaGarcia', 'pass09'), ('JoseMartinez', 'pass10'),
('LuciaDiaz', 'pass11'), ('JavierFernandez', 'pass12'), ('AndreaSantos', 'pass13'), ('DanielMorales', 'pass14'), ('PaulaVega', 'pass15'),
('AlbertoMendez', 'pass16'), ('CarolinaRuiz', 'pass17'), ('MiguelCastro', 'pass18'), ('ValeriaCruz', 'pass19'), ('FernandoSilva', 'pass20'),
('RaquelJimenez', 'pass21'), ('OscarParedes', 'pass22'), ('MonicaNavarro', 'pass23'), ('GabrielSoto', 'pass24'), ('NataliaHerrera', 'pass25'),
('RicardoMolina', 'pass26'), ('CarmenOrtega', 'pass27'), ('PabloRojas', 'pass28'), ('LorenaMedina', 'pass29'), ('AlejandroVargas', 'pass30');
GO	

INSERT INTO Preguntas (UsuarioID, Titulo, Descripcion)
VALUES
(1, '¿Cuál es el río más largo del mundo?', 'Me gustaría saber cuál es el río más largo.'),
(2, '¿Quién fue Albert Einstein?', 'Quiero conocer más sobre Albert Einstein.'),
(3, '¿Qué es el Big Bang?', 'Explicación breve sobre el origen del universo.'),
(4, '¿Cómo se mide un terremoto?', 'Quisiera información sobre la escala de Richter.'),
(5, '¿Qué es la fotosíntesis?', 'Busco información sobre este proceso biológico.'),
(6, '¿Quién inventó la bombilla?', 'Necesito saber quién inventó la bombilla eléctrica.'),
(7, '¿Cuál es el planeta más grande?', 'Información sobre el planeta más grande del sistema solar.'),
(8, '¿Qué es el efecto invernadero?', 'Definición y causas del efecto invernadero.'),
(9, '¿Qué es un agujero negro?', 'Explicación sobre los agujeros negros en el espacio.'),
(10, '¿Quién fue Leonardo da Vinci?', 'Detalles sobre este artista e inventor.'),
(11, '¿Cuál es el idioma más hablado?', 'Busco información sobre el idioma más usado mundialmente.'),
(12, '¿Cómo funciona la gravedad?', 'Explicación del concepto de gravedad.'),
(13, '¿Qué es el ADN?', 'Definición y función del ADN en los seres vivos.'),
(14, '¿Cuánto mide el Everest?', 'Altura exacta del monte Everest.'),
(15, '¿Qué causa un tsunami?', 'Busco causas y efectos de los tsunamis.'),
(16, '¿Qué animales están en peligro de extinción?', 'Listado de especies en peligro.'),
(17, '¿Qué es un volcán?', 'Explicación sobre cómo funciona un volcán.'),
(18, '¿Cómo se forman los huracanes?', 'Proceso de formación de huracanes.'),
(19, '¿Qué es un eclipse solar?', 'Definición y tipos de eclipses solares.'),
(20, '¿Cuál es el país más grande del mundo?', 'Información sobre el país más extenso.'),
(21, '¿Qué es un fósil?', 'Cómo se forman y qué significan los fósiles.'),
(22, '¿Qué es el reciclaje?', 'Importancia y proceso del reciclaje.'),
(23, '¿Cómo funciona un avión?', 'Principios básicos de la aerodinámica.'),
(24, '¿Quién fue Cleopatra?', 'Información sobre la última reina de Egipto.'),
(25, '¿Qué es un satélite artificial?', 'Definición y funciones de los satélites artificiales.'),
(26, '¿Qué es un arcoíris?', 'Cómo se forma un arcoíris en el cielo.'),
(27, '¿Qué son los océanos?', 'Definición y nombres de los océanos del planeta.'),
(28, '¿Qué es la capa de ozono?', 'Importancia y protección de la capa de ozono.'),
(29, '¿Qué es un átomo?', 'Descripción básica de la estructura atómica.'),
(30, '¿Cómo funcionan los paneles solares?', 'Explicación sobre la energía solar.');
GO

INSERT INTO Respuestas (PreguntaID, UsuarioID, Contenido)
VALUES
(1, 2, 'El río Amazonas es considerado el más largo.'),
(2, 3, 'Einstein fue un físico famoso por su teoría de la relatividad.'),
(3, 4, 'El Big Bang es la teoría sobre el origen del universo.'),
(4, 5, 'Los terremotos se miden con la escala de Richter.'),
(5, 6, 'La fotosíntesis es el proceso por el cual las plantas producen energía.'),
(6, 7, 'Thomas Edison inventó la bombilla eléctrica.'),
(7, 8, 'Júpiter es el planeta más grande del sistema solar.'),
(8, 9, 'El efecto invernadero es el calentamiento de la Tierra por gases en la atmósfera.'),
(9, 10, 'Un agujero negro es una región del espacio con gravedad extremadamente alta.'),
(10, 11, 'Leonardo da Vinci fue un artista y científico renacentista.'),
(11, 12, 'El mandarín es el idioma más hablado en el mundo.'),
(12, 13, 'La gravedad es una fuerza de atracción entre objetos con masa.'),
(13, 14, 'El ADN contiene información genética en los seres vivos.'),
(14, 15, 'El Everest mide aproximadamente 8,848 metros.'),
(15, 16, 'Un tsunami es causado por terremotos submarinos.'),
(16, 17, 'Entre los animales en peligro están el tigre y el rinoceronte.'),
(17, 18, 'Un volcán expulsa magma desde el interior de la Tierra.'),
(18, 19, 'Los huracanes se forman por el calentamiento de las aguas oceánicas.'),
(19, 20, 'Un eclipse solar ocurre cuando la Luna bloquea la luz del Sol.'),
(20, 21, 'Rusia es el país más grande del mundo.'),
(21, 22, 'Un fósil es el resto preservado de un ser vivo.'),
(22, 23, 'El reciclaje transforma materiales usados en nuevos productos.'),
(23, 24, 'Un avión vuela gracias a la fuerza de sustentación en sus alas.'),
(24, 25, 'Cleopatra fue la última faraona de Egipto.'),
(25, 26, 'Un satélite artificial orbita la Tierra y puede enviar señales.'),
(26, 27, 'Un arcoíris se forma por la refracción de la luz en gotas de agua.'),
(27, 28, 'Los océanos cubren más del 70% de la superficie de la Tierra.'),
(28, 29, 'La capa de ozono protege al planeta de los rayos UV.'),
(29, 30, 'Un átomo está compuesto por protones, neutrones y electrones.'),
(30, 1, 'Los paneles solares convierten la luz en energía eléctrica.');
GO