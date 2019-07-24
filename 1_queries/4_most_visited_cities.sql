--        city        | total_reservations 
-- -------------------+--------------------
--  Carcross          |                405
--  Town of Hay River |                379
--  Whitehorse        |                376
--  Town of Inuvik    |                298
--  Yellowknife       |                257
--  (251 rows)

SELECT properties.city, count(reservations) as total_reservations
FROM reservations
JOIN properties ON property_id = properties.id
GROUP BY properties.city
ORDER BY total_reservations DESC;