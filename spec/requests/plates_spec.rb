require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/plates", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Plate. As you add validations to Plate, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Plate.create! valid_attributes
      get plates_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      plate = Plate.create! valid_attributes
      get plate_url(plate)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_plate_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      plate = Plate.create! valid_attributes
      get edit_plate_url(plate)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Plate" do
        expect {
          post plates_url, params: { plate: valid_attributes }
        }.to change(Plate, :count).by(1)
      end

      it "redirects to the created plate" do
        post plates_url, params: { plate: valid_attributes }
        expect(response).to redirect_to(plate_url(Plate.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Plate" do
        expect {
          post plates_url, params: { plate: invalid_attributes }
        }.to change(Plate, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post plates_url, params: { plate: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested plate" do
        plate = Plate.create! valid_attributes
        patch plate_url(plate), params: { plate: new_attributes }
        plate.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the plate" do
        plate = Plate.create! valid_attributes
        patch plate_url(plate), params: { plate: new_attributes }
        plate.reload
        expect(response).to redirect_to(plate_url(plate))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        plate = Plate.create! valid_attributes
        patch plate_url(plate), params: { plate: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested plate" do
      plate = Plate.create! valid_attributes
      expect {
        delete plate_url(plate)
      }.to change(Plate, :count).by(-1)
    end

    it "redirects to the plates list" do
      plate = Plate.create! valid_attributes
      delete plate_url(plate)
      expect(response).to redirect_to(plates_url)
    end
  end
end
