const properties = require('./json/properties.json');
const users = require('./json/users.json');
const { Client, Pool } = require('pg');

const pool = new Pool({
  user: 'user',
  password: 'pass',
  host: 'localhost',
  database: 'lightbnb'
});

const client = new Client({
  user: 'user',
  password: 'pass',
  host: 'localhost',
  database: 'lightbnb'
});

/// Users

/**
 * Get a single user from the database given their email.
 * @param {String} email The email of the user.
 * @return {Promise<{}>} A promise to the user.
 */

const getUserWithEmail = function(email) {
  return pool.query(`
  SELECT * FROM users
  WHERE email = $1
  `, [email])
  .then(res => res.rows[0]);
}
exports.getUserWithEmail = getUserWithEmail;

/**
 * Get a single user from the database given their id.
 * @param {string} id The id of the user.
 * @return {Promise<{}>} A promise to the user.
 */
// const getUserWithId = function(id) {
//   return Promise.resolve(users[id]);
// }
const getUserWithId = function(id) {
  return pool.query(`
  SELECT * FROM users
  WHERE id = $1
  `, [id])
  .then(res => res.rows[0]);
}
exports.getUserWithId = getUserWithId;


/**
 * Add a new user to the database.
 * @param {{name: string, password: string, email: string}} user
 * @return {Promise<{}>} A promise to the user.
 */

// const addUser =  function(user) {
//   const userId = Object.keys(users).length + 1;
//   user.id = userId;
//   users[userId] = user;
//   return Promise.resolve(user);
// }

// Accepts a user object that will have a name, email, and hashed password property.
// This function should insert the new user into the database.
// It will return a promise that resolves with the new user object. This object should contain the user's id after it's been added to the database.
// Add RETURNING *; to the end of an INSERT query to return the objects that were inserted. This is handy when you need the auto generated id of an object you've just added to the database.

const addUser =  function(user) {
  return pool.query(`
    INSERT INTO users (name, email, password) VALUES ($1, $2, $3) RETURNING *;
  `, [user.name, user.email, user.password])
  .then(res => res.rows[0]);
}
exports.addUser = addUser;

/// Reservations

/**
 * Get all reservations for a single user.
 * @param {string} guest_id The id of the user.
 * @return {Promise<[{}]>} A promise to the reservations.
 */

const getAllReservations = function(guest_id, limit = 10) {
  return pool.query(`
    SELECT properties.*, reservations.*, avg(rating) as average_rating
    FROM reservations
    JOIN properties ON reservations.property_id = properties.id
    JOIN property_reviews ON properties.id = property_reviews.property_id 
    WHERE reservations.guest_id = $1
    AND reservations.end_date < now()::date
    GROUP BY properties.id, reservations.id
    ORDER BY reservations.start_date
    LIMIT $2;
  `, [guest_id, limit])
  .then(res => res.rows);
}
exports.getAllReservations = getAllReservations;

/// Properties

/**
 * Get all properties.
 * @param {{}} options An object containing query options.
 * @param {*} limit The number of results to return.
 * @return {Promise<[{}]>}  A promise to the properties.
 */

// const getAllProperties = function(options, limit = 10) {
//   return pool.query(`
//   SELECT * FROM properties
//   LIMIT $1
//   `, [limit])
//   .then(res => res.rows);
// }

const getAllProperties = function(options, limit = 10) {
  // 1
  const queryParams = [];
  // 2
  let queryString = `
  SELECT properties.*, avg(property_reviews.rating) as average_rating
  FROM properties
  JOIN property_reviews ON properties.id = property_id
  `;

  // Check if a city has been passed in as an option. Add the city to the params array and create a WHERE clause for the city.
  // We can use the length of the array to dynamically get the $n placeholder number. Since this is the first parameter, it will be $1.
  // The % syntax for the LIKE clause must be part of the parameter, not the query.
  // Add any query that comes after the WHERE clause.
  // Console log everything just to make sure we've done it right.
  // Run the query.

  // if an owner_id is passed in, only return properties belonging to that owner.
  // if a minimum_price_per_night and a maximum_price_per_night, only return properties within that price range.
  // if a minimum_rating is passed in, only return properties with a rating equal to or higher than that.
  // Remember that all of these may be passed in at the same time so they all need to work together. You will need to use AND for every filter after the first one. Also, none of these might be passed in, so the query still needs to work without a WHERE clause.

  // 3
  if (options.city) {
    if (queryParams.length === 0) {
      queryString += ` WHERE `
    } else {
      queryString += ` AND `
    }
    queryParams.push(`%${options.city}%`);
    queryString += `city LIKE $${queryParams.length} `;
  }

  if (options.owner_id) {
    if (queryParams.length === 0) {
      queryString += ` WHERE `
    } else {
      queryString += ` AND `
    }
    queryParams.push(`${options.owner_id}`);
    queryString += `owner_id = $${queryParams.length} `;
  }

  // if (options.maximum_price_per_night >= options.minimum_price_per_night && options.minimum_price_per_night <= options.maximum_price_per_night) {
  //   if (queryParams.length === 0) {
  //     queryString += ` WHERE `
  //   } else {
  //     queryString += ` AND `
  //   }
  //   queryParams.push(`${options.minimum_price_per_night}`);
  //   queryString += `cost_per_night > $${queryParams.length} `;
  // } else {

  // }

  if (options.minimum_price_per_night) {
    if (queryParams.length === 0) {
      queryString += ` WHERE `
    } else {
      queryString += ` AND `
    }
    queryParams.push(`${options.minimum_price_per_night}`);
    queryString += `cost_per_night > $${queryParams.length} `;
  }

  if (options.maximum_price_per_night) {
    if (queryParams.length === 0) {
      queryString += ` WHERE `
    } else {
      queryString += ` AND `
    }
    queryParams.push(`${options.maximum_price_per_night}`);
    queryString += `cost_per_night < $${queryParams.length} `;
  }

  if (options.minimum_rating) {
    if (queryParams.length === 0) {
      queryString += ` WHERE `;
    } else {
      queryString += ` AND `;
    }
    queryParams.push(`${options.minimum_rating}`);
    queryString += `rating >= $${queryParams.length} `;
  }

  // 4
  queryParams.push(limit);
  queryString += `
  GROUP BY properties.id
  ORDER BY cost_per_night
  LIMIT $${queryParams.length};
  `;

  // 5
  console.log(queryString, queryParams);

  // 6
  return pool.query(queryString, queryParams)
  .then(res => res.rows);
}

exports.getAllProperties = getAllProperties;

/**
 * Add a property to the database
 * @param {{}} property An object containing all of the property details.
 * @return {Promise<{}>} A promise to the property.
 */
const addProperty = function(property) {
  const propertyId = Object.keys(properties).length + 1;
  property.id = propertyId;
  properties[propertyId] = property;
  return Promise.resolve(property);
}
exports.addProperty = addProperty;
