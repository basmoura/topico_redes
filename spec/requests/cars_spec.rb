require 'rails_helper'

RSpec.describe "Cars", type: :request do
  describe "GET #index" do
    before do
      create_list(:car, 3)
      get cars_path
    end

    it 'return the list of cars' do
      expect(assigns(:cars).count).to eq Car.count
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
  end

  describe "GET #new" do
    before do
      get new_car_path
    end

    it 'assigns the new car' do
      expect(assigns(:car)).to be_a_new Car
    end

    it 'renders the new template' do
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context 'with valid attributes' do
      let(:car_attributes) { attributes_for(:car) }

      it 'saves the new car on database' do
        expect do
          post cars_path(car: car_attributes)
        end.to change { Car.count }.by(1)
      end

      it 'redirects to show path' do
        post cars_path(car: car_attributes)
        expect(response).to redirect_to car_path(assigns(:car))
      end
    end

    context 'with invalid attributes' do
      let(:car_attributes) { attributes_for(:car, name: nil) }

      it 'dont saves the car on database' do
        expect do
          post cars_path(car: car_attributes)
        end.to_not change { Car.count }
      end

      it 'renders the new template' do
        post cars_path(car: car_attributes)
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #edit" do
    let(:car) { create(:car) }

    before do
      get edit_car_path(car)
    end

    it 'assigns the selected car' do
      expect(assigns(:car)).to eq car
    end

    it 'renders the edit template' do
      expect(response).to render_template(:edit)
    end
  end
end
