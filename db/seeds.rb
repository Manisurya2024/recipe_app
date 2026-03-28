# Create user
user = User.create(
  name: "Test User",
  email: "test@example.com",
  password: "password"
)

# Create category
category = Category.create(name: "Food")

# Create recipe
recipe = Recipe.create(
  title: "Sample Recipe",
  description: "Simple test recipe",
  ingredients: "Salt, Water",
  instructions: "Mix and cook",
  category: category,
  user: user
)

# Create comment
Comment.create(
  content: "Nice recipe!",
  user: user,
  recipe: recipe
)