-- use restaurant_db;

1.What were the least and most ordered items? What categories were they in?

-->Least Ordered Item:-

select mi.item_name, mi.category, COUNT(od.item_id) as order_count
from menu_items mi
left join order_details od on mi.menu_item_id = od.item_id
group by mi.item_name, mi.category
order by order_count asc;

-->Most Ordered Items:-

select mi.item_name,mi.category,count(od.item_id) as order_count
from menu_items mi
left join order_details od
on mi.menu_item_id = od.item_id
group by mi.item_name,mi.category
order by order_count desc;

2.What do the highest spend orders look like? Which items did they buy and how much did they spend?

select od.order_id, SUM(mi.price) as total_spent
from order_details od
join menu_items mi on od.item_id = mi.menu_item_id
group by od.order_id
order by total_spent desc
limit 5;

3.Were there certain times that had more or less orders?

SELECT DATE_FORMAT(order_time, '%H:%i') AS order_hour, COUNT(order_id) AS order_count
FROM order_details
GROUP BY order_hour
ORDER BY order_count DESC;

4.Which cuisines should we focus on developing more menu items for based on the data?

SELECT category, COUNT(od.item_id) AS order_count
FROM menu_items mi
LEFT JOIN order_details od ON mi.menu_item_id = od.item_id
GROUP BY category
ORDER BY order_count DESC;

Insights:-
From these cuisines Category Asian Category is on more demanding cuisines so resturant should be focus on that
for devolping more menu items. 




