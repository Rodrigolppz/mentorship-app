-- +goose Up
CREATE TABLE communities (
    id          uuid        PRIMARY KEY DEFAULT uuidv7(),
    slug        text        NOT NULL UNIQUE
                            CHECK (slug ~ '^[a-z0-9]+(-[a-z0-9]+)*$'),
    name        text        NOT NULL,
    description text        NOT NULL DEFAULT '',
    created_by  uuid        REFERENCES users (id) ON DELETE SET NULL,
    created_at  timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE memberships (
    community_id uuid        NOT NULL REFERENCES communities (id) ON DELETE CASCADE,
    user_id      uuid        NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    role         text        NOT NULL CHECK (role IN ('owner', 'moderator', 'member')),
    joined_at    timestamptz NOT NULL DEFAULT now(),
    PRIMARY KEY (community_id, user_id)
);

CREATE INDEX memberships_user_id_idx ON memberships (user_id);

CREATE TABLE sessions (
    token_hash text        PRIMARY KEY,
    user_id    uuid        NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    expires_at timestamptz NOT NULL,
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX sessions_user_id_idx ON sessions (user_id);

-- +goose Down
DROP TABLE sessions;
DROP TABLE memberships;
DROP TABLE communities;