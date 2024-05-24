---cree base de datos de amazon
CREATE DATABASE Amazon
-- despues de intetar crear una tabla e importar los datos por una ruta de archivo y que no funcionara decidi darle clicK
--derecho sobre la base de datos creada y luego en tasks coloque import flat file

---CONSULTAS DE EXPLORACION DE DATOS
select count(*) as cantidad, [name] from dbo.products group by [name] order by cantidad desc
-- consulta para saber cuantos 0 hay en index
select * from dbo.movements where [index] = '0'
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

--- CREACION DE TABLAS

--tabla categoria
CREATE TABLE dbo.categories (
    id_sub_category BIGINT IDENTITY(1,1) PRIMARY KEY,
    sub_category VARCHAR(255),
    main_category VARCHAR(255)
);
SELECT * FROM dbo.categories;

--tabla productos
CREATE TABLE dbo.products (
    id_product BIGINT PRIMARY KEY identity(1,1),
    [name] VARCHAR(255)
);
SELECT * FROM dbo.products;

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
SELECT * FROM dbo.central;

--- Inserto valores a la tabla
INSERT INTO dbo.central (id_product, id_sub_category, link, imagen, ratings, no_of_ratings, actual_price, discount_price)
select id_product , id_sub_category, link, [image], ratings, no_of_ratings, actual_price, discount_price
from dbo.movements as m
join dbo.products as p on p.name = m.name
join dbo.categories as c on c.sub_category = m.sub_category

SELECT *
FROM dbo.central;
--- Defino claves foraneas
--- clave foranea id tabla producto
ALTER TABLE dbo.central
ADD CONSTRAINT fk_id_product
FOREIGN KEY (id_product) REFERENCES dbo.products(id_product);

--- Clave foranea id tabla categories
ALTER TABLE dbo.central
ADD CONSTRAINT fk_id_sub_category
FOREIGN KEY (id_sub_category) REFERENCES dbo.categories(id_sub_category);


---Proceso Almacenado
CREATE PROCEDURE sp_ActualizarTablas
AS
BEGIN
    SET XACT_ABORT, NOCOUNT ON;
    BEGIN TRANSACTION;

    DECLARE @id_product INT;
    DECLARE @id_sub_category INT;

    DECLARE movement_cursor CURSOR FOR
    SELECT name, main_category, sub_category, link, [image], ratings, no_of_ratings, discount_price, actual_price
    FROM dbo.movements;

    OPEN movement_cursor;

    DECLARE @name VARCHAR(max), @main_category VARCHAR(max), @sub_category VARCHAR(max), 
            @link VARCHAR(MAX), @imagen VARCHAR(MAX), @ratings FLOAT, 
            @no_of_ratings BIGINT, @descount_price DECIMAL(18, 2), @actual_price DECIMAL(18, 2);

    FETCH NEXT FROM movement_cursor INTO @name, @main_category, @sub_category, @link, @imagen, 
                                           @ratings, @no_of_ratings, @descount_price, @actual_price;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        IF EXISTS (SELECT 1 FROM dbo.products WHERE name = @name)
        BEGIN
            SELECT @id_product = id_product FROM dbo.products WHERE name = @name;
        END
        ELSE
        BEGIN
            INSERT INTO dbo.products (name) VALUES (@name);
            SELECT @id_product = SCOPE_IDENTITY();
        END

        IF EXISTS (SELECT 1 FROM dbo.categories WHERE sub_category = @sub_category)
        BEGIN
            SELECT @id_sub_category = id_sub_category FROM dbo.categories WHERE sub_category = @sub_category;
        END
        ELSE
        BEGIN
            INSERT INTO dbo.categories (sub_category, main_category) VALUES (@sub_category, @main_category);
            SELECT @id_sub_category = SCOPE_IDENTITY();
        END

        INSERT INTO dbo.central (id_product, id_sub_category, link, imagen, ratings, no_of_ratings, discount_price, actual_price)
        VALUES (@id_product, @id_sub_category, @link, @imagen, @ratings, @no_of_ratings, @descount_price, @actual_price);

        FETCH NEXT FROM movement_cursor INTO @name, @main_category, @sub_category, @link, @imagen, 
                                               @ratings, @no_of_ratings, @descount_price, @actual_price;
    END

    CLOSE movement_cursor;
    DEALLOCATE movement_cursor;

    COMMIT TRANSACTION;
END;


