require 'watir'
require 'pry'

describe "Tumblr" do\

     before(:all) do
          @driver = Watir::Browser.new 
          @url = "http://tumblr.com"
     end



it "should log in with correct details" do
     login 
     sleep(1)
     @driver.wait()
     expect(@driver.button(class:"compose-button").exists?).to eq true
 end



 it "should pshould be able to post" do 


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
     sleep(3)
     
     @driver.wait()
     
     logout
     
     expect(@driver.body(id:"account_actions_login_and_register").exists?).to eq true
     


end



end