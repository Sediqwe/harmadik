require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: "Sports")
    @category2 = Category.create(name: "Travel")
  end
  test "teszteljünk dolgokat " do
    get '/categories'
    assert_select "a[href=?]", category_path(@category), test: @category.name
    assert_select "a[href=?]", category_path(@category2), test: @category.name
  end
end
