# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Tool.destroy_all

6.times do
  Tool.create(name: Faker::Commerce.product_name, price: Faker::Number.decimal(2), quantity: Faker::Number.number(1))
end
