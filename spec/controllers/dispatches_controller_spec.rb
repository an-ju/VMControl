require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe DispatchesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Dispatch. As you add validations to Dispatch, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DispatchesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all dispatches as @dispatches" do
      dispatch = Dispatch.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:dispatches)).to eq([dispatch])
    end
  end

  describe "GET show" do
    it "assigns the requested dispatch as @dispatch" do
      dispatch = Dispatch.create! valid_attributes
      get :show, {:id => dispatch.to_param}, valid_session
      expect(assigns(:dispatch)).to eq(dispatch)
    end
  end

  describe "GET new" do
    it "assigns a new dispatch as @dispatch" do
      get :new, {}, valid_session
      expect(assigns(:dispatch)).to be_a_new(Dispatch)
    end
  end

  describe "GET edit" do
    it "assigns the requested dispatch as @dispatch" do
      dispatch = Dispatch.create! valid_attributes
      get :edit, {:id => dispatch.to_param}, valid_session
      expect(assigns(:dispatch)).to eq(dispatch)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Dispatch" do
        expect {
          post :create, {:dispatch => valid_attributes}, valid_session
        }.to change(Dispatch, :count).by(1)
      end

      it "assigns a newly created dispatch as @dispatch" do
        post :create, {:dispatch => valid_attributes}, valid_session
        expect(assigns(:dispatch)).to be_a(Dispatch)
        expect(assigns(:dispatch)).to be_persisted
      end

      it "redirects to the created dispatch" do
        post :create, {:dispatch => valid_attributes}, valid_session
        expect(response).to redirect_to(Dispatch.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved dispatch as @dispatch" do
        post :create, {:dispatch => invalid_attributes}, valid_session
        expect(assigns(:dispatch)).to be_a_new(Dispatch)
      end

      it "re-renders the 'new' template" do
        post :create, {:dispatch => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested dispatch" do
        dispatch = Dispatch.create! valid_attributes
        put :update, {:id => dispatch.to_param, :dispatch => new_attributes}, valid_session
        dispatch.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested dispatch as @dispatch" do
        dispatch = Dispatch.create! valid_attributes
        put :update, {:id => dispatch.to_param, :dispatch => valid_attributes}, valid_session
        expect(assigns(:dispatch)).to eq(dispatch)
      end

      it "redirects to the dispatch" do
        dispatch = Dispatch.create! valid_attributes
        put :update, {:id => dispatch.to_param, :dispatch => valid_attributes}, valid_session
        expect(response).to redirect_to(dispatch)
      end
    end

    describe "with invalid params" do
      it "assigns the dispatch as @dispatch" do
        dispatch = Dispatch.create! valid_attributes
        put :update, {:id => dispatch.to_param, :dispatch => invalid_attributes}, valid_session
        expect(assigns(:dispatch)).to eq(dispatch)
      end

      it "re-renders the 'edit' template" do
        dispatch = Dispatch.create! valid_attributes
        put :update, {:id => dispatch.to_param, :dispatch => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested dispatch" do
      dispatch = Dispatch.create! valid_attributes
      expect {
        delete :destroy, {:id => dispatch.to_param}, valid_session
      }.to change(Dispatch, :count).by(-1)
    end

    it "redirects to the dispatches list" do
      dispatch = Dispatch.create! valid_attributes
      delete :destroy, {:id => dispatch.to_param}, valid_session
      expect(response).to redirect_to(dispatches_url)
    end
  end

end
