class User::BackgroundImage < ApplicationRecord
  belongs_to :user

  has_attached_file :image, styles: {thumb: "100x100>" }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  after_save :update_image_url


  def update_image_url
    user.update(background_image_url: image.url)
  end
end
