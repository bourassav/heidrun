drop table if exists resources;

create table

drop table if exists allocations;

create table allocations(
    task_id integer,
    resource_id integer,
    role_id integer,
    responsible text, -- Boolean
    primary key(task_id, resource_id),
    foreign key (task_id) references tasks(task_id) on delete cascade on update cascade ,
    foreign key (resource_id) references resources(resource_id) on delete cascade on update cascade ,
    foreign key (role_id) references roles(role_id) on delete cascade on update cascade
);
