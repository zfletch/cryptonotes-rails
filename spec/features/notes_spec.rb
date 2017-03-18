require 'rails_helper'

RSpec.feature "Notes feature", type: :feature, js: true do
  scenario "creating a note" do
    count = Note.count

    create_note

    expect(page).to have_content("Enter the Secret Key to Show the Note")
    expect(Note.count).to eq(count + 1)
  end

  scenario "viewing a note" do
    create_note

    visit "/notes/#{find("#note-uuid").text}"

    fill_in "Secret key", with: "password"

    expect(page).to have_content("hello world 12345")
  end

  scenario "automatic deletion of notes" do
    count = Note.count

    create_note

    expect(page).to have_content("This note will be deleted the next time this page is viewed.")
    expect(Note.count).to eq(count + 1)

    visit "/notes/#{find("#note-uuid").text}"

    expect(page).to have_content("This note has been deleted from the database and can not be viewed in the future.")
    expect(page).to have_content("Enter the Secret Key to Show the Note")
    expect(Note.count).to eq(count)

    visit "/notes/#{find("#note-uuid").text}"

    expect(page).to have_content("Couldn't Find Your Note")
  end

  scenario "notes that last forever" do
    count = Note.count

    create_note(delete_message: false)

    visit "/notes/#{find("#note-uuid").text}"
    visit "/notes/#{find("#note-uuid").text}"
    visit "/notes/#{find("#note-uuid").text}"
    visit "/notes/#{find("#note-uuid").text}"
    visit "/notes/#{find("#note-uuid").text}"
    visit "/notes/#{find("#note-uuid").text}"
    visit "/notes/#{find("#note-uuid").text}"

    expect(page).to have_content("Enter the Secret Key to Show the Note")
    expect(Note.count).to eq(count + 1)
  end

  scenario "finding notes" do
    create_note

    key = find("#note-uuid").text
    visit "/"
    expect(page).to have_text("Encrypt and Share Notes")

    fill_in("Key", with: key)
    click_on "Find Note"

    fill_in "Secret key", with: "password"

    expect(page).to have_content("hello world 12345")
  end

  private

  def create_note(key: "password", message: "hello world 12345", delete_message: true)
    visit "/"

    click_on "New Note"
    fill_in "Secret key", with: key
    fill_in "Secret message...", with: message

    uncheck("delete_on_view") unless delete_message

    click_on "Create Note"
  end
end
