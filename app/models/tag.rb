class Tag < ApplicationRecord
  has_many :article_tags
  has_many :tweets, through: :article_tag
end
