# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
email = "test@example.com"
password = "password"
admin_email = "admin@example.com"

User.find_or_create_by!(email: email) do |user|
  user.password = password
  puts "ユーザーの初期データインポートに成功しました。"
end

AdminUser.find_or_create_by!(email: admin_email) do |adminuser|
  adminuser.password = password
  puts "管理者ユーザーの初期データインポートに成功しました。"
end

user = User.first
Shop.create!(name: "サンプルコーヒー", prefecture: 1, address: 0o0 - 0o0, user_id: user.id)
Shop.create!(name: "テストコーヒー", prefecture: 19, address: 0o0 - 0o0, user_id: user.id)
Shop.create!(name: "testコーヒー", prefecture: 3, address: 0o0 - 0o0, user_id: user.id)
puts "テストデータの投入に成功しました"
AdminUser.create!(email: "admin@example.com", password: "password", password_confirmation: "password") if Rails.env.development?
