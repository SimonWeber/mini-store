require 'spec_helper'

describe UsersController do
  let(:user) { create(:user) }
  let(:attr) { attributes_for(:user) }

  context 'when signed in' do
    before { sign_in user }

    describe 'GET #index' do
      before { get :index }

      it { should respond_with(:success) }
      it { should render_template(:index) }
    end
  end
end
