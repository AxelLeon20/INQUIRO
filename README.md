# INQUIRO

Inquiro es una aplicación web diseñada para la publicación de preguntas y respuestas, desarrollada con C# y ASP.NET Core, utilizando SQL Server como motor de base de datos.

Requisitos previos
Motor de base de datos SQL Server instalado y configurado.
Visual Studio o Visual Studio Code configurado para trabajar con proyectos de .NET.
.NET Core SDK instalado.
Acceso a la terminal o línea de comandos para ejecutar los scripts.

Configuración del proyecto
1. Configuración de la base de datos
Crear la base de datos: Ejecuta el script proporcionado en el archivo InquiroDB.sql dentro de tu motor de base de datos. Este archivo crea las tablas necesarias y define los procedimientos almacenados utilizados por la aplicación.

Opcional: Para cargar datos de prueba, ejecuta el script adicional Insert de Datos.sql después de crear la base de datos.

2. Configuración de appsettings.json
Modifica el archivo appsettings.json en la raíz del proyecto. En la sección ConnectionStrings, actualiza la cadena de conexión con los detalles de tu servidor.

Asegúrate de reemplazar:

Nombre_Del_Servidor: Nombre de tu servidor SQL.
Usuario y Contraseña: Credenciales para conectarte al servidor.
