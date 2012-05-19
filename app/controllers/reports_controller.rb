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
      @sale_items = SaleItem.find(:all, :order => "sale_date desc", :include => [:sales_user, {:product =>            [:category, :product_prices]}])     
      render :action => :index  

   else

   @message = "Sale Details for All Salesmans from #{params[:from_date]} To #{params[:to_date]}"     
   @sale_items = SaleItem.find(:all,
    :conditions => ["sale_date between ? and ?",start_date, end_date], 
    :order => "sale_date desc",
    :include => [:sales_user, {:product => [:category, :product_prices]}]
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
  
  end


 def salesman

   if params[:from_date] and params[:to_date]     

   begin

   @start_date = params[:from_date]
   @end_date = params[:to_date]

   start_date = @start_date.to_date
   end_date = @end_date.to_date


   rescue
      flash[:notice] = "Please use proper date format"  
      @message = "Sale Details for All Salesmans"     
      @sale_items = SaleItem.find(:all, :order => "sale_date desc", :include => [:sales_user, {:product =>            [:category, :product_prices]}])     
      render :action => :index  

   else

   @message = "Sale Details for All Salesmans from #{params[:from_date]} To #{params[:to_date]}"     
   @sale_items = SaleItem.find(:all,
    :conditions => ["sale_date between ? and ?",start_date, end_date], 
    :order => "sale_date desc",
    :include => [:sales_user, {:product => [:category, :product_prices]}]
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
  
  end




end
