require_relative '../../dsl/src/dsl'


RSpec.describe 'Buy Online Pick Up at Store' do
  before(:all) do
    @config = AppiumNativeAppConfig.new
    @config.capabilities[:caps][:automationName] = 'Appium'
    #close_appium(@config.capabilities[:appium_lib][:port])
    #close_emulator(@config.emulator_port)

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
    set_wait(30)
    #close_new_user_tutorial
    #close_new_user_dashboard_tutorial
  end

  after(:each) do |example|
    # get_screenshot($log.log_trace_path, example)
    #back_to_home_page
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



  it 'tc01: should pay using Visa with coupon as GU, PreOwned',:tc01 do

    $objData.insertTestData('BOPS','TC01')

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
    allow_access_device_location(true)
    search_for_available_store($zipCode,1005,403,true) # tap 'Hebron Parkway' with x and y coordinates.
    #sleep 3
    #bops_checkout_process
    #sleep 10
    checkout_page($promoCode,'','','cc',$creditCardType,'Accept')



  end

  it 'tc02: pay using MasterCard with coupon as Authenticated, PreOwned',:tc02 do

    $objData.insertTestData('BOPS','TC02')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"
    puts "zip code: #{$zipCode}"
    puts "promo code: #{$promoCode}"
    puts "giftTrade card: #{$giftTradeCard}"
    puts "pur cc: #{$purRC}"
    puts "credit card type: #{$creditCardType}"

    close_new_user_tutorial
    user_login_and_sku_search($userType,$skuNumber,true)
    allow_access_device_location(true)
    search_for_available_store($zipCode,1005,403,true) # tap 'Hebron Parkway' with x and y coordinates.
    #sleep 3
    #bops_checkout_process
    #sleep 10
    checkout_page($promoCode,'','','cc',$creditCardType,'Accept')



  end


  it 'tc03: should pay using Discover  as PurPlayer, PreOwned',:tc03 do

    $objData.insertTestData('BOPS','TC03')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"
    puts "zip code: #{$zipCode}"
    puts "promo code: #{$promoCode}"
    puts "giftTrade card: #{$giftTradeCard}"
    puts "pur cc: #{$purRC}"
    puts "credit card type: #{$creditCardType}"


    close_new_user_tutorial
    user_login_and_sku_search($userType,$skuNumber,true)
    allow_access_device_location(true)
    search_for_available_store($zipCode,237,241,true) # tap 'Hebron Parkway' with x and y coordinates.
    #sleep 3
    #bops_checkout_process
    #sleep 10
    checkout_page('','','','cc',$creditCardType,'Accept')



  end

  it 'tc04: should pay using Amex as Nonpur user',:tc04 do


    $objData.insertTestData('BOPS','TC04')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"
    puts "zip code: #{$zipCode}"
    puts "promo code: #{$promoCode}"
    puts "giftTrade card: #{$giftTradeCard}"
    puts "pur cc: #{$purRC}"
    puts "credit card type: #{$creditCardType}"


    close_new_user_tutorial
    user_login_and_sku_search($userType,$skuNumber,true)
    allow_access_device_location(true)
    search_for_available_store($zipCode,237,241,true) # tap 'Hebron Parkway' with x and y coordinates.
    #sleep 3
    #bops_checkout_process
    #sleep 10
    checkout_page('','','','cc',$creditCardType,'Accept')


  end

  it 'tc05: should pay using PURcc as Purpro user',:tc05 do

    $objData.insertTestData('BOPS','TC05')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"
    puts "zip code: #{$zipCode}"
    puts "promo code: #{$promoCode}"
    puts "giftTrade card: #{$giftTradeCard}"
    puts "pur cc: #{$purRC}"
    puts "credit card type: #{$creditCardType}"

    close_new_user_tutorial
    user_login_and_sku_search($userType,$skuNumber,true)
    allow_access_device_location(true)
    search_for_available_store($zipCode,237,241,true) # tap 'Hebron Parkway' with x and y coordinates.
    #sleep 3
    #bops_checkout_process
    #sleep 10
    checkout_page('','','','cc',$creditCardType,'Accept')


  end


  it 'tc06: pay using PayPal with coupon as Authenticated, PreOwned',:tc06 do

    $objData.insertTestData('BOPS','TC06')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"
    puts "zip code: #{$zipCode}"
    puts "promo code: #{$promoCode}"
    puts "giftTrade card: #{$giftTradeCard}"
    puts "pur cc: #{$purRC}"
    puts "credit card type: #{$creditCardType}"

    close_new_user_tutorial
    user_login_and_sku_search($userType,$skuNumber,true)
    allow_access_device_location(true)
    search_for_available_store($zipCode,237,241,true) # tap 'Hebron Parkway' with x and y coordinates.
    #sleep 3
    #bops_checkout_process
    #sleep 10
    checkout_page($promoCode,'','','paypal','','Accept')



  end


  it 'tc07: should pay using PayPal with coupon as Guest user',:tc07 do


    $objData.insertTestData('BOPS','TC07')
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
    allow_access_device_location(true)
    search_for_available_store($zipCode,237,241,true) # tap 'Hebron Parkway' with x and y coordinates.
    #sleep 3
    #bops_checkout_process
    #sleep 10
    checkout_page($promoCode,'','','paypal','','Accept')


  end

  #TO DO LIST
  it 'tc08: should pay using coupon and VISA as PURPLAYER user',:tc08 do

    $objData.insertTestData('BOPS','TC08')
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
    allow_access_device_location(true)
    search_for_available_store($zipCode,237,241,true) # tap 'Hebron Parkway' with x and y coordinates.
    #sleep 3
    #bops_checkout_process
    #sleep 10
    checkout_page($promoCode,'','','cc',$creditCardType,'Accept')


  end

  it 'tc09: should pay using coupon and GC as GUEST user',:tc09 do

    $objData.insertTestData('BOPS','TC09')
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
    allow_access_device_location(true)
    search_for_available_store($zipCode,237,241,true) # tap 'Hebron Parkway' with x and y coordinates.
    #sleep 3
    #bops_checkout_process
    #sleep 10
    checkout_page($promoCode,$giftTradeCard,'','','','Accept')


  end

  it 'tc10: should pay using coupon and GC as PRO user',:tc10 do

    $objData.insertTestData('BOPS','TC10')
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
    allow_access_device_location(true)
    search_for_available_store($zipCode,237,241,true) # tap 'Hebron Parkway' with x and y coordinates.
    #sleep 3
    #bops_checkout_process
    #sleep 10
    checkout_page($promoCode,$giftTradeCard,'','','','Accept')


  end

  # DONE EVS-495
  it 'tc11: allow enabled BOPS and HOPS PreOrder in PDP as PLAYER, paypal',:tc11 do

    $objData.insertTestData('BOPS','TC11')
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
    allow_access_device_location(true)
    search_for_available_store($zipCode,237,241,true) # tap 'Hebron Parkway' with x and y coordinates.
    #sleep 3
    #bops_checkout_process
    #sleep 10
    checkout_page('','','','paypal','','Accept')


  end

  # DONE EVS-495
  it 'tc12: allow enabled BOPS PreOrder in PDP as Pro',:tc12 do

    $objData.insertTestData('BOPS','TC12')
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
    allow_access_device_location(true)
    search_for_available_store($zipCode,237,241,true) # tap 'Hebron Parkway' with x and y coordinates.
    #sleep 3
    #bops_checkout_process
    #sleep 10
    checkout_page('','','','paypal','','Accept')


  end

  # DONE EVS-357
  it 'tc13: should allow PreOrder item in Cart to do BOPS as Pro',:tc13 do

    $objData.insertTestData('BOPS','TC13')
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
    allow_access_device_location(true)
    #search_for_available_store($zipCode,237,241,true) # tap 'Hebron Parkway' with x and y coordinates.
    pdp_add_to_cart_button.click
    sleep 5
    pdp_continue_shopping.click
    press_keycode(4)
    cart_icon.click
    sleep 5
    cart_pickUPAtStore.click
    sleep 5
    #bops_checkout_process
    cart_header_checkout_button.click
    sleep 30
    checkout_page('','','','cc',$creditCardType,'Accept')


  end


  #PENDING EVS-169
  it 'tc14: check BOPS PreOrder text order confirmation screen as Pro',:tc14 do

    $objData.insertTestData('BOPS','TC14')
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
    allow_access_device_location(true)
    #search_for_available_store($zipCode,237,241,true) # tap 'Hebron Parkway' with x and y coordinates.
    pdp_add_to_cart_button.click
    sleep 5
    pdp_continue_shopping.click
    press_keycode(4)
    cart_icon.click
    sleep 5
    cart_pickUPAtStore.click
    sleep 5
    #bops_checkout_process
    cart_header_checkout_button.click
    sleep 30
    checkout_page_for_BOPS_PreOrder('','','','cc',$creditCardType,'Accept')


  end


  it 'EVS-1851: check BOPS PO should not redirect to HOPS page as GU',:tc15 do

    $objData.insertTestData('BOPS','TC15')
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
    allow_access_device_location(true)
    #click_add_to_cart_button

    search_for_available_store_2($zipCode,237,241,true)



  end

  #PENDING EVS-179



end