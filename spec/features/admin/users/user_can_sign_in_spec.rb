require 'rails_helper'

feature 'Admin users' do
  let(:admin_user) { create(:user, :admin) }

  context "having signed in" do
    before do
      allow_any_instance_of(ApplicationController).to receive(:current_user) { admin_user }
      visit('/')
    end

    scenario "user can sign out" do
      click_link("Sign out")
      expect(page).to have_content("You have signed out")
    end

    scenario "user can click admin" do
      click_link("Admin")
      expect(page).to have_current_path(admin_workshops_path)
    end
  end
end
