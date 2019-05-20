class Manager < Employee
    
    def initialize (name, title, salary, boss)
      @sub_employees = []
      super 
    end

    def total_salary
      total = 0
      @sub_employees.each do |employee|
        total += employee.salary
      end
    end

    def bonus(multiplier)
      self.total_salary * multiplier
    end
  end