require 'rails_helper'

describe 'Widget administration', type: :system do
  it 'List widgets without pagination', js: true do
    create_list :widget, 2
    visit '/widgets'
    within('#widgets_table tbody') do
      expect(page).to have_css('tr', count: 1)
    end
  end

  it 'List widgets without pagination', js: true do
    create_list :widget, 2
    visit '/widgets'
    within('#widgets_table tbody') do
      expect(page).to have_css('tr', count: 2)
    end
  end
end
