require 'watir'
require 'pry'
require 'securerandom' 

describe "Tumblr" do

<<<<<<< HEAD
     before(:all) do
          @browser = Watir::Browser.new 
          @url = "http://tumblr.com"
     end
=======
before(:all) do
  @driver = Watir::Browser.new 
  @url = "http://tumblr.com"
end
>>>>>>> d520347cae04567e3d4e56ab0514191678b2e1af



it "should log in with correct details" do
  login 
<<<<<<< HEAD
  expect(@browser.button(class:"compose-button").exists?).to eq true
=======
  sleep(1)
  @driver.wait()
  expect(@driver.button(class:"compose-button").exists?).to eq true
>>>>>>> d520347cae04567e3d4e56ab0514191678b2e1af
 end



<<<<<<< HEAD
 it "should should be able to post" do 
  #clicks on the button to create a new post 
  @browser.span(class:"new_post_label_text").click 
  id = SecureRandom.uuid
  @browser.div(class:"editor-plaintext").send_keys("Testing" + id)
  @browser.div(class:"editor-richtext").send_keys("Testingbacon")
      
  delaying_page(1)
  @browser.button(class:"button-area").click
  delaying_page(3)
      
  redirect_user_to "blog"
  delaying_page(1)
=======
it "should pshould be able to post" do 
>>>>>>> d520347cae04567e3d4e56ab0514191678b2e1af

  expect(@browser.divs(class: "post_title")[0].text).to include id
  delete_post

<<<<<<< HEAD
 end 
 

it "should be able to reblog a post" do 

  redirect_user_to 'dashboard'
     
  @browser.as(class: 'reblog')[2].click
  @browser.div(class:'editor-richtext').send_keys'reblog'
     
  delaying_page(3)
    
  @browser.button(class:'button-area').click
     
  delaying_page(2)
     
  redirect_user_to 'blog'
  expect(@browser.divs(class:'reblog-content')[1].text).to eq 'reblog'
=======
  @driver.span(class:"new_post_label_text").click
      
  @driver.div(class:"editor-plaintext").send_keys("Testing")
  @driver.div(class:"editor-richtext").send_keys("Testingbacon")
  sleep(1)
  @driver.wait()
      
  @driver.button(class:"button-area").click
  sleep(1)
  @driver.wait()
  @driver.goto"https://www.tumblr.com/blog/ducktoday"
  sleep(1)
  @driver.wait()
      
  expect(@driver.divs(class: "post_title")[0].text).to include "ing"
      
  delete_post
    
     
 end   


>>>>>>> d520347cae04567e3d4e56ab0514191678b2e1af

it "should be able to reblog" do 

  @driver.goto 'https://www.tumblr.com/dashboard'

  @driver.as(class: 'reblog')[2].click
  @driver.div(class:'editor-richtext').send_keys'reblog'
     
  sleep(1)
  @driver.wait()
     
  @driver.button(class:'button-area').click
     
  sleep(1)
  @driver.wait()

  @driver.goto 'https://www.tumblr.com/blog/ducktoday'
  expect(@driver.divs(class:'reblog-content')[1].text).to eq 'reblog'
end




it "should log the user out" do
<<<<<<< HEAD
     # delaying_page
  log_user_out
  expect(@browser.body(id:"account_actions_login_and_register").exists?).to eq true
=======
  sleep(3)
     
  @driver.wait()
     
  logout
     
  expect(@driver.body(id:"account_actions_login_and_register").exists?).to eq true
>>>>>>> d520347cae04567e3d4e56ab0514191678b2e1af
     
end

<<<<<<< HEAD
=======


>>>>>>> d520347cae04567e3d4e56ab0514191678b2e1af
end