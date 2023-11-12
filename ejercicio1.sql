/* ## Ejercicio 1
1. Crear una tabla llamada "Clientes" con las columnas: id (entero, clave primaria), nombre (texto) y email (texto).
2. Insertar un nuevo cliente en la tabla "Clientes" con id=1, nombre="Juan" y email="juan@example.com". */
CREATE TABLE IF NOT EXISTS Clientes (
	id INT PRIMARY KEY,
	name VARCHAR (255) NOT NULL,
	email VARCHAR (255)
)
INSERT INTO public.clientes (id, name, email)
VALUES (1, 'Juan', 'juan@example.com');

/* 3. Actualizar el email del cliente con id=1 a "juan@gmail.com". */
UPDATE public.clientes
SET email = 'juan@gmail.com'
WHERE id = 1;

/* 4. Eliminar el cliente con id=1 de la tabla "Clientes". */
DELETE FROM public.clientes
WHERE id = 1;

/* 5. Crear una tabla llamada "Pedidos" con las columnas: id (entero, clave primaria), cliente_id (entero, clave externa referenciando a la tabla "Clientes"), producto (texto) y cantidad (entero).
6. Insertar un nuevo pedido en la tabla "Pedidos" con id=1, cliente_id=1, producto="Camiseta" y cantidad=2. */
CREATE TABLE IF NOT EXISTS Pedidos (
    id INT PRIMARY KEY,
    cliente_id INT REFERENCES public.clientes(id),
    producto VARCHAR (255),
    cantidad INT
);
INSERT INTO public.pedidos (id, cliente_id, producto, cantidad)
VALUES (1, 1, 'Camiseta', 2);

/* 7. Actualizar la cantidad del pedido con id=1 a 3. */
UPDATE public.pedidos
SET cantidad = 3
WHERE id = 1;

/* 8. Eliminar el pedido con id=1 de la tabla "Pedidos". */
DELETE FROM public.pedidos
WHERE id = 1;

/* 9. Crear una tabla llamada "Productos" con las columnas: id (entero, clave primaria), nombre (texto) y precio (decimal).
10. Insertar varios productos en la tabla "Productos" con diferentes valores. */
CREATE TABLE IF NOT EXISTS Productos (
    id INT PRIMARY KEY,
    name VARCHAR (255),
    precio decimal
);
INSERT INTO public.productos (name, precio)
VALUES
    ('Sueter', 19.99),
    ('Camiseta', 29.99),
    ('Botas', 39.99),
    ('Bolsa', 49.99),
    ('Gafas', 59.99);

/* 11. Consultar todos los clientes de la tabla "Clientes". */
SELECT * FROM public.clientes;

/* 12. Consultar todos los pedidos de la tabla "Pedidos" junto con los nombres de los clientes correspondientes. */
SELECT Pedidos.id, Clientes.name AS name_cliente, Pedidos.producto, Pedidos.cantidad
FROM public.pedidos
JOIN public.clientes ON Pedidos.cliente_id = Clientes.id;

/* 13. Consultar los productos de la tabla "Productos" cuyo precio sea mayor a $50. */
SELECT * FROM public.productos
WHERE precio > 50;

/* 14. Consultar los pedidos de la tabla "Pedidos" que tengan una cantidad mayor o igual a 5. */
SELECT * FROM public.pedidos
WHERE cantidad >= 5;

/* 15. Consultar los clientes de la tabla "Clientes" cuyo nombre empiece con la letra "A". */
SELECT * FROM public.clientes
WHERE name LIKE 'A%';

/* 16. Realizar una consulta que muestre el nombre del cliente y el total de pedidos realizados por cada cliente. */
SELECT Clientes.name, COUNT(Pedidos.id) AS total_pedidos
FROM public.clientes
LEFT JOIN Pedidos ON Clientes.id = Pedidos.cliente_id
GROUP BY Clientes.name;

/* 17. Realizar una consulta que muestre el nombre del producto y la cantidad total de pedidos de ese producto. */
SELECT Productos.name, COALESCE(SUM(Pedidos.cantidad), 0) AS total_pedidos
FROM public.productos
LEFT JOIN Pedidos ON Productos.name = Pedidos.producto
GROUP BY Productos.name;

/* 18. Agregar una columna llamada "fecha" a la tabla "Pedidos" de tipo fecha. */
ALTER TABLE public.pedidos
ADD COLUMN fecha DATE;

/* 19. Agregar una clave externa a la tabla "Pedidos" que haga referencia a la tabla "Productos" en la columna "producto". */
ALTER TABLE public.pedidos
ADD CONSTRAINT fk_producto
FOREIGN KEY (producto) REFERENCES Productos(name);

/* 20. Realizar una consulta que muestre los nombres de los clientes, los nombres de los productos y las cantidades de los pedidos donde coincida la clave externa. */
SELECT Clientes.name AS nombre_cliente, Pedidos.producto, Pedidos.cantidad
FROM public.pedidos
JOIN public.clientes ON Pedidos.cliente_id = Clientes.id;