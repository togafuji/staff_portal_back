# frozen_string_literal: true

# This migration creates the bulletin_boards table for storing user posts and related content.
class CreateBulletinBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :bulletin_boards do |t|
      # 外部キー: user_id
      t.integer :user_id, null: false, foreign_key: true
      # 投稿内容
      t.text :content, null: false
      # 作成日時
      t.datetime :created_at, null: false
    end
    add_foreign_key :bulletin_boards, :users, column: :user_id
  end
end
