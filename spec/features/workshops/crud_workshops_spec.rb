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

    context 'Create' do
      scenario 'user can add a workshop' do
        click_link('add workshop')
        fill_in :workshop_name, with: 'a test workshop'
        fill_in :workshop_url, with: 'www.test_url.com'
        fill_in :workshop_description, with: 'a super duper test'
        click_button('Create Workshop')
        expect(page).to have_content('Workshop created')
        expect(page).to have_content('a test workshop')
      end

      scenario "user can't add a workshop" do
        click_link('add workshop')
        fill_in :workshop_name, with: 'a'
        fill_in :workshop_url, with: 'www.test_url.com'
        click_button('Create Workshop')
        expect(page).not_to have_content('Workshop created')
        expect(page).to have_content('Create unsuccessful: ')
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

    context 'Update' do
      before { click_link('Update') }

      scenario 'user can edit a workshop' do
        fill_in :workshop_name, with: 'a new test workshop'
        click_button('Update Workshop')
        expect(page).to have_content('Workshop updated')
        expect(page).to have_content('a new test workshop')
      end

      scenario 'user can not edit a workshop' do
        fill_in :workshop_name, with: 'a '
        click_button('Update Workshop')
        expect(page).not_to have_content('Workshop updated')
        expect(page).to have_content('Update unsuccessful: ')
      end
    end

    context 'destroy' do
      before { click_link('Delete') }

      scenario 'user can delete a workshop' do
        expect(page).to have_content('Workshop deleted')
        expect(page).not_to have_content(workshop.name)
      end
    end
  end
end
