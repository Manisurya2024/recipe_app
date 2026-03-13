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

dessert = Category.create!(name: "Dessert")

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