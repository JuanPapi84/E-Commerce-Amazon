<p align="center">
  <img src="imagenes/logo.webp" alt="Descripción opcional del logo" width="200" height="200">
</p>

# DATAGEEKS

## Precios y Popularidad de Productos en Amazon
Este proyecto, titulado "Precios y Popularidad de Productos en Amazon", surge como respuesta a la necesidad de comprender las dinámicas fundamentales que impulsan el éxito en el comercio electrónico, particularmente en la plataforma líder, Amazon. Como consultores de datos de "DataGeeks & Coffee", nos hemos propuesto analizar en profundidad el comportamiento de los productos en esta plataforma, con el objetivo de proporcionar insights valiosos tanto para los vendedores como para los consumidores.

### Descripción del Problema

El crecimiento exponencial del comercio electrónico ha puesto de relieve la importancia de comprender las tendencias de precios, descuentos y popularidad de los productos. Esta comprensión es crucial para que los vendedores optimicen sus estrategias de precios y promociones, y para que los consumidores encuentren productos de alta calidad a precios competitivos.

### Soluciones Propuestas

Nuestro proyecto aborda este desafío mediante:

Análisis de Precios y Descuentos: Identificando las mejores ofertas y productos con la mejor relación calidad-precio.
Insights de Popularidad: Identificando los productos más populares y mejor valorados.
Recomendaciones Estratégicas: Ofreciendo recomendaciones para ajustar estrategias de precios y promociones.
Dashboard Interactivo: Desarrollando un dashboard intuitivo para explorar datos y obtener insights personalizados.

### Valor Agregado

Nos destacamos por nuestra accesibilidad, enfoque integral, personalización y detalle, así como por la innovación en visualización de datos.

### Resultados Esperados e Impacto

Esperamos mejorar las estrategias de precios y promociones, así como la experiencia del consumidor, aumentar la transparencia y eficiencia del comercio electrónico, y empoderar a los pequeños y medianos vendedores.

### Fuentes de Datos y Plan de Análisis

Utilizaremos el dataset "Amazon Products Sales Dataset 2023" para realizar tareas de limpieza, análisis exploratorio, análisis correlacional, segmentación de productos y elaboración de informes.

## Técnicas y Herramientas

Nuestras herramientas incluyen Python, Matplotlib, Seaborn, Power BI, SQL Server y GitHub, entre otras.

Este proyecto aspira a transformar datos en insights accionables para mejorar el comercio electrónico en Amazon y beneficiar a vendedores y consumidores por igual.

## Dataset: Amazon Products Sales Dataset 2023

Este dataset proporciona detalles sobre más de 300K productos de Amazon, divididos en 142 categorías. Puedes encontrar el dataset en el siguiente enlace: [Amazon Products Sales Dataset 2023](https://www.kaggle.com/datasets/lokeshparab/amazon-products-dataset).

### Acerca del Dataset

Este conjunto de datos es un raspado de ventas de productos del sitio web de Amazon. Los datos de los productos están separados por 142 categorías en formato CSV, junto con el nombre completo del conjunto de datos, "Amazon-Products.csv". Cada archivo CSV consta de 10 columnas y cada fila tiene detalles de productos correspondientes.

#### Características

- **name**: El nombre del producto.
- **main_category**: La categoría principal a la que pertenece el producto.
- **sub_category**: La subcategoría a la que pertenece el producto.
- **image**: La imagen del producto.
- **link**: El enlace de referencia del sitio web de Amazon para el producto.
- **ratings**: Las calificaciones otorgadas por los clientes de Amazon al producto.
- **no of ratings**: El número de calificaciones otorgadas a este producto en Amazon.
- **discount_price**: El precio de descuento del producto.
- **actual_price**: El precio real de venta sugerido del producto.

## Tratamiento de Datos Nulos
1. **Importar bibliotecas y cargar datos**: Utilizar bibliotecas como numpy, pandas y matplotlib/seaborn para cargar el conjunto de datos de Amazon.

2. **Manejo de datos faltantes**: Identificar y manejar los valores faltantes en el conjunto de datos. Esto puede implicar el relleno de valores faltantes, eliminación de filas o columnas con datos faltantes, o imputación de valores basados en otras características.
## SQL
1.**Creacion de bases de datos y carga de datos**: Recepcionados los datos en un documento .csv, procedimos a su importacion.

2.**Analisis exploratorio**: Analisis acerca del contenido de las columnas, relacion  y correlacion de los datos.

3.**Creacion de tablas**: Creamos tablas adicionales para un perfecto orden y rendimiento de los datos, y obtuvimos un diagrama relacional.

4.**Automatizacion**: Realizamos una automatizacion en la carga de datos.

## EDA
### Plan de Análisis Exploratorio de Datos (EDA)

El Análisis Exploratorio de Datos (EDA) es fundamental para comprender la naturaleza y la distribución de los datos antes de aplicar cualquier modelo predictivo o análisis más avanzado. A continuación, se presenta el paso a paso para llevar a cabo el EDA en el proyecto:

1. **Exploración de datos básica**: Realizar un primer vistazo a los datos mediante funciones como `head()`, `info()`, `describe()` para comprender la estructura del conjunto de datos, tipos de datos, estadísticas descriptivas, etc.

2. **Análisis univariado**: Analizar cada variable individualmente para comprender su distribución, tendencias, valores atípicos y estadísticas resumidas.

3. **Análisis multivariado**: Explorar las relaciones entre variables mediante técnicas como gráficos de dispersión combinados con gráficos regresión lineal. Esto puede ayudar a identificar patrones, correlaciones y posibles asociaciones entre las variables.

4. **Visualización de datos**: Utilizar bibliotecas de visualización como Matplotlib y Seaborn para crear gráficos informativos y visualizaciones que ayuden a comprender mejor los datos. Esto puede incluir histogramas, diagramas de dispersión, gráficos de barras, etc.

5. **Identificación de patrones y tendencias**: Buscar patrones, tendencias o anomalías en los datos que puedan proporcionar información útil para la toma de decisiones en el análisis posterior.

6. **Resumen de hallazgos**: Recapitular los hallazgos más importantes del análisis exploratorio de datos y cualquier insight relevante que pueda surgir del proceso.

Este proceso de EDA proporciona una base sólida para el análisis posterior y la toma de decisiones en el proyecto de "Precios y Popularidad de Productos en Amazon".

# Proyecto de Dashboard en Power BI para Amazon

Este proyecto detalla el proceso de creación de un dashboard en Power BI utilizando datos de una base de datos de SQL Server. El dashboard incluye análisis detallados por categoría, subcategoría, fabricante, rating y producto, así como una hoja resumen con información general sobre la base de datos.

## Tabla de Contenidos

- [Diseño del Mockup](#diseño-del-mockup)
- [Conexión a la Base de Datos](#conexión-a-la-base-de-datos)
- [Limpieza de Datos](#limpieza-de-datos)
- [Creación del Dashboard](#creación-del-dashboard)
  - [Portada](#portada)
  - [Análisis por Categoría](#análisis-por-categoría)
  - [Análisis por Subcategoría](#análisis-por-subcategoría)
  - [Análisis por Fabricante](#análisis-por-fabricante)
  - [Análisis por Rating](#análisis-por-rating)
  - [Análisis por Producto](#análisis-por-producto)
  - [Información General](#información-general)
- [Conclusiones](#conclusiones)

## Diseño del Mockup

1. *Herramienta utilizada*: Google Slides.
2. *Colores corporativos*: Utilicé los colores oficiales de Amazon:
   - Naranja (#FF9900)
   - Negro (#000000)
   - Blanco (#FFFFFF)
3. *Estructura del mockup*:
   - Una diapositiva para cada hoja del dashboard, detallando la disposición de gráficos y elementos.

## Conexión a la Base de Datos

1. *Fuente de datos*: SQL Server.
2. *Configuración de la conexión*:
   - Abrir Power BI.
   - Seleccionar "Obtener datos" > "SQL Server".
   - Ingresar los detalles del servidor y la base de datos.

## Limpieza de Datos

1. *Problema detectado*: Algunos valores en las columnas tenían números irracionales.
2. *Proceso de corrección*:
   - Usé el Editor de Consultas de Power BI.
   - Realicé transformaciones para corregir los datos anómalos.

## Creación del Dashboard

### Portada

1. *Contenido*:
   - Título del proyecto.
   - Botones de navegación para acceder a las diferentes hojas del dashboard.
2. *Elementos visuales*:
   - Logotipo de Amazon.
   - Botones interactivos.

### Análisis por Categoría

1. *Contenido*:
   - Gráficos que muestran el análisis de productos agrupados por categoría.
2. *Tipo de gráficos*:
   - Barras.
   - Líneas.
   - Columnas.

### Análisis por Subcategoría

1. *Contenido*:
   - Gráficos que muestran el análisis de productos agrupados por subcategoría.
2. *Tipo de gráficos*:
   - Barras.
   - Líneas.
   - Columnas.

### Análisis por Fabricante

1. *Contenido*:
   - Gráficos que muestran el análisis de productos agrupados por fabricante.
2. *Tipo de gráficos*:
   - Barras.
   - Líneas.
   - Columnas.

### Análisis por Rating

1. *Contenido*:
   - Gráficos que muestran el análisis de productos agrupados por rating.
2. *Tipo de gráficos*:
   - Barras.
   - Líneas.
   - Columnas.
   - Dispersión.

### Análisis por Producto

1. *Contenido*:
   - Gráficos que muestran el análisis detallado por producto.
2. *Tipo de gráficos*:
   - Barras con líneas.
   - Área.
   - Barras.
   - Columnas.

### Información General

1. *Contenido*:
   - Cantidad total de productos.
   - Número de categorías y subcategorías.
   - Número de fabricantes.
2. *Elementos visuales*:
   - Tarjetas de información.
   - Gráficos de resumen (barras, líneas, columnas).

## Conclusiones

Este proyecto de dashboard en Power BI proporciona una visión detallada y estructurada de los datos de productos de Amazon. La organización en múltiples hojas facilita la navegación y el análisis específico, ofreciendo una herramienta valiosa para la toma de decisiones informadas.

## Organización del Proyecto

    ├── LICENSE
    ├── README.md                                <- El archivo README principal para desarrolladores que utilizan este proyecto
    ├── instalacion.md                           <- Instrucciones detalladas para configurar este proyecto.
    ├── data
    │   ├── externos                             <- Datos de fuentes externas.
    │   ├── procesados                           <- Conjuntos de datos finales y validados para el modelado.
    │   └── sin_procesar                         <- Los datos originales sin modificar..
    │
    │
    ├── notebooks                               <- Cuadernos Jupyter.
    │   ├── tratamiento-datos-nulos.ipynb       <- Notebook de Tratamiento de Datos Nulos.
    │   └── analisis-exploratorio-datos.ipynb   <- Notebook de Análisis Exploratorio de Datos.
    │
    │
    ├── archivos_sql                            <- Scripts SQL
    │   ├── amazon_avance1.sql                  <- Scripts de avance 1 de proyecto amazon en sql.
    │   ├── amazon_avance2.sql                  <- Scripts de avance 2 de proyecto amazon en sql.
    │   ├── amazon_avance3.sql                  <- Scripts de avance 3 de proyecto amazon en sql.
    │   └── amazon_avance4.sql                  <- Scripts de avance 4 de proyecto amazon en sql.
    │
    │ 
    ├── powerBI                                 <- Archivos PowerBI para el Proyecto 
    │   └── mockup_amazon.pdf                   <- Mockup del Proyecto Amazon.
    │
    ├── reportes                                <- Análisis generado en HTML, PDF, LaTeX, etc.
    │ 
    ├── imagenes                                <- Imagenes usadas en archivo README
    │   └── logo.webp                           <- Logo de la empresa que realiza el proyecto.
    │
    └──  .here                                  <- Archivo que detendrá la búsqueda si ninguno de los otros criterios se 
                                                   aplica al buscar el encabezado del proyecto.
   
    

---

## Colaboradores del Proyecto

### Gina Giuliana Correa
**Rol**: Data Analyst Expert  
**LinkedIn**: [Gina Giuliana Correa](https://www.linkedin.com/in/gina-giuliana-correa/)

### Edwin Marcel Aguirre
**Rol**: Data Engineer Expert  
**LinkedIn**: [Edwin Marcel Aguirre](https://www.linkedin.com/in/edwinaguirre/)

### Valentín Baldi
**Rol**: Data Analyst Expert  
**LinkedIn**: [Valentín Baldi](https://www.linkedin.com/in/valentin-baldi-7385921a3/)

### Juan Papi
**Rol**: Data Engineer Expert  
**LinkedIn**: [Juan Papi](https://www.linkedin.com/in/juanpapi/)

### Pablo Cabrera
**Role**: Data Engineer  
**LinkedIn**: [Pablo Cabrera](https://www.linkedin.com/in/pablo-cabrera-b96241178/)

### Ángela Aguirre
**Role**: Project Mentor (Henry)  
**LinkedIn**: [Ángela Aguirre](https://www.linkedin.com/in/angela-aguirre1/)

### Mariana Gigena
**Role**: Product Owner (Henry)  
**LinkedIn**: [Mariana Gigena](https://www.linkedin.com/in/mariana-gigena/)

