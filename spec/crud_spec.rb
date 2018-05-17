ENV['RACK_ENV'] = 'test'
require File.expand_path('spec_helper.rb', __dir__)

require 'rack/test'
require 'byebug'

describe 'Rack Test' do
  include Rack::Test::Methods

  def app
    Mappd::Rest
  end

  context 'single entity' do
    it 'returns status' do
      schema = JSON.parse(File.read('spec/data/book_schema.json'))
      get '/books/schema'
      expect(last_response).to be_ok
      expect(JSON.parse(last_response.body)).to eq(schema)
    end

    it 'returns all' do
      get '/books'
      expect(last_response).to be_ok
      expect(JSON.parse(last_response.body).length).to eq(3)
    end

    it 'returns two offset by one' do
      get '/books?limit=2&offset=1'
      expect(last_response).to be_ok
      result = JSON.parse(last_response.body)
      expect(result.length).to eq(2)
      expect(result.map { |i| i['id'] }).to eq([2, 3])
    end

    it 'returs all from relationship' do
      get '/authors/1/books'
      expect(last_response).to be_ok
      expect(JSON.parse(last_response.body).length).to eq(2)
    end

    it 'returs all from relationship with limits' do
      get '/authors/1/books?limit=2&offset=1'
      expect(last_response).to be_ok
      expect(JSON.parse(last_response.body).length).to eq(1)
    end

    it 'returns one from relationship' do
      get '/authors/1/books/1'
      expect(last_response).to be_ok
      expect(JSON.parse(last_response.body)['title'])
        .to eq('Wind in the willows')
    end

    it 'returns deeply nested entity' do
      get '/authors/1/books/1/author'
      expect(last_response).to be_ok
      expect(JSON.parse(last_response.body)['name'])
        .to eq('Dan')
    end

    it 'return one' do
      get '/books/1'
      expect(JSON.parse(last_response.body)['title'])
        .to eq('Wind in the willows')
    end

    it 'does not return one' do
      get '/books/600'
      expect(last_response.status).to eq(404)
    end

    it 'creates one' do
      post '/books', { title: 'New Book', year: 2012 }.to_json
      expect(last_response.status).to eq(201)
      expect(Book.find(3)).to be_present
    end

    it 'does not create one' do
      post '/books', { title: 'New Book' }.to_json
      expect(last_response.status).to eq(422)
    end

    it 'updates one' do
      put '/books/1', { title: 'Updated Book', year: 2012 }.to_json
      expect(last_response.status).to eq(200)
      expect(Book.find(1).title).to eq('Updated Book')
    end

    it 'does not update one' do
      put '/books/1', { title: 'Updated Book', year: nil }.to_json
      expect(last_response.status).to eq(422)
    end

    it 'delete one' do
      delete '/books/1'
      expect(last_response).to be_ok
      expect { Book.find(1) }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it 'does not delete one' do
      delete '/books/600'
      expect(last_response.status).to eq(404)
    end
  end
end
