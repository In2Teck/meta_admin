create 'wikiapodos', 'mysql'
connection 'jc_wikiapodos', 'rails', 't2omedia', 'apps.t2omedia.com.mx'

table 'usuarios'
column 'facebook_id', 'string'
column 'nombre', 'string'
column 'apellido', 'string'
column 'email', 'string'
column 'es_fan', 'boolean'
has_many ['compartidos']

table 'compartidos'
column 'usuario_id', 'integer'
column 'apodo_id', 'integer'
column 'origen', 'string'
belongs_to ['usuarios', 'apodos'] 

scaffold
