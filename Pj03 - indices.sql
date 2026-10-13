create index idx_pedidos on pedidos (cliente_id , status)

alter index idx_pedidos rename to idx_pedidos_cliente_status;

