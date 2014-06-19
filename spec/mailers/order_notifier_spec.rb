require "spec_helper"

describe OrderNotifier do
  describe "received" do
    let(:mail) { OrderNotifier.received(order) }
    let(:order) do
      order = build(:order)
      order.line_items << LineItem.new(product: build(:ruby))
      order
    end

    it "renders the headers" do
      expect(mail.subject).to eq("Pragmatic Store Order Confirmation")
      expect(mail.to).to eq(["dave@example.com"])
      expect(mail.from).to eq(["anthony@enkaptic.co.uk"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Programming Ruby 1.9")
    end
  end

  describe "shipped" do
    let(:mail) { OrderNotifier.shipped(order) }
    let(:order) do
      order = build(:order)
      order.line_items << LineItem.new(product: build(:ruby))
      order
    end

    it "renders the headers" do
      expect(mail.subject).to eq("Pragmatic Store Order Shipped")
      expect(mail.to).to eq(["dave@example.com"])
      expect(mail.from).to eq(["anthony@enkaptic.co.uk"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match(/<td>1&times;<\/td>\s*<td>Programming Ruby 1.9<\/td>/)
    end
  end

end
