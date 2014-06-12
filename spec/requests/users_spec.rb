require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.email) }
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
        fill_in "Nome",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmação de Password", with: "foobar"
        fill_in "Tipo",         with: 1
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

#      describe "after saving the user" do
#        let(:user) { User.find_by(email: 'user@example.com') }
#        before { click_button submit }
#
#        it { should have_link("Utilizadores") }
#        it { should have_title(user.email) }
##        it { should have_selector('div.alert.alert-success', text: 'Utilizador criado com sucesso') }
#
#        describe "followed by signout" do
#          before { click_link 'Sair' }
#          it { should have_link('Entrar!') }
#        end
#      end

    end
  end

  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit edit_user_path(user)
    end

    describe "page" do
      it { should have_content("Editar Utilizador") }
      it { should have_title("Editar Utilizador") }
    end

    describe "with invalid information" do
      before { click_button "Gravar" }

      it { should have_content('erro') }
    end

    describe "with valid information" do
      let(:new_name)  { "New Name" }
      let(:new_email) { "new@example.com" }
      let(:new_tipo) { 1 }
      before do
        fill_in "Nome",             with: new_name
        fill_in "Email",            with: new_email
        fill_in "Tipo",            with: new_tipo
        fill_in "Password",         with: user.password
        fill_in "Confirmação de Password", with: user.password
        click_button "Gravar"
      end

      it { should have_title(new_email) }
      it { should have_link('Sair', href: signout_path) }
      specify { expect(user.reload.name).to  eq new_name }
      specify { expect(user.reload.email).to eq new_email }
    end
  end

end
