select 
     id as paymentid,
     orderid,
     paymentmethod, 
     status,
     {{cents_to_dollars('amount')}} AS amount, 
     created 
     
from {{ source('stripe', 'payment') }}
