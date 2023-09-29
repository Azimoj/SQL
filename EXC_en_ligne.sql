



SELECT COUNT(ride_id) as nb_utils, maker, first_name, last_name, COUNT(message_id) AS nb_messages
FROM cars c
LEFT JOIN rides r on r.member_car_id = c.car_id
LEFT JOIN member_car mc ON c.car_id = mc.member_car_id
LEFT JOIN members m ON m.member_id = mc.member_id
LEFT JOIN messages mes ON mes.sender_id = m.member_id
GROUP BY maker
ORDER BY nb_messages DESC, nb_utils DESC