--**************************************************************************************

-- Encontrar el total de clientes por pais
Select country,
	COUNT(customer_key) totalCliente
From gold.customers
Group By country
Order By totalCliente desc

-- Encontrar el total de cliente por genero

Select gender,
	COUNT(customer_key) totalCliente
From gold.customers
Group By gender
Order By totalCliente desc

-- Encontrar el total de productos por categoria

Select category  ,
	COUNT(product_key) totalProductos
From gold.products
Group By category
Order By totalProductos desc

-- cual es el costo medio en cada categoria 

Select category  ,
	AVG(cost) costoMedio
From gold.products
Group By category
Order By costoMedio desc

-- cual es el ingreso total generado en cada categoria 

Select
p.category,
SUM(s.sales_amount) as totalIngreso
From gold.sales as s
Left Join gold.products as p ON s.product_key = p.product_key
Group By p.category
Order By totalIngreso desc

-- cual es el ingreso total generado en cada cliente

Select
c.customer_key ,
c.first_name,
c.last_name ,
SUM(sales_amount) as totalIngreso
From gold.sales as s
Left Join gold.customers as c ON s.customer_key = c.customer_key
Group By c.customer_key, c.first_name, c.last_name
Order By totalIngreso desc

-- Cual es la distribucion de los articulos vendidos en los diferentes paises

Select c.country,
COUNT(s.quantity) as TotalVendidos
from gold.sales as s
Left Join gold.customers as c ON s.customer_key = c.customer_key
Group By c.country
Order By TotalVendidos desc


-- ***  Analisis de Ranking

-- Cuales son los 5 productos que generan mayores ingresos

Select Top 5  p.product_name,
	SUM(s.sales_amount) as totalIngresos
From gold.sales as s
Left Join gold.products as p ON s.product_key = p.product_key
Group By p.product_name
Order By totalIngresos desc

-- Cuales son los 5 productos que generan mayores ingresos
 -- con Windows Functions  
 Select * 
 From (

Select p.product_name,
	SUM(s.sales_amount) as totalIngresos,
	ROW_NUMBER() Over(Order By SUM(s.sales_amount) desc) as Rank_productos
From gold.sales as s
Left Join gold.products as p ON s.product_key = p.product_key
Group By p.product_name
) t
Where Rank_productos <= 5

-- Cuales son los 5 productos que generan menor ingresos

Select Top 5  p.product_name,
	SUM(s.sales_amount) as totalIngresos
From gold.sales as s
Left Join gold.products as p ON s.product_key = p.product_key
Group By p.product_name
Order By totalIngresos 


-- Encontrar el top 10 de clientes que generaron mayor ingreso

Select Top 10
c.customer_key ,
c.first_name,
c.last_name ,
SUM(sales_amount) as totalIngreso
From gold.sales as s
Left Join gold.customers as c ON s.customer_key = c.customer_key
Group By c.customer_key, c.first_name, c.last_name
Order By totalIngreso desc


-- Encontrar el top 3 de clientes que generaron menos pedidos realizados

Select Top 3
c.customer_key ,
c.first_name,
c.last_name ,
COUNT(Distinct s.order_number) as totalPedidos
From gold.sales as s
Left Join gold.customers as c ON s.customer_key = c.customer_key
Group By c.customer_key, c.first_name, c.last_name
Order By totalPedidos 



Select * from gold.products

Select * from gold.sales

Select * from gold.customers

Select COUNT(Distinct customer_key) from gold.customers


Select  * from gold.products
Select  * from gold.sales



