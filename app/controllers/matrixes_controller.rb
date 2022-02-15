class MatrixesController < ApplicationController
  include MatrixesHelper

  def sub_matrix
    if params[:matrix].present?
    	@matrix         = Matrix.create(matrix: params[:matrix])
      
    	if @matrix.valid?
	    	final_matrix = final_matrix(@matrix)
	      respond_to do |format|
	        if final_matrix.present?
	          format.json { render json: {sub_matrix: final_matrix} }
	        else
	          format.json { render json: {status: "500", error:"Internal Server Error"} }
	        end
	      end
	    else
        respond_to do |format|
          format.json { render json: {status:"400", error:"Bad Request"} }
        end
	    end

    else
      respond_to do |format|
        format.json { render json: {status:"400", error:"Bad Request"} }
      end
    end
  
  end

  private

  def matrix_params
    params.require(matrix: [])
  end
end
