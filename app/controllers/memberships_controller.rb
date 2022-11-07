class MembershipsController < ApplicationController

rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

    def create
        membership = Membership.create!(membership_params)
        render json: membership, status: :created
    end

    private 

    def membership_params
        params.permit(:charge, :gym_id, :client_id)
    end

    def record_invalid(invalid)
        render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
