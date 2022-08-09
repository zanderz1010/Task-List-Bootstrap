desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do

User.destroy_all

user = User.new
user.email = "alex@example.com"
user.password = "password"
user.save

if user.errors.any?

  p user.errors.full_messages

end

p "#{User.count} users are in the database"


20.times do

  task = Task.new
  task.body = Faker::TvShows::GameOfThrones.quote
  task.status = ["In Progress", "Not_Yet_Started", "Completed"].sample
  task.user_id = user.id
  task.save

end

p "#{Task.count} tasks are in the database"

end
