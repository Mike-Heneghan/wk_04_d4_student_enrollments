require("pry-byebug")
require_relative("sql_runner")

class Student

attr_reader :id, :first_name, :second_name, :house, :age

  def initialize( options )
    @id = options["id"].to_i
    @first_name = options["first_name"]
    @second_name = options["second_name"]
    @house = options["house"]
    @age = options["age"].to_i
  end

  def save()
    sql = "
    INSERT INTO students
    (first_name, second_name, house, age)
    VALUES ($1, $2, $3, $4)
    RETURNING id
    ;"

    values = [@first_name, @second_name, @house, @age]

    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i

  end

  def self.all()
    sql = "
    SELECT * FROM students"

    result = SqlRunner.run(sql)
    return result.map { |student| Student.new(student)  }
  end

  def self.find_by_id(id)
    sql = "
    SELECT * FROM students
    WHERE id = $1"

    values = [id]

    result = SqlRunner.run(sql, values)
    student_object = result.map { |student| Student.new(student)  }
  end

end
