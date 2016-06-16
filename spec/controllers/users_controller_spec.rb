require 'rails_helper'

RSpec.describe UsersController, type: :controller do

	#delete users
	describe "#destroy" do
		before(:each) do
			user = FactoryGirl.create(:user)
			allow(controller).to receive(:current_user) { user }
			delete :destroy, { id: user.id }
		end
		it "expect user to be deleted" do
			expect(User.count).to eq(0)
		end
		it "expect to redirect_to root url" do
			expect(response).to redirect_to root_url
		end
	end

	describe "#set_user" do
		it "expect to receive current_user" do
			user = FactoryGirl.create(:user)
			allow(controller).to receive(:current_user) { user }
			expect(user).to be_present
		end
	end

	#update users
	describe "#update" do
		it "expect to update user" do
			user = FactoryGirl.create(:user, name: "foo")
			allow(controller).to receive(:current_user) { user }
			put :update, id: user.id, user: attributes_for(:user, name: "bar")
			expect(user.name).to eq("bar")
		end
		it "expect to redirect to informations de votre commande" do
			user = FactoryGirl.create(:user, name: nil)
			allow(controller).to receive(:current_user) { user }
			put :update, id: user.id, user: attributes_for(:user, name: nil, firstname: nil)
			expect(response).to redirect_to informations_de_votre_compte_path
		end
		it "expect to redirect to confirmation de votre compte path" do
			user = FactoryGirl.create(:user)
			allow(controller).to receive(:current_user) { user }
			put :update, id: user.id, user: attributes_for(:user)
			expect(response).to redirect_to confirmation_de_votre_compte_path(user)
		end
		it "expect to redirect to root path" do
			user = FactoryGirl.create(:user)
			allow(controller).to receive(:current_user) { user }
			put :update, id: user.id, user: attributes_for(:user, terms: true)
			expect(response).to redirect_to root_path
		end
		it "expect to redirect to nom de votre compte path" do
			user = FactoryGirl.create(:user)
			allow(controller).to receive(:current_user) { user }
			put :update, id: user.id, user: attributes_for(:user, account_name: nil)
			expect(response).to redirect_to nom_de_votre_compte_path(user)
		end
	end

	#links for user & devise
	describe "check devise/user links viability" do
		it "expect the devise links to be routable" do
			expect( get: "/utilisateur/sign_in" ).to be_routable
			expect( post: "/utilisateur/sign_in" ).to be_routable
			expect( delete: "/utilisateur/deconnexion" ).to be_routable
			expect( post: "/utilisateur/mot-de-passe" ).to be_routable
			expect( get: "/utilisateur/mot-de-passe/new" ).to be_routable
			expect( get: "/utilisateur/mot-de-passe/edit" ).to be_routable
			expect( patch: "/utilisateur/mot-de-passe" ).to be_routable
			expect( put: "/utilisateur/mot-de-passe" ).to be_routable
			expect( get: "/utilisateur/cancel" ).to be_routable
			expect( post: "/utilisateur" ).to be_routable
			expect( get: "/utilisateur/sign_up" ).to be_routable
			expect( get: "/utilisateur/modifier" ).to be_routable
			expect( patch: "/utilisateur" ).to be_routable
			expect( put: "/utilisateur" ).to be_routable
			expect( delete: "/utilisateur" ).to be_routable
			expect( post: "/utilisateur/verification" ).to be_routable
			expect( get: "/utilisateur/verification/new" ).to be_routable
			expect( get: "/utilisateur/verification" ).to be_routable
			expect( get: "/creer-votre-mot-de-passe" ).to be_routable
			#expect( get: "/" ).to be_routable
		end
		it "expect the user links to be routable" do
			expect( patch: "/user/set_names" ).to be_routable
			expect( patch: "/user/second_step" ).to be_routable
			expect( patch: "/user/confirm_informations" ).to be_routable
			expect( patch: "/user/set_user_informations" ).to be_routable
			expect( get: "/user/edit" ).to be_routable
			expect( patch: "/user/set_parameters" ).to be_routable
			expect( get: "/users" ).to be_routable
			expect( post: "/users" ).to be_routable
			expect( get: "/users/new" ).to be_routable
			expect( get: "/users/:id/edit" ).to be_routable
			expect( get: "/users/:id" ).to be_routable
			expect( patch: "/users/:id" ).to be_routable
			expect( put: "/users/:id" ).to be_routable
			expect( delete: "/users/:id" ).to be_routable
			expect( get: "/nom-de-votre-compte" ).to be_routable
			expect( post: "/nom-de-votre-compte" ).to be_routable
			expect( get: "/parametres" ).to be_routable
			expect( post: "/parametres" ).to be_routable
			expect( get: "/informations-de-votre-compte" ).to be_routable
			expect( post: "/informations-de-votre-compte" ).to be_routable
			expect( get: "/confirmation-de-votre-compte" ).to be_routable
			expect( post: "/confirmation-de-votre-compte" ).to be_routable
			expect( get: "/modifier-votre-profil" ).to be_routable
			expect( post: "/modifier-votre-profil" ).to be_routable
		end
		it "expect registration links to be routable" do
			expect( post: "/utilisateur" ).to be_routable
			expect( get: "/utilisateur/sign_up" ).to be_routable
			expect( get: "/utilisateur/modifier" ).to be_routable
			expect( patch: "/utilisateur" ).to be_routable
			expect( put: "/utilisateur" ).to be_routable
			expect( delete: "/utilisateur" ).to be_routable
		end
		it "expect confirmation links to be routable" do
			expect( post: "/utilisateur/verification" ).to be_routable
			expect( get: "/utilisateur/verification/new" ).to be_routable
			expect( get: "/utilisateur/verification" ).to be_routable
			expect( put: "/confirm" ).to be_routable
			expect( patch: "/confirm" ).to be_routable
		end
	end

end

