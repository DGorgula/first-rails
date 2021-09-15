class User < ApplicationRecord
    has_many :posts
    validates :name, presence: true
    validates :email,
        format: { with: /\A(.+)@(.+)\z/, message: "Email invalid"  },
            uniqueness: { case_sensitive: false },
            length: { minimum: 4, maximum: 254 }
    def self.search_by_name( search )
        if search
            puts search.class
            puts search.downcase
            
            search_name = search.downcase
            if self.where("name LIKE ?",  "%#{search_name}%").length > 0
                self.where("name LIKE ?",   "%#{search_name}%").sort_by{ |user| user.name}
            else
                # here should say that the nothing was found on the search.
                User.all.sort_by{ |user| user.name}
            end
        else
            User.all.sort_by{ |user| user.name}
        end
    end
end

# [{:name =>"aksdj", :email=>"sdfa@asdf"}, {:name=>"aksdj",:email=>"sdfa@asdf"}]
    # "%" + params[:search_name] + "%"