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

    it 'should assign all offers to @offers' do
      offer = create(:offer)
      get :index
      expect(assigns(:offers)).to eq([offer])
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'should respond with success and render template' do
      expect(response).to be_success
      expect(response).to render_template(:new)
    end

    it 'should initiate a new offer' do
      expect(assigns(:offer)).to be_new_record
    end
  end

  describe 'POST #create' do
    context 'with valid attributes'do
      it 'should redirect to offers path' do
        post :create, offer: attr
        expect(response).to redirect_to(offers_path)
      end

      it 'should create a offer' do
        expect {
          post :create, offer: attr
        }.to change { Offer.count }.by(1)
      end
    end

    context 'with invalid attributes' do
      before { attr[:name] = nil }

      it 'should render the new template' do
        post :create, offer: attr
        expect(response).to render_template(:new)
      end

      it 'should not create a offer' do
        expect {
          post :create, offer: attr
        }.not_to change { Offer.count }
      end
    end
  end

  describe 'GET #edit' do
    before { get :edit, id: offer }

    it 'should respond with success and render template' do
      expect(response).to be_success
      expect(response).to render_template(:edit)
    end

    it 'should assign the offer to @offer' do
      expect(assigns(:offer)).to eq(offer)
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes'do
      before { patch :update, id: offer, offer: attr }

      it { should redirect_to(offer_path) }

      it 'should update the offer' do
        offer.reload
        expect(offer.cost).to eq(attr[:cost])
        expect(offer.name).to eq(attr[:name])
      end
    end

    context 'with invalid attributes' do
      before { attr[:name] = nil }

      it 'should render the update template' do
        patch :update, id: offer, offer: attr
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'should redirect to offers path' do
      delete :destroy, id: offer
      expect(response).to redirect_to(offers_path)
    end

    it 'should delete the offer' do
      offer = create(:offer)
      expect {
        delete :destroy, id: offer
      }.to change { Offer.count }.by(-1)
    end
  end
end
