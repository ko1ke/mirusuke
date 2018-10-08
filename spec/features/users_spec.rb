require 'rails_helper'

RSpec.feature "Users", type: :feature do
  scenario "rejects incorrect password login" do
    group = FactoryBot.create(:group)
    user = FactoryBot.create(:user, group: group)

    visit "/users/sign_in"
    fill_in "Eメール", with: user.email
    fill_in "パスワード", with: "1"
    click_button "ログイン"
    expect(page).to have_text("パスワードが不正")
    expect(page).to have_current_path "/users/sign_in"
  end

  scenario "rejects sign up an user when group is empty" do
    visit "/users/sign_in"
    click_link "まずは登録！"

    expect do
      fill_in "名前", with: "名無し太郎"
      fill_in "グループ名", with: ""
      fill_in "Eメール", with: "rspec@rspec.com"
      fill_in "パスワード", with: "password"
      fill_in "パスワード（確認用）", with: "password"
      click_button "登録"
    end.to change(User, :count).by(0)

    expect(page).to have_text("グループを入力してください")
    expect(page).to have_current_path "/users"
  end


end