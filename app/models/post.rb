class Post < ActiveRecord::Base
	has_many :comments
	belongs_to :user
	belongs_to :topic
	has_one :summary

	default_scope {order('created_at DESC')}
	scope :ordered_by_title, -> (title) { where ("ordered_by <?", title)}
	scope :ordered_by_reverse_created_at, -> (reverse) {where ("created_at <?", reverse)}

end
