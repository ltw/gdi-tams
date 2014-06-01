require 'spec_helper'

describe Status do
  it 'has_many teaching_assistants' do
    status = create(:status_with_tas)
    expect(status.teaching_assistants.length).to eq(10)
  end

  it 'requires label' do
    status = Status.new
    expect { status.save! }.to raise_error(ActiveRecord::RecordInvalid)
  end
end