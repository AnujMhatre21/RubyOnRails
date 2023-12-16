require 'bundler/inline'

gemfile true do
    source 'http://rubygems.org'
    gem 'bcrypt'
end


# create module to perform the enrypt or decrypt function
module Crud
    require 'bcrypt'

    puts "crud activated"

    #convert string to hash
    def self.create_hash_digest(password)
        BCrypt::Password.create(password)
    end

    #convert hash to string
    def self.verify_hash_digest(password)
        BCrypt::Password.new(password)
    end

    #convert the password inlist to hash password
    def self.create_secure_users(list_of_users)
        list_of_users.each do |user_record|
            user_record[:password] = create_hash_digest(user_record[:password])
            end
            list_of_users
    end

    #assugin new list
    # new_user = create_secure_users(users)

    #authenticate the passed user is correct or not
    def self.authenticate_user(username, password, list_of_users)
        list_of_users.each do |user_record|
            if user_record[:username] == username && verify_hash_digest(user_record[:password]) == password
                return user_record
            end
        end
        "Credentials are wrong"
    end
    
    def say_hello
        puts "hello"
    end

    # print authenticate_user("anuj", "anuj@123", new_user)

end
