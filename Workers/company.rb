require_relative "Manager.rb"
require_relative "Employee.rb"


ned = Manager.new("Ned","Founder",1000000)
darren = Manager.new("Darren","TA Manager",78000,ned)
shawna = Employee.new("Shawna","TA",12000,darren)

ned.bonus(5)
darren.bonus(4)
shawna.bonus(3)