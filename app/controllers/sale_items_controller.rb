class SaleItemsController < ApplicationController
 
  before_filter :login_required
 
  before_filter :check_for_sales_date, :only=>[:edit, :update]
  before_filter :check_for_user, :only=>[:edit, :update]
  
  def show
    p "In show"
    @sales_item=SaleItem.find(params[:id])
  end
    
  def index
    #@sales_item=SaleItem.find_sales_of_user(current_user.id) 
    p "###########################"
    p current_user.id 
    @sales_items=SaleItem.where("user_id=?",current_user.id)
  end
  
  def destroy
    p current_user
    p "In destroy"
    @sales_item=SaleItem.find(params[:id])
    p @sales_item
    p "**********************************"
    p current_user
    @sales_item.destroy
    p current_user
    flash[:notice]="Sales item destroyed successfully"
    p "Destoyed"
    redirect_to sale_items_path
  end
  
  def destroy_me
    p current_user
    p "In destroy me"
    @sales_item=SaleItem.find(params[:id])
    @sales_item.destroy
    flash[:notice]="Sales item destroyed successfully"
    p "Destoyed"
    redirect_to sale_items_path
  end
  
  def new
    @product=Product.all
    @sales_item=SaleItem.new
  end

  def create
    @product=Product.all
    @sales_item=SaleItem.new(params[:sale_item])
    @sales_item.user_id=current_user.id
    #@sales_item=SaleItem.calculate_total_cost(@sales_item)
    respond_to do |format|
      
      if @sales_item.save
        format.html {redirect_to @sales_item, :notice=> "Sales Item created successfully."}
      else
        format.html{render :action=> :new}
      end
      
    end
  end

  def edit
    @product=Product.all
    @sales_item=SaleItem.find(params[:id])
  end

  def update
    p "In update"
    @product=Product.all
    @sales_item=SaleItem.find(params[:id])
    hash=params[:sale_item]
    #@sales_item=SaleItem.calculate_total_cost(@sales_item)
    #hash[:total_cost]=@sales_item.total_cost
    respond_to do |format|
      if @sales_item.update_attributes(hash)
        format.html { redirect_to @sales_item, :notice => 'Sales Item updated successfully.' }
      else
        format.html { render :action=> "edit" }
      end
    end
  end

  private

  def check_for_sales_date
    @sales_item=SaleItem.find(params[:id])
    unless((@sales_item.created_at+24.hours)>(DateTime.now))
      flash[:notice]="Sales item can't be updated after 24 hours of submission."
      Rails.logger.warn("Sales item cant be updated after 24 hours of submission") 
      redirect_to root_path
      return false
    end
    puts "Sales Item is updateable"
 end
 
 def check_for_user
   @sales_item=SaleItem.find(params[:id])
     unless @sales_item.user_id==current_user.id
       flash[:notice]="You donot have access to that resource"
       puts "You dont have access to this resource"
       redirect_to root_path
       return false
     end   
     puts "Sales item belongs to the current user"
 end
end
