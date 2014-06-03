ActiveAdmin.register User do
  actions :all, except: :new
  permit_params :email, :admin

  index do
    column :email
    column :provider
    column :admin
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs 'User Details' do
      f.input :email
      f.input :admin, label: 'Administrator'
    end
    f.actions
  end

  edit = proc do
    @user = User.find_or_create_by(id: params[:id])
    @user.admin = params[:user][:admin]
    @user.update_columns(admin: @user.admin) unless @user.save
    redirect_to action: :show, id: @user.id
  end

  member_action :update, method: :put, &edit
end
