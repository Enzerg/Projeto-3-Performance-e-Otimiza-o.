select 'cliente' as tabela, count(*) as total from cliente
union all
select 'produto', count(*) from produto
union all
select 'pedidos', count(*) from pedidos
union all
select 'itens_pedido', count(*) from itens_pedido;


select min(id), max(id) from cliente;
select min(id), max(id) from produto;

'explain analyze'
select *
from  pedidos p
where status = 'PAGA'
;


'explain analyze'
select c.id, c.nome, sum(preco_unitario * quantidade) as total_gasto
from cliente c
join pedidos p  on p.cliente_id  = c.id 
join itens_pedido ip on ip.pedidos_id = p.id 
group by c.id  
order by total_gasto desc
limit 10;


begin;

drop index idx_pedidos_cliente_status;

explain analyze
select c.id, c.nome, sum(preco_unitario * quantidade) as total_gasto
from cliente c
join pedidos p  on p.cliente_id  = c.id 
join itens_pedido ip on ip.pedidos_id = p.id 
where c.id = 1
group by c.id;

rollback;
