class User < ApplicationRecord
    has_many :electronics

    validates :user_name, presence: true
end
