require 'active_support/core_ext'

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

  TABLES.each do |table|
    scaffold_command = "rails g scaffold #{table.singularize}"
    insert_commands = []
    COLUMNS[table].each do |k, v|
      scaffold_command += " #{k}:#{v}"    
    end
    scaffold_command += " --no-timestamps --no-stylesheets"
    RELATIONSHIPS[table].each do |k, v|
       v.each do |table|
        if table.respond_to?('each')
          command = ((k == 'has_many') ? "#{k} :#{table[0]}" : "#{k} :#{table[0].singularize}")
          table.drop(1).each do |property|
            command += ", #{property}"
          end
          insert_commands << command
        else
          insert_commands << ((k == 'has_many') ? "#{k} :#{table}" : "#{k} :#{table.singularize}")
        end
       end
    end
    system("cd #{PROJECT_NAME} && #{scaffold_command}")
    insert_commands.each do |relation_string|
      write_at "#{PROJECT_NAME}/app/models/#{table.singularize}.rb", 2, relation_string
    end
  end 
end

def write_at(fname, at_line, sdat)
  open(fname, 'r+') do |f|
    while (at_line-=1) > 0          # read up to the line you want to write after
      f.readline
    end
    pos = f.pos                     # save your position in the file
    rest = f.read                   # save the rest of the file
    f.seek pos                      # go back to the old position
    f.write (sdat + "\n")
    f.write rest                    # write new data & rest of file
  end

end
