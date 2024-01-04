module V1
  module Users
    class RegistrationsController < Devise::RegistrationsController
      respond_to :json

      include RackSessionFix

      private

      def respond_with(resource, _opts = {})
        if resource.persisted?
          render json: {
            status: {
              code: 200,
              message: 'Signed up successfully'
            },
            data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
          }, status: :ok
        else
          render json: {
            status: {
              code: 422,
              message: "User could not be created successfully. #{resource.errors.full_messages.to_sentence}"
            }
          }, status: :unprocessable_entity
        end
      end
    end
  end
end
