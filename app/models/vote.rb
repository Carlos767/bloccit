class Vote < ActiveRecord::Base
 has_many :comments, dependent: :destroy
 has_many :votes, dependent: :destroy
 belongs_to :user
 belongs_to :post
 validates :value, inclusion: { in: [-1, 1], message: "%{value} is not a valid vote." }
 after_save :update_post

 default_scope { order('rank DESC') }

  private

  def update_post
    post.update_rank
  end

  def update_rank
  	age_in_days = (created_at - Time.new(1970,1,1)) / (60 * 60 * 24) # 1 day in seconds
    new_rank = points + age_in_days
 
    update_attribute(:rank, new_rank)
  end
end