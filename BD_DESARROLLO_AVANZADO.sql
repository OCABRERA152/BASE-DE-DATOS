
CREATE TABLE Auditoria (
    id_auditoria int  NOT NULL IDENTITY,
    nombre_tabla nvarchar(50)  NULL,
    tipo_transaccion nvarchar(10)  NULL,
    fecha_hora datetime  NULL DEFAULT getdate(),
    usuario nvarchar(100)  NULL,
    detalle nvarchar(max)  NULL,
    CONSTRAINT Auditoria_pk PRIMARY KEY  (id_auditoria)
);


CREATE TABLE ConfirmacionEnvio (
    id_confirmacion int  NOT NULL IDENTITY,
    id_pago int  NULL,
    email nvarchar(100)  NULL,
    fecha_envio datetime  NULL DEFAULT getdate(),
    CONSTRAINT ConfirmacionEnvio_pk PRIMARY KEY  (id_confirmacion)
);


CREATE TABLE ContactoEmergencia (
    id_contacto int  NOT NULL IDENTITY,
    id_usuario int  NULL,
    nombre_contacto nvarchar(50)  NULL,
    telefono_contacto nvarchar(20)  NULL,
    CONSTRAINT ContactoEmergencia_pk PRIMARY KEY  (id_contacto)
);


CREATE TABLE FotoHotel (
    id_foto int  NOT NULL IDENTITY,
    id_hotel int  NULL,
    url_foto nvarchar(255)  NULL,
    tipo_foto nvarchar(20)  NULL,
    CONSTRAINT FotoHotel_pk PRIMARY KEY  (id_foto)
);


CREATE TABLE Habitacion (
    id_habitacion int  NOT NULL IDENTITY,
    id_hotel int  NULL,
    tipo_habitacion nvarchar(50)  NULL,
    costo decimal(10,2)  NULL,
    CONSTRAINT Habitacion_pk PRIMARY KEY  (id_habitacion)
);


CREATE TABLE Hotel (
    id_hotel int  NOT NULL IDENTITY,
    nombre_hotel nvarchar(100)  NULL,
    categoria int  NULL,
    zona nvarchar(50)  NULL,
    ubicacion nvarchar(255)  NULL,
    CONSTRAINT Hotel_pk PRIMARY KEY  (id_hotel)
);


CREATE TABLE Pago (
    id_pago int  NOT NULL IDENTITY,
    id_reserva int  NULL,
    metodo_pago nvarchar(50)  NULL,
    cuotas int  NULL,
    proteccion_viaje bit  NULL,
    cambio_viaje bit  NULL,
    estado_pago nvarchar(20)  NULL,
    CONSTRAINT Pago_pk PRIMARY KEY  (id_pago)
);


CREATE TABLE ReclamoCambio (
    id_reclamo_cambio int  NOT NULL IDENTITY,
    id_usuario int  NULL,
    tipo nvarchar(50)  NULL,
    costo decimal(10,2)  NULL,
    nueva_fecha date  NULL,
    nuevo_destino nvarchar(50)  NULL,
    estado nvarchar(20)  NULL,
    CONSTRAINT ReclamoCambio_pk PRIMARY KEY  (id_reclamo_cambio)
);


CREATE TABLE Reserva (
    id_reserva int  NOT NULL IDENTITY,
    id_usuario int  NULL,
    id_viaje int  NULL,
    id_hotel int  NULL,
    id_vuelo int  NULL,
    id_vehiculo int  NULL,
    costo_total decimal(10,2)  NULL,
    CONSTRAINT Reserva_pk PRIMARY KEY  (id_reserva)
);


CREATE TABLE ServicioHotel (
    id_servicio int  NOT NULL IDENTITY,
    descripcion nvarchar(50)  NULL,
    CONSTRAINT ServicioHotel_pk PRIMARY KEY  (id_servicio)
);


CREATE TABLE Usuario (
    id_usuario int  NOT NULL IDENTITY,
    nombres nvarchar(50)  NULL,
    apellidos nvarchar(50)  NULL,
    codigo_pais nvarchar(10)  NULL,
    telefono nvarchar(20)  NULL,
    sexo nvarchar(10)  NULL,
    pais_emisor_pasaporte nvarchar(50)  NULL,
    fecha_nacimiento date  NULL,
    frecuente_viajero nvarchar(100)  NULL,
    email nvarchar(100)  NULL,
    password nvarchar(255)  NULL,
    puntos_acumulados int  NULL DEFAULT 0,
    direccion_alertas_ofertas bit  NULL DEFAULT 0,
    CONSTRAINT AK_0 UNIQUE (email),
    CONSTRAINT Usuario_pk PRIMARY KEY  (id_usuario)
);


CREATE TABLE Vehiculo (
    id_vehiculo int  NOT NULL IDENTITY,
    tipo nvarchar(50)  NULL,
    costo_dia decimal(10,2)  NULL,
    CONSTRAINT Vehiculo_pk PRIMARY KEY  (id_vehiculo)
);


CREATE TABLE Viaje (
    id_viaje int  NOT NULL IDENTITY,
    tipo_viaje nvarchar(20)  NULL,
    ciudad_origen nvarchar(50)  NULL,
    ciudad_destino nvarchar(50)  NULL,
    fecha_salida date  NULL,
    fecha_regreso date  NULL,
    cantidad_adultos int  NULL,
    cantidad_ninos int  NULL,
    cantidad_habitaciones int  NULL,
    tipo_clase nvarchar(20)  NULL,
    id_usuario int  NULL,
    CONSTRAINT Viaje_pk PRIMARY KEY  (id_viaje)
);


CREATE TABLE Vuelo (
    id_vuelo int  NOT NULL IDENTITY,
    id_viaje int  NULL,
    tipo_aerolinea nvarchar(50)  NULL,
    escala bit  NULL,
    hora_salida time  NULL,
    hora_llegada time  NULL,
    tipo_vuelo nvarchar(20)  NULL,
    costo decimal(10,2)  NULL,
    CONSTRAINT Vuelo_pk PRIMARY KEY  (id_vuelo)
);

-- foreign keys
-- Referencia: FK_0 (table: ContactoEmergencia)
ALTER TABLE ContactoEmergencia ADD CONSTRAINT FK_0
    FOREIGN KEY (id_usuario)
    REFERENCES Usuario (id_usuario);

-- Referencia: FK_1 (table: Viaje)
ALTER TABLE Viaje ADD CONSTRAINT FK_1
    FOREIGN KEY (id_usuario)
    REFERENCES Usuario (id_usuario);

-- Referencia: FK_10 (table: ConfirmacionEnvio)
ALTER TABLE ConfirmacionEnvio ADD CONSTRAINT FK_10
    FOREIGN KEY (id_pago)
    REFERENCES Pago (id_pago);

-- Referencia: FK_11 (table: ReclamoCambio)
ALTER TABLE ReclamoCambio ADD CONSTRAINT FK_11
    FOREIGN KEY (id_usuario)
    REFERENCES Usuario (id_usuario);

-- Referencia: FK_2 (table: Habitacion)
ALTER TABLE Habitacion ADD CONSTRAINT FK_2
    FOREIGN KEY (id_hotel)
    REFERENCES Hotel (id_hotel);

-- Referencia: FK_3 (table: FotoHotel)
ALTER TABLE FotoHotel ADD CONSTRAINT FK_3
    FOREIGN KEY (id_hotel)
    REFERENCES Hotel (id_hotel);

-- Referencia: FK_4 (table: Vuelo)
ALTER TABLE Vuelo ADD CONSTRAINT FK_4
    FOREIGN KEY (id_viaje)
    REFERENCES Viaje (id_viaje);

-- Referencia: FK_5 (table: Reserva)
ALTER TABLE Reserva ADD CONSTRAINT FK_5
    FOREIGN KEY (id_usuario)
    REFERENCES Usuario (id_usuario);

-- Referencia: FK_6 (table: Reserva)
ALTER TABLE Reserva ADD CONSTRAINT FK_6
    FOREIGN KEY (id_viaje)
    REFERENCES Viaje (id_viaje);

-- Referencia: FK_7 (table: Reserva)
ALTER TABLE Reserva ADD CONSTRAINT FK_7
    FOREIGN KEY (id_hotel)
    REFERENCES Hotel (id_hotel);

-- Referencia: FK_8 (table: Reserva)
ALTER TABLE Reserva ADD CONSTRAINT FK_8
    FOREIGN KEY (id_vuelo)
    REFERENCES Vuelo (id_vuelo);

-- Referencia: FK_9 (table: Pago)
ALTER TABLE Pago ADD CONSTRAINT FK_9
    FOREIGN KEY (id_reserva)
    REFERENCES Reserva (id_reserva);



