create 'wikiapodos', 'mysql'
connection 'rails', 't2omedia', 'apps.t2omedia.com.mx'

table 'usuarios'
column 'facebook_id', 'string'
column 'nombre', 'string'
column 'apellido', 'string'
column 'email', 'string'
column 'es_fan', 'boolean'
