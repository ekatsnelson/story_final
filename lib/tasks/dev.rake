#require 'faker'

desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment }) do
  p "Hello, world!"

  User.destroy_all
  FollowRequest.destroy_all
  Like.destroy_all
  Photo.destroy_all

  # Create new user - Elise
  user = User.new
  user.email = "elisek222@gmail.com"
  user.username = "elise"
  user.own_photos_count = 0
  user.password_digest = "password"
  user.received_follow_requests_count = 0
  user.sent_follow_requests_count = 0
  user.save

  # Create new user - Beatrice
  user = User.new
  user.email = "beatricek222@gmail.com"
  user.username = "beatrice"
  user.own_photos_count = 0
  user.password_digest = "password"
  user.received_follow_requests_count = 0
  user.sent_follow_requests_count = 0
  user.save

  p "Added #{User.count} Users"



  # names = ["Pat", "Raghu", "Jelani", "Alice", "Bob", "Brit", "Jake", "Jessica", "Steven", "Santa"]
  # bool = [true, false]
  # 10.times do |count|
  #   user = User.new
  #   user.username = names.at(count)
  #   user.password_digest = "password"
  #   #user.private = bool.sample
  #   #user.comments_count = 0
  #   #user.likes_count = 0
  #   user.save
  # end

  # # 25.times do
  # #   user = User.new
  # #   user.username = Faker::Name.first_name
  # #   user.private = Faker::Boolean.boolean
  # #   user.password = "password"
  # #   user.save
  # # end

  # p "Added #{User.count} Users"

  # users = User.all

  # # Follow Requests 

  # 10.times do |count|
  #   fr = FollowRequest.new
  #   #fr.status = bool.sample
  #   fr.sender_id = users.sample.id
  #   fr.recipient_id = users.sample.id
  #   fr.save
  # end

  # p "Added #{FollowRequest.count} FollowRequests"

  # photos = ["https://www.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_11342065.htm#query=summer%20nature&position=0&from_view=keyword", "https://img.freepik.com/free-photo/beautiful-tree-middle-field-covered-with-grass-with-tree-line-background_181624-29267.jpg?size=626&ext=jpg&ga=GA1.2.1480141075.1670620687", "https://img.freepik.com/free-photo/beautiful-tree-middle-field-covered-with-grass-with-tree-line-background_181624-29267.jpg?size=626&ext=jpg&ga=GA1.2.1480141075.1670620687", "https://img.freepik.com/free-photo/aerial-view-beautiful-colorful-landscape-background-amazing-mountains_181624-22209.jpg?size=626&ext=jpg&ga=GA1.2.1480141075.1670620687"]

  # 10.times do |count|
  #   photo = Photo.new
  #   photo.caption = "This is my photo"
  #   photo.image = photos.sample
  #   photo.likes_count = 0
  #   photo.owner_id = users.sample.id
  #   photo.save
  # end

  # p "Added #{Photo.count} Photos"

  # photos = Photo.all

  # 10.times do |count|
  #   like = Like.new
  #   like.fan_id = users.sample.id
  #   like.photo_id = photos.sample.id
  #   like.save
  # end

  # p "Added #{Like.count} Likes"

  # comments = ["Cool", "I like it", "Love it"]

  # 10.times do |count|
  #   comment = Comment.new
  #   comment.body = comments.sample
  #   comment.author_id = users.sample.id
  #   comment.photo_id = photos.sample.id
  #   comment.save
  # end

  # p "Added #{Comment.count} Comments"
end
