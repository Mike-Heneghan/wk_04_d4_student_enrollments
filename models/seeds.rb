require("pry-byebug")

require_relative('sql_runner')
require_relative('student')
require_relative('house')


student1 = Student.new({
    'first_name' => 'Brendan',
    'second_name' => 'Prado',
    'house' => 'earth',
    'age' => '30'})

student2 = Student.new({
    'first_name' => 'Mike',
    'second_name' => 'Heneghan',
    'house' => 'fire',
    'age' => '26'})

student1.save()
student2.save()

p Student.all()
p Student.find_by_id(2)

house1 = House.new({'name' => 'Earth'})
house2 = House.new({'name' => 'Fire'})
house3 = House.new({'name' => 'Air'})
house4 = House.new({'name' => 'Water'})

house1.save()
house2.save()
house3.save()
house4.save()
