require 'rails_helper'

RSpec.describe User, type: :model do
  describe "check validations" do
    context "with valid information" do
      let(:user) { FactoryGirl.build(:user) }

      it { expect(user).to be_valid }
    end

    context "with invalid information" do
      it_behaves_like 'nil information', :name
      it_behaves_like 'nil information', :email
      it_behaves_like 'nil information', :password

      context "when name length is longer than 50" do
        it_behaves_like 'invalid information', :name, '.' * 51
      end

      context "when password is shorter than 8" do
        it_behaves_like 'invalid information', :password, '.' * 6
      end
    end
  end
end