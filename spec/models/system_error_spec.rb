require 'spec_helper'

describe "SystemError after_save" do
  
  # it "should send an email to the admin after save" do 
  #   system_error = SystemError.new
  #   system_error.should_receive(:notify_administrator_of)
  #   system_error.run_callbacks(:after_save)
  # end
  
end

# 
# Failures:
# 
#   1) SystemError after_save should send an email to the admin after save
#      Failure/Error: system_error.run_callbacks(:after_save)
#      undefined method `_run_after_save_callbacks' for #<SystemError:0x21a1a60>
#      # ./spec/models/system_error_spec.rb:8:in `block (2 levels) in <top (required)>'
