RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model 'Electronic' do

    edit do
      field :electronics_name
      field :mac_address
      field :is_wireless
      field :user do
        pretty_value do value.try(:user_name) end
      end
    end
    show do
      field :electronics_name
      field :mac_address
      field :is_wireless
      field :user do
        pretty_value do value.try(:user_name) end
      end
    end



  end

  config.model 'User' do
    #show do
    #  field :belongs
    #  field :user_name
    #  field :is_special
    #  field :is_payment
    #end
#
    #edit do
    #  field :belongs
    #  field :user_name
    #  field :is_special
    #  field :is_payment
    #end

  
    #index do
    field :user_name
    field :belongs
    field :is_payment
    field :is_special
    field :pre_payment
    #end    

  end

end
