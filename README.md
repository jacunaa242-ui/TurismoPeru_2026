# TURISMO PERU 2026

## Descripción General
Este proyecto consiste en el desarrollo de una aplicación web integral en Python diseñada específicamente para la gestión y administración de datos en el sector turístico peruano. Implementa una arquitectura limpia y modular bajo el patrón de diseño Modelo-Vista-Controlador (MVC), lo que permite separar eficientemente la lógica de negocio, el control de accesos y las interfaces de usuario. Para garantizar un rendimiento óptimo y la integridad en el manejo de la información, el sistema se conecta a una base de datos relacional y realiza sus operaciones de consulta, inserción y listado de registros mediante el uso exclusivo de Procedimientos Almacenados (Stored Procedures). Esto dota a la plataforma de alta velocidad de respuesta y una capa robusta de seguridad contra vulnerabilidades comunes.

El ciclo de vida del proyecto inicia con la estructuración del entorno de desarrollo virtual y el diseño modular del backend, donde se centralizan las credenciales en variables de entorno seguras y se codifica el núcleo de conexión a la base de datos. Posteriormente, se procede con la fase de persistencia mediante la creación y despliegue de los scripts de bases de datos relacionales, estructurando los procedimientos almacenados encargados de procesar la información de personas y clientes. Una vez consolidada la infraestructura de datos, se desarrolla la lógica de control en la capa de negocio junto con el diseño y renderizado de las plantillas HTML para la interfaz de usuario. Finalmente, el proyecto concluye con la etapa de integración, pruebas generales y ejecución del servidor web principal a través del archivo centralizador de la aplicación.

A lo largo de este proyecto se potencian habilidades fundamentales en ingeniería de software, enfocándose en la adopción del patrón de diseño arquitectónico MVC para estructurar aplicaciones web escalables y con separación de responsabilidades. Asimismo, se consolida el dominio práctico en el manejo avanzado de bases de datos relacionales mediante la implementación y consumo de procedimientos almacenados directamente desde entornos en Python, optimizando la seguridad y el tiempo de respuesta del servidor. Adicionalmente, se adquieren conocimientos clave sobre desarrollo web del lado del servidor, despliegue de servicios dinámicos, organización estructurada de archivos y buenas prácticas de seguridad informática en entornos productivos mediante el uso estricto de configuraciones desacopladas con variables de entorno.

---

## Estructura del Proyecto

```bash
TURISMOPERU_2026/
│
├── controllers/                  # Lógica del negocio
│   ├── listar_controller.py      # Control para listar datos
│   └── persona_controller.py     # Control para gestionar personas
│
├── database/                     # Conexión a Base de Datos
│   └── conexion.py               # Archivo de conexión central
│
├── models/                       # Modelos de datos
│   ├── cliente.py 
│   └── persona.py           
├── myenv/                        # Entorno virtual de Python
│
├── procedures/                   # Procedimientos Almacenados (SQL)
│   ├── sp_insertarPersona.sql
│   ├── sp_ListaClientes.sql
│   └── sp_ListaPersonas.sql
│
├── Scripts/                      # Scripts adicionales
├── static/                       # Archivos estáticos (CSS, JS)
│
├── templates/                    # Vistas de la aplicación (HTML)
│   ├── clientes.html
│   ├── index.html
│   └── insertar.html
│
├── .env                          # Variables de entorno (Credenciales)
├── .env.example                  # Plantilla de ejemplo para el .env
├── .gitignore                    # Archivos ignorados por Git
├── app.py                        # Archivo principal para iniciar la aplicación
├── config.py                     # Configuración general
└── README.md                     # Documentación (Este archivo)
```

---

## Autor
Proyecto desarrollado aplicando conceptos esenciales de Python, Desarrollo Web y Bases de Datos.
    JOSÉ CARLOS ACUÑA ALARCÓN