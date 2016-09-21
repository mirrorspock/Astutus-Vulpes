require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  context '#index' do

    context 'routing' do
      it 'routes correctly' do
        expect(get: '/posts').to route_to('posts#index')
      end
    end

    context 'get #index' do
      before(:each) do
        get :index
      end

      it 'has correct http status' do
        expect(response.status).to eql(200)
      end

      it 'contains posts' do
        expect(assigns(:posts)).to be_a(ActiveRecord::Relation)
      end

      it 'renders correct template' do
        expect(response).to render_template('index')
      end
    end


  end
end
