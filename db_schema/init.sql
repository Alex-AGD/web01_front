CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    content TEXT NOT NULL,
    post_id INTEGER REFERENCES posts(id) ON DELETE CASCADE,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE
);

INSERT INTO users (name, email) VALUES
('User1', 'user1@example.com'),
('User2', 'user2@example.com'),
('User3', 'user3@example.com'),
('User4', 'user4@example.com'),
('User5', 'user5@example.com'),
('User6', 'user6@example.com'),
('User7', 'user7@example.com'),
('User8', 'user8@example.com'),
('User9', 'user9@example.com'),
('User10', 'user10@example.com');

INSERT INTO posts (title, content, user_id) VALUES
('Post1', 'Content for post 1', 1),
('Post2', 'Content for post 2', 2),
('Post3', 'Content for post 3', 3),
('Post4', 'Content for post 4', 4),
('Post5', 'Content for post 5', 5),
('Post6', 'Content for post 6', 6),
('Post7', 'Content for post 7', 7),
('Post8', 'Content for post 8', 8),
('Post9', 'Content for post 9', 9),
('Post10', 'Content for post 10', 10);

INSERT INTO comments (content, post_id, user_id) VALUES
('Comment1 for Post1', 1, 1),
('Comment2 for Post1', 1, 2),
('Comment1 for Post2', 2, 3),
('Comment2 for Post2', 2, 4),
('Comment1 for Post3', 3, 5),
('Comment2 for Post3', 3, 6),
('Comment1 for Post4', 4, 7),
('Comment2 for Post4', 4, 8),
('Comment1 for Post5', 5, 9),
('Comment2 for Post5', 5, 10);
