module Controllerable
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user!
    before_action :find_record, only: %i[edit new show destroy]
    before_action :update_create_record, only: %i[create update]
  end

  %i[create update].each do |method_name|
    define_method(method_name) do
      begin
        raise if flash.now[:error].present? || !@record.valid?
        if @record.save!
          flash[:notice] = "El registro ha sido almacenado."
          redirect_to send([controller.singularize, "path"].join("_"), @record)
        end
      rescue StandardError => exception
        flash.now[:now] = "Ocurrio un error al guardar los datos" if flash.now[:error].blank?
        logger.error {"#{exception.message}: #{@record.attributes.inspect} \nMessage: #{@record.errors.messages}"}
        logger.error "******************************************************"
        logger.error exception.message
        logger.error exception.backtrace.join("\n")
        logger.error "******************************************************"
        render(template: form_template_name, layout: "layouts/application", locals: { record: @record })
      end
    end
  end

  def find_record
    if params[:id].present?
      @record = model_name.constantize.find(params[:id])
      @url = send([controller_name.singularize, "path"].join("_"), @record)
    else
      @record = model_name.constantize.new
      @url = send([controller_name, "path"].join("_"), @record)
    end
  end

  def update_create_record
    if params[:id].present?
      @record = model_name.constantize.find(params[:id])
      @url = send([controller_name.singularize, "path"].join("_"), @record)
      @record.attributes = params_permit || {}
    else
      @record = model_name.constantize.new(params_permit || {})
      @url = send([controller_name, "path"].join("_"), @record)
    end
  end

  private

  def controller
    self.controller_name
  end

  def model_name
    controller.singularize.camelcase
  end
end