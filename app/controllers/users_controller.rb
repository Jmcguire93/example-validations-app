class UsersController < ApplicationController

  def index
    users = User.all 
    render json: users.as_json 
  end

  def show
    user_id = params["id"]
    user = User.find_by(id: user_id) 
    render json: user.as_json
  end

  def create
    user = User.new(
      first_first_name: params["first_name"],
      last_name: params["last_name"],
      email: params["email"]
    )

    if user.save
      render json: user.as_json
    else
      render json: { errors: user.error.full_messages },
      status: :unprocessable_entity
    end 
  end

  def update
    user_id = params["id"]
    user = User.find_by(id: user_id)

    user.first_name = params["first_name"] || user.first_name
    user.last_name = params["last_name"] || user.last_name
    user.email = params["email"] || user.email
    
    if user.save 
      render json: user.as_json
    else
      render json: { errors: user.error.full_messages },
      status: :unprocessable_entity
    end
  end



  def destroy
    user_id = params[:id]
    user = User.find_by(id: user_id)
    
    if user.destroy
      render json: {message: "User sucesfully destroyed."}
    else
      render json: { errors: user.error.full_messages },
      status: :unprocessable_entity
    end
  end
end
