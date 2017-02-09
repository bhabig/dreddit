class PostTag < ApplicationRecord
  belongs_to :post
  belongs_to :tag

  def self.create_post_tag(tag, post)
    self.create(post_id: post.id, tag_id: tag.id)
  end

end
