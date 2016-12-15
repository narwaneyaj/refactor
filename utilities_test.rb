require 'minitest/autorun'
require './utilities'

describe 'utilities' do

  describe 'leap_year?' do
    it 'Multiples of 4 are leap years' do
      leap_year?(2016).must_equal(true)
      leap_year?(2008).must_equal(true)
      leap_year?(4).must_equal(true)
    end
    it 'Multiples of 100 are leap years when they are also multiples of 400' do
      leap_year?(2000).must_equal(true)
      leap_year?(1600).must_equal(true)
    end
    it 'Multiples of 100 are not leap years when not also multiples of 400' do
      leap_year?(1900).must_equal(false)
      leap_year?(2100).must_equal(false)
    end
    it 'Other years are not usually leap years' do
      leap_year?(2015).must_equal(false)
      leap_year?(2014).must_equal(false)
      leap_year?(2013).must_equal(false)
    end
  end

  describe 'seconds_in_year' do
    it 'Is halfway done with the year' do
      seconds_in_year(15768000).must_equal("50.0%")
    end
    it 'Is a quarter done with the year' do
      seconds_in_year(7884000).must_equal("25.0%")
    end
    it 'Is 3/4 done with the year' do
      seconds_in_year(23652000).must_equal("75.0%")
    end
  end

  describe 'standard_to_military' do
    it 'converts standard to military time ' do
      standard_to_military("1:00 pm").must_equal("13:00")
    end
  end

  describe 'am_or_pm' do
    it 'determines if military time is am or pm' do
     am_or_pm("13:00").must_equal("1300 pm")
  end
end
describe 'okay' do
  it 'is not in trouble if it is morning and parents are home' do
    in_trouble?("8:00 am", true).must_equal(false)
  end
  it 'is not in trouble if it is the night and parents are not home' do
    in_trouble?("11:00 pm", false).must_equal(false)
  end
end
describe 'span' do
  it 'finds the percentage difference in the two seconds intervals in the year' do
    span(15768000, 7884000).must_equal('25.0%')
  end
end
end
