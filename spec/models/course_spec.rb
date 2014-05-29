require 'spec_helper'

describe Course do
  context 'validations' do
    it 'requires credit_hours'
    it 'requires num_tas_needed'
  end

  context 'relationships' do
    it 'belongs_to series'

    describe 'hours with dependent destroy' do
       it 'has_many'
       it 'destroys hours'
    end

    it 'has_many teaching_assistants'
  end

  context 'class methods' do
    it '#upcoming'
    it '#single_day'
    it '#series'
    it '#last_month'
  end

  context 'methods' do
    it '#is_series?'
    it '#need_tas?'
    it '#num_tas_still_needed'
  end
end