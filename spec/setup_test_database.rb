require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'bookmark_manager_test')
  result = connection.exec("SELECT table_name FROM information_schema.tables WHERE table_schema='public';")
  result.each do |row|
    connection.exec("TRUNCATE TABLE #{row["table_name"]} CASCADE")
  end
end
