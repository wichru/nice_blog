class ArticlePolicy < ApplicationPolicy
  def edit?
    record.user == user
  end
end
