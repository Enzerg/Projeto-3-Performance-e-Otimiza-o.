select 'cliente' as tabela, count(*) as total from cliente
union all
select 'produto', count(*) from produto
union all
select 'pedidos', count(*) from pedidos
union all
select 'itens_pedido', count(*) from itens_pedido;


select min(id), max(id) from cliente;
select min(id), max(id) from produto;

explain analyze
select *
from  pedidos p
where p.cliente_id = 1  and status = 'PAGA'
;
