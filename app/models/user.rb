class User < ApplicationRecord
    self.primary_key = :user_name
    has_many :electronics

    validates :user_name, presence: true
end
