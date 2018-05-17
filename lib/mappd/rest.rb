module Mappd
  class Rest < Grape::API
    format :json

    rescue_from ActiveRecord::RecordNotFound do |e|
      error!(e, 404)
    end

    helpers do
      def resource(resource)
        resource.singularize.titlecase.constantize
      end
    end

    get '/:resource' do
      resource(params[:resource]).all
    end

    get '/:resource/:id' do
      resource(params[:resource]).find(params[:id])
    end

    delete '/:resource/:id' do
      resource(params[:resource]).find(params[:id])&.destroy
    end
  end
end
