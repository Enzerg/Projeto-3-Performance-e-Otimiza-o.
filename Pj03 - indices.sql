create index idx_pedidos on pedidos (cliente_id , status)

create index idx_Itens_pedidos on itens_pedido (pedidos_id , produto_id)

alter index idx_pedidos rename to idx_pedidos_cliente_status;


select tablename, indexname, indexdef
from pg_indexes
where tablename in ('cliente', 'produto', 'pedidos', 'itens_pedido')
order by tablename;
