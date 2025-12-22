use DataAnalytics

-- Explorar todos las tablas en la base de datos

Select * From INFORMATION_SCHEMA.TABLES

-- Explorar todos las columnas en la base de datos

Select * From INFORMATION_SCHEMA.COLUMNS
Where TABLE_NAME = 'customers'

-- Explorar todos los paises de donde provienen los clientes

Select Distinct country from gold.customers


-- Seleccionar todas las categorias de productos

Select Distinct category from gold.products

-- Seleccionar todas las subCategorias de productos

Select Distinct category ,subcategory, product_name from gold.products
Order By 1,2,3

-- Explorar las columnas de fecha
-- Encontrar las fechas del 1er y ultimo pedido

Select 
MIN(order_date) as primerPedido , MAX(order_date) as ultimoPedido  
From gold.sales

-- Cuantos años de ventas hay disponibles

Select 
MIN(order_date) as primerPedido ,
MAX(order_date) as ultimoPedido ,
DATEDIFF(YEAR,MIN(order_date), MAX(order_date) ) as rangoPedidosenAnios,
DATEDIFF(MONTH,MIN(order_date), MAX(order_date) ) as rangoPedidosenMeses
From gold.sales


-- Encontra al cliente mas joven y al mas viejo

Select 
DATEDIFF(YEAR,MIN(birthdate),GETDATE() ) as EdadViejo,
DATEDIFF(YEAR,MAX(birthdate),GETDATE() ) as EdadJoven
From gold.customers

-- ***  Exploracion de las medidas *******
-- Encontrar las ventas Totales

Select 
SUM(price) as ventasTotales
From gold.sales

-- Encontrar cuantos articulos se venden
Select 
SUM(quantity) as cantidadTotal
From gold.sales

-- Encontrar el precio de venta promedio
Select 
AVG(price) as precioPromedio
From gold.sales


-- Encontrar el total de pedidos

Select
COUNT(order_number) as totalPedidos
From gold.sales

-- Encontrar el total de pedidos
Select
COUNT(Distinct order_number) as totalPedidos
From gold.sales

-- Encontrar el total de numeros de productos

Select COUNT(product_id) as totalProductos  from gold.products
Select COUNT(Distinct product_id) as totalProductos  from gold.products

-- Encontrar el total de numeros de clientes

Select COUNT(Distinct customer_id) as totalClientes  from gold.customers

-- Encontrar numero total de clientes que han realizado un pedido

Select COUNT(Distinct customer_key) as totalClientes  from gold.customers
Select COUNT(Distinct customer_key) as totalClientes  from gold.sales

-- *****  Generar un Reporte que muestren todas las metricas de negocio

Select 'ventas Totales' as nombreMedida , SUM(sales_amount) as valorMedida  from gold.sales
Union All
Select 'cantidad Total' as nombreMedida , SUM(quantity) as valorMedida  from gold.sales
Union All
Select ' precio Promedio' as nombreMedida , AVG(price) as valorMedida  from gold.sales
Union All
Select ' Total de pedidos' as nombreMedida , COUNT(Distinct order_number) as valorMedida  from gold.sales
Union All
Select ' Total de Productos' as nombreMedida , COUNT(Distinct product_key) as valorMedida  from gold.products
Union All
Select ' Total de Cliientes' as nombreMedida , COUNT(Distinct customer_key) as valorMedida  from gold.customers

-- **************************************************************************************
