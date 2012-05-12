class AddData <ActiveRecord::Base
set_table_name "users"
def self.add_user
	7.times do |count|
	u=SalesUser.new
	u.name=Faker::Name.name
	u.password="123456"
	u.email=Faker::Internet.email
	u.email_2=Faker::Internet.email
	u.role_id=rand(3)+1
	u.address_1=Faker::Address.street_address
	u.address_2=Faker::Address.street_address
	u.area="Area"+count.to_s
	u.street="Street"+count.to_s
	u.pincode="123456"
	u.phone_no_1="1234567890"
	u.phone_no_2="0987654321"
	u.birth_date= ('"'+rand(28).to_s+'-'+rand(12).to_s+'-'+(rand(80)+1900).to_s+"'").to_date
	
	
	u.district="Mumbai"
	u.city="Mumbai"
	u.state="Maharashtra"
	u.emergency_name=Faker::Name.name||"Ramesh Hiranandani"
	u.emergency_no="5656778899"
	u.home_phone_1="3434435667"
	p u
	u.save!
	end
end

def self.add_products
	list1=["AA","AAA","AA 42","AAA 42","9 Volts","C size","D Size","2016","2025","2032"]
	list2=["4 Gb Tiny","4 Gb Big","8 Gb Tiny","8 Gb Big","16 Gb Tiny","16 Gb Big","32 Gb Tiny","CARD READER"]
	list3=["HRMF4","HRE4KN","HLD4EN","HLD4KN","HLD2KN","HW2KN","HW2RN","HWN","HH4EIN","CP ELS USB CH","AA B2FN","AA B4EN","AA B2EN","AA B4KN","AA B2KN","AA B2RN","AAA B2EN","AAAB4EN","AAA B4KN","AAAB2KN"]
	list3.each do |a|
		p=Product.new
		p.name=a.to_s
		p.description="Description for "+a.to_s
		p.category_id=3
		p.alias=a.to_s
		p.save!
		end
end

def self.add_price
    count=0
    @products=Product.all
	FasterCSV.foreach('/root/Desktop/temp.csv') do |row|
		pp=ProductPrice.new
		pp.price=row[1].to_f
		pp.product_id=@products[count].id
		pp.save!
		count=count+1
	end
end

#def self.add_companies
def self.add_distributors
	count=0
	10.times do |i|
		c=Distributor.new
		count=count+1
		#c=Company.new
		c.name= Faker::Company.name
		c.name+=" "+ Faker::Company.suffix
		c.contact_person=Faker::Name.name
		#c.phone_no="9898989898"
		c.phone_no_1="9898989898"
		c.email=Faker::Internet.email
		c.email_2=Faker::Internet.email
		#c.address=Faker::Address.street_address
		c.address_1=Faker::Address.street_address
		c.address_2=Faker::Address.street_address
		c.area="Area"
		c.street="Street"
		c.pincode="123456"
		c.city="Mumbai"
		c.district="Mumbai"
		c.state="Maharashtra"
		#c.fax="02228787878"
		#c.website=Faker::Internet.domain_name
		c.status=true
		c.save!		
	end
end

def self.add_company_product
	products=Product.all
	companies=Company.all
	companies.each do |c|
		products.each do |p|
			count=rand(3)
			if(count==0)
				c.products << p
			end
    	end
	end
end

def self.export_strings
	#FasterCSV.foreach('/root/Desktop/arv.csv') do |row|
	#	p row[1]
	#end
	stringArray=Array.new
	finalArray=Array.new
	file = File.open("/root/Desktop/string.txt")
	file.each do |line|
	stringArray << line.scan(/"([^"]*)"/)
	
	
	end
    count=0
    	stringArray.each do |l|
		l.each do |x|
			count=count+1
		end
		
	end
	p count
	stringArray.each do |a|
		a.each do |m|
		if (m.to_s.include? 'i') || (m.to_s.include? 'l') || (m.to_s.include? 'z') || (m.to_s.include? 'o')
			p m
			p "Wont save"
		else
		    finalArray << m
		    p "save"
		end
		end
		#p finalArray
		
	end
	
	p finalArray.count
	newfile=File.open("/root/Desktop/output.txt","w")
	finalArray.each do |f|
		newfile.write('"')
		newfile.write(f)
		newfile.write('",')
	end
end

def self.add_order_data
	
	companies=Company.all
	clenght=companies.length
	products=Product.all
	plength=products.length
	500.times do |t|
	status=rand(2)
	order=Order.new
	if(status==0)
	
		order.status="Order Placed"
		p "place"
		order.date_placed=DateTime.now-(rand(4000).hours)
		order.quantity_placed=rand(100)		
	else
	    p "recieved"
		order.status="Order Received"
		order.date_received=DateTime.now-(rand(4000).hours)
		order.quantity_received=rand(100)
	end
	p t
	order.company_id=companies[rand(clenght)].id
	order.product_id=products[rand(plength)].id
	#order.status=true
	order.save!
	p "saved"
	end
end

def self.add_sales_item
	users=User.where("type='SalesmanUser'")
	ulength=users.length
	products=Product.all
	plength=products.length
	500.times do |t|
		salesitem=SaleItem.new
		salesitem.user_id=users[rand(ulength)].id
		salesitem.product_id=products[rand(plength)].id
		salesitem.quantity=(rand(10)+1)
		salesitem.sale_date=Date.today-(rand(90).days)
		salesitem.save!
		p t
	end
	

end


def self.add_shop_category
    list=["Medical shops","grocery shop","bakery shop","food shop","book shop","sports shop","utensils and kitchen goods shop","electronic shop","vehicle repairing shop","General store"]
	list.each do |t|
		shopcat=ShopCategory.new
		shopcat.name=t.to_s
		#shopcat.description=Faker::Lorem.paragraph(rand(7)+1)
		shopcat.status=true
		shopcat.save!
	end
end

def self.add_shop_keeper
	count=0
	area=Array.new
	name=Array.new
	shopcat=ShopCategory.all
	slength=shopcat.length
	FasterCSV.foreach('/root/Desktop/lmn.csv') do |row|
		if(!row[2].nil?)
			if row[2].to_i > 0
			
			else
			 area << row[2].split(":")[1].strip	
			end
		end
	if !row[1].nil?	
	if !(row[1].include? ":")
		name << row[1]
	end
	end
	end
	alength=area.length
	name.each do |n|
	sp=ShopKeeper.new
	count=count+1
	sp.name=n
	sp.area=area[rand(alength)]	
	sp.address_1=Faker::Address.street_address
	sp.address_2=Faker::Address.street_address
	sp.contact_person=Faker::Name.name
	sp.street="Street"
	sp.pincode="123456"
	sp.city="Mumbai"
	sp.district="Mumbai"
	sp.state="Maharashtra"
	sp.shop_category_id=shopcat[rand(slength)].id
	sp.phone_no_1="9898989898"
	sp.email=Faker::Internet.email
	sp.email_2=Faker::Internet.email
	sp.save
	p count
	end
end

def self.add_products_shop_asso
	shopkeepers=ShopKeeper.all
	products=Product.all
	shopkeepers.each do |s|
		products.each do |p|
		count=rand(3)
		if(count==0)
			p "one"
			s.products << p
		end
	end	
	end
end

def self.add_attendance_calls
  start_date=Date.today-30.days
  users=User.where("type='SalesmanUser'")
  shops=ShopKeeper.all
  p users
  while(start_date<=Date.today)
     users.each do |u|
       flag= rand(6)
       p u.id
       agent_call=AgentCall.new
       agent_call.user_id=u.id
       agent_call.shop_id=shops[rand(shops.length)].id
       agent_call.attending=true
       agent_call.category="Morning Call"
       agent_call.duration=start_date.to_datetime
       p "**********"
      # p flag
       unless flag==0
       agent_call.save!
       p "saving"
       end
       #start_date=start_date+1.day
       
     end  
     start_date=start_date+1.day
   end   
end

def self.add_daily_sales
  agent_calls=AgentCall.all
  products=Product.all
  area_list=ShopKeeper.all.collect{|p| p.area}.uniq
  p area_list
  agent_calls.each do |a|
    shops_today=ShopKeeper.where("area=?",area_list[rand(area_list.length)])
    shops_today.each do |m|
        
        p "$$$$$$$$$$$$"
        s=SalesmanDailyReport.new
        s.agent_call_id=a.id
        s.user_id=a.user_id
        s.shop_keeper_id=m.id
        if(rand(3)==0)
            s.product_id=products[rand(products.length)].id
            s.quantity=(rand(20)+1)
            p "with data"
        end 
        
        s.save! 
     end
     p "-----------------------------------------------"
     p a.id
  end
end

def self.dup_users
  users=User.where("type='SalesmanUser'")
  users.each do |m|
  p m.id
  u=SalesUser.new
  u.name=m.name
  u.password="123456"
  u.email=m.email
  u.email_2=m.email_2
  u.role_id=m.role_id
  u.address_1=m.address_1
  u.address_2=m.address_2
  u.area=m.area
  u.street=m.street
  u.pincode="123456"
  u.phone_no_1="1234567890"
  u.phone_no_2="0987654321"
  u.birth_date= m.birth_date
  
  
  u.district="Mumbai"
  u.city="Mumbai"
  u.state="Maharashtra"
  u.emergency_name=m.emergency_name
  u.emergency_no="5656778899"
  u.home_phone_1="3434435667"
  p u
  u.save!
  end
  
end
end
