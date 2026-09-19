-- ══════════════════════════════════════════════════════
-- BodegaTech — Script de Inventario
-- Autor: Gabriela Almiron
-- Práctica: DDL y DML en SQL
-- ══════════════════════════════════════════════════════


-- ══════════════════════════════════════════════════════
-- SECCIÓN DDL — DEFINIENDO LA ESTRUCTURA
-- ══════════════════════════════════════════════════════

-- Paso 1: eliminar la tabla si ya existe.
-- Esto permite volver a ejecutar el script sin errores.
DROP TABLE IF EXISTS inventario;


-- Paso 2: crear la tabla inventario.

CREATE TABLE inventario (
    
    -- INTEGER: permite almacenar números enteros.
    -- Se utiliza como identificador único del producto.
    -- PRIMARY KEY garantiza que no existan IDs duplicados.
    id_producto INTEGER PRIMARY KEY,

    -- VARCHAR(100): permite almacenar nombres de productos
    -- de hasta 100 caracteres.
    nombre_producto VARCHAR(100),

    -- VARCHAR(50): permite almacenar categorías
    -- de hasta 50 caracteres.
    categoria VARCHAR(50),

    -- DECIMAL(10,2): permite almacenar precios con
    -- hasta 10 dígitos en total y 2 decimales.
    -- Se utiliza DECIMAL porque es apropiado para valores
    -- monetarios y evita problemas de precisión de FLOAT.
    precio_unitario DECIMAL(10,2),

    -- INTEGER: permite almacenar cantidades enteras.
    -- Se utiliza para representar las unidades disponibles.
    stock_actual INTEGER,

    -- INTEGER: representa la cantidad mínima de unidades
    -- que debe mantenerse antes de realizar una reposición.
    stock_minimo INTEGER,

    -- DATE: almacena únicamente la fecha de ingreso
    -- del producto al inventario.
    fecha_ingreso DATE,

    -- SMALLINT: en PostgreSQL no existe TINYINT(1).
    -- Se utiliza 1 para activo y 0 para inactivo.
    -- CHECK garantiza que solamente puedan utilizarse
    -- los valores 0 y 1.
    activo SMALLINT CHECK (activo IN (0,1))
);


-- ══════════════════════════════════════════════════════
-- SECCIÓN DML — CARGA Y ACTUALIZACIÓN DE DATOS
-- ══════════════════════════════════════════════════════


-- Paso 3: cargar los 10 productos iniciales.

INSERT INTO inventario
    (id_producto, nombre_producto, categoria, precio_unitario,
     stock_actual, stock_minimo, fecha_ingreso, activo)
VALUES
    (1, 'Laptop Pro 15', 'Computación', 1200.00, 15, 3, '2024-01-10', 1),
    (2, 'Mouse Inalámbrico', 'Accesorios', 28.00, 80, 10, '2024-01-10', 1),
    (3, 'Monitor 4K 27"', 'Computación', 450.00, 12, 2, '2024-01-15', 1),
    (4, 'Teclado Mecánico', 'Accesorios', 95.00, 40, 5, '2024-01-15', 1),
    (5, 'Laptop Basic 14', 'Computación', 650.00, 20, 3, '2024-02-01', 1),
    (6, 'Auriculares BT Pro', 'Audio', 120.00, 35, 5, '2024-02-01', 1),
    (7, 'Hub USB-C 7 puertos', 'Accesorios', 45.00, 60, 10, '2024-02-10', 1),
    (8, 'Webcam HD 1080p', 'Accesorios', 85.00, 25, 5, '2024-02-10', 1),
    (9, 'SSD Externo 1TB', 'Almacenamiento', 130.00, 18, 3, '2024-03-01', 1),
    (10, 'Parlante Bluetooth', 'Audio', 60.00, 45, 8, '2024-03-01', 1);


-- ══════════════════════════════════════════════════════
-- UPDATE — REGISTRO DE VENTAS DEL DÍA
-- ══════════════════════════════════════════════════════


-- Laptop Pro 15: se vendieron 3 unidades.
-- Stock inicial: 15
-- Stock final: 12

UPDATE inventario
SET stock_actual = stock_actual - 3
WHERE id_producto = 1;


-- Mouse Inalámbrico: se vendieron 12 unidades.
-- Stock inicial: 80
-- Stock final: 68

UPDATE inventario
SET stock_actual = stock_actual - 12
WHERE id_producto = 2;


-- Auriculares BT Pro: se vendieron 5 unidades.
-- Stock inicial: 35
-- Stock final: 30

UPDATE inventario
SET stock_actual = stock_actual - 5
WHERE id_producto = 6;


-- ══════════════════════════════════════════════════════
-- UPDATE — PRODUCTO DESCONTINUADO
-- ══════════════════════════════════════════════════════

-- La Webcam HD 1080p fue descontinuada por el proveedor.
-- Se cambia activo de 1 (activo) a 0 (inactivo).

UPDATE inventario
SET activo = 0
WHERE id_producto = 8;


-- ══════════════════════════════════════════════════════
-- SELECT — VALIDACIÓN
-- ══════════════════════════════════════════════════════

-- Mostrar la tabla completa para comprobar que
-- la carga y las actualizaciones fueron realizadas.
SELECT * FROM inventario;