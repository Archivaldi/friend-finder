var express = require("express");
var app = express();

//add dotenv package for hiding private data
require("dotenv").config();
const keys = require("./keys.js");

var mysql = require("mysql");

//hiding private data 
var connection = mysql.createConnection(keys.data);

// Creates the connection with the server and loads the product data upon a successful connection
connection.connect(function (err) {
    if (err) {
      console.error("error connecting: " + err.stack);
    }
    console.log("Database connected");
  });

app.listen(3000, function(){
    console.log("Server runs");
})