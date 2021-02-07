class User < ApplicationRecord
    before_save {self.email = email.downcase}

    has_many :articles

    validates :username, presence: true, 
        uniqueness: { case_sensitive: false }, 
        length: { maximum: 20, minimum: 2}

    validates :email, presence: true, 
        uniqueness: { case_sensitive: false }, 
        format: { with: /[a-z0-9]+@([a-z0-9-]+\.)+[a-z]{2,4}/i},
        length: { maximum: 100}
end
