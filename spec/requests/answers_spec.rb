require 'rails_helper'

RSpec.describe 'Questions', type: :request do
  let(:request) { post '/questions', params: params }
  let(:params) { {} }

  context 'when user is authenticated' do
    let(:user) { create(:user) }

    before { sign_in(user) }

    context 'when all requirements are satisfied' do
      let(:params) do
        {
          question: {
            title: 'What is Rails?',
            body: 'What is the difference between Ruby and Rails?'
          }
        }
      end

      it 'creates a new questions' do
        expect { request }.to change(Question, :count).by(1)
      end

      it 'redirects to root_path' do
        request

        expect(response.status).to eq(302)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when title is missing' do
      let(:params) do
        {
          question: {
            body: 'What is the difference between Ruby and Rails?'
          }
        }
      end

      it 'does not create a new questions' do
        expect { request }.not_to change(Question, :count)
      end
    end

    context 'when body is missing' do
      let(:params) do
        {
          question: {
            title: 'What is Rails?'
          }
        }
      end

      it 'does not create a new questions' do
        expect { request }.not_to change(Question, :count)
      end
    end
  end

  context 'whe user is not authenticated' do
    it 'redirects user to the login path' do
      request

      expect(response.status).to eq(302)
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
