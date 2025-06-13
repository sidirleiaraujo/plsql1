-- Listagem de todos os Clientes que não realizaram uma compra
Select * from costumers 
 where costumer_id not in ( select costumer_id from orders);
 
--Listar todos os Produtos que não foram comprados
Select a.*, b.Product_id from Products a 
  Left join order_items b on a.product_id = b.product_id 
  where b.Product_id is null;
  
-- Listar os Produtos sem Estoque
Select * from Products a, stocks b
where a.product_id = b.Product_id and b.quantity = 0

-- Agrupar a quantidade de vendas que uma determinada Marca por Loja.
Select count(1), d.brand_name, e.store_Name
 from orders a, 
      order_items b,
	  Products c,
	  Brands d,
	  Stores e,
Where a.store_id = e.Store_id and 
      a.order_id = b.order_id and 	  
	  b.product_id = c.product_id and 
	  c.brand_id = d.brand_id
group by e.store_Name, d.brand_name	  


-- Listar os Funcionarios que não estejam relacionados a um Pedido.  
Select * from Staffs a 
where not exists (Select 1 from order b where b.staff_id = a.Staff_id);

--