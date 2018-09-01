class Comment < ApplicationRecord
  validates :body, presence: true, length: { maximum: 500, minimum: 5 }
  validates :commenter, presence: true

  belongs_to :article
end
