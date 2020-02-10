# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
Option.destroy_all
Option.create(category: 'Cheese', value: 'Mozzarella')
Option.create(category: 'Cheese', value: 'Cheddar')
Option.create(category: 'Cheese', value: 'Provolone')

Option.create(category: 'Sauce', value: 'Spicy')
Option.create(category: 'Sauce', value: 'Sweet')
Option.create(category: 'Sauce', value: 'Heavy Basil')
Option.create(category: 'Sauce', value: 'Peppery')

Option.create(category: 'Crust', value: 'Thin')
Option.create(category: 'Crust', value: 'Thick')
Option.create(category: 'Crust', value: 'Filled with cheese')

p "Created #{Option.count} options"

Size.destroy_all
Size.create(name: 'Personal', slices: 1)
Size.create(name: 'Small', slices: 4)
Size.create(name: 'Medium', slices: 6)
Size.create(name: 'Large', slices: 8)

p "Created #{Size.count} sizes"