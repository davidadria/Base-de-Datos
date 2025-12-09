# DICCIONARIO DE DATOS

 Realizado por: Daniel Villena, David Adrián, Carles Mora Javaloyes, Fran Arroyo Peral.

## Diccionario de datos

* Tabla `CLIENTE`
    | **Columna**       | **TIPO  DE VARIABLE** | **RESTRICCIÓN**   | **Descripción**                                                               |    
    |-------------------|-----------------------|-------------------|---------------------------                                                    |
    | nCliente          | `INT`                 | PK                | Identificación del cliente en el casino, creación automática, autoincremento  |
    | nombre            | `VARCHAR(8)`        |                   | Nombre del cliente                                                            |
    | apellido1         | `VARCHAR(128)`        |                   | Primer apellido del cliente                                                   |
    | apellido2         | `VARCHAR(128)`        | NULL              | Segundo apellido del cliente **(Opcional)**                                   |
    | dineroCuenta      | `FLOAT`               | VNN               | Dinero que el cliente aporta para jugar. **(Debe ser mayor a 0)**             |
    | fnac              | `DATE`                | VNN               | Edad del cliente **(Edad >=18)**                                              |
    | genero            | `CHAR(1)`             | NULL              | Género del cliente **(Opcional)**                                             |
    | vip               | `BOOLEAN`             | VNN               | Identificación por si el cliente es vip                                       | 
    | identificación    | `VARCHAR(9)`          | UK                | Identificación del cliente **(DNI,NIA,Pasaporte)**                            |

* Tabla `ACCEDER`
    | **Columna**   | **Tipo de variable**  | **Restricción**   | **Descripción**                                                               |   
    |-----------    |-------------------    |-------------------|-----------                                                                    | 
    | nCliente      | `INT`                 | PK, FK            | Identificación del cliente en el casino, creación automática, autoincremento  |
    | nLocal        | `INT`                 | PK, FK            | Número identificador del local, codigo de autoincremento                      |
    | fechaAcceso   | `DATE`                |                   | Fecha del día que entro al casino el cliente                                  |
    | horaEntrada   | `TIME`                |                   | Hora en la que entró el cliente al casino                                     |
    | horaSalida    | `TIME`                |                   | Hora en la que salió el cliente del casino                                    |

    En la tabla `ACCEDER` encontramos las siguientes claves ajenas:
        La clave ajena **nCliente** que proviene de la tabla `CLIENTE`
        La clave ajena **nLocal** que proviene de la tabla `LOCAL`

        Restricción de borrado: Rechazar.

        Restricción de modificación: Propagar.

* Taula `LOCAL`
    | **Columna**   | **TIPO  DE VARIABLE**     | **RESTRICCIÓN**       | **DESCRIPCIÓN**                                                               |    
    |-----------    |-----------------------    |-------------------    |---------------                                                                |
    | nLocal        | `INT`                     | PK                    | Número identificador del local, codigo de autoincremento                      |
    | nombre        | `CHAR(128)`               |                       | Nombre del local                                                              |
    | aforo         | `INT`                     |                       | El número máximo de personas que puede haber dentro del local en el momento   |
    | horaApertura  | `TIME`                    |                       | Hora en la que el casino abre                                                 |
    | horaCierre    | `TIME`                    |                       | Hora en la que el casino cierra las puertas                                   |
    | calle         | `VARCHAR(128)`            |                       | Calle dónde se ubica el local                                                 |
    | portal        | `VARCHAR(4)`              |                       | Número del portal donde se encuentra el local                                 |
    | codigoPostal  | `CHAR(5)`                 |                       | Código postal del local                                                       |

* Taula `MAQUINA`
    | **Columna**       | **TIPO  DE VARIABLE** | **RESTRICCIÓN**   | **DESCRIPCIÓN**                                           |    
    |-----------        |-----------------------|-------------------|---------------                                            |
    | codigoMaquina     | `INT`                 | PK                | Código de identificación de la máquina, número de serie   |
    | fechaInstalacion  | `DATE`                |                   | Fecha de instalación de la máquina                        |
    | tipo              | `VARCHAR(64)`         |                   | Tipo de máquina                                           |
    | fabricante        | `VARCHAR(128)`        |                   | El nombre del fabricante                                  |
    | estado            | `BOOLEAN`             |                   | Estado en que se encuentra la máquina                     |  
    | nLocal            | `INT`                 | FK                | Número identificador del local, codigo de autoincremento  |  

    En la tabla `MAQUINA` encontramos las siguientes claves ajenas:
        La clave ajena **nLocal** que proviene de la tabla `LOCAL`

        Restricción de borrado: Rechazar.

        Restricción de modificación: Propagar.

* Taula `EMPLEADO`
    | **Columna**       | **TIPO  DE VARIABLE**     | **RESTRICCIÓN**       | **DESCRIPCIÓN**                                                       |    
    |-----------        |-----------------------    |-------------------    |---------------                                                        |
    | nEmpleado         | `INT`                     | PK                    | Identificación del empleado en la empresa, codigo de autoincremento   |
    | experencia        | `VARCHAR(512)`            |                       | La experencia del empleado                                            |
    | nombre            | `VARCHAR(128)`            |                       | Nombre del empleado                                                   |
    | apellido1         | `VARCHAR(128)`            |                       | Apellido del empleado                                                 |
    | apellido2         | `VARCHAR(128)`            | NULL                  | Segundo apellido del empleado **(Opcional)**                          |  
    | turno             | `VARCHAR(32)`             |                       | Turno en que trabaja el empleado **(Mañana , Tarde o Noche)**         |  
    | sueldo            | `FLOAT`                   |                       | Sueldo del empleado                                                   |     
    | nSeguridadSocial  | `INT`                     |                       | Número de la seguridad social                                         | 
    | nLocal            | `INT`                     | FK                    | Número de identificación del local, codigo de autoincremento          |
    | fechaInicio       | `DATE`                    |                       | Fecha de inicio de la contratación                                    |  
    | fechaFin          | `DATE`                    |                       | Fecha de finalización de la contratación                              |

    En la tabla `EMPLEADO` encontramos las siguientes claves ajenas:
        La clave ajena **nLocal** que proviene de la tabla `LOCAL`
       
        Restricción de borrado: Rechazar.

        Restricción de modificación: Propagar.

    Pérdida expresiva, en las cardinalidades del modelo ER hemos representado una cardinalidad mínima de 2, pero no se puede representar en un diccionario de datos

* Taula `CRUPIER`
    | **Columna**   | **TIPO  DE VARIABLE**     | **RESTRICCIÓN**   | **DESCRIPCIÓN**                                                                           |    
    |-----------    |-----------------------    |-------------------|---------------                                                                            |
    | nEmpleado     | `INT`                     | PK, FK            | Identificación del empleado en la empresa, codigo de autoincremento                       |
    | puesto        | `VARCHAR(32)`             |                   | El puesto concreto que ocupa el trabajador (crupier en blackjack, poker, ruleta, etc...)  |

    En la tabla `CRUPIER` encontramos las siguientes claves ajenas:
        La clave ajena **nEmpleado** que proviene de la tabla `EMPLEADO`

        Restricción de borrado: Rechazar.

        Restricción de modificación: Propagar.

* Taula `CAMARERO`
    | **Columna**       | **TIPO  DE VARIABLE**     | **RESTRICCIÓN**   | **DESCRIPCIÓN**                                                       |    
    |-----------        |-----------------------    |-------------------|---------------                                                        |
    | nEmpleado         | `INT`                     | PK, FK            | Identificación del empleado en la empresa, codigo de autoincremento   |
    | especializacion   | `VARCHAR(128)`            |                   | Bebida o servicio en el que el camarero tiene mejores resultados      |
    | codigoBarra       | `INT`                     | FK                | Identificación de la barra, código de autoincremento                  |
    | fechaServicio     | `DATE`                    |                   | La fecha del servicio                                                 | 

    En la tabla `CAMARERO` encontramos las siguientes claves ajenas:
        La clave ajena **nEmpleado** que proviene de la tabla `EMPLEADO`
        La clave ajena **codigoBarra** que proviene de la tabla `BARRA`

        Restricción de borrado: Rechazar.

        Restricción de modificación: Propagar.
    
* Taula `BARRA`
    | **Columna**   | **TIPO  DE VARIABLE**     | **RESTRICCIÓN**   | **DESCRIPCIÓN**                                               |    
    |-----------    |-----------------------    |-------------------|---------------                                                |
    | codigoBarra   | `INT`                     | PK                | Identificación de la barra, código de autoincremento          |
    | capacidad     | `INT`                     |                   | Es el aforo máximo de personas en la barra                    |
    | nLocal        | `INT`                     | FK                | Número de identificación del local, codigo de autoincremento  |
    
    En la tabla `BARRA` encontramos las siguientes claves ajenas:
        La clave ajena **nLocal** que proviene de la tabla `LOCAL`

        Restricción de borrado: Rechazar.

        Restricción de modificación: Propagar.

* Tabla `BEBIDAS`
    | **Columna**   | **TIPO  DE VARIABLE** | **RESTRICCIÓN**   | **DESCRIPCIÓN**                                       |    
    |-----------    |-----------------------|-------------------|---------------                                        |
    | nomBebida     | `VARCHAR(64)`         | PK                | Nombre de la bebida                                   |
    | codigoBarra   | `INT`                 | PK, FK            | Identificación de la barra, código de autoincremento  |

     En la tabla `BEBIDAS` encontramos las siguientes claves ajenas:
        La clave ajena **codigoBarra** que proviene de la tabla `BARRA`

        Restricción de borrado: Rechazar.

        Restricción de modificación: Propagar.

* Tabla `JUEGO`
    | **Columna**       | **TIPO  DE VARIABLE**     | **RESTRICCIÓN**   | **DESCRIPCIÓN**                                                               |    
    |-----------        |-----------------------    |-------------------|---------------                                                                |
    | nMesa             | `INT`                     | PK                | Número de la mesa, código de autoincremento                                   |
    | tipo              | `VARCHAR(64)`             |                   | El tipo de juego que se juega en la mesa                                      |
    | capacidad         | `INT`                     |                   | La capacidad máxima de juegadores que puede avergar la mesa.**(Obligatorio)** |
    | nEmpleado         | `INT`                     | FK, VNN           | Identificación del empleado en la empresa, codigo de autoincremento           |
    | comienzoSesion    | `TIME`                    |                   | La hora cuando comienza la sesión de juego                                    |
    | finSesion         | `TIME`                    |                   | La hora cuando finaliza la sesión de juego                                    |

    
    En la tabla `JUEGO` encontramos las siguientes claves ajenas:
        La clave ajena **nEmpleado** que proviene de la tabla `EMPLEADO`

        Restricción de borrado: Rechazar.

        Restricción de modificación: Propagar.

* Tabla `CONTENER`
    | **Columna**   | **TIPO  DE VARIABLE**     | **RESTRICCIÓN**   | **DESCRIPCIÓN**                                               |    
    |-----------    |-----------------------    |-------------------|---------------                                                |
    | nLocal        | `INT`                     | PK, FK            | Número de identificación del local, codigo de autoincremento  |
    | nMesa         | `INT`                     | PK, FK            | Número de la mesa, código de autoincremento                   |
    
        
    En la tabla `CONTENER` encontramos las siguientes claves ajenas:
        La clave ajena **nLocal** que proviene de la tabla `LOCAL`
        La clave ajena **nMesa** que proviene de la tabla `JUEGO`

        Restricción de borrado: Rechazar.

        Restricción de modificación: Propagar.
