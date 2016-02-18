# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.new
user.email = "test@gmail.com"
user.name = "tester"
user.password = "12345678"
user.password_confirmation = "12345678"
user.save

1.upto(20) do |i|
  group = Group.new
  group.title = "Group no.#{i}"
  group.description = "第#{i}個討論版"
  group.user_id = user.id
  group.save

  user.join!(group)

  1.upto(30) do |k|
    Post.create!([group_id: "#{i}", content: "第#{k}個留言", user_id: user.id])
  end
end
