const express = require("express");
const app = express();
app.set("view engine", "ejs");

//add dotenv package for hiding private data
require("dotenv").config();
const keys = require("./keys.js");

//path package
const path = require("path");

//mysql package
const mysql = require("mysql");

//create array with friends
var friends = [];

//hiding private data 
const connection = mysql.createConnection(keys.data);

var bodyParser = require("body-parser");

app.use(bodyParser.urlencoded({extended: true}));



// Creates the connection with the server and loads the product data upon a successful connection
connection.connect(function (err) {
    if (err) {
        console.error("error connecting: " + err.stack);
    }
    console.log("Database connected");
    loadFriends();
});

// Selects data from the MySQL database 
function loadFriends() {
    connection.query("SELECT friend_name, picture_link, friend_id FROM friends", function (err, res) {
        if (err) {
            console.log(err)
        };

        upgradeFriends(res);

    });
};


//upadte friends array with friends from database
function upgradeFriends(arr) {

    for (var i = 0; i < arr.length; i++) {
        friends.push({
            name: arr[i].friend_name,
            photo: arr[i].picture_link,
            friend_id: arr[i].friend_id,
            scores: []
        });
    }
    takeScores();
};

//put scores into every friend object
function takeScores() {
    connection.query("SELECT score, friend_id FROM scores", function (err, res) {
        for (var p = 0; p < friends.length; p++) {
            for (var i = 0; i < res.length; i++) {
                if (friends[p].friend_id === res[i].friend_id) {
                    friends[p].scores.push(res[i].score);
                }
            }
        }

        deleteIDfromFriend();
    })

}
//delete friend_id from friend object
function deleteIDfromFriend() {
    for (var i = 0; i < friends.length; i++) {
        delete friends[i].friend_id;
    }
}


//create main route
app.get("/", function (req, res) {
    res.sendFile(path.join(__dirname, 'views/index.html'));
})

//survey page
app.get("/survey", function (req, res) {
    connection.query("SELECT * FROM questions", function (err, response) {
        res.render("survey", { res: response });
    })
})

//showing friends array like json file
app.get("/api/friends", function (req, res) {
    res.json(friends);
});

app.post("/api/friends", function (req, res) {
    var name = req.body.firstname + " " + req.body.lastname;
    var link = req.body.link;
    var scores = [
        parseInt(req.body.question1),
        parseInt(req.body.question2),
        parseInt(req.body.question3),
        parseInt(req.body.question4),
        parseInt(req.body.question5),
        parseInt(req.body.question6),
        parseInt(req.body.question7),
        parseInt(req.body.question8),
        parseInt(req.body.question9),
        parseInt(req.body.question10),
    ];
    connection.query("INSERT INTO friends(friend_name, picture_link) VALUES (?, ?)", [name, link], function(err, res){
        takeNewFiendId(name);
        // insertScores(scores);
    })
    function takeNewFiendId(str) {
        connection.query("SELECT friend_id FROM friends WHERE friend_name = ?",[str], function(err,res){
            insertScores(res[0].friend_id);
            console.log(res[0].friend_id);
        })
    }

    function insertScores(num){
    connection.query("INSERT INTO scores (friend_id, question_id, score) VALUES (?,1,?), (?,2,?), (?,1,?), (?,1,?), (?,1,?), (?,1,?), (?,1,?), (?,1,?), (?,1,?), (?,1,?)"), [num,scores[0],num,scores[1],num,scores[2],num,scores[3],num,scores[4],num,scores[5],num,scores[6],num,scores[7],num,scores[8],num,scores[9]], function(err,res){
        console.log("DONE!");
    }
}
});

//create server
app.listen(3000, function () {
    console.log("Server runs");
})