require 'spec_helper'

RSpec.describe Project, type: :model do

 it { expect(project).to validate_presence_of(:name) }

end
