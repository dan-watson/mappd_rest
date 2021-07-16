module Mappd
  class Rest < Grape::API
    format :json

    cattr_accessor :auth_method

    before do
      error!('Access Denied', 401) unless access_token?
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      error!(e, 404)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      error!(e, 422)
    end

    helpers do
      def access_token?
        Rest.auth_method.call(request.headers['X-Access-Token'])
      end

      def resource
        params[:resource].singularize.titlecase.constantize
      end

      def all
        resource.all
      end

      def limiter(relation)
        return relation unless relation.is_a?(ActiveRecord::Relation)

        relation = relation.offset(params[:offset]) if params[:offset]
        relation = relation.limit(params[:limit]) if params[:limit]
        relation
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

      def method?(param)
        param.to_i.to_s != param
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

    params do
      requires :resource, type: String
      optional :id, type: Integer
    end

    get '/:resource' do
      limiter(all)
    end

    get '/:resource/:id' do
      find
    end

    get '/:resource/:id/*' do
      args = params[:splat][0].split('/')
      relation = find
      args.each_with_index do |param, index|
        relation = if index.even? || method?(param)
                     relation.send(param.to_sym)
                   else
                     relation.find(param.to_i)
                   end
      end
      limiter(relation)
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
