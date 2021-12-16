--crear base de datos blog

postgres=# CREATE DATABASE blog;
CREATE DATABASE

postgres=# \c blog;
Ahora está conectado a la base de datos «blog» con el usuario «administrador».

-- crear tablas 

blog=# CREATE TABLE usuario(id INT PRIMARY KEY, email VARCHAR(100));
CREATE TABLE
blog=# CREATE TABLE post(id INT PRIMARY KEY, usuario_id INT REFERENCES usuario(id), titulo VARCHAR(100), fecha DATE);
CREATE TABLE
blog=# CREATE TABLE comentario(id INT PRIMARY KEY, post_id INT REFERENCES post(id), usuario_id INT REFERENCES usuario(id), texto VARCHAR(200), fecha DATE);
CREATE TABLE

-- insertar datos

blog=# INSERT INTO usuario (id, email) VALUES (1, 'usuario01@hotmail.com'), (2, 'usuario02@gmail.com'), (3, 'usuario03@gmail.com'), (4, 'usuario04@hotmail.com'), (5, 'usuario05@yahoo.com'), (6, 'usuario06@hotmail.com'), (7, 'usuario07@yahoo.com'), (8, 'usuario08@yahoo.com'), (9, 'usuario09@yahoo.com');
INSERT 0 9


blog=# SELECT * FROM usuario;
 id |         email
----+-----------------------
  1 | usuario01@hotmail.com
  2 | usuario02@gmail.com
  3 | usuario03@gmail.com
  4 | usuario04@hotmail.com
  5 | usuario05@yahoo.com
  6 | usuario06@hotmail.com
  7 | usuario07@yahoo.com
  8 | usuario08@yahoo.com
  9 | usuario09@yahoo.com
(9 filas)

blog=# INSERT INTO post (id, usuario_id, titulo, fecha) VALUES (1, 1, 'Post 1: Esto es malo', '2020-06-29'), (2, 5, 'Post 2: Esto es malo', '2020-06-20'), (3, 1, 'Post 3: Esto es excelente', '2020-05-30'), (4, 9, 'Post 4: Esto es bueno', '2020-05-09'), (5, 7, 'Post 5: Esto es bueno', '2020-07-10'), (6, 5, 'Post 6: Esto es excelente', '2020-07-18'), (7, 8, 'Post 7: Esto es excelente', '2020-07-07'), (8, 5, 'Post 8: Esto es excelente', '2020-05-14'), (9, 2, 'Post 9: Esto es bueno', '2020-05-08'), (10, 6, 'Post 10: Esto es bueno', '2020-06-02'), (11, 4, 'Post 11: Esto es bueno', '2020-05-05'), (12, 9, 'Post 12: Esto es malo', '2020-07-23'), (13, 5, 'Post 13: Esto es excelente', '2020-05-30'), (14, 8, 'Post 14: Esto es excelente', '2020-05-01'), (15, 7, 'Post 15: Esto es malo', '2020-06-17');
INSERT 0 15
blog=# SELECT * FROM post;
 id | usuario_id |           titulo           |   fecha
----+------------+----------------------------+------------
  1 |          1 | Post 1: Esto es malo       | 2020-06-29
  2 |          5 | Post 2: Esto es malo       | 2020-06-20
  3 |          1 | Post 3: Esto es excelente  | 2020-05-30
  4 |          9 | Post 4: Esto es bueno      | 2020-05-09
  5 |          7 | Post 5: Esto es bueno      | 2020-07-10
  6 |          5 | Post 6: Esto es excelente  | 2020-07-18
  7 |          8 | Post 7: Esto es excelente  | 2020-07-07
  8 |          5 | Post 8: Esto es excelente  | 2020-05-14
  9 |          2 | Post 9: Esto es bueno      | 2020-05-08
 10 |          6 | Post 10: Esto es bueno     | 2020-06-02
 11 |          4 | Post 11: Esto es bueno     | 2020-05-05
 12 |          9 | Post 12: Esto es malo      | 2020-07-23
 13 |          5 | Post 13: Esto es excelente | 2020-05-30
 14 |          8 | Post 14: Esto es excelente | 2020-05-01
 15 |          7 | Post 15: Esto es malo      | 2020-06-17
(15 filas)

blog=# INSERT INTO comentario (id, usuario_id, post_id, texto, fecha) VALUES (1, 3, 6, 'Este es el comentario 1', '2020-07-08'), (2, 4, 2, 'Este es el comentario 2', '2020-06-07'), (3, 6, 4, 'Este es el comentario 3', '2020-06-16'), (4, 2, 13, 'Este es el comentario 4', '2020-06-15'), (5, 6, 6, 'Este es el comentario 5', '2020-05-14'), (6, 3, 3, 'Este es el comentario 6', '2020-07-08'), (7, 6, 1, 'Este es el comentario 7', '2020-05-22'), (8, 6, 7, 'Este es el comentario 8', '2020-07-09'), (9, 8, 13, 'Este es el comentario 9', '2020-06-30'), (10, 8, 6, 'Este es el comentario 10', '2020-06-19'), (11, 5, 1, 'Este es el comentario 11', '2020-05-09'), (12, 8, 15, 'Este es el comentario 12', '2020-06-17'), (13, 1, 9, 'Este es el comentario 13', '2020-05-01'), (14, 2, 5, 'Este es el comentario 14', '2020-05-31'), (15, 4, 3, 'Este es el comentario 15', '2020-06-28');
INSERT 0 15
blog=# SELECT * FROM comentario;
 id | post_id | usuario_id |          texto           |   fecha
----+---------+------------+--------------------------+------------
  1 |       6 |          3 | Este es el comentario 1  | 2020-07-08
  2 |       2 |          4 | Este es el comentario 2  | 2020-06-07
  3 |       4 |          6 | Este es el comentario 3  | 2020-06-16
  4 |      13 |          2 | Este es el comentario 4  | 2020-06-15
  5 |       6 |          6 | Este es el comentario 5  | 2020-05-14
  6 |       3 |          3 | Este es el comentario 6  | 2020-07-08
  7 |       1 |          6 | Este es el comentario 7  | 2020-05-22
  8 |       7 |          6 | Este es el comentario 8  | 2020-07-09
  9 |      13 |          8 | Este es el comentario 9  | 2020-06-30
 10 |       6 |          8 | Este es el comentario 10 | 2020-06-19
 11 |       1 |          5 | Este es el comentario 11 | 2020-05-09
 12 |      15 |          8 | Este es el comentario 12 | 2020-06-17
 13 |       9 |          1 | Este es el comentario 13 | 2020-05-01
 14 |       5 |          2 | Este es el comentario 14 | 2020-05-31
 15 |       3 |          4 | Este es el comentario 15 | 2020-06-28
(15 filas)

-- listar post usuario 5

blog=# SELECT u.email, p.id, p.titulo FROM usuario u INNER JOIN post p ON u.id = p.usuario_id WHERE u.id = 5;
        email        | id |           titulo
---------------------+----+----------------------------
 usuario05@yahoo.com |  2 | Post 2: Esto es malo
 usuario05@yahoo.com |  6 | Post 6: Esto es excelente
 usuario05@yahoo.com |  8 | Post 8: Esto es excelente
 usuario05@yahoo.com | 13 | Post 13: Esto es excelente
(4 filas)

-- listar comentarios de usuario06@hotmail.com

blog=# SELECT u.email, c.id, c.texto FROM usuario u INNER JOIN comentario c ON u.id = c.usuario_id WHERE u.email = 'usuario06@hotmail.com';
         email         | id |          texto
-----------------------+----+-------------------------
 usuario06@hotmail.com |  3 | Este es el comentario 3
 usuario06@hotmail.com |  5 | Este es el comentario 5
 usuario06@hotmail.com |  7 | Este es el comentario 7
 usuario06@hotmail.com |  8 | Este es el comentario 8
(4 filas)

-- listar usuarios sin post

blog=# SELECT p.id, u.email FROM post p RIGHT JOIN usuario u ON p.usuario_id = u.id WHERE p.id IS NULL;
 id |        email
----+---------------------
    | usuario03@gmail.com
(1 fila)


-- listar los post con sus comentarios

blog=# SELECT p.id, p.titulo, c.texto FROM post p LEFT JOIN comentario c on p.id = c.post_id;
 id |           titulo           |          texto
----+----------------------------+--------------------------
  6 | Post 6: Esto es excelente  | Este es el comentario 1
  2 | Post 2: Esto es malo       | Este es el comentario 2
  4 | Post 4: Esto es bueno      | Este es el comentario 3
 13 | Post 13: Esto es excelente | Este es el comentario 4
  6 | Post 6: Esto es excelente  | Este es el comentario 5
  3 | Post 3: Esto es excelente  | Este es el comentario 6
  1 | Post 1: Esto es malo       | Este es el comentario 7
  7 | Post 7: Esto es excelente  | Este es el comentario 8
 13 | Post 13: Esto es excelente | Este es el comentario 9
  6 | Post 6: Esto es excelente  | Este es el comentario 10
  1 | Post 1: Esto es malo       | Este es el comentario 11
 15 | Post 15: Esto es malo      | Este es el comentario 12
  9 | Post 9: Esto es bueno      | Este es el comentario 13
  5 | Post 5: Esto es bueno      | Este es el comentario 14
  3 | Post 3: Esto es excelente  | Este es el comentario 15
 11 | Post 11: Esto es bueno     |
 12 | Post 12: Esto es malo      |
 10 | Post 10: Esto es bueno     |
  8 | Post 8: Esto es excelente  |
 14 | Post 14: Esto es excelente |
(20 filas)

-- listar usuarios que hayan hecho un post en junio

blog=# SELECT u.id, u.email, p.titulo, p.fecha FROM usuario u RIGHT JOIN post p ON u.id = p.usuario_id WHERE fecha BETWEEN '2020-06-01' AND '2020-06-30';
 id |         email         |         titulo         |   fecha
----+-----------------------+------------------------+------------
  1 | usuario01@hotmail.com | Post 1: Esto es malo   | 2020-06-29
  5 | usuario05@yahoo.com   | Post 2: Esto es malo   | 2020-06-20
  6 | usuario06@hotmail.com | Post 10: Esto es bueno | 2020-06-02
  7 | usuario07@yahoo.com   | Post 15: Esto es malo  | 2020-06-17
(4 filas)

