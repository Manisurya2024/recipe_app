user = User.find_or_create_by!(email: "test@example.com") do |u|
  u.name = "Test User"
  u.password = "password"
end

category = Category.find_or_create_by!(name: "Food")

recipe = Recipe.create!(
  title: "Sample Recipe",
  description: "Simple test recipe",
  ingredients: "Salt, Water",
  instructions: "Mix and cook",
  category: category,
  user: user
)

Comment.create!(
  content: "Nice recipe!",
  user: user,
  recipe: recipe
)