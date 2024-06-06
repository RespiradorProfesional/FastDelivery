# Faster Delivery v1.0.0

**Curso: 2023/2024 Proyecto final DAM - Desarrollo de Aplicaciones Multiplataforma Autor: Néstor Álvarez Pareja**

## Descripción

Faster Delivery es un emocionante juego de plataformas en 2D diseñado exclusivamente para PC, donde los jugadores asumen el papel de un repartidor cuyo objetivo principal es entregar paquetes lo más rápido posible. En este juego, cada nivel presenta una historia única donde la velocidad de entrega del paquete determina el desarrollo y desenlace de la trama. La aplicación almacena las cuentas de los jugadores y los tiempos realizados en cada nivel, permitiendo mostrar los mejores tiempos logrados por los jugadores en cada uno de ellos.

## Contenido

- **Código Fuente:** Contiene todo el código fuente del juego, incluyendo el desarrollo del juego en Godot, la API con Python y Flask, y la configuración de la base de datos MySQL.

- **Assets:** Contiene los assets utilizados en el juego, como sprites, música y efectos de sonido.

- **Ejecutable del juego:** El ejecutable del juego se encuentra bajo el nombre de "FasterDelivery.exe".

## Instalación y Uso

1. En caso de no querer la funcionalidad de la API puedes probar el fragmento de juego en este enlace (no se recomienda ya que el juego no contempla la posibilidad de no estar conectada a una BD, aunque si se podra jugar el primer nivel pero no terminarlo):  [Enlace al juego ejecutable sin API]([https://www.mediafire.com/file/mya9m708vvqybdk/FasterDelivery.exe/file](https://www.mediafire.com/file/75di9j9a1iw43vo/FasterDeliveryNoApi.exe/file))

1. Clona el repositorio desde GitHub: `git clone https://github.com/tuusuario/faster-delivery.git`

2. Crea la base de datos en MySQL utilizando un programa como "WorkBench" con las siguientes credenciales:
    - MYSQL_HOST = 'localhost'
    - MYSQL_USER = 'root'
    - MYSQL_PASSWORD = ''
    - MYSQL_DB = 'FasterDeliveryBD'

3. Instala Python. Una vez instalado, deberás instalar un IDE como "Visual Studio Code" para ejecutar la API y algún programa que permita crear un servidor web local como "Xampp". Deberás ejecutar ambos y haber creado la base de datos previamente para poder jugar.

4. Ejecuta el juego y disfruta de la experiencia de Faster Delivery.

## Licencia

Este proyecto está bajo la Licencia MIT. Puedes utilizar, modificar y distribuir este software de acuerdo con los términos de la licencia.

El enlace al ejecutable se encuentra aquí: [Enlace al juego ejecutable](https://www.mediafire.com/file/mya9m708vvqybdk/FasterDelivery.exe/file)

!AVISO!, el windows puede detectar como virus el ejecutable .exe, aseguro que no es un virus
