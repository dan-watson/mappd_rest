ENV['RACK_ENV'] = 'test'
require File.expand_path('spec_helper.rb', __dir__)

require 'rack/test'

describe 'Rack Test' do
  include Rack::Test::Methods

  def app
    Mappd::Rest
  end

  context 'single entity' do
    it 'returns all' do
      get '/books'
      expect(last_response).to be_ok
      expect(JSON.parse(last_response.body).length).to eq(2)
    end
  end
end
