require 'spec_helper'

describe "layouts/application.html.erb" do
  context "displays all the elements" do
    When { render }
    When(:doc) { Nokogiri::HTML(rendered) }
    Then { doc.css('#columns #side a').size >= 4 }
    Then { doc.css('#main').size == 1 }
  end
end
