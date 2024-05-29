---cree base de datos de amazon
CREATE DATABASE Amazon
-- despues de intetar crear una tabla e importar los datos por una ruta de archivo y que no funcionara decidi darle clicK
--derecho sobre la base de datos creada y luego en tasks coloque import flat file

---CONSULTAS DE EXPLORACION DE DATOS
select count(*) as cantidad, [name] from dbo.products group by [name] order by cantidad desc
-- consulta para saber cuantos 0 hay en index
select * from dbo.products where [index] = '0'
-- consulta para saber cuantas filas tengo
select count(*) as total_filas
from dbo.movements

---Con esta consulta puedo observar cuantas veces se repite un nombre

SELECT  [name],
    COUNT(*) as cantidad
FROM  dbo.movements
GROUP BY  [name]
HAVING   COUNT(*) > 1;

--- Despues de observar los nombres que se repiten hago consultas especificas para ver si los campos de actual_price , descount_price
--- Link e imagen coinciden para el mismo producto

--- Caso 1
	SELECT * 
	FROM movements
    WHERE [name] = 'Swastik Jewellers 22KT Yellow Gold Mangalsutra for Women';
--- En este caso podemos observar que de los 53 productos ninguno de los campos de actual_price y discount_price coinciden el link y
--- la imagen tampoco coinciden en ninguno de los casos.

--- Caso 2
	SELECT *
    FROM movements
    WHERE [name] = 'U-TURN Men''s Cotton Solid Half Sleeve Combo Pack Shirts';
--- Ninguno de las columnas coincide para el mismo producto

--- Caso 3
	SELECT *
    FROM movements
    WHERE [name] = 'Spunk Flyknit Mesh Slip-on Walking Shoe';
--- En este caso el precio y el decuento es el mismo para todas las filas, pero el link y la imagen son diferentes.

--- Caso 4	
	SELECT *
    FROM movements
    WHERE [name] = 'Levi''s Women''s 710 Super Skinny Fit Jeans';
--- En este caso vemos que los parametros no coinciden para el mismo producto

--- Caso 5
	SELECT *
    FROM movements
    WHERE [name] = 'Pinkmint Women Fashion Vest';
--- En este observamos que los links y las imagenes de un mismo producto son diferentes y que el descuento es el mismo para todos, el 
--- el actual_price tiene 4 valores que se repiten en las 27 filas.


--tabla categoria
CREATE TABLE dbo.categories (
    id_sub_category BIGINT IDENTITY(1,1) PRIMARY KEY,
    sub_category VARCHAR(255),
    main_category VARCHAR(255)
);
--tabla productos
CREATE TABLE dbo.products (
    id_product BIGINT PRIMARY KEY identity(1,1),
    [name] VARCHAR(255)
);
--llenado tabla producto
insert into dbo.products ([name]) 
select distinct([name]) from dbo.movements
--llenado tabla categories
insert into dbo.categories(sub_category, main_category) 
select distinct(sub_category), main_category from dbo.movements order by sub_category

--- Creo la tabla Master
CREATE TABLE dbo.central (
    id_central BIGINT PRIMARY KEY IDENTITY (1,1),
    id_product BIGINT ,
    id_sub_category BIGINT ,
    link TEXT,
    imagen TEXT,
    ratings DECIMAL(10, 2),
    no_of_ratings BIGINT,
    actual_price DECIMAL(18, 2),
    discount_price DECIMAL(18, 2)
);
--- Inserto valores a la tabla
INSERT INTO dbo.central (link, imagen, ratings, no_of_ratings, actual_price, discount_price)
SELECT DISTINCT link, image, ratings, no_of_ratings, actual_price, discount_price
FROM dbo.movements;

--- Defino claves foraneas
--- clave foranea id tabla producto
ALTER TABLE dbo.central
ADD CONSTRAINT fk_id_product
FOREIGN KEY (id_product) REFERENCES dbo.products(id_product);

--- Clave foranea id tabla categories
ALTER TABLE dbo.central
ADD CONSTRAINT fk_id_sub_category
FOREIGN KEY (id_sub_category) REFERENCES dbo.categories(id_sub_category);

--- inserto valores id_products
INSERT INTO dbo.central(id_product)
SELECT DISTINCT id_product
FROM dbo.products;

--- inserto valores id_sub_category
INSERT INTO dbo.central(id_sub_category)
SELECT DISTINCT id_sub_category
FROM dbo.categories;




/*
ALTER TABLE dbo.movements
ADD id_sub_category BIGINT;

ALTER TABLE Product
ADD CONSTRAINT FK_Product_Categories
FOREIGN KEY (id_sub_category) REFERENCES Categories(id_sub_category);
*/