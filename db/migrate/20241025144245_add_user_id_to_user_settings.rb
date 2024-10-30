class AddUserIdToUserSettings < ActiveRecord::Migration[7.0]
  def change
    # user_idカラムが既に存在する場合、その型や制約を変更
    change_column :user_settings, :user_id, :integer, null: false
    add_foreign_key :user_settings, :users
  end
end
