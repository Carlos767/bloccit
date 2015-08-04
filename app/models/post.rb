class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
    has_many :votes, dependent: :destroy
	belongs_to :user
	belongs_to :topic
	has_one :summary
    after_create :update_post

	default_scope { order('created_at DESC') }

    validates :title, length: { minimum: 5 }, presence: true
    validates :body, length: { minimum: 20 }, presence: true
    #validates :topic, presence: true
    #validates :user, presence: true

    def markdown_title
    	markdown_to_html(title)
    end

    def markdown_body
    	markdown_to_html(body)
    end



 default_scope { order('rank DESC') }

  private

  def create_vote
    post.update_rank
  end

  def update_rank
    age_in_days = (created_at - Time.new(1970,1,1)) / (60 * 60 * 24) # 1 day in seconds
    new_rank = points + age_in_days
 
    update_attribute(:rank, new_rank)
  end


    private
    def markdown_to_html(markdown)
    	renderer = Redcarpet::Render::HTML.new
    	extensions = {fenced_code_blocks: true}
    	redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    	(redcarpet.render markdown).html_safe
    end
end

