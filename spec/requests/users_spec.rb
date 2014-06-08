require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end

  describe "signup page" do
    before { visit '/adduser1' }

    it { should have_content('Novo Utilizador') }
    it { should have_title(full_title('Novo Utilizador')) }
  end

  describe "signup" do

    before { visit '/adduser1' }

    let(:submit) { "Gravar" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Password confirmation", with: "foobar"
        fill_in "Tipo",         with: 1
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }

#        it { should have_link('Utilizadores') }
#        it { should have_title(user.name) }
#        it { should have_selector('div.alert.alert-success', text: 'Bem vindo') }
      end

      describe "followed by signout" do
        before { click_link "Sair" }
        it { should have_link('Entrar!') }
      end
    end
  end


end
