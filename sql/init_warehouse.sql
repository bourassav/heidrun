-- Creating roles, project level

drop table if exists roles;

create table roles
(
    id         integer primary key, -- This id must begin at 1
    name       text,
    short_name text
);

insert into roles
values (1, 'Business Sponsor', 'BSponsor'),
       (2, 'Business Visionnary', 'BVision'),
       (3, 'Business Analyst', 'BAnalyst'),
       (4, 'Technical Coordinator', 'TCoord'),
       (5, 'Project Manager', 'PManager'),
       (6, 'Business Ambassador', 'BAmbass'),
       (7, 'Team Leader', 'TLeader'),
       (8, 'Solution Developer', 'SDevelop'),
       (9, 'Solution Tester', 'STester'),
       (10, 'Business Advisor', 'BAdvisor'),
       (11, 'Technical Advisor', 'TAdvisor'),
       (12, 'Workshop Facilitator', 'WFacil'),
       (13, 'DSDM Coach', 'Coach');

-- Creating the responsibility (RACI) for every tasks
drop table if exists responsibilities;

create table responsibilities
(
    id   integer primary key, -- This id must begin at 1
    name text unique -- The name of the role in AgilePM
);

insert into responsibilities
values (1, 'Responsible'),
       (2, 'Accountable'),
       (3, 'Consulted'),
       (4, 'Informed');

-- Creating the sprints

drop table if exists sprints;

create table sprints
(
    id        integer primary key autoincrement,
    name      text,          -- The sprint's name
    begindate text not null, -- The sprint's beginning date
    enddate   text not null  -- The sprint's end date
);

-- Creating software & access

drop table if exists softwares;

create table softwares
(
    name     text primary key,
    script   text not null, -- Path to the updating script
    user     text,          -- User login name
    password text,          -- Password to login
    token    text,          -- Token to access API
    secret   text           -- Secret to access API
);

-- Create teams

drop table if exists teams;

create table teams
(
    id            integer primary key autoincrement,
    name          text,
    source        text, -- The team's task management solution url.
    software_name text,
    foreign key (software_name) references softwares (name) on delete cascade on update cascade
);

-- Creating the resources

drop table if exists resources;

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

-- Creating the tasks

drop table if exists tasks;

create table tasks
(
    id         integer primary key,
    type       text,    -- task type milestone, task or category
    priority   real,
    notes      text,    -- task's comments and description
    name       text,
    begindate  text,    -- the date the tasks began
    enddate    text,    -- the date the tasks was finished
    duration   integer, -- number of days to complete the task from start to finish
    completion real,    -- the level of progress on the task,
    timespent  text,    -- number of hours spent on a task
    estimate   text,    -- estimate in hours to complete the task
    sprint_id  integer  -- the id of which the tasks is bound
);

-- Creating allocations

drop table if exists allocations;

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