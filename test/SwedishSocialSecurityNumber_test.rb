require 'test_helper'
require './lib/SwedishSocialSecurityNumber.rb'

class TestSwedishSocialSecurityNumber < MiniTest::Test
  def setup
		@sut = SwedishSocialSecurityNumber.new("800603-2829");
		@bornAfter2000 = SwedishSocialSecurityNumber.new("060101-3132");
		@bornBefore2000	= SwedishSocialSecurityNumber.new("061231+1234");
  end

  def test_shouldReturnCorrectYear
    assert_equal 1980, @sut.year
    assert_equal 2006, @bornAfter2000.year
    assert_equal 1906, @bornBefore2000.year
  end

  def test_shouldReturnCorrectMonth
    assert_equal "June", @sut.month
    assert_equal "January", @bornAfter2000.month
    assert_equal "December", @bornBefore2000.month
  end

  def test_shouldReturnCorrectDay
    assert_equal 3, @sut.day
    assert_equal 1, @bornAfter2000.day
    assert_equal 31, @bornBefore2000.day
  end

  def test_shouldReturnCorrectCode
    assert_equal "2829", @sut.code
    assert_equal "3132", @bornAfter2000.code
    assert_equal "1234", @bornBefore2000.code
  end

  def test_shouldThrowExceptionOnEmptyInput
    assert_raises ArgumentError do
      SwedishSocialSecurityNumber.new ""
    end
  end

  def test_shouldThrowExceptionIfNoSeparatorIsUsed
    assert_raises ArgumentError do
      SwedishSocialSecurityNumber.new "8006032829"
    end
  end

  def test_shouldThrowExceptionOnTooShort
    assert_raises ArgumentError do
      SwedishSocialSecurityNumber.new "120103-256"
    end
  end

  def test_shouldThrowExceptionOnWrongSeparator
    assert_raises ArgumentError do
      SwedishSocialSecurityNumber.new "120103=2564"
    end
  end

  def test_shouldThrowExceptionOnCharacterAsDay
    assert_raises ArgumentError do
      SwedishSocialSecurityNumber.new "12010X-2564"
    end
  end

  def test_shouldThrowExceptionOnMonth0
    assert_raises ArgumentError do
      SwedishSocialSecurityNumber.new "120003-2564"
    end
  end

  def test_shouldThrowExceptionOnMonth13
    assert_raises ArgumentError do
      SwedishSocialSecurityNumber.new "121303-2564"
    end
  end

  def test_shouldThrowExceptionOnDay0
    assert_raises ArgumentError do
      SwedishSocialSecurityNumber.new "121200-2564"
    end
  end

  def test_shouldThrowExceptionOnDay32
    assert_raises ArgumentError do
      SwedishSocialSecurityNumber.new "121232-2564"
    end
  end
end
