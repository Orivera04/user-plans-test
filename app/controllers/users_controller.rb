class UsersController < ApplicationController
  include Controllerable
  before_action :scoped_collection, only: %i[index]

  def scoped_collection
    params[:q] ||= {}
    @coleccion = User.ransack(params[:q])
    respond_to do |formato|
      formato.html do
          @records = @coleccion.result.page(params[:page])
      end
    end
  end

  def index
    @params_permit = params[:q].present? ? {q: params[:q] .permit! } : {}
    render template: "users/index",  layout: "layouts/application"
  end

  def new
    render template: "users/form", layout: "layouts/application"
  end

  def edit
    render template: "users/form", layout: "layouts/application"
  end

  def show
    redirect_to action: :index
  end

  def destroy
    begin
      flash[:notice] = "El registro ha sido eliminado exitosamente" if @record.destroy
    rescue StandardError => e
      flash[:error] = e.message
    end

    redirect_to action: :index
end

  private

  def user_params
      params.require(:user).permit(:id, :email, :password, :user, :plan_id, :telefono, :parent_id)
  end

  def form_template_name
    "users/form"
  end

  alias :params_permit :user_params
end
