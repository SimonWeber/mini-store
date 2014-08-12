require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let(:order)     { create(:order) }
  let(:offer)     { create(:offer) }
  let(:attr)      { attributes_for(:offer) }
  let(:chochito)  { create(:user) }

  before { sign_in chochito }

  describe 'GET #index' do
    it 'should respond with success and render template' do
      get :index
      expect(response).to be_success
      expect(response).to render_template(:index)
    end

    it 'should assign all orders to @orders' do
      order = create(:order)
      get :index
      expect(assigns(:orders)).to eq([order])
    end
  end
end
