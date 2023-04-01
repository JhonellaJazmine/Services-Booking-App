class LocationsController < ApplicationController
    def index
        @locations = Location.all.order(:created_at)
        
        # if session[:user_id]
        #     @user = User.find(session[:user_id])
        # end
    end

    def new
        @location = Location.new
    end

    def create
        @location = Location.new(location_params)
        if @location.save 
            redirect_to locations_path, notice: 'Location has been created successfully.'
        else
            render :new, status: 422
        end
    end

def show 
end

def edit 
    if @location.user != Current.user
        redirect_to locations_path, notice: 'unauthorized access!'
     end
end

def update
    if @location.update(location_params)
        redirect_to locations_path, notice: 'Location has been updated successfully.'
    else
        render :edit, status: 422
    end
end

def destroy
    if @location.user != Current.user
        redirect_to locations_path, notice: 'unauthorized access!'
    else @location.destroy
    redirect_to locations_path, notice: 'Location has been deleted successfully.'
    end
end


private

    def location_params
        params.require(:location).permit(:name, :admin_id)
    end

    def set_location
        @location = Location.find(params[:id])
    end
end
