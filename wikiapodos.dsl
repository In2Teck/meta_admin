create 'wikiapodos', 'mysql'
connection 'jc_wikiapodos', 'rails', 't2omedia', 'apps.t2omedia.com.mx'

table 'apodos', 'apodo'
column 'autor_id', 'string'
column 'nombre', 'string'
column 'prefijo', 'string'
column 'descripcion', 'string'
column 'imagen_url', 'string'
column 'calificacion', 'float'
column 'visible', 'boolean'
column 'destacado', 'boolean'
column 'fecha_creacion', 'datetime'
column 'fecha_actualizacion', 'datetime'
has_many ['calificaciones', 'apodos_usuarios', 'compartidos', 'reportes']
belongs_to [['usuarios', ':primary_key => :facebook_id', ':foreign_key => :autor_id']]

table 'apodos_usuarios', 'apodos_usuario'
column 'usuario_desde_id', 'string'
column 'usuario_para_id', 'string'
column 'apodo_id', 'integer'
column 'status', 'string'
column 'visible', 'boolean'
column 'fecha_creacion', 'datetime'
column 'fecha_actualizacion', 'datetime'
belongs_to [['usuario_desde', ':class_name => "Usuario"', ':primary_key => :facebook_id', ':foreign_key => :usuario_desde_id'], ['usuario_para', ':class_name => "Usuario"', ':primary_key => :facebook_id', ':foreign_key => :usuario_para_id'], 'apodos']

table 'calificaciones', 'calificacion'
column 'usuario_id', 'string'
column 'apodo_id', 'integer'
column 'calificacion', 'integer'
column 'fecha_creacion', 'datetime'
column 'fecha_actualizacion', 'datetime'
belongs_to [['usuarios', ':primary_key => :facebook_id'], 'apodos'] 

table 'categorias', 'categoria'
column 'descripcion', 'string'
column 'imagen_url', 'string'
column 'fecha_creacion', 'datetime'
column 'fecha_actualizacion', 'datetime'
has_many ['objetos']

table 'usuarios', 'usuario'
column 'facebook_id', 'string'
column 'nombre', 'string'
column 'apellido', 'string'
column 'email', 'string'
column 'es_fan', 'string'
column 'fecha_creacion', 'datetime'
column 'fecha_actualizacion', 'datetime'
has_many [['compartidos', ':foreign_key => :facebook_id'], ['calificaciones', ':foreign_key => :facebook_id'], ['reportes', ':foreign_key => :facebook_id'], ['apodos_desde', ':class_name => "ApodosUsuario"', ':primary_key => :usuario_desde_id', ':foreign_key => :facebook_id'], ['apodos_para', ':class_name => "ApodosUsuario"', ':primary_key => :usuario_para_id', ':foreign_key => :facebook_id']]

table 'compartidos', 'compartido'
column 'usuario_id', 'string'
column 'apodo_id', 'integer'
column 'origen', 'string'
column 'fecha_creacion', 'datetime'
column 'fecha_actualizacion', 'datetime'
belongs_to [['usuarios', ':primary_key => :facebook_id'], 'apodos'] 

table 'cuerpos', 'cuerpo'
column 'descripcion', 'string'
column 'imagen_url', 'string'
column 'fecha_creacion', 'datetime'
column 'fecha_actualizacion', 'datetime'
has_many ['imagenes']

table 'imagenes', 'imagen'
column 'cuerpo_id', 'integer'
column 'objeto_id', 'integer'
column 'imagen_url', 'string'
column 'fecha_creacion', 'datetime'
column 'fecha_actualizacion', 'datetime'
belongs_to ['cuerpos', 'objetos']

table 'objetos', 'objeto'
column 'categoria_id', 'integer'
column 'descripcion', 'string'
column 'imagen_url', 'string'
column 'fecha_creacion', 'datetime'
column 'fecha_actualizacion', 'datetime'
has_many ['imagenes']
belongs_to ['categoria']

table 'reportes', 'reportes'
column 'usuario_id', 'string'
column 'apodo_id', 'string'
column 'fecha', 'string'
column 'razon', 'text'
column 'fecha_creacion', 'datetime'
column 'fecha_actualizacion', 'datetime'
belongs_to [['usuarios', ':primary_key => :facebook_id'], 'apodos'] 

scaffold
