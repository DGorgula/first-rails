class User < ApplicationRecord
    has_many :posts
    validates :name, presence: true
    validates :email,
        format: { with: /\A(.+)@(.+)\z/, message: "Email invalid"  },
            uniqueness: { case_sensitive: false },
            length: { minimum: 4, maximum: 254 }
            
end
