class ClientsController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def show
        client = Client.find(params[:id])
        render json: client, methods: :total_spent
    end

    private

    def record_not_found
        render json: {error: "Client not found"}, status: :not_found
    end
end
