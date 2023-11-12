/* ## Ejercicio 3
Nivel de dificultad: Difícil
1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "precio" (numérico). */
CREATE TABLE IF NOT EXISTS productos (
    id serial PRIMARY KEY,
    name text,
    precio numeric
);

/* 2. Inserta al menos cinco registros en la tabla "Productos". */
INSERT INTO public.productos (name, precio)
VALUES
    ('Libreta', 19.99),
    ('Pintura', 29.99),
    ('Caballete', 39.99),
    ('Pincel', 49.99),
    ('Adobe', 59.99);

/* 3. Actualiza el precio de un producto en la tabla "Productos".*/
UPDATE public.productos
SET precio = 24.99
WHERE name = 'Pincel';

/* 4. Elimina un producto de la tabla "Productos". */
DELETE FROM public.productos
WHERE name = 'Pintura';

/* 5. Realiza una consulta que muestre los nombres de los usuarios junto con los nombres de los productos que han comprado (utiliza un INNER JOIN con la tabla "Productos"). */
CREATE TABLE IF NOT EXISTS usuarios (
    id serial PRIMARY KEY,
    name text,
    compra text
);

INSERT INTO public.usuarios (name, compra)
VALUES
    ('Francisco', 'Caballete'),

SELECT usuarios.name AS productos.name
FROM public.usuarios
INNER JOIN productos ON usuarios.usuario_id = productos.usuarios_id;