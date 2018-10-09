# == Schema Information
#
# Table name: schedules
#
#  id               :bigint(8)        not null, primary key
#  content          :string
#  action_type      :integer
#  termination_time :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer
#  start_time       :datetime
#

require 'rails_helper'

RSpec.describe Schedule, type: :model do
  let(:group) {FactoryBot.create(:group)}
  let(:user) {FactoryBot.create(:user, group: group)}

  describe "create schedule" do
    it "is invalid without a user" do
      schedule = FactoryBot.build(:schedule, user: nil)
      expect(schedule).to_not be_valid
      expect(schedule.errors[:user]).to include("を入力してください")
    end

    context 'start_time is not rational' do
      it "is invalid with start_time > termination_time" do
        schedule = FactoryBot.build(:schedule, start_time: DateTime.now + 3.0 / 24, user: user)
        expect(schedule).to_not be_valid
        expect(schedule.errors[:start_time]).to include("は終了時間以前の日時を指定できません")
      end

      it "is invalid with start_time == termination_time" do
        schedule = FactoryBot.build(:schedule, user: user)
        schedule.termination_time = schedule.start_time
        expect(schedule).to_not be_valid
        expect(schedule.errors[:start_time]).to include("は終了時間以前の日時を指定できません")
      end
    end

    context 'time must not be past' do
      it "is invalid with past start_time" do
        schedule = FactoryBot.build(:schedule, start_time: DateTime.now - 2.0 / 24, user: user)
        expect(schedule).to_not be_valid
        expect(schedule.errors[:start_time]).to include("は現在以前の日時を指定できません")
      end

      it "is invalid with past termination_time" do
        schedule = FactoryBot.build(:schedule,
                                    start_time: DateTime.now - 1.0 / 24,
                                    termination_time: DateTime.now - 2.0 / 24,
                                    user: user)
        expect(schedule).to_not be_valid
        expect(schedule.errors[:start_time]).to include("は現在以前の日時を指定できません")
      end
    end
  end
end
