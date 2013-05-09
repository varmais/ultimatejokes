# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin_user = User.create(email: "admin@admin.com",
					    password: "1234",
					    password_confirmation: "1234",
					    role: "admin")

joke1 = Joke.create(title: "A man goes to a restaurant",
                    content: "He has a seat at a booth and opens a menu to find out that none of the foods have prices next to them. He asks the waiter, \"How much is the fettucini alfredo?\" \n The waiter says \"a penny.\" \n The man exclaims, \"a penny?? How much for a steak?\" \n The waiter says, \"a nickel\" \n The man is astonished, \"Are you serious?? Where's the man that owns this place? I'd like to shake his hand!\" \n The waiter answers, \"He's upstairs with my wife.\" \n Confused, the man asks, \"What's he doing upstairs with your wife?\" \n The waiter smiles and says, \"The same thing I'm doing down here to his business.\"", 
                    user_id: admin_user)
#password_salt:  salt = Authlogic::Random.hex_token,
#					    crypted_password: Authlogic::CryptoProviders::Sha512.encrypt("1234" + salt),
#					    persistence_token: Authlogic::Random.hex_token,