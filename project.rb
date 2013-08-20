PROJECT_NAME = ""

def create name, adapter
  system("rails _3.2.11_ new #{name} -d #{adapter}")
  PROJECT_NAME.replace name
end

def connection database, username, password, host
  text = File.read("#{PROJECT_NAME}/config/database.yml")
  text.gsub!("database: #{PROJECT_NAME}_development", "database: #{database}")
  text.gsub!("username: root", "username: #{username}")
  text.gsub!("password:", "password: #{password}")
  text.gsub!("reconnect: false", "reconnect: true")
  text.gsub!("host: localhost", "host: #{host}")
  File.open("#{PROJECT_NAME}/config/database.yml", "w"){|file| file.puts text}
end

def add_gems
  #write_at the gems required
  #gem 'activerecord-custom_timestamps' para podermanejar custom timestamps
end
