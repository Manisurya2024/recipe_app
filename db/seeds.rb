Comment.destroy_all
Recipe.destroy_all
Category.destroy_all
User.destroy_all

user = User.create!(
  name: "Test User",
  email: "test@test.com",
  password: "password",
  password_confirmation: "password"
)

# ✅ ADD MULTIPLE CATEGORIES
dessert = Category.create!(name: "Dessert")
food    = Category.create!(name: "Food")
drinks  = Category.create!(name: "Drinks")

recipe = Recipe.create!(
  title: "Chocolate Cake",
  description: "Delicious chocolate cake",
  ingredients: "flour, cocoa powder, sugar",
  instructions: "mix ingredients and bake",
  user: user,
  category: dessert
)

Comment.create!(
  content: "Looks delicious!",
  user: user,
  recipe: recipe
)