class ShopKeeper < ActiveRecord::Base
  belongs_to :shop_category
  has_and_belongs_to_many :products
  validates_presence_of :name,:address_1,:pincode,:district,:city,:state,:shop_category_id
  validates_uniqueness_of :name
  validates :pincode, :length=>{:is=>6}, :numericality=> true
  validates_format_of :contact_person, :city, :district, :state, :with=>/^[a-zA-Z\s]+$/, :message=>"has invalid characters. Only alphabets and spaces are allowed"
  validates_format_of :name, :street, :area, :address_1, :with=>/^[\w &_,\/.-]*$/, :message=>"has invalid characters. Only alphanumeric characters _-.,&/ and white spaces are allowed"

  RailsAdmin.config do |config|
    config.model ::ShopKeeper do
      edit do
        field :name do
          label "Shop Name"  
        end
        field :contact_person
        field :products
        field :address_1
      #  field :address_2
        field :street
        field :area
        field :city
        field :pincode
        field :district
        field :state
        field :shop_category_id
      end
      list do
        field :name do
          label "Shop Name"
        end
        field :contact_person
        field :products
        field :address_1
        field :address_2
        field :street
        field :area
        field :city
        field :pincode
        field :district
        field :state
        field :shop_category_id
      end
    end
  end

end
