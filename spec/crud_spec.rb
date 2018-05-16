require File.expand_path('boot.rb', __dir__)
require File.expand_path('spec_helper.rb', __dir__)
require File.expand_path('app/models/book.rb', __dir__)

context '#book' do
  context '#setup' do
    it 'has method restify' do
      expect(Book).to respond_to(:restify)
    end
  end
end
