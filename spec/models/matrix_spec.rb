require 'rails_helper'
require "pry"

RSpec.describe Matrix, :type => :model do

  it "is not valid because of invalid size" do
    matrix = Matrix.create!(:matrix => [[1, 0, 1, 1], [0, 1, 0, 1],[1, 1, 1, 0, 1],[1, 1, 1, 1]])
    matrix.validate 
    expect(subject.errors[:matrix]).to include('invalid_size')
  end

end