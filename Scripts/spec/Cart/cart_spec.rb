require_relative '../../dsl/src/dsl'




RSpec.describe 'Cart tests' do


  before(:all) do
    @config = AppiumNativeAppConfig.new
    @config.capabilities[:caps][:automationName] = 'Appium'
    #close_appium(@config.capabilities[:appium_lib][:port])
    #close_emulator(@config.emulator_port)
    #

    $objData = TestData.new


  end
  before(:each) do

    # --close_appium(@config.capabilities[:appium_lib][:port])
    close_emulator(@config.emulator_port)
    # restart_adb
    sleep 10
    start_emulator(@config.capabilities[:caps][:deviceName],@config.emulator_port)
    start_appium(@config.capabilities[:appium_lib][:port])
    sleep 10
    clear_data
    @app = AndroidApp.new(@config)
    start_driver
    set_wait(20)
    #close_new_user_tutorial
    #close_new_user_dashboard_tutorial
  end

  after(:each) do |example|
    get_screenshot($log.log_trace_path, example)
    # back_to_home_page
    # log_out_user_account
    quit_driver
    close_appium(@config.capabilities[:appium_lib][:port])
    close_emulator(@config.emulator_port)
    sleep 7
  end

  after(:all) do
    quit_driver
    close_appium(@config.capabilities[:appium_lib][:port])
    close_emulator(@config.emulator_port)
    sleep 5
  end


  # MTM Automated Regression 33

  #Covers TCID: [87651]
  #


    it 'tc01: should modify single item', :tc01 do


      $objData.insertTestData('CART','TC01')

      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      puts "zip code: #{$zipCode}"
      puts "promo code: #{$promoCode}"
      puts "giftTrade card: #{$giftTradeCard}"
      puts "pur cc: #{$purRC}"
      puts "credit card type: #{$creditCardType}"

      close_new_user_tutorial
      #guest_user_only('952007',true)
      user_login_and_sku_search($userType,$skuNumber,true)
      allow_access_device_location(false)
      sleep 10
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      sleep 5
      pdp_continue_shopping.click
      sleep 5
      cart_icon.click
      sleep 10
      cart_modify_quantity(2)
      expect(cart_header_count.text).to eq("2 items in cart")

    end

    #Covers TCID: [87652]
    it 'tc02: should modify multiple item',:tc02 do


      $objData.insertTestData('CART','TC02')

      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      puts "zip code: #{$zipCode}"
      puts "promo code: #{$promoCode}"
      puts "giftTrade card: #{$giftTradeCard}"
      puts "pur cc: #{$purRC}"
      puts "credit card type: #{$creditCardType}"


      close_new_user_tutorial
      #guest_user_only('952007',true)
      user_login_and_sku_search($userType,$skuNumber.split(",")[0],true)
      allow_access_device_location(false)
      sleep 10
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      sleep 5
      pdp_continue_shopping.click
      sleep 10
      search_for_item($skuNumber.split(",")[1])
      allow_access_device_location(false)
      #button_to_click('PRE-ORDER')
      click_add_to_cart_button
      pdp_continue_shopping.click
      cart_icon.click
      sleep 10
      cart_modify_quantity(2)
      page_scroll_down('0.60','0.20')
      sleep 5
      cart_modify_quantity(2)
      sleep 10
      page_scroll_down('0.40','0.90')
      puts cart_header_count.text
      expect(cart_header_count.text).to eq("4 items in cart")

    end

    #Covers TCID: [73863,87886]
    it 'tc03: Merge items from GU to AU- Cart version merge', :tc03 do



      $objData.insertTestData('CART','TC03')

      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      puts "zip code: #{$zipCode}"
      puts "promo code: #{$promoCode}"
      puts "giftTrade card: #{$giftTradeCard}"
      puts "pur cc: #{$purRC}"
      puts "credit card type: #{$creditCardType}"

      close_new_user_tutorial
      user_login_and_logout($userType.split(",")[0])
      #guest_user_only('952007',true)
      user_login_and_sku_search($userType.split(",")[1],$skuNumber.split(",")[0],true)
      allow_access_device_location(false)
      sleep 10
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      sleep 5
      pdp_continue_shopping.click
      sleep 5
      back_to_home_page
      user_login_and_sku_search($userType.split(",")[0],$skuNumber.split(",")[1],false)
      allow_access_device_location(false)
      sleep 10
      page_scroll_down(0.30,0.50)
      click_add_to_cart_button
      pdp_continue_shopping.click
      sleep 10
      cart_icon.click
      sleep 10
      expect(cart_header_count.text).to eq("2 items in cart")

    end


  it 'tc04: should add multiple digital items to cart', :tc04 do


    $objData.insertTestData('CART','TC04')

    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"
    puts "zip code: #{$zipCode}"
    puts "promo code: #{$promoCode}"
    puts "giftTrade card: #{$giftTradeCard}"
    puts "pur cc: #{$purRC}"
    puts "credit card type: #{$creditCardType}"

    close_new_user_tutorial
    #guest_user_only('952007',true)
    user_login_and_sku_search($userType,$skuNumber,true)
    allow_access_device_location(false)
    sleep 10
    page_scroll_down(0.50,0.30)
    click_add_to_cart_button
    sleep 5
    pdp_continue_shopping.click
    sleep 5
    click_add_to_cart_button
    pdp_continue_shopping.click
    sleep 5
    cart_icon.click
    sleep 10
    expect(cart_header_count.text).to eq("2 items in cart")

  end


  it 'tc05: should check image optimization on app', :tc05 do


   $objData.insertTestData('CART','TC05')

    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"
    puts "zip code: #{$zipCode}"
    puts "promo code: #{$promoCode}"
    puts "giftTrade card: #{$giftTradeCard}"
    puts "pur cc: #{$purRC}"
    puts "credit card type: #{$creditCardType}"

    $current_path = "C:/dev/Screenshot/current/"
    close_new_user_tutorial
    get_screenshot2($current_path,"home")
    clear_cart
    sleep 5
    tap_search_icon
    sleep 10
    keypad_search_button_tap
    sleep 40
    get_screenshot2($current_path,"bulkSearch")
    tap_search_icon
    search_field.click
    search_field.send_keys($skuNumber)
    keypad_search_button_tap
    sleep 10
    get_screenshot2($current_path,"itemSearch")
    search_result_list_item.click
    sleep 10
    allow_access_device_location(false)
    sleep 20
    get_screenshot2($current_path,"pdpBoxArt")
    page_scroll_down(0.50,0.30)
    pdp_images_view.click
    sleep 20
    get_screenshot2($current_path,"pdpImagesTab")
    page_scroll_down(0.30,0.50)

    pdp_add_to_cart_button.click
    pdp_continue_shopping.click
    sleep 5
    cart_icon.click
    sleep 10
    get_screenshot2($current_path,"cartPage")
    cart_header_checkout_button.click
    #pdp_checkout_now.click
    sleep 40
    get_screenshot2($current_path,"checkoutPage")

   page_scroll_down(0.50,0.30)
   page_scroll_down(0.30,0.50)



   #if exists{summ_shipping_information_link}
   if (exists{confirmation_shipping_info} && confirmation_shipping_info.text == 'Shipping Information')
     summ_shipping_information_link.click
     sleep 10
     enter_new_billing_address("Accept")
     #back
     sleep 15
   end

   checkout_page_Payment("cc")
   credit_card_payment_input("VISA")
   enter_new_billing_address("Accept")
   checkout_save_button.click
   sleep 10
   page_scroll_down(0.50,0.30)
   sleep 2
   page_scroll_down(0.30,0.50)
   place_order_button1.click
   sleep 10
   love_this_app_alert_msg
   page_scroll_down(0.50,0.30)
   get_screenshot2($current_path,"confirmationPage")

  end

  it 'tc06: should add gift card item to cart', :tc06 do


    $objData.insertTestData('CART','TC06')

    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"
    puts "zip code: #{$zipCode}"
    puts "promo code: #{$promoCode}"
    puts "giftTrade card: #{$giftTradeCard}"
    puts "pur cc: #{$purRC}"
    puts "credit card type: #{$creditCardType}"

    close_new_user_tutorial
    #guest_user_only('952007',true)
    user_login_and_sku_search($userType,$skuNumber,true)
    allow_access_device_location(false)
    sleep 10
    page_scroll_down(0.50,0.30)
    click_add_to_cart_button
    sleep 5
    pdp_continue_shopping.click
    sleep 5
    cart_icon.click
    sleep 10
    expect(cart_header_count.text).to eq("1 item in cart")

  end



end

