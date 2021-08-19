with payments as (
    select *
    from {{ ref('stg_payment')}}
),
orders as (
    select * 
    from {{ ref('stg_orders')}}
),

successful_payments as (
    select * from payments 
    where status='success'
)


select 
    order_id, 
    customer_id, 
    coalesce(amount, 0) as amount,
    orders.status,
    order_date

from orders
inner join
payments on 
orders.order_id=payments.orderid
