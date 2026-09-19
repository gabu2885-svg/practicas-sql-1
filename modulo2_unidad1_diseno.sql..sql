DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS productos;


-- ============================================
-- TABLA: CLIENTES
-- ============================================

CREATE TABLE clientes (

    -- INTEGER: se utiliza para identificar al cliente
    -- mediante un número entero.
    -- PRIMARY KEY garantiza que cada cliente tenga
    -- un identificador único.
    id_cliente INTEGER PRIMARY KEY,

    -- VARCHAR(100): permite almacenar el nombre
    -- utilizando hasta 100 caracteres.
    nombre VARCHAR(100),

    -- TEXT: se utiliza para almacenar una biografía
    -- o notas de longitud variable.
    perfil_bio TEXT,

    -- DATE: permite almacenar únicamente la fecha
    -- de registro, sin necesidad de almacenar la hora.
    fecha_registro DATE
);


-- ============================================
-- TABLA: PRODUCTOS
-- ============================================

CREATE TABLE productos (

    -- INTEGER: se utiliza para identificar al producto
    -- mediante un número entero.
    -- PRIMARY KEY garantiza que cada producto tenga
    -- un identificador único.
    id_producto INTEGER PRIMARY KEY,

    -- VARCHAR(255): permite almacenar una descripción
    -- de hasta 255 caracteres.
    descripcion VARCHAR(255),

    -- NUMERIC(10,2): se utiliza para representar precios
    -- de manera precisa, evitando los problemas de precisión
    -- que pueden producirse con FLOAT.
    -- Permite hasta 10 dígitos en total y 2 decimales.
    precio NUMERIC(10,2),

    -- BOOLEAN: permite representar si el producto está
    -- disponible (TRUE) o no disponible (FALSE).
    esta_activo BOOLEAN
);




