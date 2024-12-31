# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

# ロールが存在しない場合は作成
role = Role.find_or_create_by!(name: 'default_role')

# ユーザーの作成（role_idを設定）
user = User.find_or_create_by!(username: 'test_user', email: 'test_user@example.com') do |u|
  u.password = 'password'
  u.role = role # role_id ではなく、関連付けとして role を指定
end

# サンプルの掲示板データを20件作成
20.times do
  BulletinBoard.create!(
    title: Faker::Lorem.sentence(word_count: 3),
    content: Faker::Lorem.paragraph(sentence_count: 5),
    user: user, # 投稿者
    created_at: Time.current - rand(1..30).days, # 作成日
    is_read: [true, false].sample # 未読/既読のランダム設定
  )
end

Rails.logger.info 'サンプルデータを20件作成しました。'
