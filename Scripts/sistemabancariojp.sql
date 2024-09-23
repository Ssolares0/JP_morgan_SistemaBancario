-------------------------creacion de tabla clientes-------------------
CREATE TABLE clientes (
    id_cliente                     NUMBER(10) NOT NULL,
    nombre                 VARCHAR2(20),
    apellido               VARCHAR2(20),
    telefono               VARCHAR2(15),
    tarjetasC_id           NUMBER(10) NOT NULL,
    prestamos_id           NUMBER(10)
);



ALTER TABLE clientes ADD CONSTRAINT clientes_pk PRIMARY KEY ( id_cliente);

---------creacion de tabla cuentas_cliente-------------------
CREATE TABLE cuentas_cliente (
    id_cuenta                         NUMBER(10) NOT NULL,
    numero_cuenta                     NUMBER(10),
    id_tipocuenta                     NUMBER(10) NOT NULL,
    saldo                             NUMBER(15, 2),
    titular                           INTEGER NOT NULL
   
);


ALTER TABLE cuentas_cliente ADD CONSTRAINT cuentas_cliente_pk PRIMARY KEY ( id_cuenta );

---------creacion de tabla departamentos-------------------
CREATE TABLE departamentos (
    id_departamento          NUMBER(10) NOT NULL,
    departamento VARCHAR2(50),
    municipio    VARCHAR2(50),
    direccion    VARCHAR2(25),
    postalcode   VARCHAR2(5)
);

ALTER TABLE departamentos ADD CONSTRAINT departamentos_pk PRIMARY KEY ( id_departamento );

---------creacion de tabla empleados-------------------
CREATE TABLE empleados (
    id_empleado               NUMBER(10) NOT NULL,
    nombre                    VARCHAR2(20) NOT NULL,
    apellido                  VARCHAR2(20) NOT NULL,
    telefono                  VARCHAR2(15) NOT NULL,
    id_departamento           VARCHAR2(2) NOT NULL,
    sucursal                  VARCHAR2(25) NOT NULL,

    id_rol                       VARCHAR2(2) NOT NULL
);



ALTER TABLE empleados ADD CONSTRAINT empleados_pk PRIMARY KEY ( id_empleado );

---------creacion de tabla prestamos_estados-------------------

CREATE TABLE prestamos_estados (
    id_estadoprestamo    NUMBER(10) NOT NULL,
    estado_prestamo VARCHAR2(15) NOT NULL
);

ALTER TABLE prestamos_estados ADD CONSTRAINT prestamos_estados_pk PRIMARY KEY ( id_estadoprestamo );

---------creacion de tabla estado_tarjeta_creditos-------------------
CREATE TABLE estado_tarjeta_creditos (
    id_estadoTarjeta               NUMBER(10) NOT NULL,
    estado_tarjeta                        VARCHAR2(10) NOT NULL
  
);


ALTER TABLE estado_tarjeta_creditos ADD CONSTRAINT estado_tarjeta_credito_pk PRIMARY KEY ( id_estadoTarjeta );

---------creacion de tabla municipios-------------------
CREATE TABLE municipios (
    id_municipio              NUMBER(10) NOT NULL,
    id_departamento  NUMBER(10) NOT NULL,
    nombre           VARCHAR2(20) NOT NULL
    
);

ALTER TABLE municipios
    ADD CONSTRAINT municipio_pk PRIMARY KEY ( id_municipio );

CREATE TABLE prestamos (
    id_prestamo                NUMBER(10) NOT NULL,
    id_cliente                 NUMBER(10) NOT NULL,
    persona_garante            NUMBER(10) NOT NULL,
    monto                      NUMBER(15, 2) NOT NULL,
    tasa_interes               NUMBER(5, 2) NOT NULL,
    fecha_desembolso           DATE NOT NULL,
    fecha_vencimiento          DATE NOT NULL,
    saldo_pendiente            NUMBER(15, 2) NOT NULL,
    estado_prestamo            NUMBER(1) NOT NULL

    
);

ALTER TABLE prestamos ADD CONSTRAINT prestamos_pk PRIMARY KEY ( id_prestamo );



CREATE TABLE roles (
    id_rol  NUMBER(10) NOT NULL,
    rol VARCHAR2(30) NOT NULL
);

ALTER TABLE roles ADD CONSTRAINT rol_pk PRIMARY KEY ( id_rol );

CREATE TABLE sucursales_o_agencias (
    id_sucursal             NUMBER(10) NOT NULL,
    nombre           VARCHAR2(25) NOT NULL,
    tipo             VARCHAR2(10) NOT NULL,
    telefono         VARCHAR2(15) NOT NULL,
    id_departamento  NUMBER(10) NOT NULL
    
);

ALTER TABLE sucursales_o_agencias ADD CONSTRAINT sucursales_o_agencias_pk PRIMARY KEY ( id_sucursal );

CREATE TABLE tarjetas_de_credito (
    id_tarjeta                    NUMBER(10) NOT NULL,
    id_cliente                 NUMBER(10) NOT NULL,
    nombre_titular             VARCHAR2(20) NOT NULL,
    numero_tarjeta             VARCHAR2(19) NOT NULL,
    limite_credito             NUMBER(8, 2) NOT NULL,
    saldo_actual               NUMBER(8, 2) NOT NULL,
    fecha_emision              DATE NOT NULL,
    fecha_expiracion           DATE NOT NULL,
    fecha_corte                DATE NOT NULL,
    dia_ciclo                  VARCHAR2(2) NOT NULL
  
   
   
);



ALTER TABLE tarjetas_de_credito ADD CONSTRAINT tarjetas_de_credito_pk PRIMARY KEY ( id_tarjeta );

CREATE TABLE tipo_de_cuentas (
    id_tipocuenta                    NUMBER(10) NOT NULL,
    tipo_cuenta                   VARCHAR2(20) NOT NULL
    
);


ALTER TABLE tipo_de_cuentas ADD CONSTRAINT tipo_de_cuentas_pk PRIMARY KEY ( id_tipocuenta );



CREATE TABLE tipo_de_transacciones (
    id_tipoTransaccion             NUMBER(10) NOT NULL,
    tipo_transaccion VARCHAR2(15)
);

ALTER TABLE tipo_de_transacciones ADD CONSTRAINT tipo_de_transacciones_pk PRIMARY KEY ( id_tipoTransaccion );

CREATE TABLE transacciones (
    id_transaccion                 NUMBER(10) NOT NULL,
    id_cliente                     NUMBER(10) NOT NULL,
    numero_cuentadestino           NUMBER(10) NOT NULL,
    tipo_transaccion               NUMBER(1) NOT NULL,
    monto                          NUMBER(6, 2) NOT NULL,
    cliente_transaccion            VARCHAR2(20) NOT NULL,
    fecha                          DATE NOT NULL,
    hora                           DATE NOT NULL,
    descripcion                    VARCHAR2(50) NOT NULL,
    sucursal_agencia               VARCHAR2(20) NOT NULL,
    numero_cuentaorigen            NUMBER(10) NOT NULL
);

ALTER TABLE transacciones ADD CONSTRAINT transacciones_pk PRIMARY KEY ( id_transaccion);


--------------------------- claves foraneas----------------------------------------------
ALTER TABLE cuentas_cliente
    ADD CONSTRAINT cuentas_cliente_fk FOREIGN KEY ( titular )
        REFERENCES clientes ( id_cliente );


ALTER TABLE cuentas_cliente
    ADD CONSTRAINT cuentas_tipo_cuentas_fk FOREIGN KEY ( tipo_cuenta )
        REFERENCES tipo_de_cuentas ( id_tipocuenta );

ALTER TABLE empleados
    ADD CONSTRAINT empleados_departamentos_fk FOREIGN KEY ( departamentos_id )
        REFERENCES departamentos ( id_departamento );

ALTER TABLE empleados
    ADD CONSTRAINT empleados_roles_fk FOREIGN KEY ( id_rol )
        REFERENCES roles ( id_rol );


ALTER TABLE empleados
    ADD CONSTRAINT empleados_sucursales_fk FOREIGN KEY ( id_sucursal )
        REFERENCES sucursales_o_agencias ( id_sucursal );


ALTER TABLE estado_tarjeta_creditos
    ADD CONSTRAINT estado_tarjeta_creditos_tarjetas_de_credito_fk FOREIGN KEY ( tarjetas_de_credito_id_cliente,
                                                                                tarjetas_de_credito_id2 )
        REFERENCES tarjetas_de_credito ( id_cliente,
                                         id );

ALTER TABLE municipios
    ADD CONSTRAINT municipios_departamentos_fk FOREIGN KEY ( id_departamento )
        REFERENCES departamentos ( id_departamento );

ALTER TABLE prestamos
    ADD CONSTRAINT prestamos_clientes_fk FOREIGN KEY (persona_garante   )
        REFERENCES clientes ( id_cliente );


ALTER TABLE prestamos
    ADD CONSTRAINT prestamos_estados_fk FOREIGN KEY ( estado_prestamo )
        REFERENCES prestamos_estados ( id_prestamo );


ALTER TABLE sucursales_o_agencias
    ADD CONSTRAINT sucursales_departamentos_fk FOREIGN KEY ( id_departamento )
        REFERENCES departamentos ( id_departamento );

--ss-s-s-s-ss-s-


ALTER TABLE tarjetas_de_credito
    ADD CONSTRAINT tarjetas_de_credito_clientes_fk FOREIGN KEY ( nombre_titular )
        REFERENCES clientes ( id_cliente );


ALTER TABLE tarjetas_de_credito
    ADD CONSTRAINT tarjetas_de_credito_estado_fk FOREIGN KEY ( estado_tarjeta )
        REFERENCES estado_tarjeta_creditos ( id_estadoTarjeta );

--  ERROR: FK name length exceeds maximum allowed length(30) 
--ALTER TABLE tipo_de_cuentas
--    ADD CONSTRAINT tipo_cuentas_cliente_fk FOREIGN KEY ( cuentas_cliente_id,
--                                                                    cuentas_cliente_id_tipocuenta )
--        REFERENCES cuentas_cliente ( id,
 --                                    id_tipocuenta );

ALTER TABLE transacciones
    ADD CONSTRAINT transacciones_clientes_fk FOREIGN KEY ( cliente_transaccion)
        REFERENCES clientes ( id_cliente );


ALTER TABLE transacciones
    ADD CONSTRAINT transacciones_sucursales__fk FOREIGN KEY ( id_sucursal )
        REFERENCES sucursales_o_agencias ( id_sucursal);


ALTER TABLE transacciones
    ADD CONSTRAINT transacciones_tarjetas_fk FOREIGN KEY ( id_cliente
                                                           )
        REFERENCES tarjetas_de_credito ( id_cliente);


ALTER TABLE transacciones
    ADD CONSTRAINT transacciones_tipo_transa_fk FOREIGN KEY ( tipo_transaccion )
        REFERENCES tipo_de_transacciones ( id_tipoTransaccion );





