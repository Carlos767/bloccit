class CommentPolicy < ApplicationPolicy
 
   def new
     user.present? && user.admin?
   end
 
   def create?
     user.present? && user.admin?
   end
 
 end