class Matrix < ApplicationRecord
  serialize :matrix, Array
  validate  :arrays_elements_of_same_size, :validate_matrix, on: :create

  private
	  def arrays_elements_of_same_size
	    if !(self.matrix.all? { |e| e.class==Array } && self.matrix.map(&:size).uniq.size == 1)
	      errors.add(:matrix, "invalid_size")
	    end
	  end

	  def validate_matrix
	    if !(!(self.matrix.flatten.uniq & [2,3,4,5,6,7,8,9]).any? && self.matrix.flatten.uniq.all?{|i| i.is_a?(Integer)})
	      errors.add(:matrix, "invalid_attribute")
	    end
	  end

end
