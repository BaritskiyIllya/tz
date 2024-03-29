ActiveAdmin.register DeviceExperiment do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :device_id, :experiments_option_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:device_id, :experiments_option_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end


  filter :experiments_option_id, as: :select, collection: -> { ExperimentsOption
                                                                 .pluck(:options, :id)
                                                                 .map { |options, id| ["ID:#{id} #{options} - #{DeviceExperiment.where(experiments_option_id: id).count}", id] } }
  filter :created_at
  filter :updated_at

end
