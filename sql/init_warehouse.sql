-- Creating the roles
drop table if exists roles;

create table roles(
    id integer primary key, -- This id must begin at 1
    name text unique -- The name of the role in AgilePM
);

insert into roles values (1, 'Responsible'), (2, 'Accountable'), (3, 'Consulted'), (4, 'Informed');

-- Creating the resources

drop table if exists resources;

create table resources(
    id integer primary key, -- Resource id in the gantt project, must begin at 1
    first_name text, -- Resource's first name,
    last_name text, -- Resource's last name,
    email text unique, -- Resource's email,
    phone text, -- Resource's phone number
    std_rate -- Resource's standard hourly rate
);

-- Creating the tasks

drop table if exists tasks;

create table tasks(
    id integer primary key,
    type text, -- task type milestone, task or category
    priority real,
    notes text, -- task's comments and description
    name text,
    begindate text, -- the date the tasks began
    enddate text, -- the date the tasks was finished
    duration integer, -- number of days to complete the task from start to finish
    completion real -- the level of progress on the task
);

-- Creating allocations

drop table if exists allocations;

create table allocations(
    task_id integer,
    resource_id integer,
    role_id integer,
    responsible text, -- Boolean
    load real, -- Number of hours for the task
    primary key(task_id, resource_id),
    foreign key (task_id) references tasks(id) on delete cascade on update cascade ,
    foreign key (resource_id) references resources(id) on delete cascade on update cascade ,
    foreign key (role_id) references roles(id) on delete cascade on update cascade
);