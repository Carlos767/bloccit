class Comment < ActiveRecord::Base

	default_scope { order('created_at DESC') }

    
    validates :body, length: { minimum: 5 }, presence: true
    validates :user, presence: true


	belongs_to :post
	belongs_to :user
end
