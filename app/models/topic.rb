class Topic < ActiveRecord::Base
	has_many :posts, dependent: :destroy

	scope :visible_to, -> (user) { user ? all : publicly_viewable}
	scope :privately_viewable, -> {where(public: false)}
	WillPaginate.per_page = 100

	# validates :title, length: { minumum: 5 }, presence: true
	# validates :body, length: { minumum: 5 }, presence: true
end
