require 'rails_helper'

describe 'widget administration', :devise, type: :system do

  before do
  end

  it 'List widgets without pagination' do
    create_list :widget, 2
    visit '/widgets'
    within('#widgets_table tbody') do
      expect(page).to have_css('tr', count: 1)
    end
  end

  it 'List widgets without pagination' do
    create_list :widget, 2
    visit '/widgets'
    within('#widgets_table tbody') do
      expect(page).to have_css('tr', count: 2)
    end
  end

end
