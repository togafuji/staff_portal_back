class AddIdToUsers < ActiveRecord::Migration[7.0]
  def change
    return if column_exists?(:user_settings, :user_id)

    add_reference :user_settings, :user, foreign_key: true
  end
end
