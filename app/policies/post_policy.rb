class PostPolicy < ApplicationPolicy
 def index?
 	def index?
    user.present? && (user.moderator? || user.admin? || record.user == user) 
  end
end

 