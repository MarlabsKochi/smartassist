class Api::V1::SessionsController < Api::V1::BaseController
  skip_before_filter :require_authentication!
  
  def create
    p request.params.inspect
    user = User.find_by(email: params[:email])
    if user && user.valid_password?(params[:password])
      response = {
        response_code: "1",
        user_id: user.id,
        token: user.authentication_token
      }
      render_json(response)
    else
      error! :unauthenticated,:metadata => {:response_code => "0",:message => "Username or Password are incorrect"}
    end
  end

  private
  def create_params
    params.require(:user).permit(:email, :password)
  end
end
