select 
     id as paymentid,
     orderid,
     paymentmethod, 
     status,
     amount/100 AS amount, 
     created 
     
from {{ source('stripe', 'payment') }}
