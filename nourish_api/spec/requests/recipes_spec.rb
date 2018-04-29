# recipes spec
# /spec/requests/recipes_spec.rb
# test methods adapted from https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-one

require 'rails_helper'

RSpec.describe 'Recipes API', type: :request do
  let!(:user) { create(:user) }
  let(:user_id) { user.id }
  let!(:recipes) { create_list(:recipe, 10, user_id: user.id) }
  let!(:recipe_id) { recipes.first.id }

  # spec for GET/recipes
  describe 'GET/recipes' do
    # make get request
    before { get '/recipes' }

    it 'returns recipes' do
      expect(json).not_to be_empty
      expect(json.size).to eq 10
    end

    it 'returns status 200' do  
      expect(response).to have_http_status 200
    end
  end

  # spec for GET /recipes/:id
  describe 'GET /recipes/:id' do
     before { get "/recipes/#{recipe_id}" }

    # expect a request for recipe id of :recipe_id
    context 'when the record exists' do
      it 'returns the recipe' do
        expect(json).not_to be_empty
        expect(json['id']).to eq id
      end

      it 'returns status code 200' do
        expect(response).to have_http_status 200
      end
    end
  
    context 'when the record does not exist' do
      let(:recipe_id) { 99 }

      it 'returns status code 404' do
        expect(response).to have_http_status 404
      end

      it 'returns not found message' do
        expect(response.body).to match /Couldn't find Recipe/
      end
    end    
 
  end

  # spec for POST /recipes
  describe 'POST /recipes' do
  
    let(:valid_attributes) { {title: 'Slow Cooker Garlic Butter Chicken with Cream Cheese Sauce', user_id: '1', source: 'https://www.oursmallhours.com/slow-cooker-garlic-butter-chicken-cream-cheese-sauce/', servings: '4', description: 'The most amazing yet simple recipe I\'ve ever encountered.'} }

    context 'when request is valid' do
      before { post '/recipes', params: valid_attributes}

      it 'creates a recipe' do
        expect( json['title'] ).to eq 'Slow Cooker Garlic Butter Chicken with Cream Cheese Sauce'
      end

      it 'returns status code 201' do
        expect(response).to have_http_status 201
      end
    end

    context 'when request is invalid' do
      before { post '/recipes', params: { } }

      it 'returns status code 422' do
        expect(response).to have_http_status 422
      end

      it 'returns validation failure message' do
        expect(response.body).to match /Validation failed: Title can't be blank/
      end
    end
 
  end


  # spec for PUT /recipes/:id
  describe 'PUT /recipes/:id' do

    let(:valid_attributes) { {title: 'Chicken'} } 

    context 'when recipe exists' do
      before { put "/recipes/#{id}", params: valid_attributes}

      it 'updates the recipe' do
        updated_recipe = Recipe.find(id)
        expect(updated_recipe.title).to match /Chicken/
      end

      it 'returns status code 204' do
        expect(response).to have_http_status 204
      end
    end

  end

  # spec for DELETE /recipes/:id
  describe 'DELETE /recipes/:id' do

    before { delete "/recipes/#{recipe_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status 204 
    end
  
  end


end