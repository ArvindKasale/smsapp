class ReportsController < ApplicationController

  layout 'application'
    

  def index

   if params[:from_date] and params[:to_date]     

   begin

   @start_date = params[:from_date]
   @end_date = params[:to_date]

   start_date = @start_date.to_date
   end_date = @end_date.to_date


   rescue
      flash[:notice] = "Please use proper date format"  
      @message = "Sale Details for All Salesmans"     
      @sale_items = SaleItem.find(:all, :order => "sale_date desc", :include => [:sales_users, {:product =>            [:category, :product_prices]}])     
      render :action => :index  

   else

   @message = "Sale Details for All Salesmans From #{params[:from_date]} To #{params[:to_date]}"     
   @sale_items = SaleItem.find(:all,
    :conditions => ["sale_date between ? and ?",start_date, end_date], 
    :order => "sale_date desc",
    :include => [:sales_users, {:product => [:category, :product_prices]}]
    )     

   end     
   
   

    else 

   @message = "Sale Details for All Salesmans"     
   @sale_items = SaleItem.find(:all, :order => "sale_date desc", :include => [:sales_user, {:product => [:category, :product_prices]}])     
   
  end
  @sum = 0.0
  
  @sale_items.each do |s|

  @sum += s.product.price.to_f

  end

  logger.info @sum


  respond_to do |format|
      format.xls { send_data(@sale_items.to_xls(:except => [:id, :updated_at]), :filename => "Overall_sales_#{Time.now.strftime("%Y%m%d-%H%M%S")}.xls") }
      format.html


   end
    
  
  
  
  end


 def salesman

   query = "1 "
   query << "and area like '%#{params[:area]}%'" if params[:area] != ""
   query << "and city like '%#{params[:city]}%'" if params[:city] != ""
   query << "and district like '%#{params[:district]}%'" if params[:district] != ""
   query << "and product_id like '%#{params[:product]}%'" if params[:product] != ""
   query << "and products.category_id like '%#{params[:category]}%'" if params[:category] != ""   
   query << "and user_id like '%#{params[:user]}%'" if params[:user] != ""   

   logger.info "-----"     
   logger.info query     

   if params[:from_date] and params[:to_date]     

   begin

   @start_date = params[:from_date]
   @end_date = params[:to_date]

   start_date = @start_date.to_date
   end_date = @end_date.to_date


   rescue
      flash[:notice] = "Please use proper date format"  
      @message = "Sale Details for All Salesmans"     
      @sale_items = SaleItem.find(:all,
      :from => "sale_items,products,categories, sales_users",
      :select => "sale_items.sale_date as created_at, sales_users.name as user_name, categories.name as category, products.name as product, sales_users.area as area, sales_users.city as city, sales_users.district as district",
      :conditions => "sale_items.product_id = products.id and products.category_id = categories.id and sale_items.user_id = sales_users.id and #{query}",
      :order => "sale_date desc"
      )
      
      render :action => :index  

   else

   @message = "Sale Details for All Salesmans From #{params[:from_date]} To #{params[:to_date]}"     

   @sale_items = SaleItem.find(:all,
      :from => "sale_items,products,categories, sales_users",
      :select => "sale_items.sale_date as created_at, sales_users.name as user_name, categories.name as category, products.name as product, sales_users.area as area, sales_users.city as city, sales_users.district as district",
      :conditions => ["(sale_date between ? and ? ) and sale_items.product_id = products.id and products.category_id = categories.id and sale_items.user_id = sales_users.id and #{query}",start_date, end_date], 
      :order => "sale_date desc"
      )


   end     
   
   

    else 

   @message = "Sale Details for All Salesmans"     
      @sale_items = SaleItem.find(:all,
      :from => "sale_items,products,categories, sales_users",
      :select => "sale_items.sale_date as created_at, sales_users.name as user_name, categories.name as category, products.name as product, sales_users.area as area, sales_users.city as city, sales_users.district as district",
      :conditions => "sale_items.product_id = products.id and products.category_id = categories.id and sale_items.user_id = sales_users.id and #{query}",
      :order => "sale_date desc"
      )
   
  end
  @sum = 0.0
  
  @sale_items.each do |s|
  logger.info s.product
#  @sum += Product.find_by_name(s.product).price.to_f

  end

  logger.info @sum
  
  end




end
