const express = require("express");
const app = express();

//add dotenv package for hiding private data
require("dotenv").config();
const keys = require("./keys.js");

const path = require("path");

const mysql = require("mysql");

var friends = [];

//hiding private data 
const connection = mysql.createConnection(keys.data);


// Creates the connection with the server and loads the product data upon a successful connection
connection.connect(function (err) {
    if (err) {
      console.error("error connecting: " + err.stack);
    }
    console.log("Database connected");
    loadFriends();
  });  

  function upgradeFriends(arr){

      for (var i = 0; i < arr.length; i++){
            friends.push({
                name: arr[i].friend_name,
                photo: arr[i].picture_link,
                friend_id: arr[i].friend_id,
                scores: []
              });
        }
            takeScores();
      };


      //console.log(friends);
     // takeScores();

  function takeScores(){
      connection.query("SELECT score, friend_id FROM scores", function(err,res){
            for (var p = 0; p < friends.length; p++){
                for (var i = 0; i < res.length; i++){
                    if (friends[p].friend_id === res[i].friend_id){
                        friends[p].scores.push(res[i].score);
                    }
            }
        }

        deleteIDfromFriend();
    })

}

    function deleteIDfromFriend () {
        for (var i = 0; i < friends.length; i++){
            delete friends[i].friend_id;
        }
    }

  function loadFriends() {
    // Selects all of the data from the MySQL products table
    connection.query("SELECT friend_name, picture_link, friend_id FROM friends", function (err, res) {
      if (err) {
        console.log(err)
      }
     upgradeFriends(res);

    });
}


app.get("/", function(req,res){
    res.sendFile(path.join(__dirname, 'public/index.html')); 
})

app.get("/survey", function(req,res){
    res.sendFile(path.join(__dirname, 'public/survey.html'));     
})

app.get("/api/friends", function(req,res){
    res.json(friends);
});

app.post("/api/friends", function(req,res){

});

app.listen(3000, function(){
    console.log("Server runs");
})