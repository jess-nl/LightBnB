--  id |     name      |          email          | password
-- ----+---------------+-------------------------+---------
--   1 | Devin Sanders | tristanjacobs@gmail.com | $2a...
-- (1 row)

SELECT id, name, email, password
FROM users
WHERE email = 'tristanjacobs@gmail.com';