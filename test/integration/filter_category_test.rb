require 'test_helper'

class FilterCategoryTest < ActionDispatch::IntegrationTest
  test 'items get filtered by status' do
    get root_url
    assert_select('select#filter option[selected]').first['value']
  end
end
