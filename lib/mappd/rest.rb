module Mappd
  class Rest < Grape::API
    format :json

    rescue_from ActiveRecord::RecordNotFound do |e|
      error!(e, 404)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      error!(e, 422)
    end

    helpers do
      def resource
        params[:resource].singularize.titlecase.constantize
      end

      def all
        resource.all
      end

      def find
        resource.find(params[:id])
      end

      def create!(attributes)
        resource.create!(attributes)
      end

      def update!(attributes)
        find.update!(attributes)
      end

      def destroy!
        find&.destroy
      end
    end

    get '/:resource/schema' do
      resource.columns.map do |column|
        {
          name: column.name,
          type: column.type.to_s
        }
      end
    end

    get '/:resource' do
      all
    end

    get '/:resource/:id' do
      find
    end

    post '/:resource' do
      create!(JSON.parse(params.first[0]))
    end

    put '/:resource/:id' do
      update!(JSON.parse(params.first[0]))
    end

    delete '/:resource/:id' do
      destroy!
    end
  end
end
