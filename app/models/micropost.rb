class Micropost < ApplicationRecord
  belongs_to :user
  scope :postsort, ->{order(created_at: :desc)}
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: Settings.content.max_length}
  validate  :picture_size
  scope :feed_user, ->(id){where("user_id= ?", id)}
  scope :feed_for, ->(user_id, following_ids){where(user_id: [user_id, *following_ids])}

  private

  def picture_size
    return unless picture.size > Settings.number.five.megabytes
    errors.add(:picture, t("uploaders.picture_uploader.errupload"))
  end
end
