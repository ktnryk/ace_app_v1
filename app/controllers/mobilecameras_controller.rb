class MobilecamerasController < ApplicationController
  before_action :logged_in_user, only:  :destroy
  before_action :correct_user,    only: :destroy

  def new
    @mobilecamera = Mobilecamera.new
  end

  def show
    @mobilecamera = Mobilecamera.find_by(id: params[:id])
  end


  def create
    user = User.find_by(email: params[:mobilecamera][:email])
      if user != nil
          if user.mobilecameras.count < 10
              @mobilecamera = user.mobilecameras.build(cam_name: params[:mobilecamera][:cam_name], user_id: user.id)
              if @mobilecamera.save
                  flash.now[:success] = "Mobile registered"
                  render 'new'
                else
                  render 'new'
                end
          else
            flash.now[:danger] = "Camera limit"
            render 'new'
          end
        else
          flash.now[:danger] = "Invalid email"
          render 'new'
        end
  end

  def edit
  end

  def update
  end

  def destroy
    @mobilecamera.destroy
      flash[:success] = "Mobilecamera deleted"
      redirect_to request.referrer || root_url
  end

private
  def user_params
      params.require(:mobilecamera).permit(:cam_name, :email)
  end

  def correct_user
    @mobilecamera = current_user.mobilecameras.find_by(id: params[:id])
    redirect_to root_url if @mobilecamera.nil?
  end

end
