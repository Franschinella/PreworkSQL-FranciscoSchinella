/* ## Ejercicio 2
Nivel de dificultad: Fácil
1. Crea una base de datos llamada "MiBaseDeDatos". */
CREATE DATABASE MiBaseDeDatos;
\c MiBaseDeDatos;

/* 2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "edad" (entero). */
CREATE TABLE IF NOT EXISTS usuarios (
    id serial PRIMARY KEY,
    name text,
    edad integer
);

/* 3. Inserta dos registros en la tabla "Usuarios". */
INSERT INTO public.usuarios (name, edad)
VALUES
    ('Francisco', 25),
    ('Julio', 30);

/* 4. Actualiza la edad de un usuario en la tabla "Usuarios". */
UPDATE public.usuarios
SET edad = 28
WHERE name = 'Francisco';

/* 5. Elimina un usuario de la tabla "Usuarios". */
DELETE FROM public.usuarios
WHERE name = 'Julio';

/* Nivel de dificultad: Moderado
1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "pais" (texto). */
CREATE TABLE IF NOT EXISTS ciudades (
    id serial PRIMARY KEY,
    name text,
    pais text
);

/* 2. Inserta al menos tres registros en la tabla "Ciudades". */
INSERT INTO public.ciudades (name, pais)
VALUES
    ('La Plata', 'Argentina'),
    ('Valencia', 'España'),
    ('Ámsterdam', 'Paises Bajos');

/* 3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id" de la tabla "Ciudades". */
ALTER TABLE public.usuarios
ADD COLUMN ciudad_id integer,
ADD CONSTRAINT fk_ciudad
    FOREIGN KEY (ciudad_id)
    REFERENCES public.ciudades (id);

/* 4. Realiza una consulta que muestre los nombres de los usuarios junto con el nombre de su ciudad y país (utiliza un LEFT JOIN). */
SELECT Usuarios.name, Ciudades.name AS ciudad, Ciudades.pais
FROM public.usuarios
LEFT JOIN Ciudades ON Usuarios.ciudad_id = Ciudades.id;

/* 5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad asociada (utiliza un INNER JOIN).*/
SELECT Usuarios.name, Ciudades.name AS ciudad, Ciudades.pais
FROM public.usuarios
INNER JOIN Ciudades ON Usuarios.ciudad_id = Ciudades.id;