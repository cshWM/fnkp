require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_content('Autenticação') }
    it { should have_title('Autenticação') }
  end

  describe "signin" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Entrar!" }

      it { should have_title('Autenticação') }
      it { should have_selector('div.alert.alert-error') }

      describe "after visiting another page" do
        before { click_link "Início" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Entrar!"
      end

      it { should have_title(user.name) }
      it { should have_link('Perfil',     href: user_path(user)) }
      it { should have_link('Sair',    href: signout_path) }
      it { should_not have_link('Entrar!', href: signin_path) }
    end


  end
end
