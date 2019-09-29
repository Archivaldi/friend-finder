# friend-finder

Friend finder is an app that matches new person with people from database. New use should answer 10 questions. The app with MySQL queries compare every answer of new user with every answer of every user in database and canculate best match.

## Technologies Used

* CSS
* Bootstrap
* JavaScript
* jQuery
* node.js
* Express.js
* ejs
* body-parser
* dotenv
* MySQL

## Code Explanation

* Our `server.js` file sets up the Express server, specifying our port number, the npm packages that need to be loaded, and also the routes, which we have externalized. `server.js` file determines the back-end logic as well (connect MySQL database and makes `GET` and `POST` requests to get and upload data in database)
* There are 3 separate ejs files (`index.ejs`, `survey.ejs` and `result.ejs`) that serve as the front-end portion of our code; they determine what the user sees (the homepage, the survey and result page which will shows the resulting best match).
* `navbar.ejs` file is a navbar template that used for every page.
* `keys.js` file is used for hiding private data about database. We used `dotenv` npm package to create environment varibles.