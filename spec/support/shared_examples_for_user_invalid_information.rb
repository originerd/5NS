shared_examples_for 'nil information' do |att|
  let(:user) { FactoryGirl.build(:user, att => nil)}

  it { expect(user).to be_invalid }
end

shared_examples_for 'invalid information' do |att, value|
  let(:user) { FactoryGirl.build(:user, att => value)}

  it { expect(user).to be_invalid }
end