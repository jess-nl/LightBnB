-- Users:
-- `name`         | `email`
-- ---------------|-------------------------------
-- Eva Stanley    | sebastianguerra@ymail.com
-- Louisa Meyer   | jacksonrose@hotmail.com
-- Dominic Parks  | victoriablackwell@outlook.com
-- Sue Luna       | jasonvincent@gmx.com
-- Rosalie Garza  | jacksondavid@gmx.com
-- Etta West      | charlielevy@yahoo.com
-- Margaret Wong  | makaylaweiss@icloud.com
-- Leroy Hart     | jaycereynolds@inbox.com

INSERT INTO users (name, email, password) VALUES ('Eva Stanley', 'sebastianguerra@ymail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');
INSERT INTO users (name, email, password) VALUES ('Louisa Meyer', 'jacksonrose@hotmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');
INSERT INTO users (name, email, password) VALUES ('Dominic Parks', 'victoriablackwell@outlook.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');
INSERT INTO users (name, email, password) VALUES ('Sue Luna', 'jasonvincent@gmx.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');
INSERT INTO users (name, email, password) VALUES ('Rosalie Garza', 'jacksondavid@gmx.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');
INSERT INTO users (name, email, password) VALUES ('Etta West', 'charlielevy@yahoo.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');

-- Properties:

INSERT INTO properties (owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code, active) 
VALUES (1, 'Speed lamp', 'description', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg', 930.61, 6, 4, 8, 'Canada', '536 Namsub Highway', 'Sotboske', 'Quebec', '28142', true);

INSERT INTO properties (owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code, active) 
VALUES (1, 'Blank corner', 'description', 'https://images.pexels.com/photos/2121121/pexels-photo-2121121.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2121121/pexels-photo-2121121.jpeg', 85234, 6, 6, 7, 'Canada', '651 Nami Road', 'Bohbatev', 'Alberta', '83680', true);

INSERT INTO properties (owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code, active) 
VALUES (2, 'Habit mix', 'description', 'https://images.pexels.com/photos/2080018/pexels-photo-2080018.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2080018/pexels-photo-2080018.jpeg', 46058, 0, 5, 6, 'Canada', '1650 Hejto Center', 'Genwezuj', 'Newfoundland And Labrador', '44583', true);

INSERT INTO properties (owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code, active) 
VALUES (4, 'Headed know', 'description', 'https://images.pexels.com/photos/1029599/pexels-photo-1029599.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/1029599/pexels-photo-1029599.jpeg', 82640, 0, 5, 5, 'Canada', '513 Powov Grove', 'Jaebvap', 'Ontario', '38051', true);

INSERT INTO properties (owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code, active) 
VALUES (6, 'Port out', 'description', 'https://images.pexels.com/photos/1475938/pexels-photo-1475938.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/1475938/pexels-photo-1475938.jpeg', 2358, 2, 8, 0, 'Canada', '1392 Gaza Junction', 'Upetafpuv', 'Nova Scotia', '81059', true);

INSERT INTO properties (owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code, active) 
VALUES (6, 'Fun glad', 'description', 'https://images.pexels.com/photos/1172064/pexels-photo-1172064.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/1172064/pexels-photo-1172064.jpeg', 34291, 6, 6, 4, 'Canada', '169 Nuwug Circle', 'Vutgapha', 'Newfoundland And Labrador', '00159', true);


-- Reservations:
--  `start_date` |  `end_date`  | `property_id` | `guest_id` 
-- --------------|--------------|---------------|----------
--  2018-09-11   | 2018-09-26   |           313 |      399
--  2019-01-04   | 2019-02-01   |           515 |      628
--  2021-10-01   | 2021-10-14   |           217 |       93
--  2014-10-21   | 2014-10-21   |           557 |       71
--  2016-07-17   | 2016-08-01   |           672 |      794
--  2018-05-01   | 2018-05-27   |           285 |      160
--  2022-10-04   | 2022-10-23   |            65 |      120
--  2015-09-13   | 2015-09-30   |           614 |      419
--  2023-05-27   | 2023-05-28   |           484 |      661
--  2023-04-23   | 2023-05-02   |           770 |       71

INSERT INTO reservations (start_date, end_date, property_id, guest_id)
VALUES ('2018-09-11', '2018-09-26Z', 313, 399);

INSERT INTO reservations (start_date, end_date, property_id, guest_id)
VALUES ('2019-01-04', '2019-02-01', 515, 628);

INSERT INTO reservations (start_date, end_date, property_id, guest_id)
VALUES ('2021-10-01', '2021-10-14', 217, 93);

INSERT INTO reservations (start_date, end_date, property_id, guest_id)
VALUES ('2014-10-21', '2014-10-21', 557, 71);

INSERT INTO reservations (start_date, end_date, property_id, guest_id)
VALUES ('2016-07-17', '2016-08-01', 672, 794);

INSERT INTO reservations (start_date, end_date, property_id, guest_id)
VALUES ('2018-05-01', '2018-05-27', 285, 160);


-- Property Reviews:
-- `guest_id` | `property_id` | `reservation_id` | `rating` | `message` 
-- -----------|---------------|------------------|----------|---------
--          2 |             5 |               10 |        3 | message
--          1 |             4 |                1 |        4 | message
--          8 |             1 |                2 |        4 | message
--          3 |             8 |                5 |        4 | message
--          4 |             2 |                7 |        5 | message
--          4 |             3 |                4 |        4 | message
--          5 |             6 |                3 |        5 | message

INSERT INTO property_reviews (guest_id, property_id, reservation_id, rating, message) 
VALUES (2, 5, 10, 3, 'message');

INSERT INTO property_reviews (guest_id, property_id, reservation_id, rating, message) 
VALUES (1, 4, 1, 4, 'message');

INSERT INTO property_reviews (guest_id, property_id, reservation_id, rating, message) 
VALUES (8, 1, 2, 4, 'message');

INSERT INTO property_reviews (guest_id, property_id, reservation_id, rating, message) 
VALUES (3, 8, 5, 4, 'message');

INSERT INTO property_reviews (guest_id, property_id, reservation_id, rating, message) 
VALUES (4, 2, 7, 5, 'message');

INSERT INTO property_reviews (guest_id, property_id, reservation_id, rating, message) 
VALUES (4, 3, 4, 4, 'message');