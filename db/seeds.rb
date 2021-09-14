# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
email = "test@example.com"
password = "password"

User.find_or_create_by!(email: email) do |user|
  user.password = password
  puts "ユーザーの初期データインポートに成功しました"
end

user = User.first
Shop.create!(name: "サンプルコーヒー", prefecture: 1, address: 0o0 - 0o0, user_id: user.id)
Shop.create!(name: "テストコーヒー", prefecture: 19, address: 0o0 - 0o0, user_id: user.id)
Shop.create!(name: "testコーヒー", prefecture: 3, address: 0o0 - 0o0, user_id: user.id)
puts "テストデータの投入に成功しました"
