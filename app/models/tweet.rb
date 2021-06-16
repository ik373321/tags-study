class Tweet < ApplicationRecord
  belongs_to :user
  has_many :article_tags
  has_many :tags, through: :article_tags


  def tags_save(tag_list)
    if self.tags != nil
      article_tags_records = ArticleTag.where(tweet_id: self.id)
      article_tags_records.destroy_all
    end

    tag_list.each do |tag|
      inspected_tag = Tag.where(tag_name: tag).first_or_create
      self.tags << inspected_tag
    end

  end

end
