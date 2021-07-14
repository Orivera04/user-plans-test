class PlansController < ApplicationController
  include Controllerable
  before_action :scoped_collection, only: %i[index]

  def scoped_collection
    params[:q] ||= {}
    @coleccion = Plan.ransack(params[:q])
    respond_to do |formato|
      formato.html do
        @records = @coleccion.result.page(params[:page])
      end
    end
  end

  def index
    @params_permit = params[:q].present? ? {q: params[:q] .permit! } : {}
    render template: "plan/index",  layout: "layouts/application"
  end

  def new
    render template: "plan/form", layout: "layouts/application"
  end

  def edit
    render template: "plan/form", layout: "layouts/application"
  end

  def show
    redirect_to action: "index"
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

  def plan_params
      params.require(:plan).permit(:id, :nombre, :porcentaje_comision)
  end

  def form_template_name
    "plan/form"
  end

  alias :params_permit :plan_params
end
