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
(1, '�Cu�l es el r�o m�s largo del mundo?', 'Me gustar�a saber cu�l es el r�o m�s largo.'),
(2, '�Qui�n fue Albert Einstein?', 'Quiero conocer m�s sobre Albert Einstein.'),
(3, '�Qu� es el Big Bang?', 'Explicaci�n breve sobre el origen del universo.'),
(4, '�C�mo se mide un terremoto?', 'Quisiera informaci�n sobre la escala de Richter.'),
(5, '�Qu� es la fotos�ntesis?', 'Busco informaci�n sobre este proceso biol�gico.'),
(6, '�Qui�n invent� la bombilla?', 'Necesito saber qui�n invent� la bombilla el�ctrica.'),
(7, '�Cu�l es el planeta m�s grande?', 'Informaci�n sobre el planeta m�s grande del sistema solar.'),
(8, '�Qu� es el efecto invernadero?', 'Definici�n y causas del efecto invernadero.'),
(9, '�Qu� es un agujero negro?', 'Explicaci�n sobre los agujeros negros en el espacio.'),
(10, '�Qui�n fue Leonardo da Vinci?', 'Detalles sobre este artista e inventor.'),
(11, '�Cu�l es el idioma m�s hablado?', 'Busco informaci�n sobre el idioma m�s usado mundialmente.'),
(12, '�C�mo funciona la gravedad?', 'Explicaci�n del concepto de gravedad.'),
(13, '�Qu� es el ADN?', 'Definici�n y funci�n del ADN en los seres vivos.'),
(14, '�Cu�nto mide el Everest?', 'Altura exacta del monte Everest.'),
(15, '�Qu� causa un tsunami?', 'Busco causas y efectos de los tsunamis.'),
(16, '�Qu� animales est�n en peligro de extinci�n?', 'Listado de especies en peligro.'),
(17, '�Qu� es un volc�n?', 'Explicaci�n sobre c�mo funciona un volc�n.'),
(18, '�C�mo se forman los huracanes?', 'Proceso de formaci�n de huracanes.'),
(19, '�Qu� es un eclipse solar?', 'Definici�n y tipos de eclipses solares.'),
(20, '�Cu�l es el pa�s m�s grande del mundo?', 'Informaci�n sobre el pa�s m�s extenso.'),
(21, '�Qu� es un f�sil?', 'C�mo se forman y qu� significan los f�siles.'),
(22, '�Qu� es el reciclaje?', 'Importancia y proceso del reciclaje.'),
(23, '�C�mo funciona un avi�n?', 'Principios b�sicos de la aerodin�mica.'),
(24, '�Qui�n fue Cleopatra?', 'Informaci�n sobre la �ltima reina de Egipto.'),
(25, '�Qu� es un sat�lite artificial?', 'Definici�n y funciones de los sat�lites artificiales.'),
(26, '�Qu� es un arco�ris?', 'C�mo se forma un arco�ris en el cielo.'),
(27, '�Qu� son los oc�anos?', 'Definici�n y nombres de los oc�anos del planeta.'),
(28, '�Qu� es la capa de ozono?', 'Importancia y protecci�n de la capa de ozono.'),
(29, '�Qu� es un �tomo?', 'Descripci�n b�sica de la estructura at�mica.'),
(30, '�C�mo funcionan los paneles solares?', 'Explicaci�n sobre la energ�a solar.');
GO

INSERT INTO Respuestas (PreguntaID, UsuarioID, Contenido)
VALUES
(1, 2, 'El r�o Amazonas es considerado el m�s largo.'),
(2, 3, 'Einstein fue un f�sico famoso por su teor�a de la relatividad.'),
(3, 4, 'El Big Bang es la teor�a sobre el origen del universo.'),
(4, 5, 'Los terremotos se miden con la escala de Richter.'),
(5, 6, 'La fotos�ntesis es el proceso por el cual las plantas producen energ�a.'),
(6, 7, 'Thomas Edison invent� la bombilla el�ctrica.'),
(7, 8, 'J�piter es el planeta m�s grande del sistema solar.'),
(8, 9, 'El efecto invernadero es el calentamiento de la Tierra por gases en la atm�sfera.'),
(9, 10, 'Un agujero negro es una regi�n del espacio con gravedad extremadamente alta.'),
(10, 11, 'Leonardo da Vinci fue un artista y cient�fico renacentista.'),
(11, 12, 'El mandar�n es el idioma m�s hablado en el mundo.'),
(12, 13, 'La gravedad es una fuerza de atracci�n entre objetos con masa.'),
(13, 14, 'El ADN contiene informaci�n gen�tica en los seres vivos.'),
(14, 15, 'El Everest mide aproximadamente 8,848 metros.'),
(15, 16, 'Un tsunami es causado por terremotos submarinos.'),
(16, 17, 'Entre los animales en peligro est�n el tigre y el rinoceronte.'),
(17, 18, 'Un volc�n expulsa magma desde el interior de la Tierra.'),
(18, 19, 'Los huracanes se forman por el calentamiento de las aguas oce�nicas.'),
(19, 20, 'Un eclipse solar ocurre cuando la Luna bloquea la luz del Sol.'),
(20, 21, 'Rusia es el pa�s m�s grande del mundo.'),
(21, 22, 'Un f�sil es el resto preservado de un ser vivo.'),
(22, 23, 'El reciclaje transforma materiales usados en nuevos productos.'),
(23, 24, 'Un avi�n vuela gracias a la fuerza de sustentaci�n en sus alas.'),
(24, 25, 'Cleopatra fue la �ltima faraona de Egipto.'),
(25, 26, 'Un sat�lite artificial orbita la Tierra y puede enviar se�ales.'),
(26, 27, 'Un arco�ris se forma por la refracci�n de la luz en gotas de agua.'),
(27, 28, 'Los oc�anos cubren m�s del 70% de la superficie de la Tierra.'),
(28, 29, 'La capa de ozono protege al planeta de los rayos UV.'),
(29, 30, 'Un �tomo est� compuesto por protones, neutrones y electrones.'),
(30, 1, 'Los paneles solares convierten la luz en energ�a el�ctrica.');
GO