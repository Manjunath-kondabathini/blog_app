class Post < ApplicationRecord
  # Each post is created by a user
  # Association
  belongs_to :user

  # If a post is deleted, all its comments should be deleted too
  # association
  has_many :comments, dependent: :destroy

  # Title and content are mandatory for every post
  # validating correct data is stored or not
  validates :title, presence: true
  validates :content, presence: true

  # Search posts by keyword in title or content (case-insensitive)
  # ILIKE is insensitive it is used in postgresql , same like Like operator in sql
  def self.search(keyword)
    where("title ILIKE ? OR content ILIKE ?", "%#{keyword}%", "%#{keyword}%")
  end
end