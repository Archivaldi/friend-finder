CREATE DATABASE IF NOT EXISTS shema;

USE shema;

CREATE TABLE questions(
    question_id INT NOT NULL AUTO_INCREMENT,
    question VARCHAR(200),
    PRIMARY KEY (question_id)
);

CREATE TABLE friends(
    friend_id INT NOT NULL AUTO_INCREMENT,
    friend_name VARCHAR(101),
    picture_link VARCHAR(200),
    PRIMARY KEY (friend_id)
);

CREATE TABLE scores (
    friend_id INT NOT NULL,
    question_id INT NOT NULL,
    score INT NOT NULL,
    FOREIGN KEY (friend_id) REFERENCES friends(friend_id),
    FOREIGN KEY (question_id) REFERENCES questions(question_id)
);

INSERT INTO friends (friend_name, picture_link) VALUES 
("Maybell Dambrosio", "https://static.boredpanda.com/blog/wp-content/uploads/2018/04/5acb63d83493f__700-png.jpg"), 
("Cami Ventura", "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR_KVEv2hHP29l-M2gsLMhzDZHMfYWZO5ecqGA5OzJVDYHHatrx"),
("Lurline Hunnicutt", "https://static.scientificamerican.com/sciam/cache/file/32665E6F-8D90-4567-9769D59E11DB7F26_source.jpg?w=590&h=800&7E4B4CAD-CAE1-4726-93D6A160C2B068B2"),
("Magen Mathias", "https://www.humanesociety.org/sites/default/files/styles/400x400/public/2018/06/cat-217679.jpg?h=c4ed616d&itok=H0FcH69a"),
("Gabriele Failla", "https://www.popsci.com/resizer/Y8hOGlHlO0BDVr8GVbLu4zqy9AA=/1008x672/filters:focal(960x640:961x641)/arc-anglerfish-arc2-prod-bonnier.s3.amazonaws.com/public/4EUUM6DNKBCZAOKBI2G3U6TRFQ.jpg"),
("Kendrick Clauss", "https://i.ytimg.com/vi/PbQNjkDCIn4/maxresdefault.jpg"),
("Madeline Rosecrans", "https://s.abcnews.com/images/GMA/gma-cat-groomsman-1-ht-jcl-190814_hpMain_16x9_992.jpg"),
("Lora Henriquez", "https://mymodernmet.com/wp/wp-content/uploads/2019/07/russian-blue-cats-17.jpg"),
("Barney Hobdy", "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80"),
("Nana Triggs", "https://imgix.bustle.com/uploads/getty/2018/4/13/5268bf1a-f786-4743-9474-6614fec8638c-getty-915821408.jpg?w=970&h=546&fit=crop&crop=faces&auto=format&q=70"),
("Clint Bissonette", "https://i.kinja-img.com/gawker-media/image/upload/s--eZrGJpKG--/c_scale,f_auto,fl_progressive,q_80,w_800/mfsptkstqthdh8xrdydn.jpg"),
("Erik Gennaro", "https://cdn.shopify.com/s/files/1/3004/1474/products/orange-tabby_1800x1800.png?v=1544042837"),
("Alona Box", "https://petharbor.com/get_image.asp?RES=detail&ID=A418149&LOCATION=SNFR"),
("Dahlia Lenox", "https://peopledotcom.files.wordpress.com/2018/02/two-tone-cat.jpg"),
("Aleisha Richerson", "https://images-na.ssl-images-amazon.com/images/I/71EhiFce9pL._SX466_.jpg"),
("Jessica Hillyer", "https://www.washingtonian.com/wp-content/uploads/2019/07/Sapphire-2-2048x2048.jpg"),
("Kenyatta Maldonado", "https://i.ytimg.com/vi/n62ZdxxbLZA/maxresdefault.jpg"),
("Concepcion Lippincott", "https://www.abc.net.au/news/image/10585188-3x2-700x467.jpg"),
("Rossie Maitland", "https://cdn.theatlantic.com/assets/media/img/mt/2019/07/lickcat/lead_720_405.jpg?mod=1564421316"),
("Shaunda Cao", "https://d17fnq9dkz9hgj.cloudfront.net/uploads/2012/11/100901720-cat-adoption-first-30-days-632x475.jpg");