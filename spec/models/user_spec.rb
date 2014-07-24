require 'spec_helper'

describe User do
  context 'with valid attributes' do
    Given(:user) { build(:user) }
    Then { user.valid? }
  end
end
