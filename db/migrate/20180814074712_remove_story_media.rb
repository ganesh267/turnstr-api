class RemoveStoryMedia < ActiveRecord::Migration[5.0]
  def change
    drop_table :user_story_media
  end
end
