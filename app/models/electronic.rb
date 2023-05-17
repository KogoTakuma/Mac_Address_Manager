class Electronic < ApplicationRecord
    belongs_to :user, primary_key: :user_name
    validates :user_id, presence: true
end
