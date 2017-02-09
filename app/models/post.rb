class Post < ApplicationRecord
  belongs_to :user
  has_many :post_tags
  has_many :tags, through: :post_tags

  validates_presence_of :title, :content, allow_blank: false

  def tag_attributes=(tag_attributes)
    tag_attributes.values.reject(&:empty?).each do |tag_attribute|
      tag = Tag.find_or_create_by(name: tag_attribute)
      self.save
      exists = self.post_tag_check(tag)
      self.tags << tag
    end
  end

  def post_tag_check(tag)
    exists = self.post_tags.find{|pt| pt.post_id == self.id && pt.tag_id == tag.id}
    PostTag.create_post_tag(tag, self) if !exists
  end

end
