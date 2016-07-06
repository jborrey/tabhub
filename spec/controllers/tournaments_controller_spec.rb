require 'rails_helper'

RSpec.describe TournamentsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Tournament. As you add validations to Tournament, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      name: 'The Tokyo-3 Open',
      start_date: '2009-01-03 14:00:00',
      end_date: '2009-01-06 14:00:00',
      location: 'Tokyo-3',
      description: 'Let the Eva & Angles compete.',
      debate_format: 'BP',
      tournament_type: 'Open',
      number_of_rounds: 6,
    }
  end

  let(:invalid_attributes) do
    {
      name: '', # name is required
      start_date: '2009-01-03 14:00:00',
      end_date: '2009-01-06 14:00:00',
      location: 'Tokyo-3',
      description: 'Let the Eva & Angles compete.',
      debate_format: 'BP',
      tournament_type: 'Open',
      number_of_rounds: 6,
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TournamentsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET index' do
    it 'assigns all tournaments as @tournaments' do
      tournament = Tournament.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:tournaments)).to eq([tournament])
      expect(response).to be_success
    end
  end

  describe 'GET show' do
    it 'assigns the requested tournament as @tournament' do
      tournament = Tournament.create! valid_attributes
      get :show, { id: tournament.to_param }, valid_session
      expect(assigns(:tournament)).to eq(tournament)
      expect(response).to be_success
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Tournament' do
        expect do
          post :create, { tournament: valid_attributes }, valid_session
        end.to change(Tournament, :count).by(1)
        expect(assigns(:tournament)).to be_a(Tournament)
        expect(assigns(:tournament)).to be_persisted
        expect(response).to be_created # 201
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved tournament as @tournament' do
        post :create, { tournament: invalid_attributes }, valid_session
        expect(assigns(:tournament)).to be_a_new(Tournament)
        expect(response).to be_unprocessable # 422
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      let(:new_name) { 'Angels VS Eva' }
      let(:new_attributes) { { name: new_name } }

      it 'updates the requested tournament' do
        tournament = Tournament.create! valid_attributes
        expect(tournament.name).not_to eq(new_name)
        put :update,
            { id: tournament.to_param, tournament: new_attributes },
            valid_session
        expect(tournament.reload.name).to eq(new_name)
        expect(response).to be_success # actually get 204
        expect(assigns(:tournament)).to eq(tournament)
      end
    end

    describe 'with invalid params' do
      it 'assigns the tournament as @tournament' do
        tournament = Tournament.create! valid_attributes
        put :update,
            { id: tournament.to_param, tournament: invalid_attributes },
            valid_session
        expect(assigns(:tournament)).to eq(tournament)
        expect(response).to be_unprocessable # 422
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested tournament' do
      tournament = Tournament.create! valid_attributes
      expect do
        delete :destroy, { id: tournament.to_param }, valid_session
      end.to change(Tournament, :count).by(-1)
      expect(response).to be_success # actually get 204
    end
  end
end
