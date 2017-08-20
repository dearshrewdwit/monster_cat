require 'rails_helper'

feature 'Workshops' do
  let(:user) { create(:user) }
  let!(:workshop) { create(:workshop_with_feedback) }

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user) { user }
    visit('/workshops')
  end

  context 'All Workshops' do
    context 'Read' do
      scenario 'user can see all workshops and their info' do
        expect(page).to have_content(workshop.name)
        expect(page).to have_content('view on github')
      end
    end
  end

  context 'individual workshop page' do
    before { click_link(workshop.name) }

    context 'Show' do
      scenario 'user can see workshop info' do
        expect(page).to have_content(workshop.name)
        expect(page).to have_content('view on github')
      end

      scenario 'user can see feedback' do
        expect(page).to have_content(workshop.feedbacks.first.body)
      end
    end
  end
end
