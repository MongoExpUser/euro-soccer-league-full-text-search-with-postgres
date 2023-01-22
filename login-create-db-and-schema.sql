-- login, create database, create schema, and set path
-- all command=s form postgres shell

-- login on Ubuntu : udo -u postgres psql -d postgres
-- login on MacOS  : psql -d postgres

CREATE DATABASE euro WITH TEMPLATE=template0 OWNER=postgres ENCODING='UTF8' LOCALE='C';
CREATE SCHEMA IF NOT EXISTS league AUTHORIZATION postgres;

\c euro

-- set and show schema/path
SET search_path TO soccer, public;
SHOW search_path;