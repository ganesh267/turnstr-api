class V1::Admin::UsersController < V1::Admin::BaseController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /v1/admin/users
  def index
    users = ::User.all.page(current_page)

    render_success data: {
        users: ActiveModel::Serializer::CollectionSerializer.new(users, serializer: UserListSerializer),
        total_pages: users.total_pages,
        current_page: users.current_page,
        next_page: users.next_page,
        prev_page: users.prev_page,
        first_page: users.first_page?,
        last_page: users.last_page?
    }
  end

  # GET /v1/admin/users/1
  def show
    render json: @user

  end

  # POST /v1/user/users
  def create
    user = ::User.new(user_params)

    if user.save
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /v1/user/users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /v1/user/users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = ::User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:email, :username, :password, :first_name, :last_name, :phone, :avatar_face1, :avatar_face2, :avatar_face3, :avatar_face4, :avatar_face5, :avatar_face6, :website, :bio, :gender, :address, :city, :state, :info, :contact_me, :online, :is_verified, :is_active  )
      
    end
end
