with payments as (
    select * from raw.stripe.payment limit 10
),
orders as (
    select * from {{ ref('stg_orders')}}
)

select order_id, customer_id, amount from orders
inner join
payments on orders.order_id=payments.orderid
