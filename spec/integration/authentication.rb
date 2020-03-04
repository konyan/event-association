require 'rails_helper'

RSpec.feature 'Integrations', type: :feature do
    scenario 'Log in as a saved user' do
      User.create(name: "tashfeen", email: 'goobar@example.org',password: '123456', password_confirmation: '123456')
      visit signin_path
      have_link 'Log in', href: signin_path
      have_link 'Events', href: events_path
      page.fill_in 'email', with: 'goobar@example.org'
      page.fill_in 'password', with: '123456'
      click_button 'Sign In'
      expect(page.current_path).to eq '/users/1'
      have_link 'Post', href: events_path
      have_link("Sign out", :href => "/signout")
      have_link 'Events', href: events_path
    end
  end