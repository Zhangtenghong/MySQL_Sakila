-- What query would you run to get all the customers inside city_id = 312? Your query should return customer first name, last name, email, and address.
SELECT address.city_id, customer.first_name, customer.last_name, customer.email, address.address
FROM customer
JOIN address ON address.address_id=customer.address_id
WHERE address.city_id=312;

-- What query would you run to get all comedy films? Your query should return film title, description, release year, rating, special features, and genre (category).
SELECT film.title, film.description, film.release_year, film.rating, film.special_features, category.name
FROM film
JOIN film_category ON film.film_id=film_category.film_id
JOIN category ON category.category_id=film_category.category_id
WHERE category.name='Comedy';

-- What query would you run to get all the films joined by actor_id=5? Your query should return the actor id, actor name, film title, description, and release year.
SELECT actor.actor_id, CONCAT(actor.first_name,' ', actor.last_name) AS actor_name, film.title, film.description, film.release_year
FROM film
JOIN film_actor ON film.film_id=film_actor.film_id
JOIN actor ON actor.actor_id=film_actor.actor_id
WHERE film_actor.actor_id=5;

-- What query would you run to get all the customers in store_id = 1 and inside these cities (1, 42, 312 and 459)? Your query should return customer first name, last name, email, and address.
SELECT customer.store_id, address.city_id, customer.first_name, customer.last_name, customer.email, address.address
FROM address
JOIN customer ON address.address_id=customer.address_id
WHERE customer.store_id=1 and address.city_id IN(1, 42, 312 and 459); -- ????????????????????

-- What query would you run to get all the films with a "rating = G" and "special feature = behind the scenes", joined by actor_id = 15? Your query should return the film title, description, release year, rating, and special feature. Hint: You may use LIKE function in getting the 'behind the scenes' part.
SELECT film.title, film.description, film.release_year, film.rating, film.special_features
FROM film
JOIN film_actor ON film.film_id=film_actor.film_id
WHERE film.rating='G' and film.special_features LIKE 'behind the scenes' and film_actor.actor_id = 15; -- ???????????????

-- What query would you run to get all the actors that joined in the film_id = 369? Your query should return the film_id, title, actor_id, and actor_name.
SELECT film.film_id, film.title, actor.actor_id, concat(first_name, actor.last_name) AS actor_name
FROM film 
JOIN film_actor ON film.film_id=film_actor.film_id
JOIN actor ON actor.actor_id=film_actor.actor_id
WHERE film.film_id=369;

-- What query would you run to get all drama films with a rental rate of 2.99? Your query should return film title, description, release year, rating, special features, and genre (category).

SELECT film.title, film.description, film.release_year, film.rating, film.special_features, category.name AS genre, film.rental_rate
FROM film 
JOIN film_category ON film.film_id = film_category.film_id 
JOIN category ON film_category.category_id = category.category_id 
WHERE film.rental_rate = 2.99 AND category.name = 'Drama';

-- What query would you run to get all the action films which are joined by SANDRA KILMER? Your query should return film title, description, release year, rating, special features, genre (category), and actor's first name and last name.
SELECT film.title, film.description, film.release_year, film.rating, film.special_features, category.name AS genre, actor.first_name, actor.last_name
FROM film 
JOIN film_category ON film.film_id = film_category.film_id 
JOIN category ON film_category.category_id = category.category_id 
JOIN film_actor ON film.film_id = film_actor.film_id 
JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE category.name = 'Action' AND actor.first_name = 'SANDRA' AND actor.last_name = 'KILMER'