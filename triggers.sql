
---para las consultas select debe manejarse desde el SP que devuelve los datos al desarrollo
INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
VALUES ('Usuario', 'Select', SYSTEM_USER, 'Consulta realizada en la tabla Usuario');

-- Trigger para UPDATE en ContactoEmergencia
CREATE TRIGGER Update_ContactoEmergencia
ON ContactoEmergencia
AFTER UPDATE
AS
BEGIN
    DECLARE @Usuario NVARCHAR(100), @Detalle NVARCHAR(MAX);
    SELECT @Usuario = (SELECT email FROM Usuario WHERE id_usuario = (SELECT id_usuario FROM inserted));
    SET @Detalle = 'Contacto de emergencia actualizado para el usuario: ' + @Usuario;

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('ContactoEmergencia', 'UPDATE', @Usuario, @Detalle);
END;

-- Trigger para DELETE en ContactoEmergencia
CREATE TRIGGER Delete_ContactoEmergencia
ON ContactoEmergencia
AFTER DELETE
AS
BEGIN
    DECLARE @Usuario NVARCHAR(100), @Detalle NVARCHAR(MAX);
    SELECT @Usuario = (SELECT email FROM Usuario WHERE id_usuario = (SELECT id_usuario FROM deleted));
    SET @Detalle = 'Contacto de emergencia eliminado para el usuario: ' + @Usuario;

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('ContactoEmergencia', 'DELETE', @Usuario, @Detalle);
END;

-- Trigger para INSERT en ServicioHotel
CREATE TRIGGER Insert_ServicioHotel
ON ServicioHotel
AFTER INSERT
AS
BEGIN
    DECLARE @Detalle NVARCHAR(MAX);
    SET @Detalle = 'Nuevo servicio de hotel agregado con ID: ' + CAST((SELECT id_servicio FROM inserted) AS NVARCHAR);

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('ServicioHotel', 'INSERT', 'Sistema', @Detalle);
END;

-- Trigger para UPDATE en ServicioHotel
CREATE TRIGGER Update_ServicioHotel
ON ServicioHotel
AFTER UPDATE
AS
BEGIN
    DECLARE @Detalle NVARCHAR(MAX);
    SET @Detalle = 'Servicio de hotel actualizado con ID: ' + CAST((SELECT id_servicio FROM inserted) AS NVARCHAR);

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('ServicioHotel', 'UPDATE', 'Sistema', @Detalle);
END;

-- Trigger para DELETE en ServicioHotel
CREATE TRIGGER Delete_ServicioHotel
ON ServicioHotel
AFTER DELETE
AS
BEGIN
    DECLARE @Detalle NVARCHAR(MAX);
    SET @Detalle = 'Servicio de hotel eliminado con ID: ' + CAST((SELECT id_servicio FROM deleted) AS NVARCHAR);

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('ServicioHotel', 'DELETE', 'Sistema', @Detalle);
END;

-- Trigger para INSERT en Habitacion
CREATE TRIGGER Insert_Habitacion
ON Habitacion
AFTER INSERT
AS
BEGIN
    DECLARE @Detalle NVARCHAR(MAX);
    SET @Detalle = 'Nueva habitación agregada con ID: ' + CAST((SELECT id_habitacion FROM inserted) AS NVARCHAR);

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('Habitacion', 'INSERT', 'Sistema', @Detalle);
END;

-- Trigger para UPDATE en Habitacion
CREATE TRIGGER Update_Habitacion
ON Habitacion
AFTER UPDATE
AS
BEGIN
    DECLARE @Detalle NVARCHAR(MAX);
    SET @Detalle = 'Habitación actualizada con ID: ' + CAST((SELECT id_habitacion FROM inserted) AS NVARCHAR);

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('Habitacion', 'UPDATE', 'Sistema', @Detalle);
END;

-- Trigger para DELETE en Habitacion
CREATE TRIGGER Delete_Habitacion
ON Habitacion
AFTER DELETE
AS
BEGIN
    DECLARE @Detalle NVARCHAR(MAX);
    SET @Detalle = 'Habitación eliminada con ID: ' + CAST((SELECT id_habitacion FROM deleted) AS NVARCHAR);

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('Habitacion', 'DELETE', 'Sistema', @Detalle);
END;

-- Trigger para INSERT en FotoHotel
CREATE TRIGGER Insert_FotoHotel
ON FotoHotel
AFTER INSERT
AS
BEGIN
    DECLARE @Detalle NVARCHAR(MAX);
    SET @Detalle = 'Nueva foto agregada al hotel con ID de foto: ' + CAST((SELECT id_foto FROM inserted) AS NVARCHAR);

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('FotoHotel', 'INSERT', 'Sistema', @Detalle);
END;

-- Trigger para UPDATE en FotoHotel
CREATE TRIGGER Update_FotoHotel
ON FotoHotel
AFTER UPDATE
AS
BEGIN
    DECLARE @Detalle NVARCHAR(MAX);
    SET @Detalle = 'Foto de hotel actualizada con ID de foto: ' + CAST((SELECT id_foto FROM inserted) AS NVARCHAR);

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('FotoHotel', 'UPDATE', 'Sistema', @Detalle);
END;

-- Trigger para DELETE en FotoHotel
CREATE TRIGGER Delete_FotoHotel
ON FotoHotel
AFTER DELETE
AS
BEGIN
    DECLARE @Detalle NVARCHAR(MAX);
    SET @Detalle = 'Foto de hotel eliminada con ID de foto: ' + CAST((SELECT id_foto FROM deleted) AS NVARCHAR);

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('FotoHotel', 'DELETE', 'Sistema', @Detalle);
END;

-- Trigger para INSERT en Vuelo
CREATE TRIGGER Insert_Vuelo
ON Vuelo
AFTER INSERT
AS
BEGIN
    DECLARE @Detalle NVARCHAR(MAX);
    SET @Detalle = 'Nuevo vuelo registrado con ID de vuelo: ' + CAST((SELECT id_vuelo FROM inserted) AS NVARCHAR);

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('Vuelo', 'INSERT', 'Sistema', @Detalle);
END;

-- Trigger para UPDATE en Vuelo
CREATE TRIGGER Update_Vuelo
ON Vuelo
AFTER UPDATE
AS
BEGIN
    DECLARE @Detalle NVARCHAR(MAX);
    SET @Detalle = 'Vuelo actualizado con ID de vuelo: ' + CAST((SELECT id_vuelo FROM inserted) AS NVARCHAR);

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('Vuelo', 'UPDATE', 'Sistema', @Detalle);
END;

-- Trigger para DELETE en Vuelo
CREATE TRIGGER Delete_Vuelo
ON Vuelo
AFTER DELETE
AS
BEGIN
    DECLARE @Detalle NVARCHAR(MAX);
    SET @Detalle = 'Vuelo eliminado con ID de vuelo: ' + CAST((SELECT id_vuelo FROM deleted) AS NVARCHAR);

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('Vuelo', 'DELETE', 'Sistema', @Detalle);
END;

-- Trigger para INSERT en Vehiculo
CREATE TRIGGER Insert_Vehiculo
ON Vehiculo
AFTER INSERT
AS
BEGIN
    DECLARE @Detalle NVARCHAR(MAX);
    SET @Detalle = 'Nuevo vehículo agregado con ID: ' + CAST((SELECT id_vehiculo FROM inserted) AS NVARCHAR);

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('Vehiculo', 'INSERT', 'Sistema', @Detalle);
END;

-- Trigger para UPDATE en Vehiculo
CREATE TRIGGER Update_Vehiculo
ON Vehiculo
AFTER UPDATE
AS
BEGIN
    DECLARE @Detalle NVARCHAR(MAX);
    SET @Detalle = 'Vehículo actualizado con ID: ' + CAST((SELECT id_vehiculo FROM inserted) AS NVARCHAR);

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('Vehiculo', 'UPDATE', 'Sistema', @Detalle);
END;

-- Trigger para DELETE en Vehiculo
CREATE TRIGGER Delete_Vehiculo
ON Vehiculo
AFTER DELETE
AS
BEGIN
    DECLARE @Detalle NVARCHAR(MAX);
    SET @Detalle = 'Vehículo eliminado con ID: ' + CAST((SELECT id_vehiculo FROM deleted) AS NVARCHAR);

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('Vehiculo', 'DELETE', 'Sistema', @Detalle);
END;

-- Trigger para INSERT en ConfirmacionEnvio
CREATE TRIGGER Insert_ConfirmacionEnvio
ON ConfirmacionEnvio
AFTER INSERT
AS
BEGIN
    DECLARE @Usuario NVARCHAR(100), @Detalle NVARCHAR(MAX);
    SELECT @Usuario = (SELECT email FROM Usuario WHERE id_usuario = (SELECT id_usuario FROM Reserva WHERE id_reserva = (SELECT id_reserva FROM Pago WHERE id_pago = (SELECT id_pago FROM inserted))));
    SET @Detalle = 'Confirmación de envío generada para usuario: ' + @Usuario;

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('ConfirmacionEnvio', 'INSERT', @Usuario, @Detalle);
END;

-- Trigger para INSERT en ReclamoCambio
CREATE TRIGGER Insert_ReclamoCambio
ON ReclamoCambio
AFTER INSERT
AS
BEGIN
    DECLARE @Usuario NVARCHAR(100), @Detalle NVARCHAR(MAX);
    SELECT @Usuario = (SELECT email FROM Usuario WHERE id_usuario = (SELECT id_usuario FROM inserted));
    SET @Detalle = 'Nuevo reclamo o cambio registrado para el usuario: ' + @Usuario;

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('ReclamoCambio', 'INSERT', @Usuario, @Detalle);
END;

-- Trigger para UPDATE en ReclamoCambio
CREATE TRIGGER Update_ReclamoCambio
ON ReclamoCambio
AFTER UPDATE
AS
BEGIN
    DECLARE @Usuario NVARCHAR(100), @Detalle NVARCHAR(MAX);
    SELECT @Usuario = (SELECT email FROM Usuario WHERE id_usuario = (SELECT id_usuario FROM inserted));
    SET @Detalle = 'Reclamo o cambio actualizado para el usuario: ' + @Usuario;

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('ReclamoCambio', 'UPDATE', @Usuario, @Detalle);
END;

-- Trigger para DELETE en ReclamoCambio
CREATE TRIGGER Delete_ReclamoCambio
ON ReclamoCambio
AFTER DELETE
AS
BEGIN
    DECLARE @Usuario NVARCHAR(100), @Detalle NVARCHAR(MAX);
    SELECT @Usuario = (SELECT email FROM Usuario WHERE id_usuario = (SELECT id_usuario FROM deleted));
    SET @Detalle = 'Reclamo o cambio eliminado para el usuario: ' + @Usuario;

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('ReclamoCambio', 'DELETE', @Usuario, @Detalle);
END;

CREATE TRIGGER Usuario_Insert
ON Usuario
AFTER INSERT
AS
BEGIN
    DECLARE @usuario NVARCHAR(100) = SYSTEM_USER;
    DECLARE @detalle NVARCHAR(MAX) = '';

    SELECT @detalle = @detalle + 'ID Usuario: ' + CAST(id_usuario AS NVARCHAR) + ', Nombre: ' + nombre + ', Email: ' + email + '; '
    FROM inserted;

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('Usuario', 'Insert', @usuario, @detalle);
END;

CREATE TRIGGER Usuario_Update
ON Usuario
AFTER UPDATE
AS
BEGIN
    DECLARE @usuario NVARCHAR(100) = SYSTEM_USER;
    DECLARE @detalle NVARCHAR(MAX) = '';

    SELECT @detalle = @detalle + 'ID Usuario: ' + CAST(id_usuario AS NVARCHAR) +
                      ', Nombre Anterior: ' + i.nombre + ', Nuevo Nombre: ' + d.nombre + 
                      ', Email Anterior: ' + i.email + ', Nuevo Email: ' + d.email + '; '
    FROM inserted i
    INNER JOIN deleted d ON i.id_usuario = d.id_usuario;

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('Usuario', 'Update', @usuario, @detalle);
END;

CREATE TRIGGER Usuario_Delete
ON Usuario
AFTER DELETE
AS
BEGIN
    DECLARE @usuario NVARCHAR(100) = SYSTEM_USER;
    DECLARE @detalle NVARCHAR(MAX) = '';

    SELECT @detalle = @detalle + 'ID Usuario: ' + CAST(id_usuario AS NVARCHAR) + ', Nombre: ' + nombre + ', Email: ' + email + '; '
    FROM deleted;

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('Usuario', 'Delete', @usuario, @detalle);
END;


---para las consultas select debe manejarse desde el SP que devuelve los datos al desarrollo
INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
VALUES ('Usuario', 'Select', SYSTEM_USER, 'Consulta realizada en la tabla Usuario');


CREATE TRIGGER Viaje_Insert
ON Viaje
AFTER INSERT
AS
BEGIN
    DECLARE @usuario NVARCHAR(100) = SYSTEM_USER;
    DECLARE @detalle NVARCHAR(MAX) = '';

    SELECT @detalle = @detalle + 'ID Viaje: ' + CAST(id_viaje AS NVARCHAR) + 
                      ', Tipo Viaje: ' + tipo_viaje + ', Origen: ' + ciudad_origen +
                      ', Destino: ' + ciudad_destino + '; '
    FROM inserted;

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('Viaje', 'Insert', @usuario, @detalle);
END;

CREATE TRIGGER Viaje_Update
ON Viaje
AFTER UPDATE
AS
BEGIN
    DECLARE @usuario NVARCHAR(100) = SYSTEM_USER;
    DECLARE @detalle NVARCHAR(MAX) = '';

    SELECT @detalle = @detalle + 'ID Viaje: ' + CAST(i.id_viaje AS NVARCHAR) + 
                      ', Tipo Viaje Anterior: ' + d.tipo_viaje + ', Nuevo Tipo Viaje: ' + i.tipo_viaje + 
                      ', Origen Anterior: ' + d.ciudad_origen + ', Nuevo Origen: ' + i.ciudad_origen + 
                      ', Destino Anterior: ' + d.ciudad_destino + ', Nuevo Destino: ' + i.ciudad_destino + '; '
    FROM inserted i
    INNER JOIN deleted d ON i.id_viaje = d.id_viaje;

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('Viaje', 'Update', @usuario, @detalle);
END;

CREATE TRIGGER Viaje_Delete
ON Viaje
AFTER DELETE
AS
BEGIN
    DECLARE @usuario NVARCHAR(100) = SYSTEM_USER;
    DECLARE @detalle NVARCHAR(MAX) = '';

    SELECT @detalle = @detalle + 'ID Viaje: ' + CAST(id_viaje AS NVARCHAR) + 
                      ', Tipo Viaje: ' + tipo_viaje + ', Origen: ' + ciudad_origen + 
                      ', Destino: ' + ciudad_destino + '; '
    FROM deleted;

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('Viaje', 'Delete', @usuario, @detalle);
END;

CREATE TRIGGER Hotel_Insert
ON Hotel
AFTER INSERT
AS
BEGIN
    DECLARE @usuario NVARCHAR(100) = SYSTEM_USER;
    DECLARE @detalle NVARCHAR(MAX) = '';

    SELECT @detalle = @detalle + 'ID Hotel: ' + CAST(id_hotel AS NVARCHAR) + 
                      ', Nombre: ' + nombre_hotel + ', Categoria: ' + CAST(categoria AS NVARCHAR) + 
                      ', Zona: ' + zona + '; '
    FROM inserted;

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('Hotel', 'Insert', @usuario, @detalle);
END;


CREATE TRIGGER Hotel_Update
ON Hotel
AFTER UPDATE
AS
BEGIN
    DECLARE @usuario NVARCHAR(100) = SYSTEM_USER;
    DECLARE @detalle NVARCHAR(MAX) = '';

    SELECT @detalle = @detalle + 'ID Hotel: ' + CAST(i.id_hotel AS NVARCHAR) +
                      ', Nombre Anterior: ' + d.nombre_hotel + ', Nuevo Nombre: ' + i.nombre_hotel + 
                      ', Categoria Anterior: ' + CAST(d.categoria AS NVARCHAR) + ', Nueva Categoria: ' + CAST(i.categoria AS NVARCHAR) + 
                      ', Zona Anterior: ' + d.zona + ', Nueva Zona: ' + i.zona + '; '
    FROM inserted i
    INNER JOIN deleted d ON i.id_hotel = d.id_hotel;

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('Hotel', 'Update', @usuario, @detalle);
END;


CREATE TRIGGER Hotel_Delete
ON Hotel
AFTER DELETE
AS
BEGIN
    DECLARE @usuario NVARCHAR(100) = SYSTEM_USER;
    DECLARE @detalle NVARCHAR(MAX) = '';

    SELECT @detalle = @detalle + 'ID Hotel: ' + CAST(id_hotel AS NVARCHAR) + 
                      ', Nombre: ' + nombre_hotel + ', Categoria: ' + CAST(categoria AS NVARCHAR) + 
                      ', Zona: ' + zona + '; '
    FROM deleted;

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('Hotel', 'Delete', @usuario, @detalle);
END;

CREATE TRIGGER Reserva_Insert
ON Reserva
AFTER INSERT
AS
BEGIN
    DECLARE @usuario NVARCHAR(100) = SYSTEM_USER;
    DECLARE @detalle NVARCHAR(MAX) = '';

    SELECT @detalle = @detalle + 'ID Reserva: ' + CAST(id_reserva AS NVARCHAR) +
                      ', ID Usuario: ' + CAST(id_usuario AS NVARCHAR) + ', Costo Total: ' + CAST(costo_total AS NVARCHAR) + '; '
    FROM inserted;

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('Reserva', 'Insert', @usuario, @detalle);
END;


CREATE TRIGGER Reserva_Update
ON Reserva
AFTER UPDATE
AS
BEGIN
    DECLARE @usuario NVARCHAR(100) = SYSTEM_USER;
    DECLARE @detalle NVARCHAR(MAX) = '';

    SELECT @detalle = @detalle + 'ID Reserva: ' + CAST(i.id_reserva AS NVARCHAR) +
                      ', ID Usuario: ' + CAST(i.id_usuario AS NVARCHAR) + 
                      ', Costo Total Anterior: ' + CAST(d.costo_total AS NVARCHAR) + ', Nuevo Costo Total: ' + CAST(i.costo_total AS NVARCHAR) + '; '
    FROM inserted i
    INNER JOIN deleted d ON i.id_reserva = d.id_reserva;

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('Reserva', 'Update', @usuario, @detalle);
END;

CREATE TRIGGER Reserva_Delete
ON Reserva
AFTER DELETE
AS
BEGIN
    DECLARE @usuario NVARCHAR(100) = SYSTEM_USER;
    DECLARE @detalle NVARCHAR(MAX) = '';

    SELECT @detalle = @detalle + 'ID Reserva: ' + CAST(id_reserva AS NVARCHAR) +
                      ', ID Usuario: ' + CAST(id_usuario AS NVARCHAR) + ', Costo Total: ' + CAST(costo_total AS NVARCHAR) + '; '
    FROM deleted;

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('Reserva', 'Delete', @usuario, @detalle);
END;


CREATE TRIGGER Vuelo_Insert
ON Vuelo
AFTER INSERT
AS
BEGIN
    DECLARE @usuario NVARCHAR(100) = SYSTEM_USER;
    DECLARE @detalle NVARCHAR(MAX) = '';

    SELECT @detalle = @detalle + 'ID Vuelo: ' + CAST(id_vuelo AS NVARCHAR) +
                      ', Tipo Aerolínea: ' + tipo_aerolinea + ', Escalas: ' + CAST(escalas AS NVARCHAR) +
                      ', Hora Salida: ' + hora_salida + ', Hora Llegada: ' + hora_llegada + '; '
    FROM inserted;

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('Vuelo', 'Insert', @usuario, @detalle);
END;


CREATE TRIGGER Vuelo_Update
ON Vuelo
AFTER UPDATE
AS
BEGIN
    DECLARE @usuario NVARCHAR(100) = SYSTEM_USER;
    DECLARE @detalle NVARCHAR(MAX) = '';

    SELECT @detalle = @detalle + 'ID Vuelo: ' + CAST(i.id_vuelo AS NVARCHAR) +
                      ', Aerolínea Anterior: ' + d.tipo_aerolinea + ', Nueva Aerolínea: ' + i.tipo_aerolinea + 
                      ', Escalas Anteriores: ' + CAST(d.escalas AS NVARCHAR) + ', Nuevas Escalas: ' + CAST(i.escalas AS NVARCHAR) + 
                      ', Hora Salida Anterior: ' + d.hora_salida + ', Nueva Hora Salida: ' + i.hora_salida + '; '
    FROM inserted i
    INNER JOIN deleted d ON i.id_vuelo = d.id_vuelo;

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('Vuelo', 'Update', @usuario, @detalle);
END;


CREATE TRIGGER Vuelo_Delete
ON Vuelo
AFTER DELETE
AS
BEGIN
    DECLARE @usuario NVARCHAR(100) = SYSTEM_USER;
    DECLARE @detalle NVARCHAR(MAX) = '';

    SELECT @detalle = @detalle + 'ID Vuelo: ' + CAST(id_vuelo AS NVARCHAR) +
                      ', Tipo Aerolínea: ' + tipo_aerolinea + ', Escalas: ' + CAST(escalas AS NVARCHAR) +
                      ', Hora Salida: ' + hora_salida + ', Hora Llegada: ' + hora_llegada + '; '
    FROM deleted;

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('Vuelo', 'Delete', @usuario, @detalle);
END;


CREATE TRIGGER Vehiculo_Insert
ON Vehiculo
AFTER INSERT
AS
BEGIN
    DECLARE @usuario NVARCHAR(100) = SYSTEM_USER;
    DECLARE @detalle NVARCHAR(MAX) = '';

    SELECT @detalle = @detalle + 'ID Vehiculo: ' + CAST(id_vehiculo AS NVARCHAR) +
                      ', Tipo: ' + tipo + ', Costo Día: ' + CAST(costo_dia AS NVARCHAR) + '; '
    FROM inserted;

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('Vehiculo', 'Insert', @usuario, @detalle);
END;


CREATE TRIGGER Vehiculo_Update
ON Vehiculo
AFTER UPDATE
AS
BEGIN
    DECLARE @usuario NVARCHAR(100) = SYSTEM_USER;
    DECLARE @detalle NVARCHAR(MAX) = '';

    SELECT @detalle = @detalle + 'ID Vehiculo: ' + CAST(i.id_vehiculo AS NVARCHAR) +
                      ', Tipo Anterior: ' + d.tipo + ', Nuevo Tipo: ' + i.tipo + 
                      ', Costo Día Anterior: ' + CAST(d.costo_dia AS NVARCHAR) + ', Nuevo Costo Día: ' + CAST(i.costo_dia AS NVARCHAR) + '; '
    FROM inserted i
    INNER JOIN deleted d ON i.id_vehiculo = d.id_vehiculo;

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('Vehiculo', 'Update', @usuario, @detalle);
END;


CREATE TRIGGER Vehiculo_Delete
ON Vehiculo
AFTER DELETE
AS
BEGIN
    DECLARE @usuario NVARCHAR(100) = SYSTEM_USER;
    DECLARE @detalle NVARCHAR(MAX) = '';

    SELECT @detalle = @detalle + 'ID Vehiculo: ' + CAST(id_vehiculo AS NVARCHAR) +
                      ', Tipo: ' + tipo + ', Costo Día: ' + CAST(costo_dia AS NVARCHAR) + '; '
    FROM deleted;

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('Vehiculo', 'Delete', @usuario, @detalle);
END;

CREATE TRIGGER Pago_Insert
ON Pago
AFTER INSERT
AS
BEGIN
    DECLARE @usuario NVARCHAR(100) = SYSTEM_USER;
    DECLARE @detalle NVARCHAR(MAX) = '';

    SELECT @detalle = @detalle + 'ID Pago: ' + CAST(id_pago AS NVARCHAR) +
                      ', ID Reserva: ' + CAST(id_reserva AS NVARCHAR) + 
                      ', Método Pago: ' + metodo_pago + ', Estado Pago: ' + estado_pago + '; '
    FROM inserted;

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('Pago', 'Insert', @usuario, @detalle);
END;


CREATE TRIGGER Pago_Update
ON Pago
AFTER UPDATE
AS
BEGIN
    DECLARE @usuario NVARCHAR(100) = SYSTEM_USER;
    DECLARE @detalle NVARCHAR(MAX) = '';

    SELECT @detalle = @detalle + 'ID Pago: ' + CAST(i.id_pago AS NVARCHAR) +
                      ', Método Pago Anterior: ' + d.metodo_pago + ', Nuevo Método Pago: ' + i.metodo_pago + 
                      ', Estado Pago Anterior: ' + d.estado_pago + ', Nuevo Estado Pago: ' + i.estado_pago + '; '
    FROM inserted i
    INNER JOIN deleted d ON i.id_pago = d.id_pago;

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('Pago', 'Update', @usuario, @detalle);
END;

CREATE TRIGGER Pago_Delete
ON Pago
AFTER DELETE
AS
BEGIN
    DECLARE @usuario NVARCHAR(100) = SYSTEM_USER;
    DECLARE @detalle NVARCHAR(MAX) = '';

    SELECT @detalle = @detalle + 'ID Pago: ' + CAST(id_pago AS NVARCHAR) +
                      ', ID Reserva: ' + CAST(id_reserva AS NVARCHAR) + 
                      ', Método Pago: ' + metodo_pago + ', Estado Pago: ' + estado_pago + '; '
    FROM deleted;

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('Pago', 'Delete', @usuario, @detalle);
END;

-- Trigger para INSERT en ContactoEmergencia
CREATE TRIGGER Insert_ContactoEmergencia
ON ContactoEmergencia
AFTER INSERT
AS
BEGIN
    DECLARE @Usuario NVARCHAR(100), @Detalle NVARCHAR(MAX);
    SELECT @Usuario = (SELECT email FROM Usuario WHERE id_usuario = (SELECT id_usuario FROM inserted));
    SET @Detalle = 'Contacto de emergencia agregado para el usuario: ' + @Usuario;

    INSERT INTO Auditoria (nombre_tabla, tipo_transaccion, usuario, detalle)
    VALUES ('ContactoEmergencia', 'INSERT', @Usuario, @Detalle);
END;
