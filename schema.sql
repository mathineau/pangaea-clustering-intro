-- In order to use this schema, you will have to create a UTF8 encoded database and then create 
-- the postgis and postgis_topology extension,
-- E.X: create database pangaeaultima ENCODING='UTF8';
--      create extension postgis;
--      create extension postgis_topology;

-- Constains information about a group of stencil (Countries, Provinces/States, Cities etc.).
create table STENCIL_GROUP (
    name varchar(128) primary key,
    description text
);

-- Constains the Stencil used for guide generation. Stencils are grabbed from 
-- OSM via overpass (http://overpass-api.de/). For an example of stencil, see
-- http://www.openstreetmap.org/relation/1428125
create table STENCIL (
    geometry geometry NOT NULL,
    url varchar(512) primary key,
    stencil_group varchar(512),
    attributes JSON,
    CONSTRAINT fk_stencil_group_stencil FOREIGN KEY(stencil_group) REFERENCES STENCIL_GROUP(name) ON DELETE cascade ON UPDATE CASCADE
);

-- Contains the Features Of Interests collected from the various sources.
create table FOI (
    geometry geometry NOT NULL,
    url varchar(512) primary key,
    source varchar(512), -- the tld of the source of the FOI. De-normalized from url for performance.
    attributes JSON
);

-- geometry indexes.
create index stencil_geometry on stencil using gist(geometry);
create index foi_geometry on foi using gist(geometry);

-- relation indexes.
create index stencil_stencil_group on stencil using btree(stencil_group);

-- source index.
create index foi_source on foi using btree(source);

-- Clustering on Geospatial indexe of stencil since it's mostly read only. See
-- http://postgis.net/docs/manual-1.4/ch06.html for details.
CLUSTER stencil_geometry ON STENCIL;

