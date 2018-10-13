require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  context 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect response.successful?
    end
  end
end
