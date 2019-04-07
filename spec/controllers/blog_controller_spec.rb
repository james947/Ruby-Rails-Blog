# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BlogController, type: :controller do
  context 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect response.successful?
    end
  end
end
