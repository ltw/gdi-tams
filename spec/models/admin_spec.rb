require 'spec_helper'

describe Admin do
  context 'validations' do
    it 'requires name' do
      admin = Admin.new(password: "taco")
      expect { admin.save! }.to raise_error("Validation failed: Name can't be blank")
    end

    it 'requires password' do
      admin = Admin.new(name: "taco")
      expect { admin.save! }.to raise_error("Validation failed: Password can't be blank, Password can't be blank")
    end
  end
end