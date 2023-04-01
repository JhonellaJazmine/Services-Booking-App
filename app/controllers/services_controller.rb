class ServicesController < ApplicationController
    before_action :set_service, only: %i[show edit update destroy]
    def index
        @services = Service.all.order(:created_at)
        
        # if session[:user_id]
        #     @user = User.find(session[:user_id])
        # end
    end

    def new
        @service = Service.new
    end

    def create
        @service = Service.new(service_params)
        if @service.save 
            redirect_to services_path, notice: 'Service has been created successfully.'
        else
            render :new, status: 422
        end
    end

def show 
end

def edit 
    if @service.user != Current.user
        redirect_to services_path, notice: 'unauthorized access!'
     end
end

def update
    if @service.update(service_params)
        redirect_to services_path, notice: 'Service has been updated successfully.'
    else
        render :edit, status: 422
    end
end

def destroy
    if @service.user != Current.user
        redirect_to services_path, notice: 'unauthorized access!'
    else @service.destroy
    redirect_to services_path, notice: 'Service has been deleted successfully.'
    end
end


private

    def service_params
        params.require(:service).permit(:name, :description, :price, :available_date, :available_time, :category_id, :location_id, :admin_id)
    end

    def set_service
        @service = Service.find(params[:id])
    end

end
