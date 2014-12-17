require 'test_helper'
require './lib/SwedishSocialSecurityNumber.rb'

class TestVerify < MiniTest::Test
  def setup
		@sut = SwedishSocialSecurityNumber.new("810504-8303");
		@bornAfter2000 = SwedishSocialSecurityNumber.new("140202-0166");
		@bornBefore2000	= SwedishSocialSecurityNumber.new("141130+2951");
  end
	
	def test_shouldReturnCorrectYear
    assert_equal 1981, @sut.year
    assert_equal 2014, @bornAfter2000.year
    assert_equal 1914, @bornBefore2000.year
  end
	
	def test_shouldReturnCorrectMonth
    assert_equal "May", @sut.month
    assert_equal "February", @bornAfter2000.month
    assert_equal "November", @bornBefore2000.month
  end
	
	def test_shouldReturnCorrectDay
    assert_equal 4, @sut.day
    assert_equal 2, @bornAfter2000.day
    assert_equal 30, @bornBefore2000.day
  end
	
	def test_shouldReturnCorrectCode
    assert_equal "8303", @sut.code
    assert_equal "0166", @bornAfter2000.code
    assert_equal "2951", @bornBefore2000.code
  end

	def test_shouldThrowExceptionOnEmptyInput
    assert_raises ArgumentError do
      SwedishSocialSecurityNumber.new ""
    end
  end
	
	def test_shouldThrowExceptionIfNoSeparatorIsUsed
    assert_raises ArgumentError do
      SwedishSocialSecurityNumber.new "8105048303"
    end
  end
	
	def test_shouldThrowExceptionIfThousandsIsUsed
    assert_raises ArgumentError do
      SwedishSocialSecurityNumber.new "19810504-8303"
    end
  end
	
	def test_shouldThrowExceptionOnTooShort
    assert_raises ArgumentError do
      SwedishSocialSecurityNumber.new "81050-8303"
    end
  end
	
	def test_shouldThrowExceptionOnWrongSeparator
    assert_raises ArgumentError do
      SwedishSocialSecurityNumber.new "810504_8303"
    end
  end
	
	def test_shouldThrowExceptionOnMinusAsYear
    assert_raises ArgumentError do
      SwedishSocialSecurityNumber.new "-20101-2564"
    end
  end
	
	def test_shouldThrowExceptionOnMonth0
    assert_raises ArgumentError do
      SwedishSocialSecurityNumber.new "120003-2564"
    end
  end
	
	def test_shouldThrowExceptionOnMonth14
    assert_raises ArgumentError do
      SwedishSocialSecurityNumber.new "121403-2564"
    end
  end
	
	def test_shouldThrowExceptionOnDay0
    assert_raises ArgumentError do
      SwedishSocialSecurityNumber.new "121200-2564"
    end
  end
	
	def test_shouldThrowExceptionOnDay33
    assert_raises ArgumentError do
      SwedishSocialSecurityNumber.new "121233-2564"
    end
  end
end
