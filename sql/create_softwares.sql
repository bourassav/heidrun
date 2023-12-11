create table softwares
(
    name     text primary key,
    script   text not null, -- Path to the updating script
    user     text,          -- User login name
    password text,          -- Password to login
    token    text,          -- Token to access API
    secret   text           -- Secret to access API
);