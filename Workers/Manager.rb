require_relative "Employee.rb"
class Manager < Employee
    
    def initialize (name, title, salary,&boss)
      @sub_employees = []
      super(name, title, salary, boss)
    end

    def add_employees(name,title,salary)
      @sub_employees << Employee.new(name,title,salary,self)
    end

    def total_salary
      total = 0
      @sub_employees.each do |employee|
        total += employee.salary
      end
      total
    end

    def bonus(multiplier)
      self.total_salary * multiplier
    end
  end