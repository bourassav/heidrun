create table allocations
(
    task_id     integer,
    resource_id integer,
    team_id     integer,
    responsability_id     integer,
    responsible text, -- Boolean
    load        real, -- Number of hours for the task
    primary key (task_id, resource_id),
    foreign key (task_id) references tasks (id) on delete cascade on update cascade,
    foreign key (resource_id) references resources (id) on delete cascade on update cascade,
    foreign key (responsability_id) references responsibilities (id) on delete cascade on update cascade,
    foreign key (team_id) references teams (id) on delete cascade on update cascade
);