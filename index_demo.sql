drop table if exists quotes;

show tables;

CREATE TABLE quotes (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT primary key,
  author_first_name VARCHAR(50),
  author_last_name  VARCHAR(100) NOT NULL,
  content VARCHAR(255) NOT NULL
);

# ensure we only have unique quotes
alter table quotes
    add unique (content);

insert into quotes (author_first_name, author_last_name, content)
    values ('Bart', 'Simpson', 'Eat my shorts');

insert into quotes (author_first_name, author_last_name, content)
values ('Mayor', 'Quimby', 'Eat my shorts');