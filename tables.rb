require 'active_support/core_ext'

TABLES = []
COLUMNS = {}
RELATIONSHIPS = {}

def table name, model
  TABLES << [name, model]
  COLUMNS[TABLES.last[0]] = {}
  RELATIONSHIPS[TABLES.last[0]] = {}
end

def column name, type
  COLUMNS[TABLES.last[0]][name] = type
end

def has_many table_array
  RELATIONSHIPS[TABLES.last[0]]['has_many'] = []
  table_array.each do |table| 
    RELATIONSHIPS[TABLES.last[0]]['has_many'] << table
  end
end

def belongs_to table_array
  RELATIONSHIPS[TABLES.last[0]]['belongs_to'] = []
  table_array.each do |table| 
    RELATIONSHIPS[TABLES.last[0]]['belongs_to'] << table
  end
end

def scaffold

  write_at "#{PROJECT_NAME}/config/initializers/inflections.rb", 1, "ActiveSupport::Inflector.inflections do |inflect|"
  write_at "#{PROJECT_NAME}/config/initializers/inflections.rb", 2, "end"

  TABLES.each do |table|
    scaffold_command = "rails g scaffold #{table[1]}"
    insert_commands = []
    COLUMNS[table[0]].each do |k, v|
      scaffold_command += " #{k}:#{v}"    
    end
    scaffold_command += " --no-timestamps --no-stylesheets"
    RELATIONSHIPS[table[0]].each do |k, v|
       v.each do |relations|
        if relations.respond_to?('each')
          command = ((k == 'has_many') ? "#{k} :#{relations[0]}" : "#{k} :#{relations[0].singularize}")
          relations.drop(1).each do |property|
            command += ", #{property}"
          end
          insert_commands << command
        else
          insert_commands << ((k == 'has_many') ? "#{k} :#{relations}" : "#{k} :#{relations.singularize}")
        end
       end
    end
    
    write_at "#{PROJECT_NAME}/config/initializers/inflections.rb", 2, "inflect.irregular '#{table[1]}', '#{table[0]}'"
    system("cd #{PROJECT_NAME} && #{scaffold_command}")
    insert_commands.each do |relation_string|
      write_at "#{PROJECT_NAME}/app/models/#{table[1]}.rb", 2, relation_string
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
