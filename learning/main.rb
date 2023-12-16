require_relative "demo.rb"
# $LOAD_PATH << '.'
# require 'Crud'

include Crud


users = [
    {username:"anuj", password:"anuj@123"},
    {username:"snehal", password:"snehal@123"}
]

hased_users = Crud.create_secure_users(users)
puts hased_users














