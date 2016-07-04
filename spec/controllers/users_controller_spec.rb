require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      first_name: 'Shinji',
      last_name: 'Ikari',
      username: 'sikari',
      email: 'sikaria@nerv.com',
    }
  end

  let(:invalid_attributes) do
    {
      first_name: 'Shinji',
      # missing last name
      username: '1234567890123456789012345', # > 24 chars
      email: 'invalidEmail' # incorrect format
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UsersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET index' do
    it 'assigns all users as @users' do
      user = User.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:users)).to eq([user])
      expect(response).to be_success
    end
  end

  describe 'GET show' do
    it 'assigns the requested user as @user' do
      user = User.create! valid_attributes
      get :show, { id: user.to_param }, valid_session
      expect(assigns(:user)).to eq(user)
      expect(response).to be_success
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new User' do
        expect do
          post :create, { user: valid_attributes }, valid_session
        end.to change(User, :count).by(1)
        expect(response).to be_created # 201
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved user as @user' do
        post :create, { user: invalid_attributes }, valid_session
        expect(assigns(:user)).to be_a_new(User)
        expect(response).to be_unprocessable # 422
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      let(:new_attributes) { { username: 'EVA U-01' } }

      it 'updates the requested user' do
        user = User.create! valid_attributes
        put :update,
            { id: user.to_param, user: new_attributes },
            valid_session
        user.reload
        expect(user.username).to eq('EVA U-01')
        expect(response).to be_success # actually get 204
        expect(assigns(:user)).to eq(user)
      end
    end

    describe 'with invalid params' do
      it 'assigns the user as @user' do
        user = User.create! valid_attributes
        put :update,
            { id: user.to_param, user: invalid_attributes },
            valid_session
        expect(assigns(:user)).to eq(user)
        expect(response).to be_unprocessable # 422
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested user' do
      user = User.create! valid_attributes
      expect do
        delete :destroy, { id: user.to_param }, valid_session
      end.to change(User, :count).by(-1)
      expect(response).to be_success # actually get 204
    end
  end
end
