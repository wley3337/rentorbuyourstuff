# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])

#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(name: "Essa", username: "e1", password: "essa123")
u2 = User.create(name: "Anthony", username: "a1", password: "anthony123")
u3 = User.create(name: "Will", username: "w1", password: "will123")

l1 = Listing.create(product_name: "Bike", product_description: "bicycle", item_value: 1000.00, rental_price: 30.00, buy_price: 800.00, quality: "Mint Condition", address: "123 Street Rd.", zip_code: 20009)


l2 = Listing.create(product_name: "Guitar", product_description: "Accoustic Guitar", item_value: 200.00, rental_price: 10.00, buy_price: 180.00, quality: "Well worn", address: "321 Street Rd.", zip_code: 20009)

l3 = Listing.create(product_name: "Laptop", product_description: "Mac Book Pro", item_value: 2000.00, rental_price: 25.00, buy_price: 1700.00, quality: "Slow", address: "213 Street Rd.", zip_code: 20009)

l4 = Listing.create(product_name: "Laptop2", product_description: "Mac Book Pro", item_value: 2000.00, rental_price: 25.00, buy_price: 1700.00, quality: "Broken", address: "213 Street Rd.", zip_code: 20009, deleted: true)

u1.listings << l2
u1.listings << l3
u2.listings << l1
u1.listings << l4

e1 = Exchange.new(renter_id: 3, listing_id: 2, start_date: "2018-10-24", end_date: "2018-10-31")
e1.total_price = e1.get_rental_cost
e1.save

e2 = Exchange.new(renter_id: 3, listing_id: 1, start_date: "2018-11-24", end_date: "2018-12-10")
e2.total_price = e1.get_rental_cost
e2.save

e3 = Exchange.new(renter_id: 2, listing_id: 3, start_date: "2018-12-12", end_date: "2018-12-21")
e3.total_price = e3.get_rental_cost
e3.save
