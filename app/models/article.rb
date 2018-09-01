# frozen_string_literal: true

class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }, uniqueness: true
  validates :text, presence: true, length: { maximum: 200 }

  has_many :comments, dependent: :destroy
end
