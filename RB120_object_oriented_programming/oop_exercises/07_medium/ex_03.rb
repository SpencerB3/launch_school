# Below we have 3 classes: Student, Graduate, and Undergraduate. The implementation details for the #initialize methods in Graduate and Undergraduate are missing. Fill in those missing details so that the following requirements are fulfilled:

# Graduate students have the option to use on-campus parking, while Undergraduate students do not.

# Graduate and Undergraduate students both have a name and year associated with them.

class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name, year)
    @parking = parking
  end
end

class Undergraduate < Student
end
