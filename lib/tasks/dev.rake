require 'faker'

desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do
  p "Hello, world!"

  User.destroy_all
  FollowRequest.destroy_all
  Like.destroy_all
  Photo.destroy_all
  User.destroy_all

  # names = ["Pat", "Raghu", "Jelani"]
  bool = [true, false]
  # 3.times do |count|
  #     user = User.new
  #     user.username = names.at(count)
  #     user.password = "password"
  #     user.private = bool.sample
  #     user.comments_count = 0
  #     user.likes_count = 0
  #     user.save
  # end


  25.times do 
    user = User.new
    user.username = Faker::Name.first_name 
    user.private = Faker::Boolean.boolean
    user.password = "password"
    user.save
  end

  p "Added #{User.count} Users"

  users = User.all

  10.times do 
    fr = FollowRequest.new
    fr.status = bool.sample
    fr.sender_id = users.sample.id 
    fr.recipient_id = users.sample.id 
    fr.save
  end

  p "Added #{FollowRequest.count} FollowRequests"

  photos = ["https://tinyurl.comy6hk6oep", https://tinyurl.com/y5uszprj, https://picsum.photos/200]
  10.times do 
    photo = Photo.new
    photo.caption = "This is my photo"
    photo.image = photos.sample
    photo.likes_count = 0
    photo.owner_id = users.sample.id
    photo.save
  end

  p "Added #{Photo.count} Photos"

  photos = Photo.all 

  10.times do 
    like = Like.new
    like.fan_id = users.sample.id 
    like.photo_id = photos.sample.id
    like.save
  end

  p "Added #{Like.count} Likes"

  comments = ["Cool", "I like it", "Love it"]
    
  10.times do 
    comment = Comment.new
    comment.body = comments.sample
    comment.author_id = users.sample.id 
    comment.photo_id = photos.sample.id 
    comment.save
  end

  p "Added #{Comment.count} Comments"



end
