module ApplicationHelper
  
  def calculate(premium,tenure,int)
   return (premium.to_i * (int.interest_rate.to_f / 100 ) * tenure.to_i ) + (premium.to_i * tenure.to_i)
   
  end
  
  
end
