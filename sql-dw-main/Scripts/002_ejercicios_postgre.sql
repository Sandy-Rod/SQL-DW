-- Recupera todos los clientes (name y email) ordenados alfabéticamente por nombre.
SELECT name, email
    FROM customer 
    ORDER BY name ASC;


-- Encuentra el número total de reservas.
SELECT COUNT(reservation_id) 
    FROM reservation;


-- Muestra los detalles de las reservas (reservation_id, start_date, end_date) para un cliente específico (puedes elegir el customer_id).
SELECT reservation_id, start_date, end_date
FROM reservation 
WHERE customer_id = 7;


-- Encuentra el nombre y apellido de los propietarios que tienen apartamentos.
SELECT name, surname 
    FROM owner ow
    INNER JOIN apartment ap ON ow.owner_id = ap.owner_id;


-- Recupera el nombre y la ubicación de los apartamentos propiedad de un propietario específico (puedes elegir el owner_id).
SELECT ow.name, ow.surname, ap.location
    FROM owner ow
    INNER JOIN apartment ap ON ow.owner_id = ap.owner_id
    WHERE ow.owner_id = 3;


-- Muestra las comodidades asociadas a un apartamento específico (puedes elegir el apartment_id).
SELECT *
FROM amenity am
INNER JOIN apt_amenity apt ON am.amenity_id = apt.amenity_id
WHERE apt.apartment_id = 14;


-- Encuentra los clientes que no han realizado ninguna reserva.
SELECT c.customer_id, c.name, c.surname
FROM customer c
LEFT JOIN reservation r ON c.customer_id = r.customer_id
WHERE r.customer_id IS NULL;


-- Obtén el número total de apartamentos en una ubicación específica (puedes elegir la ubicación).

---comillas dobles son diferentes a comillas simples en Postgresql
SELECT COUNT(apartment_id)
FROM apartment 
WHERE "location"= 'Madrid';


-- Recupera la información completa de las reservas (reservation_id, start_date, end_date) para los apartamentos que tienen un precio superior a cierto valor 
-- (puedes elegir el valor).
SELECT res.reservation_id, res.start_date, res.end_date 
FROM reservation res
LEFT JOIN apartment ap ON res.apartment_id = ap.apartment_id
WHERE ap.price > 154.00;

-- otra forma de hacerlo 
SELECT res.reservation_id, res.start_date, res.end_date
FROM reservation res
JOIN (SELECT * 
    FROM apartment
    WHERE apartment.price > 154.00) ap_caros 
ON res.apartment_id = ap_caros.apartment_id;



-- Encuentra el propietario con más apartamentos y muestra sus detalles (name, surname, email).
SELECT ow.name, ow.surname, ow.email
FROM owner ow
LEFT JOIN apartment ap ON ow.owner_id = ap.owner_id
GROUP BY ap.owner_id, ow.name, ow.surname, ow.email
ORDER BY COUNT(ap.apartment_id) DESC
LIMIT 1;







-- Muestra la ubicación y el número de reservas para cada ubicación, ordenado por número de reservas descendente.
SELECT ap.location, re.reservation_id
    FROM apartment ap
    INNER JOIN reservation re 
    ON ap.apartment_id = re.apartment_id
    ORDER BY re.reservation_id DESC;



-- Encuentra los clientes que han realizado al menos una reserva y muestra cuántas reservas han hecho.
SELECT cu.customer_id, cu.name, cu.surname, COUNT(re.reservation_id) AS "Número de Reservas"
	FROM customer cu
	JOIN reservation re 
	ON cu.customer_id = re.customer_id
	GROUP BY cu.customer_id, cu.name, cu.surname
--HAVING COUNT(re.reservation_id) >= 1;



-- Obtén el precio promedio de los apartamentos.
SELECT AVG(price) AS "Precio Promedio"
    FROM apartment;



-- Recupera el nombre de las comodidades que están asociadas a más de un apartamento.  --   revisar
SELECT ame.name, ameapt.apartment_id
    FROM amenity ame
    INNER JOIN apt_amenity ameapt 
    ON ame.amenity_id = ameapt.amenity_id
    GROUP BY ame.name, ameapt.apartment_id
    HAVING COUNT(DISTINCT ameapt.apartment_id) >=1;


-- Encuentra los propietarios que tienen apartamentos en más de una ubicación.
SELECT ow.name, ow.surname
    FROM owner ow 
    JOIN apartment ap 
    ON ow.owner_id = ap.owner_id
    GROUP BY ow.name, ow.surname
    HAVING COUNT(DISTINCT ap.location) > 1;

-- REVIDAD 
SELECT apartment.owner_id
    , COUNT(1) AS num_apartamentos
    FROM owner



-- Muestra las reservas que están programadas desde una fecha futura (puedes elegir la fecha).
SELECT start_date, end_date
FROM reservation
WHERE start_date BETWEEN '2023-12-01' AND '2024-01-06';

SELECT *
    FROM reservation
    WHERE start_date > DATE('2023-06-22')





-- Obtén el nombre de los clientes que han realizado reservas en al menos dos ubicaciones diferentes.

SELECT customer.name,
        COUNT(1)
    FROM customer
    JOIN reservation 
    ON customer.customer_id = reservation.customer_id  
    JOIN apartment 
    ON apartment.apartment_id = reservation.apartment_id
    GROUP BY 1
    HAVING COUNT(DISTINCT apartment.location) >= 2;





-- Obtén la ubicación con el mayor número de comodidades, mostrando el nombre de la ubicación y la cantidad de comodidades.

    SELECT apartment."location",
		COUNT(1) AS num_comodidades
	FROM apartment
	JOIN apt_amenity
	ON apartment.apartment_id = apt_amenity.apartment_id
	GROUP BY 1
	ORDER BY num_comodidades DESC
	LIMIT 1





-- Obtén la cantidad total de reservas realizadas por cada cliente, ordenado de mayor a menor.
SELECT customer_id,
		COUNT(1) AS num_reservas
	FROM reservation 
	GROUP BY customer_id
	ORDER BY num_reservas DESC;



-- Clientes que han repetido en un mismo apartment

SELECT customer_id,
		apartment_id,
		COUNT(1) AS num_reservas
	FROM reservation
	GROUP BY 1,2
	HAVING COUNT(1) > 1
