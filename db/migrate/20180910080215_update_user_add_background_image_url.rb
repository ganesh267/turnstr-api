class UpdateUserAddBackgroundImageUrl < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :background_image_url, :string
  end
end
