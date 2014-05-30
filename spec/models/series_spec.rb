require 'spec_helper'

describe Series do
  context 'validtions' do
    it 'requires name'
    it 'requires end_date'
  end

  context 'course relationships' do
    it 'has_many'
    it 'destroys dependent courses'
  end

  context 'class methods' do
    it '#upcoming'
    it '#last_month'
  end
end