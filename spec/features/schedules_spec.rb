require 'rails_helper'

RSpec.feature "Schedules", type: :feature do
  include LoginSupport
  let(:group) {FactoryBot.create(:group)}
  let(:user) {FactoryBot.create(:user, group: group)}

  scenario "user creates a new schedule", js: true do
    sign_in_as(user)
    click_link "外出"

    expect do
      # 注：現在時刻が23:55以降だと失敗する
      find("label", text: "終日").click
      click_button "保存"
    end.to change(Schedule, :count).by(1)
    expect(page).to have_current_path root_path
  end
end
