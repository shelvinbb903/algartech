## Detalles del proyecto

# Backend
- Python
- Django
- Mysql
- Wampserver
- Phpmyadmin

# FrontEnd
- Ionic versión 7
- NPM versión 8.11.0
- Node.js versión 16.15.1

## Instrucciones de Despliegue Local del proyecto Backend

Para realizar la verificación de los puntos de la prueba técnica se deben seguir los siguientes pasos:

- Clonar el proyecto, ya sea con el comando git clone https://github.com/shelvinbb903/algartech.git o usando una herramienta grafica GitHub

- Después de clonar el repositorio, acceder a la carpeta descargada con el comando cd en la terminal, es decir ```cd backendbelleza```, ya que en ella se ejecutarán varios comandos.

- Activar enviroment de python con los comandos: 
```
python -m venv env
source env/Scripts/activate
```

- Instalar las dependencias necesarias y usadas para la prueba con el comando: ```pip install -r requirements.txt```

- Cambiar la conexión a la base de datos archivo PruebaTecnica/settings.py del proyecto. En este archivo se modifican el diccionario u objeto DATABASES, el cual tiene los atributos para la conexión establecida por defecto. Se modifican los atributos USER y PASSWORD, los cuales tienen su configuración establecida durante la instalación de PostgreSQL en su equipo y NAME que corresponde al nombre de la base de datos en caso de que se modifique el nombre.

- Crear la base de datos en el administrador de su preferencia. Por ejemplo, puede usar phpmyadmin del servidor wampserver o xampp. Para realizar esto hay dos opciones:
    1. Importar la base de datos mediante el archivo sql llamado bellezabd.sql que se encuentra en la carpeta del proyecto, el cual ya tiene incluido la creacion de la base de datos, la estructura de las tablas y los datos iniciales para hacer pruebas.
    2. Crear la base de datos en el administrador que este usando y despues ejecutar las migraciones con los comandos ```python manage.py migrate productos``` y ```python manage.py makemigrations pedidos```. Se realizan las migraciones por cada app dentro del proyecto, en caso de que tenga pendiente alguna migracion de otro proyecto y no se genere la migracion en este proyecto.

- En este punto, el proyecto está listo para realizar prueba. Se realiza la ejecución con el comando: ```python manage.py runserver```Por defecto se usa la url `http://localhost:8000/` para ejecutar los servicios rest.

## Instrucciones de Despliegue Local del proyecto FrontEnd

- Descargar e instalar node.js para ejecutar comandos npm
- Instalar Ionic CLI con el siguiente comando `npm install -g @ionic/cli`
- Como el proyecto ya esta clonado al seguir los pasos anteriores, se accede a la carpeta con el comando `cd belleza-app` desde una terminal de comandos.
- Instalar las dependencias de node usa el comando `npm install`. Si ocurre un error agregar la opcion --force
- Ejecutar comando `ionic serve` para comenzar a realizar pruebas. Por defecto se usa la url `http://localhost:8100/`.

## Dato Adicional

- Dentro del proyecto de existe el archivo src/proxy.conf.json, el cual contiene la configuracion de proxy para evitar errores de cors y dar seguridad en la conexion al servicio rest. En este archivo esta la url donde estan los servicios rest. En las pruebas locales, normalmente se usa `http://127.0.0.1:8000`. Si se va a usar otra url, se debe cambiar la propiedad target.