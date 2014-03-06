require 'spec_helper'

describe "store/index.html.erb" do
  context "displays all the elements" do
    def assign_products
      assign(:products, [:ruby, :one, :two].map { |p| build_stubbed(p) })
    end

    Given { assign_products }
    When { render }
    When(:doc) { Nokogiri::HTML(rendered) }
    Then { doc.css('.entry').size == 3 }
    Then { doc.css('h3').text =~ /Programming Ruby 1\.9/ }
    Then { doc.css('.price').text =~ /\$[,\d]+\.\d\d/ }
  end
end
