require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let(:order)     { create(:order) }
  let(:offer)     { create(:offer) }
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

  describe 'GET #new' do
    before { get :new }

    it 'should respond with success and render template' do
      expect(response).to be_success
      expect(response).to render_template(:new)
    end

    it 'should initiate a new order' do
      expect(assigns(:order)).to be_new_record
    end
  end

  describe 'POST #create' do
    context 'with valid attributes'do
      let(:order_attributes) do
        attributes_for(:order).merge(offer_id: create(:offer).id)
      end

      it 'should redirect to orders path' do
        post :create, order: order_attributes
        expect(response).to redirect_to(orders_path)
      end

      it 'creates the order' do
        expect {
          post :create, order: order_attributes
        }.to change { Order.count }.by(1)
      end
    end

    context 'with invalid attributes' do
      let(:order_attributes) { attributes_for(:order) }

      it 'does not create the order if there is not a valid email' do
        order_attributes[:email] = 'lalala'

        expect {
          post :create, order: order_attributes
        }.to change { Order.count }.by(0)
      end

      it 'does not create the order if there is not a valid zip' do
        order_attributes[:zip] = '123'

        expect {
          post :create, order: order_attributes
        }.to change { Order.count }.by(0)
      end

      it 'does not create the order if zip is blank' do
        order_attributes[:zip] = nil

        expect {
          post :create, order: order_attributes
        }.to change { Order.count }.by(0)
      end

      it 'does not create the order if city is blank' do
        order_attributes[:city] = nil

        expect {
          post :create, order: order_attributes
        }.to change { Order.count }.by(0)
      end

      it 'does not create the order if telephone is to short' do
        order_attributes[:telephone] = '12345'

        expect {
          post :create, order: order_attributes
        }.to change { Order.count }.by(0)
      end

      it 'does not create the order if telephone and email are blank' do
        order_attributes[:telephone] = nil
        order_attributes[:email] = nil

        expect {
          post :create, order: order_attributes
        }.to change { Order.count }.by(0)
      end
    end
  end

  describe 'GET #edit' do
    before { get :edit, id: order }

    it 'should respond with success and render template' do
      expect(response).to be_success
      expect(response).to render_template(:edit)
    end

    it 'should assign the order to @order' do
      expect(assigns(:order)).to eq(order)
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      let(:order_attributes) { attributes_for(:order) }
      before { patch :update, id: order, order: order_attributes }

      it { should redirect_to(order_path) }

      it 'should update the recipient' do
        order.reload
        expect(order.email).to eq(order_attributes[:email])
        expect(order.lastname).to eq(order_attributes[:lastname])
      end
    end

    context 'with invalid attributes' do
      let(:order_attributes) { attributes_for(:order) }
      before { order_attributes[:lastname] = nil }

      it 'should render the update template' do
        patch :update, id: order, order: order_attributes
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'should redirect to orders path' do
      delete :destroy, id: order
      expect(response).to redirect_to(orders_path)
    end

    it 'should delete the order' do
      order = create(:order)
      expect {
        delete :destroy, id: order
      }.to change { Order.count }.by(-1)
    end
  end
end
