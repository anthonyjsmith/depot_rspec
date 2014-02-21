require "spec_helper"

describe Product do

  # rspec-given
  context "with no attributes" do
    Given(:product) { Product.new }
    When { product.valid? }
    Then { product.errors[:title].any? }
    Then { product.errors[:description].any? }
    Then { product.errors[:price].any? }
    Then { product.errors[:image_url].any? }
  end

  # Equivalent in rspec
  it "does not allow attributes to be empty" do
    product = Product.new
    expect(product).to be_invalid
    expect(product.errors[:title]).to be_any
    expect(product.errors[:description]).to be_any
    expect(product.errors[:price]).to be_any
    expect(product.errors[:image_url]).to be_any
  end

  # rspec-given
  context "with price" do
    def product_with(price)
      Product.new(title: "My Book Title", description: "yyy", price: price, image_url: "zzz.jpg")            
    end

    Given(:product) { product_with(price) }
    When(:valid) { product.valid? } #valid? has side-effects (populates #errors) so we place it in a When clause

    context "negative" do
      Given(:price) { -1 }
      Then { product.errors[:price] == ["must be greater than or equal to 0.01"] }
    end

    context "zero" do
      Given(:price) { 0 }
      Then { product.errors[:price] == ["must be greater than or equal to 0.01"] }
    end

    context "positive" do
      Given(:price) { 1 }
      Then { valid }
    end
  end

  # rspec
  describe "price" do
    let (:product) {
      Product.new(title:       "My Book Title",
                  description: "yyy",
                  image_url:   "zzz.jpg")
    }

    it "cannot be negative" do
      product.price = -1
      expect(product).to be_invalid
      expect(product.errors[:price]).to eq(["must be greater than or equal to 0.01"])
    end

    it "cannot be zero" do
      product.price = 0
      expect(product).to be_invalid
      expect(product.errors[:price]).to eq(["must be greater than or equal to 0.01"])
    end

    it "may be 1" do
      product.price = 1
      expect(product).to be_valid
    end
  end

  # rspec-given
  context "with image_url" do
    def product_with(image_url)
      Product.new(title: "My Book Title", description: "yyy", price: 1, image_url: image_url)            
    end

    Given(:product) { product_with(image_url) }
    When(:valid) { product.valid? }

    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif }
    ok.each do |image_url|
      context image_url do
        Given(:image_url) { image_url }
        Then { valid }
      end
    end

    bad = %w{ fred.doc fred.gif/more fred.gif.more }
    bad.each do |image_url|
      context image_url do
        Given(:image_url) { image_url }
        Then { not valid }
      end
    end
  end

  # rspec
  describe "image_url" do
    def new_product(image_url)
      Product.new(title:       "My Book Title",
                  description: "yyy",
                  price:       1,
                  image_url:   image_url)
    end

    it "accepts names of images" do
      ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif }
      ok.each do |name|
        expect(new_product(name)).to be_valid
      end
    end

    it "rejects URLs that do not correspond to images" do
      bad = %w{ fred.doc fred.gif/more fred.gif.more }
      bad.each do |name|
        expect(new_product(name)).to be_invalid
      end
    end
  end

end
