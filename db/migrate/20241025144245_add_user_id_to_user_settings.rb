class AddUserIdToUserSettings < ActiveRecord::Migration[7.0]
  def change
    add_reference :user_settings, :user, null: false, foreign_key: true unless column_exists?(:user_settings, :user_id)
  end
end
