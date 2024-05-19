# Definición de la clase de configuración para el entorno de desarrollo
class DevelopmentConfig():
    # Habilita el modo de depuración de Flask
    DEBUG = True
    # Configuración del host de la base de datos MySQL
    MYSQL_HOST = 'localhost'
    # Nombre de usuario para la base de datos MySQL
    MYSQL_USER = 'root'
    # Contraseña para la base de datos MySQL (vacía en este caso)
    MYSQL_PASSWORD = ''
    # Nombre de la base de datos MySQL a la que se conectará la aplicación
    MYSQL_DB = 'FasterDeliveryBD'
    
# Diccionario de configuración
config = {
    # Clave 'development' que apunta a la clase DevelopmentConfig
    'development': DevelopmentConfig
}