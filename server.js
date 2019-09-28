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

app.use(bodyParser.urlencoded({ extended: true }));



// Creates the connection with the server and loads the product data upon a successful connection
connection.connect(function (err) {
    if (err) {
        console.error("error connecting: " + err.stack);
    }
    console.log("Database connected");
});

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
    connection.query("SELECT f.friend_name, f.picture_link, GROUP_CONCAT(s.score) AS scores FROM scores s JOIN friends f USING (friend_id) GROUP BY friend_id", function (err, response){
        var friends = [];
        for (var i = 0; i < response.length; i++){
            var friend = {};
            friend.name = response[i].friend_name;
            friend.link = response[i].picture_link;
            friend.scores = [];
            for (var p = 0; p < response[i].scores.length; p ++){
                if (response[i].scores[p] != ",")
                friend.scores.push(response[i].scores[p]);
            }
            friends.push(friend);
        }
        res.json(friends);
    })
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

    connection.query("INSERT INTO friends(friend_name, picture_link) VALUES (?, ?)", [name, link], function (err, res) {
        takeNewFriendId(name, link);
    });
    function takeNewFriendId(str,link) {
        connection.query("SELECT friend_id FROM friends WHERE friend_name = ? AND picture_link=?", [str,link], function (err, res) {
            insertScores(res[0].friend_id);
        });
    };

    function insertScores(num) {
        connection.query("INSERT INTO scores (friend_id, question_id, score) VALUES (?,1,?), (?,2,?), (?,3,?), (?,4,?), (?,5,?), (?,6,?), (?,7,?), (?,8,?), (?,9,?), (?,10,?)", [num, scores[0], num, scores[1], num, scores[2], num, scores[3], num, scores[4], num, scores[5], num, scores[6], num, scores[7], num, scores[8], num, scores[9]], function (err, res) {
            takeDiff(num);
        });
};

    function takeDiff(num){ 
        connection.query("SELECT * FROM (SELECT SUM(score_difference) ans_diff_total, friend_id, t2friend_id FROM (SELECT question_id, friend_id, t2friend_id, score_difference FROM  (SELECT *, ABS(score-t2score) AS score_difference FROM (SELECT * FROM scores s1 LEFT JOIN (SELECT question_id AS t2question_id, friend_id AS t2friend_id, score AS t2score FROM scores s2) t2 ON t2question_id = s1.question_id) t3) t4) t5 GROUP BY t2friend_id, friend_id) t6 LEFT JOIN friends  ON t2friend_id = friends.friend_id WHERE t6.friend_id = ? ORDER BY ans_diff_total", [num], function (err, results){
            console.log(results[1]["friend_name"]);
            console.log(results[1]["picture_link"]);
        });
        };
});

//create server
app.listen(3000, function () {
    console.log("Server runs");
})