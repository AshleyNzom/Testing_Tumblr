require 'watir'
require 'pry'
require 'securerandom' 

describe "Tumblr" do

before(:all) do
  @browser = Watir::Browser.new 
  @url = "http://tumblr.com"
end



it "should log in with correct details" do
  login 
  expect(@browser.button(class:"compose-button").exists?).to eq true

 end


 it "should should be able to post" do 
  #clicks on the button to create a new post 
  @browser.span(class:"new_post_label_text").click 
  id = SecureRandom.uuid
  @browser.div(class:"editor-plaintext").send_keys("Testing" + id)
  @browser.div(class:"editor-richtext").send_keys("Testingbacon")
      
  page_delay(1)
  @browser.button(class:"button-area").click
  page_delay(3)
      
  redirect_user_to "blog"
  page_delay(1)

  expect(@browser.divs(class: "post_title")[0].text).to include id
  delete_post


 end 
 

it "should be able to reblog a post" do 

  redirect_user_to 'dashboard'
     
  @browser.as(class: 'reblog')[2].click
  @browser.div(class:'editor-richtext').send_keys'reblog'
     
  page_delay(3)
    
  @browser.button(class:'button-area').click
     
  page_delay(2)
     
  redirect_user_to 'blog'
  expect(@browser.divs(class:'reblog-content')[1].text).to eq 'reblog'
      
  delete_post
    
 end   







it "should log the user out" do

  # delaying_page
  log_user_out
  expect(@browser.body(id:"account_actions_login_and_register").exists?).to eq true
    
end

end