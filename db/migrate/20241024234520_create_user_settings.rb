class CreateUserSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :user_settings do |t|
      ## Foreign Key - users テーブルとの関連

      ## カスタムフィールド
      t.string :user_icon, limit: 255 # ユーザーアイコン画像のパス
      t.text :app_settings # アプリケーション設定をJSON形式で保存

      ## 自動的に created_at と updated_at を追加
      t.timestamps
    end
  end
end
