class RenameUserImageToProfileImage < ActiveRecord::Migration[6.1]
  def change
    rename_table :user_images, :profile_images
  end
end
