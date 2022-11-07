class Membership < ApplicationRecord

    belongs_to :gym
    belongs_to :client

    validate :unique_membership, on: :create

    def unique_membership
        # Then need to get a list of instances associanteed with teh client 
        
        # Access the created instance through self.
        # We can do client.memberships to see existing memberships
        # I want to loop through client.memberships and on each membership, I want to check if self.gym_id (the record trying to be created) matches the id of existing membership. 

        # if gym_id == membership.gym_id, then add to errors and break the loop

        reference_id = self.gym_id
        client.memberships.each do |membership|
            if membership.gym_id == reference_id
                errors.add(:gym_id, "membership already exists for this client at this gym")
            end
        end

        # byebug
        

        
        
    end
    
end
