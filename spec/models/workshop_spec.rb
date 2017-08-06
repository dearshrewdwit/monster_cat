require 'rails_helper'

RSpec.describe Workshop, type: :model do
  subject(:workshop) { create(:workshop) }

  %i(name url).each do |property|
    it "has property #{property}" do
      expect { workshop.send(property) }.not_to raise_error
    end
  end
end
