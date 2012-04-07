module ApplicationHelper
  
  def calculate(premium,tenure,int)
    return (premium.to_i * (int.interest_rate.to_f / 100 ) * tenure.to_i ) + (premium.to_i * tenure.to_i)
    
  end
  
  
  def check_edit_access
    if current_user.role.role == 'Admin' or current_user.role.role == 'Super Admin' or current_user.role.role == 'Data Entry'
      return true
    else
      return false
    end
  end
  
  def check_delete_access
     if current_user.role.role == 'Admin' or current_user.role.role == 'Super Admin'
      return true
    else
      return false
    end
  end
  
end
