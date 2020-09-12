require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

    def setup
        @category = Category.new(name: "Sport")
    end

    test "category should be valid" do
       assert @category.valid?
      end
    test "Name is presents" do
        @category.name = " "
        assert_not @category.valid? 
    end

    test "uniqe" do
        @category.save
        @category2 = Category.new(name: "Sport")
        assert_not @category2.valid?
    end


    test "to loong" do
        @category.name = "a" * 26
        assert_not @category.valid?
    
    end

    test "too short" do
        @category.name = "aa"
        assert_not @category.valid?
    end
end