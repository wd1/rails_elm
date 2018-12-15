module AnnotationsHelper
	def find_annotation_name
	  @annotation_name = Annotation.find_by_id(params[:id]).Item_Name.capitalize  rescue nil
	end
    
    def find_annotation_creator
	  @annotation_craetor = User.find_by_id(Annotation.find_by_id(params[:id]).annotation_creator_id).first_name.capitalize + ' ' +
	                User.find_by_id(Annotation.find_by_id(params[:id]).annotation_creator_id).last_name.capitalize  rescue nil
	end
    
    def find_annotation_created_at
	  @annotation_created_at = Annotation.find_by_id(params[:id]).created_at.localtime rescue nil 
	end

	def annotation_item_price_sum
       @annotation_price = Annotation.where(Project_Select: Annotation.find_by_id(params[:id]).Project_Select,annotation_creator_id: current_user.id).pluck(:Item_Price).compact.sum.round(4)
       @annotation_price.present?  ? @annotation_price : 0
	end

	def annotation_price
		@annotation_price=Annotation.find_by_id(params[:id]).Item_Price
	end

	def annotation_affiliate
      @annotation_price=Annotation.find_by_id(params[:id]).Project_Select.capitalize
	end

	def annotation_merchant
	  @annotation_merchant=Annotation.find_by_id(params[:id]).Merchant_Name.capitalize
	end

	def annotation_source
      @annotation_source=Annotation.find_by_id(params[:id]).Source.capitalize
	end 
end
