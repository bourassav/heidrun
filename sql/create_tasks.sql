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