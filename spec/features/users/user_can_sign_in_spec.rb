require 'rails_helper'

feature 'Users' do
  let(:user) { create(:user) }

  context 'not yet signed in' do
    before do
      visit('/')
    end

    scenario "user can sign in via github" do
      expect(page).to have_content("Sign In with Github")
    end

    scenario "user can see home and workshop links" do
      expect(page).to have_content("Home")
      expect(page).to have_content("Workshops")
    end

    scenario "user can not see signout and admin links" do
      expect(page).not_to have_content("Sign out")
      expect(page).not_to have_content("Admin")
    end
  end

  context "having signed in" do
    before do
      allow_any_instance_of(ApplicationController).to receive(:current_user) { user }
      visit('/')
    end

    scenario "user can sign out" do
      click_link("Sign out")
      expect(page).to have_content("You have signed out")
    end

    scenario "admin view not accessible" do
      expect(page).not_to have_content("Admin")
    end
  end
end
