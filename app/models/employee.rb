class Employee < ApplicationRecord
	enum role: [:CEO, :VP, :DIRECTOR, :MANAGER, :SDE]
	has_many :subs, class_name: 'Employee', foreign_key: :parent_id
	belongs_to :reportee, -> { where(is_resigned: false) }, class_name: 'Employee', foreign_key: :parent_id, required: false

	scope :top_execs, -> { where(parent_id: nil, role: 0) }
end
