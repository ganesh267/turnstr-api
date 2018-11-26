class AddMediaFieldToUserStory < ActiveRecord::Migration[5.0]
  def change
    change_table :user_stories do |t|
      t.attachment :media
    end
    remove_column :user_stories, :thumb_url, :string
  end
end
