# == Schema Information
#
# Table name: photos
#
#  id             :integer          not null, primary key
#  caption        :string
#  comments_count :integer
#  image          :string
#  likes_count    :integer
#  location       :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :integer
#
class Photo < ApplicationRecord

  # Direct Associations
  belongs_to(:owner, { :required => true, :class_name => "User", :foreign_key => "owner_id", :counter_cache => :own_photos_count })

  has_many(:likes, { :class_name => "Like", :foreign_key => "photo_id", :dependent => :destroy })

  has_many(:comments, { :class_name => "Comment", :foreign_key => "photo_id", :dependent => :destroy })

  # Indirect Associations
  has_many(:fans, { :through => :likes, :source => :user })

  has_many(:followers, { :through => :owner, :source => :following })

  has_many(:fan_followers, { :through => :fans, :source => :following })

  # Validations
  validates(:owner_id, { :presence => true })
  validates(:image, { :presence => true })

  # Methods
  def poster
    return User.where({ :id => self.owner_id }).at(0)
  end

  def comments
    return Comment.where({ :photo_id => self.id })
  end

  def likes
    return Like.where({ :photo_id => self.id })
  end

  def fans
    array_of_user_ids = self.likes.map_relation_to_array(:fan_id)

    return User.where({ :id => array_of_user_ids })
  end

  def fan_list
    return self.fans.map_relation_to_array(:username).to_sentence
  end
end
