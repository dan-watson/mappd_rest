module Mappd
  class Rest < Grape::API
    format :json

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
  end
end
