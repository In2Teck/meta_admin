create 'wikiapodos', 'mysql'
connection 'jc_wikiapodos', 'rails', 't2omedia', 'apps.t2omedia.com.mx'

table 'usuarios'
column 'facebook_id', 'string'
column 'nombre', 'string'
column 'apellido', 'string'
column 'email', 'string'
column 'es_fan', 'string'
column 'fecha_creacion', 'datetime'
column 'fecha_actualizacion', 'datetime'
has_many ['compartidos']

table 'compartidos'
column 'usuario_id', 'string'
column 'apodo_id', 'integer'
column 'origen', 'string'
column 'fecha_creacion', 'datetime'
column 'fecha_actualizacion', 'datetime'
belongs_to [['usuarios', ':primary_key => :facebook_id'], 'apodos'] 

scaffold
