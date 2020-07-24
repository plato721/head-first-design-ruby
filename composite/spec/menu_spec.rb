require './lib/menu'
require './spec/shared_examples'

describe Menu do
  it_behaves_like "a menu component", Menu.new(
      name: "Pizzeria",
      description: "Popular among both sober and trashed members of society."
  )

  context "collection of MenuItems: " do
    before :all do
      @menu = Menu.new(
          name: "Waffle hut",
          description: "Your go-to food provider."
      )
      @items = [*1..3].map do |i|
        menu_item = MenuItem.new(
            name: "Name #{i}",
            description: "Description #{i}",
            price: 1.75 + i - 0.01,
            vegetarian: false
        )
        @menu.add(menu_item)
        menu_item
      end
    end

    it "can add/remove a MenuItem" do
      item = MenuItem.new(
          name: "Pop tarts",
          description: "Unknown pastry components",
          price: "1.75",
          vegetarian: true
      )

      @menu.add(item)
      expect(@menu.create_enumerable).to include(item)

      @menu.remove(item)
      expect(@menu.create_enumerable).to_not include(item)
    end

    it "provides an enumerable" do
      expect(@items.length).to eq(3)
      expect(@menu.create_enumerable).to match_array(@items)
      [:all?, :each, :select].each do |method|
        expect(@menu.create_enumerable).to respond_to(method)
      end
    end

    it "prints all the menu items" do
      @items.each do |item|
        expect(@menu.print).to match(/.*#{item.name}.*/)
        expect(@menu.print).to match(/.*#{item.description}.*/)
        expect(@menu.print).to match(/.*#{item.price}.*/)
      end
    end

    it "gets nth child" do
      expected = @items[1]
      result = @menu.get_child(1)
      expect(result).to eq(expected)
    end
  end
end
