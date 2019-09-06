# Mysql

require "csv"

CSV.foreach("db/driver.csv") do |row|
  Driver.create(:name => row[0], :tel => row[1], :car_number => row[2])
end

# Neo4j

5.times { |i|
  User.create(user_id: i, user_name: sprintf("User%d", i))
}

Follow.create(from_node: User.find_by(user_id: 0), to_node: User.find_by(user_id: 1))
Follow.create(from_node: User.find_by(user_id: 0), to_node: User.find_by(user_id: 2))
Follow.create(from_node: User.find_by(user_id: 1), to_node: User.find_by(user_id: 0))
Follow.create(from_node: User.find_by(user_id: 1), to_node: User.find_by(user_id: 3))
Follow.create(from_node: User.find_by(user_id: 2), to_node: User.find_by(user_id: 4))
Follow.create(from_node: User.find_by(user_id: 4), to_node: User.find_by(user_id: 0))
