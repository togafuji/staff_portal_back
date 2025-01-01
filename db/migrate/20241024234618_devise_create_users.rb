# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_users_table
    add_indices
  end

  private

  # usersテーブルの作成処理を別メソッドに分ける
  def create_users_table
    create_table :users do |t|
      ## Primary Key
      # t.integer :id, null: false, primary_key: true

      ## カスタムフィールド
      t.string :username, null: false, limit: 50 # ユーザー名
      t.string :encrypted_password, null: false, limit: 255 # パスワードハッシュ
      t.references :role, null: false, foreign_key: true # ロールID (外部キー)
      t.references :user_settings, foreign_key: true # 設定ID (外部キー)
      t.string :email, null: false, limit: 100 # メールアドレス (ユニーク制約を後で追加)
      t.datetime :last_login # 最終ログイン日時

      ## Devise標準機能
      ## Recoverable
      t.string :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      t.timestamps null: false
    end
  end

  # インデックス追加処理を別メソッドに分ける
  def add_indices
    change_table :users, bulk: true do |t|
      t.index :email, unique: true # メールアドレスにユニーク制約
      t.index :username, unique: true # ユーザー名にユニーク制約
      t.index :reset_password_token, unique: true # パスワードリセットトークンにユニーク制約
    end
  end
end
