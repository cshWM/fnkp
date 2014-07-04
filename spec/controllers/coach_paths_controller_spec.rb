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

describe CoachPathsController do

  # This should return the minimal set of attributes required to create a valid
  # CoachPath. As you add validations to CoachPath, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "date_acomplished" => "2014-06-20 00:28:23" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CoachPathsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all coach_paths as @coach_paths" do
      coach_path = CoachPath.create! valid_attributes
      get :index, {}, valid_session
      assigns(:coach_paths).should eq([coach_path])
    end
  end

  describe "GET show" do
    it "assigns the requested coach_path as @coach_path" do
      coach_path = CoachPath.create! valid_attributes
      get :show, {:id => coach_path.to_param}, valid_session
      assigns(:coach_path).should eq(coach_path)
    end
  end

  describe "GET new" do
    it "assigns a new coach_path as @coach_path" do
      get :new, {}, valid_session
      assigns(:coach_path).should be_a_new(CoachPath)
    end
  end

  describe "GET edit" do
    it "assigns the requested coach_path as @coach_path" do
      coach_path = CoachPath.create! valid_attributes
      get :edit, {:id => coach_path.to_param}, valid_session
      assigns(:coach_path).should eq(coach_path)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new CoachPath" do
        expect {
          post :create, {:coach_path => valid_attributes}, valid_session
        }.to change(CoachPath, :count).by(1)
      end

      it "assigns a newly created coach_path as @coach_path" do
        post :create, {:coach_path => valid_attributes}, valid_session
        assigns(:coach_path).should be_a(CoachPath)
        assigns(:coach_path).should be_persisted
      end

      it "redirects to the created coach_path" do
        post :create, {:coach_path => valid_attributes}, valid_session
        response.should redirect_to(CoachPath.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved coach_path as @coach_path" do
        # Trigger the behavior that occurs when invalid params are submitted
        CoachPath.any_instance.stub(:save).and_return(false)
        post :create, {:coach_path => { "date_acomplished" => "invalid value" }}, valid_session
        assigns(:coach_path).should be_a_new(CoachPath)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        CoachPath.any_instance.stub(:save).and_return(false)
        post :create, {:coach_path => { "date_acomplished" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested coach_path" do
        coach_path = CoachPath.create! valid_attributes
        # Assuming there are no other coach_paths in the database, this
        # specifies that the CoachPath created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        CoachPath.any_instance.should_receive(:update).with({ "date_acomplished" => "2014-06-20 00:28:23" })
        put :update, {:id => coach_path.to_param, :coach_path => { "date_acomplished" => "2014-06-20 00:28:23" }}, valid_session
      end

      it "assigns the requested coach_path as @coach_path" do
        coach_path = CoachPath.create! valid_attributes
        put :update, {:id => coach_path.to_param, :coach_path => valid_attributes}, valid_session
        assigns(:coach_path).should eq(coach_path)
      end

      it "redirects to the coach_path" do
        coach_path = CoachPath.create! valid_attributes
        put :update, {:id => coach_path.to_param, :coach_path => valid_attributes}, valid_session
        response.should redirect_to(coach_path)
      end
    end

    describe "with invalid params" do
      it "assigns the coach_path as @coach_path" do
        coach_path = CoachPath.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        CoachPath.any_instance.stub(:save).and_return(false)
        put :update, {:id => coach_path.to_param, :coach_path => { "date_acomplished" => "invalid value" }}, valid_session
        assigns(:coach_path).should eq(coach_path)
      end

      it "re-renders the 'edit' template" do
        coach_path = CoachPath.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        CoachPath.any_instance.stub(:save).and_return(false)
        put :update, {:id => coach_path.to_param, :coach_path => { "date_acomplished" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested coach_path" do
      coach_path = CoachPath.create! valid_attributes
      expect {
        delete :destroy, {:id => coach_path.to_param}, valid_session
      }.to change(CoachPath, :count).by(-1)
    end

    it "redirects to the coach_paths list" do
      coach_path = CoachPath.create! valid_attributes
      delete :destroy, {:id => coach_path.to_param}, valid_session
      response.should redirect_to(coach_paths_url)
    end
  end

end