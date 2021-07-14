class PagosController < ApplicationController
  include Controllerable
  before_action :scoped_collection, only: %i[index]

  def scoped_collection
    params[:q] ||= {}
    @coleccion = Pago.ransack(params[:q])
    respond_to do |formato|
      formato.html do
        @records = @coleccion.result.page(params[:page])
      end
    end
  end

  def index
    @params_permit = params[:q].present? ? {q: params[:q] .permit! } : {}
    render template: "pago/index",  layout: "layouts/application"
  end

  def new
    render template: "pago/form", layout: "layouts/application"
  end

  def show
    render template: "pago/show", layout: "layouts/application"
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

  def pago_params
      params.require(:pago).permit(:id, :user_id, :monto_usd)
  end

  def form_template_name
    "pago/form"
  end

  alias :params_permit :pago_params
end
