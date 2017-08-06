require 'rails_helper'

feature 'Feedbacks' do
  let(:user) { create(:user) }
  let!(:workshop) { create(:workshop_with_feedback) }

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user) { user }
    visit('/workshops')
    click_link(workshop.name)
  end

  context 'Create' do
    scenario 'user can add feedback' do
      click_link('Add Feedback')
      fill_in :feedback_body, with: 'a test feedback'
      click_button('Add Feedback')
      expect(page).to have_content('Feedback added')
      expect(page).to have_content('a test feedback')
    end

    scenario "user can't add feedback" do
      click_link('Add Feedback')
      fill_in :feedback_body, with: ''
      click_button('Add Feedback')
      expect(page).to have_content('Feedback was not added')
      expect(page).not_to have_content('a test feedback')
    end
  end
end
