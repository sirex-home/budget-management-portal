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
