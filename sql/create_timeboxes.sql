create table timeboxes
(
    id        integer primary key autoincrement,
    name      text,          -- The sprint's name
    begindate text not null, -- The sprint's beginning date
    enddate   text not null  -- The sprint's end date
);