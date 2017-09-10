require 'rails_helper'

describe 'widget administration', :devise, type: :system do

  before do
  end

  it 'List widgets without pagination' do
    create_list :widget, 2
    visit '/widgets'
    within('#widgets_table tbody') do
      expect(page).to have_css('tr', count: 2)
    end
  end

  it 'Create a widget', :js do
    visit new_widget_path
    fill_in t(:name, scope: 'activerecord.attributes.widget'), with: 'Jon Doe'
    fill_in t(:email, scope: 'activerecord.attributes.widget'), with: 'demo@email.com'
    fill_in t(:password, scope: 'activerecord.attributes.widget'), with: 'foobar17'
    fill_in t(:password_confirmation, scope: 'activerecord.attributes.widget'), with: 'foobar17'
    click_button t('admins.widgets.new.submit')
    expect(page).to have_content t('admins.widgets.create.success')
    expect(page).to have_content 'Jon Doe'
    expect(page).to have_content 'demo@email.com'
  end

  it 'Cannot create a widget with invalid attributes', :js do
    widget = create :widget
    visit new_widget_path
    fill_in t(:name, scope: 'activerecord.attributes.widget'), with: 'Same old Jon'
    fill_in t(:email, scope: 'activerecord.attributes.widget'), with: widget.email
    click_button t('admins.widgets.new.submit')
    expect(page).not_to have_content 'Same old Jon'
  end

  it 'Update a  widget', :js do
    create :widget
    visit widgets_path
    click_link_or_button 'Επεξεργασία'
    fill_in t(:name, scope: 'activerecord.attributes.widget'), with: 'New name'
    click_button t('admins.widgets.edit.submit')
    expect(page).to have_content t('admins.widgets.update.success')
    expect(page).to have_content 'New name'
  end

  it 'Cannot update a widget with invalid attributes', :js do
    create :widget
    visit widgets_path
    click_link_or_button 'Επεξεργασία'
    fill_in t(:email, scope: 'activerecord.attributes.widget'), with: ''
    click_button t('admins.widgets.edit.submit')
    expect(page).to have_content t('admins.widgets.update.failure')
  end

  it 'Destroy a  widget', js: :true do
  end
end
