require 'rails_helper'

RSpec.describe 'Items Index Page' do
  before :each do
    @market1 = Supermarket.create!(name: "Smith's", location: "2100 South")
    @market2 = Supermarket.create!(name: "Harmon's", location: "4700 South")

    @item1 = @market1.items.create!(name: "Banana", price: 1)
    @item2 = @market1.items.create!(name: "Apple", price: 2)
    @item3 = @market2.items.create!(name: "Orange", price: 3)
    @item4 = @market2.items.create!(name: "Peach", price: 4)

    @customer1 = Customer.create!(name: "Dani")
    @customer2 = Customer.create!(name: "Juliet")

    @customer_item_1 = CustomerItem.create!(item_id: @item1.id, customer_id: @customer1.id)
    @customer_item_2 = CustomerItem.create!(item_id: @item2.id, customer_id: @customer1.id)
    @customer_item_3 = CustomerItem.create!(item_id: @item3.id, customer_id: @customer2.id)
    @customer_item_4 = CustomerItem.create!(item_id: @item4.id, customer_id: @customer2.id)
  end

  describe "#index" do
    it "displays all items - name, price, supermarket and number of customers" do 
      visit "/items"

      expect(page).to have_content(@item1.name)
      expect(page).to have_content(@item1.price)
      expect(page).to have_content(@market1.name)
      expect(page).to have_content(@item1.customers.count)
    end
  end
end