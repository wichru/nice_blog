# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :article

  validates :commenter, presence: true, email: true
  validates :body, presence: true, length: { maximum: 500, minimum: 5 }
end
