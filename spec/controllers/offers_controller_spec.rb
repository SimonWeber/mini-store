require 'rails_helper'

RSpec.describe OffersController, type: :controller do
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

    it "should assign all offers to @offers" do
      offer = create(:offer)
      get :index
      expect(assigns(:offers)).to eq([offer])
    end
  end
end
