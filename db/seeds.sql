USE shema;


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

INSERT INTO questions (question) VALUES
("Your mind is always buzzing with unexplored ideas and plans"),
("Generally speaking, you rely more on your experience than your imagination"),
("You find it easy to stay relaxed and focused even when there is some pressure"),
("You rarely do something just out of sheer curiosity"),
("People can rarely upset you"),
("It is often difficult for you to relate to other people's feelings"),
("In a discussion, truth should be more important than people's sensitivities"),
("You rarely get carried away by fantasies and ideas"),
("You think that everyone's views should be respected regardless of whether they are supported by facts or not"),
("You feel more energetic after spending time with a group of people");

INSERT INTO scores (friend_id, question_id, score) VALUES 
(1,1,3), (1,2,2), (1,3,4), (1,4,1), (1,5,5), (1,6,4), (1,7,1), (1,8,3), (1,9,4), (1,10,4),
(2,1,4), (2,2,4), (2,3,1), (2,4,2), (2,5,4), (2,6,1), (2,7,4), (2,8,1), (2,9,1), (2,10,3),
(3,1,3), (3,2,3), (3,3,5), (3,4,4), (3,5,5), (3,6,3), (3,7,4), (3,8,1), (3,9,3), (3,10,1),
(4,1,3), (4,2,4), (4,3,4), (4,4,2), (4,5,1), (4,6,5), (4,7,4), (4,8,3), (4,9,4), (4,10,3),
(5,1,4), (5,2,2), (5,3,5), (5,4,2), (5,5,5), (5,6,4), (5,7,3), (5,8,4), (5,9,1), (5,10,5),
(6,1,3), (6,2,4), (6,3,4), (6,4,2), (6,5,4), (6,6,5), (6,7,1), (6,8,3), (6,9,4), (6,10,5),
(7,1,3), (7,2,2), (7,3,5), (7,4,4), (7,5,5), (7,6,1), (7,7,4), (7,8,1), (7,9,4), (7,10,4),
(8,1,3), (8,2,2), (8,3,5), (8,4,2), (8,5,5), (8,6,4), (8,7,1), (8,8,3), (8,9,1), (8,10,1),
(9,1,3), (9,2,4), (9,3,5), (9,4,2), (9,5,1), (9,6,5), (9,7,1), (9,8,4), (9,9,3), (9,10,5),
(10,1,3), (10,2,2), (10,3,4), (10,4,1), (10,5,4), (10,6,5), (10,7,3), (10,8,1), (10,9,4), (10,10,5),
(11,1,3), (11,2,1), (11,3,5), (11,4,2), (11,5,1), (11,6,5), (11,7,3), (11,8,3), (11,9,1), (11,10,1),
(12,1,1), (12,2,4), (12,3,1), (12,4,4), (12,5,1), (12,6,5), (12,7,1), (12,8,4), (12,9,3), (12,10,3),
(13,1,3), (13,2,1), (13,3,4), (13,4,2), (13,5,5), (13,6,1), (13,7,3), (13,8,4), (13,9,4), (13,10,4),
(14,1,3), (14,2,4), (14,3,5), (14,4,4), (14,5,5), (14,6,5), (14,7,1), (14,8,3), (14,9,1), (14,10,5),
(15,1,1), (15,2,1), (15,3,4), (15,4,1), (15,5,4), (15,6,1), (15,7,4), (15,8,3), (15,9,3), (15,10,1),
(16,1,3), (16,2,2), (16,3,5), (16,4,2), (16,5,3), (16,6,4), (16,7,1), (16,8,3), (16,9,3), (16,10,4),
(17,1,4), (17,2,4), (17,3,1), (17,4,4), (17,5,1), (17,6,4), (17,7,3), (17,8,4), (17,9,4), (17,10,3),
(18,1,3), (18,2,2), (18,3,3), (18,4,3), (18,5,5), (18,6,3), (18,7,4), (18,8,3), (18,9,1), (18,10,5),
(19,1,3), (19,2,1), (19,3,4), (19,4,2), (19,5,4), (19,6,1), (19,7,4), (19,8,1), (19,9,3), (19,10,4),
(20,1,4), (20,2,4), (20,3,5), (20,4,4), (20,5,5), (20,6,4), (20,7,1), (20,8,3), (20,9,1), (20,10,5);
