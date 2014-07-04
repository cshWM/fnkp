require 'spec_helper'

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

describe RefereePathsController do

  # This should return the minimal set of attributes required to create a valid
  # RefereePath. As you add validations to RefereePath, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "date_acomplished" => "2014-07-04 22:53:44" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RefereePathsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all referee_paths as @referee_paths" do
      referee_path = RefereePath.create! valid_attributes
      get :index, {}, valid_session
      assigns(:referee_paths).should eq([referee_path])
    end
  end

  describe "GET show" do
    it "assigns the requested referee_path as @referee_path" do
      referee_path = RefereePath.create! valid_attributes
      get :show, {:id => referee_path.to_param}, valid_session
      assigns(:referee_path).should eq(referee_path)
    end
  end

  describe "GET new" do
    it "assigns a new referee_path as @referee_path" do
      get :new, {}, valid_session
      assigns(:referee_path).should be_a_new(RefereePath)
    end
  end

  describe "GET edit" do
    it "assigns the requested referee_path as @referee_path" do
      referee_path = RefereePath.create! valid_attributes
      get :edit, {:id => referee_path.to_param}, valid_session
      assigns(:referee_path).should eq(referee_path)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new RefereePath" do
        expect {
          post :create, {:referee_path => valid_attributes}, valid_session
        }.to change(RefereePath, :count).by(1)
      end

      it "assigns a newly created referee_path as @referee_path" do
        post :create, {:referee_path => valid_attributes}, valid_session
        assigns(:referee_path).should be_a(RefereePath)
        assigns(:referee_path).should be_persisted
      end

      it "redirects to the created referee_path" do
        post :create, {:referee_path => valid_attributes}, valid_session
        response.should redirect_to(RefereePath.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved referee_path as @referee_path" do
        # Trigger the behavior that occurs when invalid params are submitted
        RefereePath.any_instance.stub(:save).and_return(false)
        post :create, {:referee_path => { "date_acomplished" => "invalid value" }}, valid_session
        assigns(:referee_path).should be_a_new(RefereePath)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        RefereePath.any_instance.stub(:save).and_return(false)
        post :create, {:referee_path => { "date_acomplished" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested referee_path" do
        referee_path = RefereePath.create! valid_attributes
        # Assuming there are no other referee_paths in the database, this
        # specifies that the RefereePath created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        RefereePath.any_instance.should_receive(:update).with({ "date_acomplished" => "2014-07-04 22:53:44" })
        put :update, {:id => referee_path.to_param, :referee_path => { "date_acomplished" => "2014-07-04 22:53:44" }}, valid_session
      end

      it "assigns the requested referee_path as @referee_path" do
        referee_path = RefereePath.create! valid_attributes
        put :update, {:id => referee_path.to_param, :referee_path => valid_attributes}, valid_session
        assigns(:referee_path).should eq(referee_path)
      end

      it "redirects to the referee_path" do
        referee_path = RefereePath.create! valid_attributes
        put :update, {:id => referee_path.to_param, :referee_path => valid_attributes}, valid_session
        response.should redirect_to(referee_path)
      end
    end

    describe "with invalid params" do
      it "assigns the referee_path as @referee_path" do
        referee_path = RefereePath.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        RefereePath.any_instance.stub(:save).and_return(false)
        put :update, {:id => referee_path.to_param, :referee_path => { "date_acomplished" => "invalid value" }}, valid_session
        assigns(:referee_path).should eq(referee_path)
      end

      it "re-renders the 'edit' template" do
        referee_path = RefereePath.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        RefereePath.any_instance.stub(:save).and_return(false)
        put :update, {:id => referee_path.to_param, :referee_path => { "date_acomplished" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested referee_path" do
      referee_path = RefereePath.create! valid_attributes
      expect {
        delete :destroy, {:id => referee_path.to_param}, valid_session
      }.to change(RefereePath, :count).by(-1)
    end

    it "redirects to the referee_paths list" do
      referee_path = RefereePath.create! valid_attributes
      delete :destroy, {:id => referee_path.to_param}, valid_session
      response.should redirect_to(referee_paths_url)
    end
  end

end
