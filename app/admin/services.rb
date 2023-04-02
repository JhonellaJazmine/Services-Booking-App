ActiveAdmin.register Service do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :price, :category_id, :location_id, :available_time_start, :available_time_end, available_days: []
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :price, :available_days, :available_time_start, :available_time_end, :category_id, :location_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :price
    column :category
    column :location
    column :available_time_start, :sortable => :available_time_start do |service|
      service.available_time_start.strftime('%H:%M')
    end
    column :available_time_end, :sortable => :available_time_end do |service|
      service.available_time_end.strftime('%H:%M')
    end
    column "Available Days" do |service|
      days = {0 => "Monday", 1 => "Tuesday", 2 => "Wednesday", 3 => "Thursday", 4 => "Friday", 5 => "Saturday", 6 => "Sunday"}
      service.available_days.map { |day| days[day] }.join(" ")
    end
    actions
  end


  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :name
      f.input :description
      f.input :price
      f.input :category_id, as: :select, collection: Category.all.map { |c| [c.name, c.id] }
      f.input :location_id, as: :select, collection: Location.all.map { |l| [l.name, l.id] }
      f.input :available_time_start, as: :time_picker, ampm: true
      f.input :available_time_end, as: :time_picker, ampm: true
      f.input :available_days, as: :check_boxes, collection: [
        ["Monday", 0],
        ["Tuesday", 1],
        ["Wednesday", 2],
        ["Thursday", 3],
        ["Friday", 4],
        ["Saturday", 5],
        ["Sunday", 6]
      ]    end
      f.actions
    end
end
