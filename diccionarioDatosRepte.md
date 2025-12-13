# DICCIONARIO DE DATOS

 Realizado por: Daniel Villena, David Adrián, Carles Mora Javaloyes, Fran Arroyo Peral.

## Diccionario de datos

* Tabla `CLIENTE`
    | **Columna**       | **TIPO  DE VARIABLE** | **RESTRICCIÓN**   | **Descripción**                                                       |    
    |-------------------|-----------------------|-------------------|---------------------------                                            |
    | nCliente          | `INT`                 | PK, AUTO_INCREMENT| Identificación del cliente en el casino, creación automática          |
    | nombre            | `VARCHAR(128)`        |                   | Nombre del cliente                                                    |
    | apellido1         | `VARCHAR(128)`        |                   | Primer apellido del cliente                                           |
    | apellido2         | `VARCHAR(128)`        | NULL              | Segundo apellido del cliente **(Opcional)**                           |
    | dineroCuenta      | `FLOAT`               | VNN               | Dinero que el cliente aporta para jugar **(Debe ser mayor a 0)**     |
    | fnac              | `DATE`                | VNN               | Edad del cliente **(Edad >=18)**                                      |
    | genero            | `ENUM`                | NULL              | Género del cliente (H, M, O) **(Opcional)**                           |
    | vip               | `TINYINT(1)`          | VNN               | Identificación por si el cliente es vip, por defecto no lo es         | 
    | identificación    | `VARCHAR(64)`         | UK                | Identificación del cliente **(DNI,NIA,Pasaporte)**                    |

* Taula `LOCAL`
    | **Columna**   | **TIPO  DE VARIABLE**     | **RESTRICCIÓN**       | **DESCRIPCIÓN**                                                               |    
    |-----------    |-----------------------    |-------------------    |---------------                                                                |
    | nLocal        | `INT`                     | PK, AUTO_INCREMENT    | Número identificador del local                                                |
    | nombre        | `VARCHAR(64)`             |                       | Nombre del local                                                              |
    | aforo         | `INT`                     |                       | El número máximo de personas que puede haber dentro del local en el momento   |
    | horaApertura  | `TIME`                    |                       | Hora en la que el casino abre                                                 |
    | horaCierre    | `TIME`                    |                       | Hora en la que el casino cierra las puertas                                   |
    | calle         | `VARCHAR(128)`            |                       | Calle dónde se ubica el local                                                 |
    | portal        | `CHAR(4)`                 |                       | Número del portal donde se encuentra el local                                 |
    | codigoPostal  | `CHAR(5)`                 |                       | Código postal del local                                                       |

* Tabla `ACCEDER`
    | **Columna**   | **Tipo de variable**  | **Restricción**   | **Descripción**                                               |   
    |-----------    |-------------------    |-------------------|-----------                                                    | 
    | nCliente      | `INT`                 | PK, FK            | Identificación del cliente, REFERENCIA a `CLIENTE.nCliente`   |
    | nLocal        | `INT`                 | PK, FK            | Número identificador del local, REFERENCIA a `LOCAL.nLocal`   |
    | fechaAcceso   | `DATE`                |                   | Fecha del día que entro al casino el cliente                  |
    | horaEntrada   | `TIME`                |                   | Hora en la que entró el cliente al casino                     |
    | horaSalida    | `TIME`                |                   | Hora en la que salió el cliente del casino                    |

    En la tabla `ACCEDER` encontramos las siguientes claves ajenas:
        La clave ajena **nCliente** que proviene de la tabla `CLIENTE`
        La clave ajena **nLocal** que proviene de la tabla `LOCAL`

        Restricción de borrado: Rechazar.
  
        Restricción de modificación: Propagar.

* Taula `MAQUINA`
    | **Columna**       | **TIPO  DE VARIABLE** | **RESTRICCIÓN**   | **DESCRIPCIÓN**                                                                                               |    
    |-----------        |-----------------------|-------------------|---------------                                                                                                | 
    | codigoMaquina     | `INT`                 | PK, AUTO_INCREMENT| Código de identificación de la máquina, número de serie                                                       |
    | fechaInstalacion  | `DATE`                |                   | Fecha de instalación de la máquina                                                                            |
    | tipo              | `ENUM`                |                   | Tipo de máquina, puede ser: (Slot, VideoRodillo, JackpotProgresivo, RuletaElectronica, BlackjackElectronico)  |
    | fabricante        | `VARCHAR(128)`        |                   | El nombre del fabricante                                                                                      |
    | estado            | `ENUM`                |                   | Estado en que se encuentra la máquina (Activa, FueraDeServicio, EnMantenimiento), por defecto Activa          |  
    | nLocal            | `INT`                 | FK                | Número identificador del local, REFERENCIA a `LOCAL.nLocal`                                                   |  
                                    
    En la tabla `MAQUINA` encontramos las siguientes claves ajenas:
        La clave ajena **nLocal** que proviene de la tabla `LOCAL`

        Restricción de borrado: Rechazar.

        Restricción de modificación: Propagar.

* Taula `EMPLEADO`
    | **Columna**       | **TIPO  DE VARIABLE**     | **RESTRICCIÓN**       | **DESCRIPCIÓN**                                                   |    
    |-----------        |-----------------------    |-------------------    |---------------                                                    |
    | nEmpleado         | `INT`                     | PK, AUTO_INCREMENT    | Identificación del empleado en la empresa                         |
    | experencia        | `TEXT`                    |                       | La experencia del empleado                                        |
    | nombre            | `VARCHAR(128)`            |                       | Nombre del empleado                                               |
    | apellido1         | `VARCHAR(128)`            |                       | Apellido del empleado                                             |
    | apellido2         | `VARCHAR(128)`            | NULL                  | Segundo apellido del empleado **(Opcional)**                      |  
    | turno             | `ENUM`                    |                       | Turno en que trabaja el empleado, (Mañana , Tarde o Noche)        |  
    | sueldo            | `DECIMAL(7)(2)`           |                       | Sueldo del empleado                                               |     
    | nSeguridadSocial  | `CHAR(12)`                |                       | Número de la seguridad social                                     | 
    | nLocal            | `INT`                     | FK                    | Número de identificación del local, REFERENCIA a `LOCAL.nLocal`   |
    | fechaInicio       | `DATE`                    |                       | Fecha de inicio de la contratación                                |  
    | fechaFin          | `DATE`                    |                       | Fecha de finalización de la contratación                          |

    En la tabla `EMPLEADO` encontramos las siguientes claves ajenas:
        La clave ajena **nLocal** que proviene de la tabla `LOCAL`
       
        Restricción de borrado: Rechazar.

        Restricción de modificación: Propagar.

    Pérdida expresiva, en las cardinalidades del modelo ER hemos representado una cardinalidad mínima de 2, pero no se puede representar en un diccionario de datos

* Taula `CRUPIER`
    | **Columna**   | **TIPO  DE VARIABLE**     | **RESTRICCIÓN**   | **DESCRIPCIÓN**                                                                           |    
    |-----------    |-----------------------    |-------------------|---------------                                                                            |
    | nEmpleado     | `INT`                     | PK, FK            | Identificación del empleado en la empresa, REFERENCIA a `EMPLEADO.nEmpleado`              |
    | puesto        | `VARCHAR(32)`             |                   | El puesto concreto que ocupa el trabajador (Crupier en Blackjack, Poker, Ruleta, etc...)  |

    En la tabla `CRUPIER` encontramos las siguientes claves ajenas:
        La clave ajena **nEmpleado** que proviene de la tabla `EMPLEADO`

        Restricción de borrado: Rechazar.

        Restricción de modificación: Propagar.

* Taula `CAMARERO`
    | **Columna**       | **TIPO  DE VARIABLE**     | **RESTRICCIÓN**   | **DESCRIPCIÓN**                                                               |    
    |-----------        |-----------------------    |-------------------|---------------                                                                |
    | nEmpleado         | `INT`                     | PK, FK            | Identificación del empleado en la empresa, REFERENCIA a `EMPLEADO.nEmpleado`  |
    | especializacion   | `VARCHAR(128)`            |                   | Bebida o servicio en el que el camarero tiene mejores resultados              |
    | codigoBarra       | `INT`                     | FK                | Identificación de la barra, REFERENCIA a `BARRA.codigoBarra`                  |
    | fechaServicio     | `DATE`                    |                   | La fecha del servicio                                                         |    

    En la tabla `CAMARERO` encontramos las siguientes claves ajenas:
        La clave ajena **nEmpleado** que proviene de la tabla `EMPLEADO`
        La clave ajena **codigoBarra** que proviene de la tabla `BARRA`

        Restricción de borrado: Rechazar.

        Restricción de modificación: Propagar.
    
* Taula `BARRA`
    | **Columna**   | **TIPO  DE VARIABLE**     | **RESTRICCIÓN**   | **DESCRIPCIÓN**                                                   |    
    |-----------    |-----------------------    |-------------------|---------------                                                    |
    | codigoBarra   | `INT`                     | PK, AUTO_INCREMENT| Identificación de la barra                                        |
    | capacidad     | `INT`                     | VNN               | Es el aforo máximo de personas en la barra **(Obligatorio)**        |
    | nLocal        | `INT`                     | FK                | Número de identificación del local, REFERENCIA a `LOCAL.nLocal`   |
    
    En la tabla `BARRA` encontramos las siguientes claves ajenas:
        La clave ajena **nLocal** que proviene de la tabla `LOCAL`

        Restricción de borrado: Rechazar.

        Restricción de modificación: Propagar.

* Tabla `BEBIDA`
    | **Columna**   | **TIPO  DE VARIABLE** | **RESTRICCIÓN**   | **DESCRIPCIÓN**                                               |    
    |-----------    |-----------------------|-------------------|---------------                                                |
    | nomBebida     | `VARCHAR(64)`         | PK                | Nombre de la bebida                                           |
    | codigoBarra   | `INT`                 | PK, FK            | Identificación de la barra, REFERENCIA a `BARRA.codigoBarra`  |

     En la tabla `BEBIDA` encontramos las siguientes claves ajenas:
        La clave ajena **codigoBarra** que proviene de la tabla `BARRA`

        Restricción de borrado: Rechazar.

        Restricción de modificación: Propagar.

* Tabla `JUEGO`
    | **Columna**       | **TIPO  DE VARIABLE**     | **RESTRICCIÓN**   | **DESCRIPCIÓN**                                                                   |    
    |-----------        |-----------------------    |-------------------|---------------                                                                    |
    | nMesa             | `INT`                     | PK, AUTO_INCREMENT| Número de la mesa                                                                 |
    | tipo              | `ENUM`                    |                   | El tipo de juego que se juega en la mesa, puede ser (BlackJack, Poker o Ruleta)   |
    | capacidad         | `INT`                     | VNN               | La capacidad máxima de juegadores que puede avergar la mesa **(Obligatorio)**     |
    | nEmpleado         | `INT`                     | FK, VNN           | Identificación del empleado en la empresa, REFERENCIA a `CRUPIER.nEmpleado`       |
    | nLocal            | `INT`                     | FK, VNN           | Clave de identificacion del local, REFERENCIA a `LOCAL.nLocal`
    | comienzoSesion    | `TIME`                    |                   | La hora cuando comienza la sesión de juego                                        |
    | finSesion         | `TIME`                    |                   | La hora cuando finaliza la sesión de juego                                        |

    
    En la tabla `JUEGO` encontramos las siguientes claves ajenas:
        La clave ajena **nEmpleado** que proviene de la tabla `EMPLEADO`
        La clave ajena **nLocal** que proviene de la tabla `LOCAL`

        Restricción de borrado: Rechazar.

        Restricción de modificación: Propagar.
