class AnnotationsController < ApplicationController
	
	def create
	  @annotation = Annotation.new(annotation_params)
      if params["date_status"] == "order"
        @annotation.date_status = params["date_status"]
        @annotation.date = params["date"]
      else
        @annotation.date_status = params["date_status"]
        @annotation.date = params["date"]
      end
      @annotation.item_price_dup = params[:Item_Price]
       @annotation.annotation_creator_id = current_user.id
      if @annotation.save!
        flash[:success] = "Request Submit Successfully"
        redirect_to annotation_path(@annotation)
      else
        flash[:error] = "Request Submit Unsuccessful"
        redirect_to Register_path
      end
	end

  def show
    @annotation = Annotation.where(Project_Select: Annotation.find_by_id(params[:id]).Project_Select,annotation_creator_id: current_user.id).paginate(:page => params[:page], :per_page => 5).order('created_at DESC')  rescue nil
  end 

	

	private
	  def annotation_params
        params.permit(:Item_Name,:Project_Select,:Item_Price,:Merchant_Name,:Source,:Note)
    end
end
