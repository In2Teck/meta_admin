TABLES = []
COLUMNS = {}
RELATIONSHIPS = {}

def table name
  TABLES << name
  COLUMNS[TABLES.last] = {}
  RELATIONSHIPS[TABLES.last] = {}
end

def column name, type
  COLUMNS[TABLES.last][name] = type
end

def has_many table_array
  RELATIONSHIPS[TABLES.last]['has_many'] = []
  table_array.each do |table| 
    RELATIONSHIPS[TABLES.last]['has_many'] << table
  end
end

def belongs_to table_array
  RELATIONSHIPS[TABLES.last]['belongs_to'] = []
  table_array.each do |table| 
    RELATIONSHIPS[TABLES.last]['belongs_to'] << table
  end
end

def scaffold
  puts TABLES
  puts COLUMNS
  puts RELATIONSHIPS
end
