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
    created_by          bigint not null
);
create index on budget_events (budget_id);



INSERT INTO budgets (last_event_number, title, description, status, amount, created_at, updated_at, updated_by, version)
VALUES
    (4,'Summer school budget', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', 'APPROVED', 1000, '2024-08-25T19:03:09.340634683Z', '2024-08-25T19:03:09.340634683Z', 42, 1),
    (4,'New Year budget', 'Lorem  eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'APPROVED', 1000, '2024-08-25T19:03:09.340634683Z', '2024-08-25T19:03:09.340634683Z', 42, 1),
    (4,'NORAD budget', 'Lorem  eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'APPROVED', 1000, '2024-08-25T19:03:09.340634683Z', '2024-08-25T19:03:09.340634683Z', 42, 1),
    (4,'Oslo property budget', 'Lorem  eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'APPROVED', 1000, '2024-08-25T19:03:09.340634683Z', '2024-08-25T19:03:09.340634683Z', 42, 1),
    (4,'London property budget', 'Lorem  eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'APPROVED', 1000, '2024-08-25T19:03:09.340634683Z', '2024-08-25T19:03:09.340634683Z', 42, 1),
    (4,'Malmo property budget', 'Lorem  eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'APPROVED', 1000, '2024-08-25T19:03:09.340634683Z', '2024-08-25T19:03:09.340634683Z', 42, 1),
    (4,'Izmir property budget', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', 'APPROVED', 1000, '2024-08-25T19:03:09.340634683Z', '2024-08-25T19:03:09.340634683Z', 42, 1),
    (4,'Munich property budget', 'Lorem  eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'APPROVED', 1000, '2024-08-25T19:03:09.340634683Z', '2024-08-25T19:03:09.340634683Z', 42, 1),
    (4,'Airspace budget', 'Lorem  eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'APPROVED', 1000, '2024-08-25T19:03:09.340634683Z', '2024-08-25T19:03:09.340634683Z', 42, 1),
    (4,'Science budget', 'Lorem  eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'APPROVED', 1000, '2024-08-25T19:03:09.340634683Z', '2024-08-25T19:03:09.340634683Z', 42, 1),
    (4,'Tourism budget', 'Lorem  eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'APPROVED', 1000, '2024-08-25T19:03:09.340634683Z', '2024-08-25T19:03:09.340634683Z', 42, 1),
    (4,'Kyiv budget', 'Lorem  eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'APPROVED', 1000, '2024-08-25T19:03:09.340634683Z', '2024-08-25T19:03:09.340634683Z', 42, 1),
    (4,'Chisinau budget', 'Lorem  eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'APPROVED', 1000, '2024-08-25T19:03:09.340634683Z', '2024-08-25T19:03:09.340634683Z', 42, 1),
    (4,'Public transport budget', 'Lorem  eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'APPROVED', 1000, '2024-08-25T19:03:09.340634683Z', '2024-08-25T19:03:09.340634683Z', 42, 1),
    (4,'Healthcare budget', 'Lorem  eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'APPROVED', 1000, '2024-08-25T19:03:09.340634683Z', '2024-08-25T19:03:09.340634683Z', 42, 1),
    (4,'Parachuting budget', 'Lorem  eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'APPROVED', 1000, '2024-08-25T19:03:09.340634683Z', '2024-08-25T19:03:09.340634683Z', 42, 1),
    (4,'Cycling budget', 'Lorem  eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'APPROVED', 1000, '2024-08-25T19:03:09.340634683Z', '2024-08-25T19:03:09.340634683Z', 42, 1),
    (4,'The best Budget in the world', 'Lorem  eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'APPROVED', 1000, '2024-08-25T19:03:09.340634683Z', '2024-08-25T19:03:09.340634683Z', 42, 1),
    (4,'Frodo trip budget', 'Lorem  eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'APPROVED', 1000, '2024-08-25T19:03:09.340634683Z', '2024-08-25T19:03:09.340634683Z', 42, 1),
    (4,'Hiking budget', 'Lorem  eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'APPROVED', 1000, '2024-08-25T19:03:09.340634683Z', '2024-08-25T19:03:09.340634683Z', 42, 1),
    (4,'Computing budget', 'Lorem  eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'APPROVED', 1000, '2024-08-25T19:03:09.340634683Z', '2024-08-25T19:03:09.340634683Z', 42, 1)
;

INSERT INTO budget_events (budget_id, sequence_number, payload, created_at, created_by)
VALUES
    (1, 1, '{ "type": "CREATE", "title": "Summer school budget", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (1, 2, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (1, 3, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (1, 4, '{ "type": "UPDATE", "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),

    (2, 1, '{ "type": "CREATE", "title": "New Year budget", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (2, 2, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (2, 3, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (2, 4, '{ "type": "UPDATE", "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),

    (3, 1, '{ "type": "CREATE", "title": "NORAD budget", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (3, 2, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (3, 3, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (3, 4, '{ "type": "UPDATE", "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),

    (4, 1, '{ "type": "CREATE", "title": "Oslo property budget", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (4, 2, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (4, 3, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (4, 4, '{ "type": "UPDATE", "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),

    (5, 1, '{ "type": "CREATE", "title": "London property budget", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (5, 2, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (5, 3, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (5, 4, '{ "type": "UPDATE", "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),

    (6, 1, '{ "type": "CREATE", "title": "Malmo property budget", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (6, 2, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (6, 3, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (6, 4, '{ "type": "UPDATE", "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),

    (7, 1, '{ "type": "CREATE", "title": "Summer school budget", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (7, 2, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (7, 3, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (7, 4, '{ "type": "UPDATE", "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),

    (8, 1, '{ "type": "CREATE", "title": "Summer school budget", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (8, 2, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (8, 3, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (8, 4, '{ "type": "UPDATE", "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),

    (9, 1, '{ "type": "CREATE", "title": "Summer school budget", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (9, 2, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (9, 3, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (9, 4, '{ "type": "UPDATE", "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),

    (10, 1, '{ "type": "CREATE", "title": "Summer school budget", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (10, 2, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (10, 3, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (10, 4, '{ "type": "UPDATE", "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),

    (11, 1, '{ "type": "CREATE", "title": "Summer school budget", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (11, 2, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (11, 3, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (11, 4, '{ "type": "UPDATE", "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),

    (11, 1, '{ "type": "CREATE", "title": "Summer school budget", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (11, 2, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (11, 3, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (11, 4, '{ "type": "UPDATE", "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),

    (11, 1, '{ "type": "CREATE", "title": "Summer school budget", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (11, 2, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (11, 3, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (11, 4, '{ "type": "UPDATE", "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),

    (12, 1, '{ "type": "CREATE", "title": "Summer school budget", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (12, 2, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (12, 3, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (12, 4, '{ "type": "UPDATE", "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),

    (13, 1, '{ "type": "CREATE", "title": "Summer school budget", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (13, 2, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (13, 3, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (13, 4, '{ "type": "UPDATE", "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),

    (14, 1, '{ "type": "CREATE", "title": "Summer school budget", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (14, 2, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (14, 3, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (14, 4, '{ "type": "UPDATE", "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),

    (15, 1, '{ "type": "CREATE", "title": "Summer school budget", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (15, 2, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (15, 3, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (15, 4, '{ "type": "UPDATE", "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),

    (16, 1, '{ "type": "CREATE", "title": "Summer school budget", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (16, 2, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (16, 3, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (16, 4, '{ "type": "UPDATE", "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),

    (17, 1, '{ "type": "CREATE", "title": "Summer school budget", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (17, 2, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (17, 3, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (17, 4, '{ "type": "UPDATE", "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),

    (18, 1, '{ "type": "CREATE", "title": "Summer school budget", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (18, 2, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (18, 3, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (18, 4, '{ "type": "UPDATE", "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),

    (19, 1, '{ "type": "CREATE", "title": "Summer school budget", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (19, 2, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (19, 3, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (19, 4, '{ "type": "UPDATE", "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),

    (20, 1, '{ "type": "CREATE", "title": "Summer school budget", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (20, 2, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (20, 3, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (20, 4, '{ "type": "UPDATE", "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),

    (21, 1, '{ "type": "CREATE", "title": "Summer school budget", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (21, 2, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (21, 3, '{ "type": "UPDATE", "description": "test", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42),
    (21, 4, '{ "type": "UPDATE", "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum", "amount": 1000 }', '2024-08-25T19:03:09.340634683Z', 42)
;
