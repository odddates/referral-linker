require 'rails_helper'

RSpec.feature "Links" do
  before(:each) do
    visit '/'
  end

  scenario "can be created" do
    fill_in "link_title", :with => "awesomelink"
    click_button "Add"
    expect(Link.all.first.title).to eq 'awesomelink'
    expect(page).to have_content 'awesomelink'
  end

  scenario "can be edited" do
    @link = Link.create!(title: 'editablelink')
    visit '/'
    click_on 'Edit'
    fill_in "link_title", :with => "editedlink"
    click_button "Update"
    expect(Link.all.first.title).to eq 'editedlink'
    expect(page).to have_content 'editedlink'
  end

  scenario "can be deleted" do
    @link = Link.create!(title: 'deleteablelink')
    visit '/'
    click_on 'Delete'
    expect(Link.count).to eq 0
    expect(page).not_to have_content 'deleteablelink'
  end

  scenario "display validation messages when appropriate" do
    # new validation
    click_button "Add"
    expect(page).to have_content "Your link can't be blank, can only have alphanumeric characters"
    fill_in "link_title", :with => "invalid link"
    click_button "Add"
    expect(page).to have_content "Your link can only have alphanumeric characters"
    expect(Link.count).to eq 0

    #edit validation
    @link = Link.create!(title: 'editvalidation')
    visit "#{@link.id}/edit"
    fill_in "link_title", :with => ""
    click_button "Update"
    expect(page).to have_content "Your link can't be blank, can only have alphanumeric characters"
    fill_in "link_title", :with => "invalid link"
    click_button "Update"
    expect(page).to have_content "Your link can only have alphanumeric characters"
    expect(@link.title).to eq 'editvalidation'
  end

  scenario "redirect to the landing page and update their view count" do
    @link = Link.create!(title: 'redirectandcount')
    visit "/#{@link.title}"
    @link.reload
    expect(page).to have_content "We love Tim's World Wide Web and so should you!"
    expect(page).to have_content @link.title
    visit '/'
    expect(page).to have_content @link.views
    expect(@link.views).to eq 1
  end
end