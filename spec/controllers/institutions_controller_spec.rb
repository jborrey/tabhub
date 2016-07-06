require 'rails_helper'

RSpec.describe InstitutionsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Institution. As you add validations to Institution, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      name: 'Duke University Debating Society',
      university: 'Duke University',
      location: 'Durham, North Carolina, USA',
      president_id: 1,
      website: 'dukedebate.org',
      founded_at: '1897-01-01',
    }
  end

  let(:invalid_attributes) do
    {
      name: 'UNC Debating Society',
      university: 'University of North Carolina',
      president_id: nil, # this is required
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # InstitutionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET index' do
    it 'assigns all institutions as @institutions' do
      institution = Institution.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:institutions)).to eq([institution])
      expect(response).to be_success
    end
  end

  describe 'GET show' do
    it 'assigns the requested institution as @institution' do
      institution = Institution.create! valid_attributes
      get :show, { id: institution.to_param }, valid_session
      expect(assigns(:institution)).to eq(institution)
      expect(response).to be_success
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Institution' do
        expect do
          post :create, { institution: valid_attributes }, valid_session
        end.to change(Institution, :count).by(1)
        expect(assigns(:institution)).to be_a(Institution)
        expect(assigns(:institution)).to be_persisted
        expect(response).to be_created # 201
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved institution as @institution' do
        post :create, { institution: invalid_attributes }, valid_session
        expect(assigns(:institution)).to be_a_new(Institution)
        expect(response).to be_unprocessable # 422
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      let(:new_attributes) { { twitter_handle: '@dukedebate' } }

      it 'updates the requested institution' do
        institution = Institution.create! valid_attributes
        expect(institution.twitter_handle).to be_nil
        put :update,
            { id: institution.to_param, institution: new_attributes },
            valid_session
        expect(institution.reload.twitter_handle).to eq('@dukedebate')
        expect(assigns(:institution)).to eq(institution)
        expect(response).to be_success # actually get 204
      end
    end

    describe 'with invalid params' do
      it 'assigns the institution as @institution' do
        institution = Institution.create! valid_attributes
        put :update,
            { id: institution.to_param, institution: invalid_attributes },
            valid_session
        expect(assigns(:institution)).to eq(institution)
        expect(response).to be_unprocessable # 422
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested institution' do
      institution = Institution.create! valid_attributes
      expect do
        delete :destroy, { id: institution.to_param }, valid_session
      end.to change(Institution, :count).by(-1)
      expect(response).to be_success # actually get 204
    end
  end
end
