# frozen_string_literal: true

class AddRefToUserInArticle < ActiveRecord::Migration[5.2]
  def change
    add_reference :articles, :user
  end
end
