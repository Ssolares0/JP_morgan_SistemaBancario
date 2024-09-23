# Diseño del Sistema bancario JP morgan -   Sebastian Solares

## Introducción
El análisis y diseño de una base de datos es un proceso fundamental en el desarrollo de sistemas de información eficientes y funcionales. Este proceso busca estructurar, organizar y optimizar los datos de manera que se facilite su almacenamiento, acceso y manejo, garantizando así la integridad y consistencia de la información.

Durante la fase de análisis, se identifican los requerimientos del sistema y se definen las relaciones entre los distintos elementos de datos, lo que permite entender cómo interactúan las diferentes entidades y procesos de la organización. El diseño de la base de datos, por otro lado, se enfoca en convertir estos requerimientos en una estructura lógica y física que refleje correctamente las interacciones identificadas en el análisis.

Un diseño de base de datos bien estructurado no solo mejora el rendimiento del sistema y reduce redundancias, sino que también asegura que los datos sean seguros, consistentes y accesibles de manera eficiente. Este documento aborda los principios fundamentales para el análisis y diseño de bases de datos, explorando aspectos clave como la identificación de entidades, la normalización de las relaciones, la elección de tipos de datos y la implementación de claves primarias y foráneas para garantizar la integridad referencial.

## Tablas a normalizar

### 1. Clientes
| ID  | NOMBRE   | APELLIDO   | NUM CUENTA | TIPO DE CUENTA     | SALDO     | TELEFONO       |
| --- | -------- | ---------- | ---------- | ------------------ | --------- | -------------- |
| 1   | Nombre_1 | Apellido_1 | 70186741-1 | Ahorro             | 256848.49 | +502 4634-7041 |
| 2   | Nombre_2 | Apellido_2 | 42148275-2 | Ahorro             | 378588.21 | +502 2701-1140 |
| 3   | Nombre_3 | Apellido_3 | 95968205-3 | Depósito Monetario | 294799.84 | +502 6277-2079 |
| 4   | Nombre_4 | Apellido_4 | 74601803-4 | Ahorro             | 30357.74  | +502 7371-9552 |
| 5   | Nombre_5 | Apellido_5 | 18184518-5 | Ahorro             | 270027.60 | +502 1699-8122 |
| 6   | Nombre_6 | Apellido_6 | 16900231-6 | Depósito Monetario | 320114.50 | +502 3725-6825 |


### 2. Sucursales o Agencias   
| ID  | Nombre                       | Tipo     | Departamento   | Municipio         | Dirección | Código Postal |
| --- | ---------------------------- | -------- | -------------- | ----------------- | --------- | ------------- |
| 1   | Sucursal Antigua Guatemala 1 | Sucursal | Sacatepéquez   | Antigua Guatemala | Zona 7    | 91405         |
| 2   | Sucursal Escuintla 2         | Sucursal | Escuintla      | Escuintla         | Zona 1    | 97145         |
| 3   | Sucursal Quetzaltenango 3    | Sucursal | Quetzaltenango | Quetzaltenango    | Zona 1    | 53915         |
| 4   | Sucursal Cobán 4             | Sucursal | Alta Verapaz   | Cobán             | Zona 8    | 31535         |
| 5   | Sucursal Flores 5            | Sucursal | Petén          | Flores            | Zona 10   | 63389         |
| 6   | Sucursal Chiquimula 6        | Sucursal | Chiquimula     | Chiquimula        | Zona 8    | 19714         |


### 3. Empleados
| ID  | Nombre   | Apellido   | Rol                 | Departamento   | Sucursal/Asignación  | Teléfono       |
| --- | -------- | ---------- | ------------------- | -------------- | -------------------- | -------------- |
| 1   | Nombre_1 | Apellido_1 | Auditor Interno     | Petén          | Sucursal/Agencia 528 | +502 7815-2167 |
| 2   | Nombre_2 | Apellido_2 | Administrador       | Chiquimula     | Sucursal/Agencia 171 | +502 3808-9764 |
| 3   | Nombre_3 | Apellido_3 | Atención al Cliente | Jutiapa        | Sucursal/Agencia 103 | +502 4899-1699 |
| 4   | Nombre_4 | Apellido_4 | Oficial de Crédito  | Quetzaltenango | Sucursal/Agencia 36  | +502 3452-1726 |
| 5   | Nombre_5 | Apellido_5 | Soporte Técnico     | Jutiapa        | Sucursal/Agencia 583 | +502 8283-6524 |
| 6   | Nombre_6 | Apellido_6 | Asesor Financiero   | Chiquimula     | Sucursal/Agencia 394 | +502 6080-1303 |


### 4. Tarjetas de creditos
| ID Tarjeta | ID Cliente | Numero de Tarjeta | Límite de crédito | Saldo Actual | Fecha de emisión | Fecha de Exp | Estado    | Fecha de Corte | Día del Ciclo |
| ---------- | ---------- | ----------------- | ----------------- | ------------ | ---------------- | ------------ | --------- | -------------- | ------------- |
| 1          | 558120     | 4872410269895827  | 4344.96           | 20358.67     | 09/02/2022       | 04/05/2025   | Bloqueada | 06/03/2022     | 6             |
| 2          | 443984     | 4780431200473540  | 48263.8           | 12583.92     | 29/04/2021       | 10/11/2025   | Activa    | 26/05/2021     | 26            |
| 3          | 709855     | 4653562424107275  | 37894.69          | 16274.3      | 10/12/2021       | 08/08/2026   | Bloqueada | 08/01/2022     | 8             |
| 4          | 495584     | 4935123661880312  | 3610.3            | 31113.15     | 21/11/2020       | 26/07/2025   | Bloqueada | 18/12/2020     | 18            |
| 5          | 621646     | 4918591621061050  | 35118.01          | 5054.92      | 06/10/2023       | 05/02/2028   | Cancelada | 05/11/2023     | 5             |
| 6          | 473745     | 4378520539795383  | 5109.03           | 3686.69      | 21/11/2022       | 19/08/2026   | Cancelada | 14/12/2022     | 14            |

### 5. prestamos
| ID Préstamo | ID Cliente | Monto del Préstamo | Tasa de Interés | Fecha de Desembolso | Fecha de Vencimiento | Saldo Pendiente | Estado del Préstamo |
| ----------- | ---------- | ------------------ | --------------- | ------------------- | -------------------- | --------------- | ------------------- |
| 1           | 495798     | 964203.64          | 6.63            | 19/11/2023          | 06/06/2032           | 674174.18       | Vencido             |
| 2           | 42734      | 811935.67          | 13.42           | 07/05/2023          | 29/08/2028           | 756664.53       | Activo              |
| 3           | 540710     | 961457.89          | 13.68           | 28/10/2021          | 10/03/2030           | 200162.19       | Vencido             |
| 4           | 983331     | 78869.24           | 11.42           | 14/05/2023          | 17/12/2026           | 67546.61        | Vencido             |
| 5           | 409214     | 456168.05          | 6.93            | 18/05/2020          | 08/07/2026           | 729762.37       | Activo              |
| 6           | 775681     | 11769.26           | 7.77            | 11/09/2022          | 06/10/2025           | 737055.62       | Cancelado           |


### 6. Transacciones
| ID Transacción | ID Cliente | Número de Cuenta | Tipo de Transacción | Monto   | Fecha      | Hora     | Descripción                       | Sucursal/Agencia     |
| -------------- | ---------- | ---------------- | ------------------- | ------- | ---------- | -------- | --------------------------------- | -------------------- |
| 1              | 455902     | 58639163-455902  | Transferencia       | 2865.8  | 24/10/2023 | 14:28:01 | Transacción de tipo Transferencia | Sucursal/Agencia 221 |
| 2              | 469824     | 99757988-469824  | Depósito            | 2438.92 | 09/12/2023 | 14:28:01 | Transacción de tipo Depósito      | Sucursal/Agencia 257 |
| 3              | 626567     | 19969005-626567  | Transferencia       | 9494.98 | 01/06/2024 | 14:28:01 | Transacción de tipo Transferencia | Sucursal/Agencia 874 |
| 4              | 784443     | 95861936-784443  | Pago                | 8399.08 | 26/12/2023 | 14:28:01 | Transacción de tipo Pago          | Sucursal/Agencia 265 |
| 5              | 421423     | 21672609-421423  | Depósito            | 7722.1  | 27/12/2022 | 14:28:01 | Transacción de tipo Depósito      | Sucursal/Agencia 986 |
| 6              | 373084     | 56507869-373084  | Pago                | 8905.79 | 30/01/2023 | 14:28:01 | Transacción de tipo Pago          | Sucursal/Agencia 574 |




## Tablas Normalizadas

### 1. Clientes
| Campo      | Tipo        | Descripción                           |
| ---------- | ----------- | ------------------------------------- |
| id_cliente | NUMERIC(10) | Identificador único  (ID DEL CLIENTE) |
| nombre     | VARCHAR(20) | Nombre del cliente                    |
| apellido   | VARCHAR(20) | apellido del cliente                  |
| telefono   | VARCHAR(15) | Telefono cliente                      |


### 2. Cuentas Cliente
| Campo          | Tipo          | Descripción                             |
| -------------- | ------------- | --------------------------------------- |
| id_cuenta      | NUMERIC(10)   | Identificador único                     |
| Numero_cuenta  | NUMERIC(10)   | Numero de cuenta                        |
| id_tipo_cuenta | NUMERIC(10)   | llave foranea para la tabla tipo cuenta |
| saldo          | NUMERIC(15,2) | saldo de la cuenta                      |

### 3. Transacciones
| Campo                | Tipo          | Descripción                                           |
| -------------------- | ------------- | ----------------------------------------------------- |
| id_transaccion       | NUMERIC(10)   | Identificador único                                   |
| id_cliente           | NUMERIC(10)   | Cuenta de origen                                      |
| numero_cuentaOrigen  | NUMERIC(10)   | Cuenta de Origen                                      |
| numero_cuentaDestino | NUMERIC(10)   | Cuenta de destino                                     |
| monto                | DECIMAL(10,2) | Monto de la transacción                               |
| fecha                | DATETIME      | Fecha de la transacción                               |
| hora                 | TIME          | Hora en que se efectuo la transaccion                 |
| tipo_transaccion     | VARCHAR(1)    | Tipo de transacción (depósito, retiro, transferencia) |
| sucursal_agencia     | VARCHAR(20)   | Sucursal o agencia                                    |



### 4. Préstamos
| Campo             | Tipo          | Descripción                       |
| ----------------- | ------------- | --------------------------------- |
| id_prestamo       | NUMERIC(10)   | Identificador único               |
| id_cliente        | NUMERIC(10)   | Identificador del usuario         |
| monto             | NUMERIC(15,2) | Monto del préstamo                |
| tasa_interes      | NUMERIC(5,2)  | Tasa de interés                   |
| fecha_desembolso  | DATETIME      | Fecha de desembolso del préstamo  |
| fecha_vencimiento | DATETIME      | Fecha de vencimiento del préstamo |
| saldo_pendiente   | NUMERIC(15,2) | saldo pendiente del prestamo      |
| estado_prestamo   | NUMERIC(1)    | Estado del préstamo               |

### 5. Sucursales
| Campo           | Tipo        | Descripción                              |
| --------------- | ----------- | ---------------------------------------- |
| id_sucursal     | NUMERIC(10) | Identificador único                      |
| tipo            | VARCHAR(10) | Identificador único                      |
| nombre          | VARCHAR(25) | Nombre de la sucursal                    |
| id_Departamento | NUMERIC(10) | llave foranea para la tabla departamento |
| telefono        | VARCHAR(15) | Teléfono de contacto sucursal            |

### 6. Estado de Préstamos
| Campo     | Tipo        | Descripción            |
| --------- | ----------- | ---------------------- |
| id_estado | NUMERIC(10) | Identificador único    |
| estado    | VARCHAR(15) | Descripción del estado |

### 7. Tipo de Transacciones
| Campo            | Tipo        | Descripción                         |
| ---------------- | ----------- | ----------------------------------- |
| id_tipo          | NUMERIC(10) | Identificador único                 |
| tipo_transaccion | VARCHAR(15) | Descripción del tipo de transaccion |

### 8. Empleados
| Campo        | Tipo        | Descripción                                 |
| ------------ | ----------- | ------------------------------------------- |
| id_empleado  | NUMERIC(10) | Identificador único                         |
| nombre       | VARCHAR(20) | Nombre del empleado                         |
| apellido     | VARCHAR(20) | apellido del empleado                       |
| telefono     | VARCHAR(15) | Telefono empleado                           |
| departamento | VARCHAR(2)  | llave foranea para la tabla de departamento |
| sucursal     | VARCHAR(25) | sucursal donde trabaja el empleado          |
| rol          | VARCHAR(2)  | llave foranea para la tabla de roles        |

### 9. Roles de Empleados
| Campo  | Tipo        | Descripción         |
| ------ | ----------- | ------------------- |
| id_rol | NUMERIC(10) | Identificador único |
| rol    | VARCHAR(30) | Descripción del rol |

### 10. Tarjetas de Crédito
| Campo            | Tipo         | Descripción               |
| ---------------- | ------------ | ------------------------- |
| id_tarjeta       | NUMERIC(10)  | Identificador único       |
| id_cliente       | NUMERIC(10)  | Identificador del cliente |
| numero_tarjeta   | VARCHAR(19)  | Número de la tarjeta      |
| fecha_emision    | DATE         | Fecha de emision          |
| fecha_expiracion | DATE         | Fecha de expiración       |
| fecha_corte      | DATE         | Fecha de corte            |
| limite_credito   | NUMERIC(8,2) | Límite de crédito         |
| saldo_actual     | NUMERIC(8,2) | Saldo actual              |
| estado           | VARCHAR(50)  | Estado de la tarjeta      |

### 11. Tipo de Cuentas Cliente
| Campo          | Tipo        | Descripción                    |
| -------------- | ----------- | ------------------------------ |
| id_tipo_cuenta | NUMERIC(10) | Identificador único            |
| tipo_cuenta    | VARCHAR(20) | Descripción del tipo de cuenta |

### 12. Estado de Tarjetas de Crédito
| Campo     | Tipo        | Descripción                     |
| --------- | ----------- | ------------------------------- |
| id_estado | NUMERIC(10) | Identificador único             |
| estado    | VARCHAR(10) | estado de la tarjeta de credito |
|           |



### 13. Municipios
| Campo           | Tipo        | Descripción                              |
| --------------- | ----------- | ---------------------------------------- |
| id_municipio    | NUMERIC(10) | Identificador único                      |
| id_departamento | NUMERIC(10) | Llave foránea para la tabla departamento |
| nombre          | VARCHAR(25) | Nombre del municipio                     |



### 14. Departamentos
| Campo           | Tipo        | Descripción                |
| --------------- | ----------- | -------------------------- |
| id_departamento | NUMERIC(10) | Identificador único        |
| departamento    | VARCHAR(50) | Nombre del departamento    |
| municipio       | VARCHAR(50) | Nombre del municipio       |
| direccion       | VARCHAR(25) | Dirección del departamento |
| codigo_postal   | VARCHAR(5)  | Código postal              |



## Total de tablas normalizadas


1. Clientes
2. Cuentas Cliente
3. Transacciones
4. Préstamos
5. Sucursales
6. Estado de Préstamos
7. Tipo de Transacciones
8. Empleados
9. Roles de Empleados
10. Tarjetas de Crédito
11. Estado de Tarjetas de Crédito
12. Municipios
13. Departamentos
14. Cuentas Cliente


## Relaciones
- Un usuario puede tener múltiples cuentas.
- Una cuenta puede tener múltiples transacciones.   



## Diagrama matricial

| Tablas                        | Clientes  | Cuentas   | Transacciones | Tarjetas de crédito | Tipos de cuentas | Sucursales/Agencias | Roles     | Tipo transacción | Departamento | Empleados | Municipio | Préstamos | Estado tarjeta de crédito |
| ----------------------------- | --------- | --------- | ------------- | ------------------- | ---------------- | ------------------- | --------- | ---------------- | ------------ | --------- | --------- | --------- | ------------------------- |
| **Clientes**                  | --------  | 1:N       | 1:N           | 1:N                 | No aplica        | No aplica           | No aplica | No aplica        | NO APLICA    | NO APLICA | No aplica | 1:N       | No aplica                 |
| **Cuentas**                   | N:1       | --------  | No aplica     | NO APLICA           | 1                | No aplica           | No aplica | No aplica        | NO APLICA    | NO APLICA | No aplica | No aplica | No aplica                 |
| **Transacciones**             | N:1       | N:1       | --------      | N:1                 | NO APLICA        | N:1                 | NO APLICA | N:1              | NO APLICA    | NO APLICA | No aplica | No aplica | No aplica                 |
| **Tarjetas de crédito**       | N:1       | No aplica | N:1           | --------            | No aplica        | No aplica           | No aplica | No aplica        | No aplica    | No aplica | No aplica | No aplica | 1                         |
| **Tipos de cuentas**          | No aplica | 1         | No aplica     | No aplica           | --------         | No aplica           | No aplica | No aplica        | No aplica    | No aplica | No aplica | No aplica | No aplica                 |
| **Sucursales/Agencias**       | No aplica | No aplica | 1:N           | No aplica           | No aplica        | --------            | No aplica | No aplica        | N:1          | 1:N       | N:1       | No aplica | No aplica                 |
| **Roles**                     | No aplica | No aplica | No aplica     | No aplica           | No aplica        | No aplica           | --------  | No aplica        | No aplica    | 1:N       | No aplica | No aplica | No aplica                 |
| **Tipo transacción**          | No aplica | N:1       | 1:N           | 1                   | No aplica        | No aplica           | No aplica | --------         | No aplica    | No aplica | No aplica | No aplica | No aplica                 |
| **Departamento**              | No aplica | No aplica | No aplica     | No aplica           | No aplica        | 1:N                 | No aplica | No aplica        | --------     | 1:N       | 1:N       | No aplica | No aplica                 |
| **Empleados**                 | No aplica | No aplica | No aplica     | No aplica           | No aplica        | N:1                 | N:1       | No aplica        | N:1          | --------  | No aplica | No aplica | No aplica                 |
| **Municipio**                 | No aplica | No aplica | No aplica     | No aplica           | No aplica        | No aplica           | No aplica | No aplica        | N:1          | No aplica | --------  | No aplica | No aplica                 |
| **Préstamos**                 | 1:1       | No aplica | No aplica     | No aplica           | No aplica        | No aplica           | No aplica | No aplica        | No aplica    | No aplica | No aplica | --------  | No aplica                 |
| **Estado tarjeta de crédito** | No aplica | No aplica | No aplica     | 1                   | No aplica        | No aplica           | No aplica | No aplica        | No aplica    | No aplica | No aplica | No aplica | --------                  |


## Diagrama ER
![Diagrama ER](images/modelo_logico.jpg)

## Conclusión
El diseño de la base de datos está estructurado para soportar las operaciones básicas de un sistema bancario, asegurando integridad y eficiencia en las transacciones.
