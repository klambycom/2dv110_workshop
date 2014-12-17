class SwedishSocialSecurityNumber
  attr_accessor :year, :month, :day, :code

  def initialize number
    ssn = ssn_regex.match(number)
    raise ArgumentError unless ssn

    get_year ssn[1], ssn[4]
    get_month ssn[2]
    get_day ssn[3]
    get_code ssn[5]
  end

  private

  def get_year str, d
    y = str.to_i

    @year = if d == "+" || y > 14
      1900 + y
    else 
      2000 + y
    end
  end

  def get_month str
    m = str.to_i
    @month = Date::MONTHNAMES[m]
    raise ArgumentError if m > 12
  end

  def get_day str
    @day = str.to_i
    raise ArgumentError if day < 1 || day > 31
  end

  def get_code str
    @code = str
  end

  def ssn_regex
    /([0-9][0-9])([0-1][1-9])([0-3][0-9])([-+])([0-9]{4})/
  end
end
