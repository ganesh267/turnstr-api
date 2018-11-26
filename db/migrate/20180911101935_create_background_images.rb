class CreateBackgroundImages < ActiveRecord::Migration[5.0]
  def change
    create_table :background_images do |t|
      t.references :background_image_group, foreign_key: true, index: true
      t.attachment :image

      t.timestamps
    end
  end
end
