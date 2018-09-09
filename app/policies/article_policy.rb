class ArticlePolicy < ApplicationPolicy
  def update?
    record.user == user
  end
end
