require 'watir'
require 'pry'

  
@driver  = Watir::Browser.new 
@url = "http://tumblr.com"

def delete_post
 
 @driver.div(class:"post_control_menu creator").click
 @driver.div(class:"delete").click
 @driver.button(class:"btn_1").click

end

def login

  if logged_in?
    puts "Already logged in"
  else
  @driver.goto("#{@url}")
  @driver.button(id:"signup_login_button").click
  @driver.text_field(id:"signup_determine_email").set("testingcheck@mailinator.com\n")
  @driver.button(id:"login-signin").click
  @driver.text_field(id:"login-passwd").send_keys("Link1234!\n")
  sleep(1)
  @driver.wait()
end

end

def logged_in?
  @driver.button(class:"compose-button").exists?
end

def logout


  if logged_in? 
     @driver.goto"#{@url}/logout"
  else puts "already logged out"

  
  end






end




RSpec.configure do |config|

  
 
  config.expect_with :rspec do |expectations|
  
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end


  config.mock_with :rspec do |mocks|
 
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups


end
