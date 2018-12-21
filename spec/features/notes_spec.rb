require 'rails_helper'

RSpec.feature "Notes feature", type: :feature, js: true do
  scenario "creating a note" do
    count = Note.count

    create_note

    expect(page).to have_content("View Note")
    expect(Note.count).to eq(count + 1)
  end

  scenario "viewing a note" do
    create_note

    find(".note-link").click
    click_on "View"

    fill_in "Secret key", with: "password"

    expect(page).to have_content("hello world 12345")
  end

  scenario "automatic deletion of notes" do
    count = Note.count

    create_note

    expect(page).to have_content("This note will be deleted when it is viewed.")
    expect(Note.count).to eq(count + 1)

    click_on "View"

    expect(page).to have_content("This note has been deleted from the database and can not be viewed in the future.")
    expect(page).to have_content("Enter the Secret Key to Show the Note")
    expect(Note.count).to eq(count)

    visit page.current_path
    expect(page).to have_content("Can't Find Your Note")
    expect(Note.count).to eq(count)
  end

  scenario "visiting the show page does not delete the note" do
    create_note

    find(".note-link").click
    find(".note-link").click
    find(".note-link").click
    find(".note-link").click
    find(".note-link").click

    click_on "View"

    expect(page).to have_content("This note has been deleted from the database and can not be viewed in the future.")
    expect(page).to have_content("Enter the Secret Key to Show the Note")
  end

  scenario "notes that last forever" do
    count = Note.count

    create_note(delete_message: false)

    find(".note-link").click
    click_on "View"
    find(".note-link").click
    click_on "View"
    find(".note-link").click
    click_on "View"
    find(".note-link").click
    click_on "View"
    find(".note-link").click
    click_on "View"

    expect(page).to_not have_content("This note will be deleted when it is viewed.")
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
    click_on "View"

    fill_in "Secret key", with: "password"

    expect(page).to have_content("hello world 12345")
  end

  scenario "blank key" do
    create_note(key: " ")

    expect(page).to have_content("No key entered")
    expect(page).to_not have_content("Enter the Secret Key to Show the Note")
  end

  scenario "blank message" do
    create_note(message: "")

    expect(page).to have_content("No message entered")
    expect(page).to_not have_content("Enter the Secret Key to Show the Note")
  end

  scenario "message too long" do
    create_note(message: "a" * 2000)

    expect(page).to have_content("Encrypted text is too long")
    expect(page).to_not have_content("Enter the Secret Key to Show the Note")
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
