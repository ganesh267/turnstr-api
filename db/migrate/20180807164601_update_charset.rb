class UpdateCharset < ActiveRecord::Migration[5.0]
  def up
    execute "ALTER TABLE `stories` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_bin, MODIFY caption text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;"
  end

  def down

  end
end
