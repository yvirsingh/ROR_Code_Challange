class EmployeesController < ApplicationController
	def create
		@employee = Employee.new(emp_params)
		if @employee.save!
			render json: @employee
		else
			render error: {error: 'unable to create a employee'}, status: 400
		end
	end

	def update
		@employee = employee
		if @employee
			@employee.update(emp_params)
			render json: {message: 'Employee has been updated successfully'}, status: 200
		else
			render error: {error: 'unable to update employee'}, status: 400
		end
	end

	def top_employees
		@employees = Employee.order("salary DESC").limit(10)
		render json: @employees
	end

	def tree_data
	  output = []
	  Employee.where(is_resigned: false).includes(:subs, :reportee).top_execs.each do |emp|
	    output << data(emp)
	  end
	  render json: output.to_json
	end

	def destroy
		@employee = employee
		if @employee
			@employee.update(is_resigned: true)
			render json: {message: 'Employee has been resigned successfully'}, status: 200
		else
			render error: {error: 'unable to resign employee'}, status: 400
		end
	end

	private

	def emp_params
		params.require(:employee).permit(:name, :salary, :parent_id, :rating, :role, :emp_id)
	end

	def employee
		@employee = Employee.find(params[:id])
	end

	def data(employee)
	  subordinates = []
	  unless employee.subs.blank?
	    employee.subs.each do |emp|
	      subordinates << data(emp)
	    end
	  end
	  {name: employee.name, role:  employee.role, subordinates: subordinates}
	end
end
