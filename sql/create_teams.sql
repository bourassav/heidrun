create table teams
(
    id            integer primary key autoincrement,
    name          text,
    source        text, -- The team's task management solution url.
    software_name text,
    foreign key (software_name) references softwares (name) on delete cascade on update cascade
);