# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
if AdminUser.count == 0
  puts 'Seeding admin users...'
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
end



# Create categories
if Category.count == 0
  puts 'Seeding categories...'
  categories = ['Biryani', 'Dosa', 'Pizza', 'Burger', 'Pasta', 'Salad', 'Dessert','Idli','ice cream','pure Veg','non-veg']
  categories.each { |category| Category.create!(name: category) }
end

# Create restaurants
restaurants_data = [
  { name: 'Hyderabadi Kitchen', spaciality: 'Biryani, Andhra', area: 'Marathahalli' },
  { name: 'Chickpet donne biriyani house', spaciality: 'Biryani', area: 'Koramangala' },
  { name: 'Thalairaj Biryani', spaciality: 'Andhra, Biryani', area: 'Whitefield' },
  { name: 'Kerala Kitchen', spaciality: 'Kerala, Seafood', area: 'Indiranagar' },
  { name: 'Sri Alok Park', spaciality: 'South Indian, North Indian', area: 'Koramangala' },
  { name: 'Brahmins Tiffin Centre', spaciality: 'South Indian, Fast Food', area: 'Marathahalli' },
  { name: 'Suryawanshi', spaciality: 'Maharashtrian, Thalis', area: 'Whitefield' },
  { name: 'Sri Lakshmi Vaibhava', spaciality: 'South Indian, North Indian, Jain, Chinese, Desserts', area: 'Marathahalli' },
  { name: 'The Rameshwaram Cafe', spaciality: 'South Indian', area: 'Whitefield' },
  { name: 'Sandwich 2 Poha', spaciality: 'Healthy Food, Indian, Continental', area: 'Marathahalli' },
  { name: 'Sri Jayadurga Biryani', spaciality: 'Biryani, South Indian, Andhra, Hyderabadi, Snacks', area: 'Marathahalli' },
  { name: 'Sri Lakshmi Biryani', spaciality: 'Biryani, North Indian, Snacks', area: 'Marathahalli' },
  { name: 'Sri Jayadurga Tiffins', spaciality: 'South Indian', area: 'Whitefield' }

  # Add more restaurants as needed
]
food_items_data = [
  { name: 'Hyderabadi Biryani', description: 'Delicious biryani with aromatic spices', price: 10.99, food_type: 'Non-Vegetarian', category_name: 'Biryani' },
  { name: 'Masala Dosa', description: 'Crispy dosa with flavorful masala', price: 7.99, food_type: 'Vegetarian', category_name: 'Dosa' },
  { name: 'Margherita Pizza', description: 'Classic pizza with tomato and mozzarella', price: 12.99, food_type: 'Vegetarian', category_name: 'Pizza' },
  { name: 'BBQ Burger', description: 'Juicy burger with BBQ sauce', price: 9.99, food_type: 'Non-Vegetarian', category_name:  'Burger' },
  { name: 'Alfredo Pasta', description: 'Creamy Alfredo pasta with chicken', price: 14.99, food_type: 'Non-Vegetarian', category_name: 'Pasta' },
  { name: 'Caesar Salad', description: 'Fresh Caesar salad with dressing', price: 8.99, food_type: 'Vegetarian', category_name: 'Salad' },
  { name: 'Chocolate Brownie', description: 'Rich chocolate brownie with ice cream', price: 6.99, food_type: 'Dessert', category_name: 'Dessert' },
  { name: 'Iced Coffee', description: 'Refreshing iced coffee with cream', price: 4.99, food_type: 'Beverage', category_name: 'Idli' },
  { name: 'Veg Sizzler', description: 'Sizzling hot vegetable platter', price: 11.99, food_type: 'Vegetarian', category_name: 'ice cream' },
  { name: 'Chicken Kebab', description: 'Grilled chicken kebabs with spices', price: 13.99, food_type: 'Non-Vegetarian', category_name: 'pure Veg' },
  # Add more food items as needed
]

if Restaurant.count == 0
  puts 'Seeding restaurants...'
  restaurants_data.each do |data|
    restaurant = Restaurant.create!(data)
    Address.create!(
      addressable_type: 'Restaurant',
      addressable_id: restaurant.id,
      door_number: '',
      street_area: restaurant.area,
      city:'Bengaluru',
      state: 'Karnataka',
      zipcode: 560037
    )
    food_items_data.each do |food_item_data|
      # puts food_item_data.inspect
      # category_name = food_item_data.delete(:category_name)

      # food_item_data.merge!(category_id: Category.find_by!(name: category_name).id)

      food_data = food_item_data.except(:category_name).merge(category_id: Category.find_by!(name: food_item_data[:category_name]).id)
      restaurant.food_items.create!(food_data)
    end
  end
end

# Run `rails db:seed` to populate your database with this data.
