class AddUserIdToUserSettings < ActiveRecord::Migration[7.0]
  def up
    change_column :user_settings, :user_id, :integer, null: false
  end
end
