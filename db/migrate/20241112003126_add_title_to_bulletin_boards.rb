class AddTitleToBulletinBoards < ActiveRecord::Migration[7.0]
  def change
    add_column :bulletin_boards, :title, :string, limit: 30, null: false, default: "Temporary"
    change_column_default :bulletin_boards, :title, from: "Untitled", to: nil
  end
end
