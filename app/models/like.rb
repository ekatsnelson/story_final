# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  photo_id   :integer
#  user_id    :integer
#
class Like < ApplicationRecord
  # Direct Associations
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })

  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })

  # Validations
  validates(:user_id, { :presence => true })
  validates(:user_id, { :presence => true })
  validates(:photo_id, { :uniqueness => { :scope => ["user_id"], :message => "already liked" } })
end
