PROJECT_NAME = ""

def create name, database
  system("rails _3.2.11_ new #{name} -d #{database}")
  PROJECT_NAME.replace name
end

def connection username, password, host
  text = File.read("#{PROJECT_NAME}/config/database.yml")
  text.gsub!("username: root", "username: #{username}")
  text.gsub!("password:", "password: #{password}")
  text.gsub!("host: localhost", "host: #{host}")
  File.open("#{PROJECT_NAME}/config/database.yml", "w"){|file| file.puts text}
end
