require 'watir'
require 'pry'

<<<<<<< HEAD
  
=======

>>>>>>> d520347cae04567e3d4e56ab0514191678b2e1af

def delete_post
 
 @browser.div(class:"post_control_menu creator").click
 @browser.div(class:"delete").click
 @browser.button(class:"btn_1").click

end

def login

<<<<<<< HEAD

  if logged_in?
    puts "Already logged in"
  else
  @browser.goto("#{@url}")
  @browser.button(id:"signup_login_button").click
  @browser.text_field(id:"signup_determine_email").set("testingcheck@mailinator.com\n")
  @browser.button(id:"login-signin").click
  @browser.text_field(id:"login-passwd").send_keys("Link1234!\n")
  delaying_page(1)
  end
=======
      if logged_in?
        puts "Already logged in"
      else
      @driver.goto("#{@url}")
      
      @driver.button(id:"signup_login_button").click
      
      @driver.text_field(id:"signup_determine_email").set("testingcheck@mailinator.com\n")
      
      @driver.button(id:"login-signin").click
      
      @driver.text_field(id:"login-passwd").send_keys("Link1234!\n")
      
    end
>>>>>>> d520347cae04567e3d4e56ab0514191678b2e1af

end


def logged_in?
  @browser.button(class:"compose-button").exists?
end

<<<<<<< HEAD

def log_user_out
  if logged_in?
      #redirect user to logout page 
     redirect_user_to'logout'
  else puts "already logged out"
  end
end


def redirect_user_to(page)
  
    case
      when page == 'dashboard' then @browser.goto"#{@url}/dashboard"
      when page == 'blog' then @browser.goto "#{@url}/blog/ducktoday"
      when page == 'logout' then @browser.goto"#{@url}/logout"
    end


end

=======
def logout
 if logged_in? 

  #Redirects browser to logout page  
  @driver.goto"#{@url}/logout" 

 else puts "already logged out"
 end
>>>>>>> d520347cae04567e3d4e56ab0514191678b2e1af

def delaying_page(seconds)
  sleep(seconds)
  @browser.wait()
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
