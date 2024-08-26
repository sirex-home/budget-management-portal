create table if not exists budgets
(
    id                  bigint primary key generated always as identity,
    last_event_number   bigint not null,

    title               text not null,
    description         text,
    status              text,
    amount              decimal,

    created_at          timestamp not null,
    updated_at          timestamp not null,
    updated_by          bigint not null,

    version             integer not null
);

create table if not exists budget_events
(
    id                  bigint primary key generated always as identity,
    budget_id           bigint not null references budgets,
    sequence_number     bigint not null,

    payload             json not null,

    created_at          timestamp not null,
    created_by          text not null
);
create index on budget_events (budget_id);



INSERT INTO budgets (last_event_number, title, description, status, amount, created_at, updated_at, updated_by, version)
VALUES
    (1,'Summer school budget', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', 'APPROVED', 1000, '2024-08-25T19:03:09.340634683Z', '2024-08-25T19:03:09.340634683Z', 42, 1),
    (2,'New Year budget', 'Lorem  eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'APPROVED', 1000, '2024-08-25T19:03:09.340634683Z', '2024-08-25T19:03:09.340634683Z', 42, 1),
    (3,'NORAD budget', 'Lorem  eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'APPROVED', 1000, '2024-08-25T19:03:09.340634683Z', '2024-08-25T19:03:09.340634683Z', 42, 1),
    (4,'Oslo property budget', 'Lorem  eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'APPROVED', 1000, '2024-08-25T19:03:09.340634683Z', '2024-08-25T19:03:09.340634683Z', 42, 1),
    (5,'London property budget', 'Lorem  eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'APPROVED', 1000, '2024-08-25T19:03:09.340634683Z', '2024-08-25T19:03:09.340634683Z', 42, 1),
    (6,'Malmo property budget', 'Lorem  eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'APPROVED', 1000, '2024-08-25T19:03:09.340634683Z', '2024-08-25T19:03:09.340634683Z', 42, 1),
    (7,'Izmir property budget', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', 'APPROVED', 1000, '2024-08-25T19:03:09.340634683Z', '2024-08-25T19:03:09.340634683Z', 42, 1),
    (8,'Munich property budget', 'Lorem  eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'APPROVED', 1000, '2024-08-25T19:03:09.340634683Z', '2024-08-25T19:03:09.340634683Z', 42, 1),
    (9,'Airspace budget', 'Lorem  eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'APPROVED', 1000, '2024-08-25T19:03:09.340634683Z', '2024-08-25T19:03:09.340634683Z', 42, 1),
    (10,'Science budget', 'Lorem  eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'APPROVED', 1000, '2024-08-25T19:03:09.340634683Z', '2024-08-25T19:03:09.340634683Z', 42, 1),
    (11,'Tourism budget', 'Lorem  eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'APPROVED', 1000, '2024-08-25T19:03:09.340634683Z', '2024-08-25T19:03:09.340634683Z', 42, 1),
    (12,'Kyiv budget', 'Lorem  eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'APPROVED', 1000, '2024-08-25T19:03:09.340634683Z', '2024-08-25T19:03:09.340634683Z', 42, 1),
    (13,'Chisinau budget', 'Lorem  eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'APPROVED', 1000, '2024-08-25T19:03:09.340634683Z', '2024-08-25T19:03:09.340634683Z', 42, 1),
    (14,'Public transport budget', 'Lorem  eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'APPROVED', 1000, '2024-08-25T19:03:09.340634683Z', '2024-08-25T19:03:09.340634683Z', 42, 1),
    (15,'Healthcare budget', 'Lorem  eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'APPROVED', 1000, '2024-08-25T19:03:09.340634683Z', '2024-08-25T19:03:09.340634683Z', 42, 1)
;

INSERT INTO budget_events (budget_id, sequence_number, payload, created_at, created_by)
VALUES
    (1, 1, '{ "type": "CREATE", "title": "Summer school budget", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (1, 2, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (1, 3, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (1, 4, '{ "type": "UPDATE", "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42)
;
