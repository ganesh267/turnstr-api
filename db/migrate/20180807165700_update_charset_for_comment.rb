class UpdateCharsetForComment < ActiveRecord::Migration[5.0]
  def up
    execute "ALTER TABLE `comments` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_bin, MODIFY body text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;"
  end

  def down

  end
end
