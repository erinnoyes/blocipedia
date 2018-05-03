class WikiPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
      @user = user
      @post = post
  end


  def index?
    user.nil? || user.present?
  end

  def update?
    user.present?
  end

  def destroy?
    if user == nil
      false
    else
      user.admin? || user == post.user
    end
  end

  def show?
    user.nil? || user.present?
  end

  def new?
    user.present?
  end

  def create?
    user.present?
  end

  def edit?
    user.present?
  end
end

  class Scope
     attr_reader :user, :scope

     def initialize(user, scope)
       @user = user
       @scope = scope
     end

     def resolve
       wikis = []
       if user.role == 'admin'
         wikis = scope.all
       elsif user.role == 'premium'
         all_wikis = scope.all
         all_wikis.each do |wiki|
           if wiki.public? || wiki.user == user
             wikis << wiki
         end
       end
       else
         all_wikis = scope.all
         wikis = []
         all_wikis.each do |wiki|
           if wiki.public?
             wikis << wiki
         end
       end
       wikis
     end
   end
  end
