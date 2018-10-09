# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  invitation_token       :string
#  invitation_created_at  :datetime
#  invitation_sent_at     :datetime
#  invitation_accepted_at :datetime
#  invitation_limit       :integer
#  invited_by_type        :string
#  invited_by_id          :bigint(8)
#  invitations_count      :integer          default(0)
#  username               :string
#  group_id               :integer
#

require 'rails_helper'

RSpec.describe User, type: :model do

  describe "create user" do
    let(:group) { FactoryBot.create(:group) }

    it "is valid with a group" do
      user = FactoryBot.build(:user, group: group)
      expect(user).to be_valid
    end

    it "is invalid without a group" do
      user = FactoryBot.build(:user, group: nil)
      expect(user).to_not be_valid
      expect(user.errors[:group_id]).to include("を入力してください")
    end
  end
end