use codeup_test_db;

CREATE TABLE roles (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  role_id INT UNSIGNED DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

INSERT INTO users (name, email, role_id) VALUES
  ('bob', 'bob@example.com', 1),
  ('joe', 'joe@example.com', 2),
  ('sally', 'sally@example.com', 3),
  ('adam', 'adam@example.com', 3),
  ('jane', 'jane@example.com', null),
  ('mike', 'mike@example.com', null);

# JOIN w/o specification defaults to an inner join
# Inner join is an AND operation
select * from users
join roles on roles.id = users.role_id;

# Left join
# Left means get all values from the first table specified
# showing nulls on the right
select * from users
left join roles on roles.id = users.role_id;

# Right join
# Right means get all the values from the second table specified
# showing nulls from the left
select * from users
right join roles on roles.id = users.role_id;
