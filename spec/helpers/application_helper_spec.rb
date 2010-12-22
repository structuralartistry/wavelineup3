require 'spec_helper'

describe ApplicationHelper do
  
  it "should return a good fading flash notice" do
    flash[:notice] = 'hello world'
    fading_flash_notice.should =~ /<div id='.*?' class='flash_notice'>hello world<\/div>/
    fading_flash_notice.should =~ /\$\(".*"\).fadeOut\(.*\);/
  end
  
end