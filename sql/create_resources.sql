create table resources
(
    id         integer primary key, -- Resource id in the gantt project, must begin at 1
    first_name text,                -- Resource's first name,
    last_name  text,                -- Resource's last name,
    email      text unique,         -- Resource's email,
    phone      text,                -- Resource's phone number
    std_rate   real, -- Resource's standard hourly rate
    role_name  text,
    foreign key (role_name) references roles(name) on delete cascade on update cascade
);