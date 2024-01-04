module V1
  class CurrentUserController < V1Controller
    before_action :authenticate_user!

    def index
      render json: UserSerializer.new(current_user).serializable_hash[:data][:attributes], status: :ok
    end
  end
end
