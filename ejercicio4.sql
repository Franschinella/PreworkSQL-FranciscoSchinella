/* ## Ejercicio 4
Nivel de dificultad: Experto
1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y "id_producto" (entero, clave foránea de la tabla "Productos"). */
CREATE TABLE IF NOT EXISTS Pedidos (
    id serial PRIMARY KEY,
    id_usuario integer REFERENCES Usuarios(id),
    id_producto integer REFERENCES Productos(id)
);

/* 2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con productos. */
INSERT INTO public.pedidos (id_usuario, id_producto)
VALUES
    (1, 1),
    (2, 2),
    (3, 3);

/* 3. Realiza una consulta que muestre los nombres de los usuarios y los nombres de los productos que han comprado, incluidos aquellos que no han realizado ningún pedido (utiliza LEFT JOIN y COALESCE). */
SELECT U.name AS nombre_usuario, COALESCE(P.name, 'Ningún pedido') AS nombre_producto
FROM public.usuarios U
LEFT JOIN public.pedidos P ON U.id = P.id_usuario;

/* 4. Realiza una consulta que muestre los nombres de los usuarios que han realizado un pedido, pero también los que no han realizado ningún pedido (utiliza LEFT JOIN). */
SELECT U.name AS nombre_usuario, P.id_producto
FROM public.usuarios U
LEFT JOIN public.pedidos P ON U.id = P.id_usuario;

/* 5. Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza los registros existentes con un valor (utiliza ALTER TABLE y UPDATE) */
ALTER TABLE Pedidos
ADD COLUMN cantidad integer;

UPDATE public.pedidos
SET cantidad = 1;