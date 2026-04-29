\connect northwind
\i /docker-entrypoint-initdb.d/northwind_dump_latest.sql

\connect ardine
\i /docker-entrypoint-initdb.d/ardine_dump_latest.sql