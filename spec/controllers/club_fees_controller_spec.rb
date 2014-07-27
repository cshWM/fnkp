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

describe ClubFeesController do

  # This should return the minimal set of attributes required to create a valid
  # ClubFee. As you add validations to ClubFee, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ClubFeesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all club_fees as @club_fees" do
      club_fee = ClubFee.create! valid_attributes
      get :index, {}, valid_session
      assigns(:club_fees).should eq([club_fee])
    end
  end

  describe "GET show" do
    it "assigns the requested club_fee as @club_fee" do
      club_fee = ClubFee.create! valid_attributes
      get :show, {:id => club_fee.to_param}, valid_session
      assigns(:club_fee).should eq(club_fee)
    end
  end

  describe "GET new" do
    it "assigns a new club_fee as @club_fee" do
      get :new, {}, valid_session
      assigns(:club_fee).should be_a_new(ClubFee)
    end
  end

  describe "GET edit" do
    it "assigns the requested club_fee as @club_fee" do
      club_fee = ClubFee.create! valid_attributes
      get :edit, {:id => club_fee.to_param}, valid_session
      assigns(:club_fee).should eq(club_fee)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ClubFee" do
        expect {
          post :create, {:club_fee => valid_attributes}, valid_session
        }.to change(ClubFee, :count).by(1)
      end

      it "assigns a newly created club_fee as @club_fee" do
        post :create, {:club_fee => valid_attributes}, valid_session
        assigns(:club_fee).should be_a(ClubFee)
        assigns(:club_fee).should be_persisted
      end

      it "redirects to the created club_fee" do
        post :create, {:club_fee => valid_attributes}, valid_session
        response.should redirect_to(ClubFee.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved club_fee as @club_fee" do
        # Trigger the behavior that occurs when invalid params are submitted
        ClubFee.any_instance.stub(:save).and_return(false)
        post :create, {:club_fee => { "name" => "invalid value" }}, valid_session
        assigns(:club_fee).should be_a_new(ClubFee)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        ClubFee.any_instance.stub(:save).and_return(false)
        post :create, {:club_fee => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested club_fee" do
        club_fee = ClubFee.create! valid_attributes
        # Assuming there are no other club_fees in the database, this
        # specifies that the ClubFee created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        ClubFee.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => club_fee.to_param, :club_fee => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested club_fee as @club_fee" do
        club_fee = ClubFee.create! valid_attributes
        put :update, {:id => club_fee.to_param, :club_fee => valid_attributes}, valid_session
        assigns(:club_fee).should eq(club_fee)
      end

      it "redirects to the club_fee" do
        club_fee = ClubFee.create! valid_attributes
        put :update, {:id => club_fee.to_param, :club_fee => valid_attributes}, valid_session
        response.should redirect_to(club_fee)
      end
    end

    describe "with invalid params" do
      it "assigns the club_fee as @club_fee" do
        club_fee = ClubFee.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ClubFee.any_instance.stub(:save).and_return(false)
        put :update, {:id => club_fee.to_param, :club_fee => { "name" => "invalid value" }}, valid_session
        assigns(:club_fee).should eq(club_fee)
      end

      it "re-renders the 'edit' template" do
        club_fee = ClubFee.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ClubFee.any_instance.stub(:save).and_return(false)
        put :update, {:id => club_fee.to_param, :club_fee => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested club_fee" do
      club_fee = ClubFee.create! valid_attributes
      expect {
        delete :destroy, {:id => club_fee.to_param}, valid_session
      }.to change(ClubFee, :count).by(-1)
    end

    it "redirects to the club_fees list" do
      club_fee = ClubFee.create! valid_attributes
      delete :destroy, {:id => club_fee.to_param}, valid_session
      response.should redirect_to(club_fees_url)
    end
  end

end
