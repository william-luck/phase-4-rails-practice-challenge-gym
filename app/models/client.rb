class Client < ApplicationRecord

    has_many :memberships
    has_many :gyms, through: :memberships

    def total_spent
        count = 0
        self.memberships.each do |membership|
            count = count + membership.charge
        end
        count
    end

end
