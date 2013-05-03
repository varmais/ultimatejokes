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
					    role: "admin"
					    )
#password_salt:  salt = Authlogic::Random.hex_token,
#					    crypted_password: Authlogic::CryptoProviders::Sha512.encrypt("1234" + salt),
#					    persistence_token: Authlogic::Random.hex_token,