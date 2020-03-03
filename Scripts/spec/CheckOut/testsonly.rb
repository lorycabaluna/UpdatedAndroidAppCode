
require_relative '../../dsl/src/dsl'



RSpec.describe 'Test Suite' do

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
    clear_data
    start_emulator(@config.capabilities[:caps][:deviceName],@config.emulator_port)
    start_appium(@config.capabilities[:appium_lib][:port])
    sleep 10
    #clear_data
    @app = AndroidApp.new(@config)
    start_driver
    set_wait(20)
    #close_new_user_tutorial
    #close_new_user_dashboard_tutorial

  end

  after(:each) do |example|
    get_screenshot($log.log_trace_path, example)
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

  #Covers TCID: [68780,69474,93012]
  context 'Checkout' do
    it 'tc01: checkout as AUTHENTICATED using VISA and coupon, PreOwned item',:tc01 do

      $objData.insertTestData('CHECKOUT','TC01')
      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      puts "zip code: #{$zipCode}"
      puts "promo code: #{$promoCode}"
      puts "giftTrade card: #{$giftTradeCard}"
      puts "pur cc: #{$purRC}"
      puts "credit card type: #{$creditCardType}"

      close_new_user_tutorial
      user_login_and_sku_search($userType,$skuNumber,true)
      allow_access_device_location(false)
      sleep 15
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      pdp_checkout_now.click
      sleep 40
      checkout_page($promoCode,'','','cc',$creditCardType,'Accept')


    end

    #Covers TCID: [139836,93339,139931]
    it 'tc02: checkout as PURPRO using MASTERCARD, Download item',:tc02 do

      $objData.insertTestData('CHECKOUT','TC02')
      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      puts "zip code: #{$zipCode}"
      puts "promo code: #{$promoCode}"
      puts "giftTrade card: #{$giftTradeCard}"
      puts "pur cc: #{$purRC}"
      puts "credit card type: #{$creditCardType}"

      close_new_user_tutorial
      user_login_and_sku_search($userType,$skuNumber,true)
      allow_access_device_location(false)
      sleep 15
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      pdp_checkout_now.click
      sleep 40
      checkout_page('','','','cc',$creditCardType,'Accept')


    end

    # Change to GC instead of PUR Trade rewards card
    #PUR credit field not read

    #Covers TCID: [139933, 89719,93339]
    it 'tc03: checkout as NONPUR using AMEX, PreOrder New',:tc03 do

      $objData.insertTestData('CHECKOUT','TC03')
      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      puts "zip code: #{$zipCode}"
      puts "promo code: #{$promoCode}"
      puts "giftTrade card: #{$giftTradeCard}"
      puts "pur cc: #{$purRC}"
      puts "credit card type: #{$creditCardType}"

      close_new_user_tutorial
      user_login_and_sku_search($userType,$skuNumber,true)
      allow_access_device_location(false)
      sleep 15
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button #PRE-ORDER button click
      pdp_checkout_now.click
      sleep 40
      checkout_page('','','','cc',$creditCardType,'Accept')


    end

    # PURBASIC not working
    # NEEDED TRADE CARD HERE TEMPORARILY USES GIFT CARD > Exceeds allowable purchase
    #Covers TCID: [139929,139934,139935]
    it 'tc04: checkout as AUTHENTICATED using GC,Refurb',:tc04 do

      $objData.insertTestData('CHECKOUT','TC04')
      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      puts "zip code: #{$zipCode}"
      puts "promo code: #{$promoCode}"
      puts "giftTrade card: #{$giftTradeCard}"
      puts "pur cc: #{$purRC}"
      puts "credit card type: #{$creditCardType}"

      close_new_user_tutorial
      user_login_and_sku_search($userType,$skuNumber,true)
      allow_access_device_location(false)
      sleep 15
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      pdp_checkout_now.click
      sleep 40
      checkout_page('',$giftTradeCard,'','','','Accept')


    end



    #Covers TCID: [139928]
    it 'tc05: checkout as PURPRO using PURCC and coupon,Digital item',:tc05 do

      $objData.insertTestData('CHECKOUT','TC05')
      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      puts "zip code: #{$zipCode}"
      puts "promo code: #{$promoCode}"
      puts "giftTrade card: #{$giftTradeCard}"
      puts "pur cc: #{$purRC}"
      puts "credit card type: #{$creditCardType}"

      close_new_user_tutorial
      user_login_and_sku_search($userType,$skuNumber,true)
      allow_access_device_location(false)
      sleep 15
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button #PRE-ORDER button click
      pdp_checkout_now.click
      sleep 40
      checkout_page($promoCode,'','','cc',$creditCardType,'Accept')


    end

    #Covers TCID: [139932]
    it 'tc06: checkout as PURPRO using Discover with coupon,Online',:tc06 do

      $objData.insertTestData('CHECKOUT','TC06')
      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      puts "zip code: #{$zipCode}"
      puts "promo code: #{$promoCode}"
      puts "giftTrade card: #{$giftTradeCard}"
      puts "pur cc: #{$purRC}"
      puts "credit card type: #{$creditCardType}"

      close_new_user_tutorial
      user_login_and_sku_search($userType,$skuNumber,true) #640214
      allow_access_device_location(false)
      sleep 15
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      pdp_checkout_now.click
      sleep 40
      checkout_page($promoCode,'','','cc',$creditCardType,'Accept')


    end
    # TO
    #Covers TCID: [139925,139924]
    it 'tc07: checkout as GUEST using PURCC with coupon,PreOwned',:tc07 do

      $objData.insertTestData('CHECKOUT','TC07')
      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      puts "zip code: #{$zipCode}"
      puts "promo code: #{$promoCode}"
      puts "giftTrade card: #{$giftTradeCard}"
      puts "pur cc: #{$purRC}"
      puts "credit card type: #{$creditCardType}"

      close_new_user_tutorial
      user_login_and_sku_search($userType,$skuNumber,true)
      allow_access_device_location(false)
      sleep 15
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      pdp_checkout_now.click
      sleep 40
      checkout_page($promoCode,'','','cc',$creditCardType,'Accept')


    end

    #Covers TCID: [68782,69475,69478,139922,139927,93059]
    it 'tc08: checkout as GU using VISA coupon,PreOwned',:tc08 do

      $objData.insertTestData('CHECKOUT','TC08')
      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      puts "zip code: #{$zipCode}"
      puts "promo code: #{$promoCode}"
      puts "giftTrade card: #{$giftTradeCard}"
      puts "pur cc: #{$purRC}"
      puts "credit card type: #{$creditCardType}"

      close_new_user_tutorial
      #guest_user_only('952040',true)
      user_login_and_sku_search($userType,$skuNumber,true)
      allow_access_device_location(false)
      sleep 15
      #page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      pdp_checkout_now.click
      sleep 40
      checkout_page($promoCode,'','','cc',$creditCardType,'Accept')

    end

    #Covers TCID: [139837]
    it 'tc09: checkout as AU using PayPal and coupon, Online',:tc09 do

      $objData.insertTestData('CHECKOUT','TC09')
      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      puts "zip code: #{$zipCode}"
      puts "promo code: #{$promoCode}"
      puts "giftTrade card: #{$giftTradeCard}"
      puts "pur cc: #{$purRC}"
      puts "credit card type: #{$creditCardType}"

      close_new_user_tutorial
      user_login_and_sku_search($userType,$skuNumber,true) #640214
      allow_access_device_location(false)
      sleep 15
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      pdp_checkout_now.click
      sleep 40
      checkout_page($promoCode,'','','paypal','','Accept')


    end


    #promo code not link not clicked.
    #Covers TCID: [139921,139930]
    it 'tc10: checkout as GU using PayPal and coupon, New',:tc10 do

      $objData.insertTestData('CHECKOUT','TC10')
      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      puts "zip code: #{$zipCode}"
      puts "promo code: #{$promoCode}"
      puts "giftTrade card: #{$giftTradeCard}"
      puts "pur cc: #{$purRC}"
      puts "credit card type: #{$creditCardType}"

      close_new_user_tutorial
      #guest_user_only('111253',true) #600132 Digital
      user_login_and_sku_search($userType,$skuNumber,true)
      allow_access_device_location(false)
      sleep 15
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      #older_than_seventeen_button.click
      pdp_checkout_now.click
      sleep 40
      checkout_page($promoCode,'','','paypal','','Accept')


    end

    #Covers TCID: [139923]
    it 'tc11: checkout as Non PUR using PayPal and coupon, New',:tc11 do

      $objData.insertTestData('CHECKOUT','TC11')
      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      puts "zip code: #{$zipCode}"
      puts "promo code: #{$promoCode}"
      puts "giftTrade card: #{$giftTradeCard}"
      puts "pur cc: #{$purRC}"
      puts "credit card type: #{$creditCardType}"

      close_new_user_tutorial
      user_login_and_sku_search($userType,$skuNumber,true) #640214
      allow_access_device_location(false)
      sleep 15
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      pdp_checkout_now.click
      sleep 40
      checkout_page($promoCode,'','','paypal','','Accept')


    end


    it 'tc12: checkout as PUR Pro using PayPal and coupon, New',:tc12 do

      $objData.insertTestData('CHECKOUT','TC12')
      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      puts "zip code: #{$zipCode}"
      puts "promo code: #{$promoCode}"
      puts "giftTrade card: #{$giftTradeCard}"
      puts "pur cc: #{$purRC}"
      puts "credit card type: #{$creditCardType}"

      close_new_user_tutorial
      user_login_and_sku_search($userType,$skuNumber,true) #640214
      allow_access_device_location(false)
      sleep 15
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      pdp_checkout_now.click
      sleep 40
      checkout_page($promoCode,'','','paypal','','Accept')


    end


    it 'tc13: PayPal payment not available for DLC, Dowload',:tc13 do


      $objData.insertTestData('CHECKOUT','TC13')
      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      puts "zip code: #{$zipCode}"
      puts "promo code: #{$promoCode}"
      puts "giftTrade card: #{$giftTradeCard}"
      puts "pur cc: #{$purRC}"
      puts "credit card type: #{$creditCardType}"

      close_new_user_tutorial
      user_login_and_sku_search($userType,$skuNumber,true) #640214
      allow_access_device_location(false)
      sleep 15
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      pdp_checkout_now.click
      sleep 40
      page_scroll_down(0.50,0.30)
      page_scroll_down(0.30,0.50)
      sleep 2
      checkout_payment_icon.click
      sleep 5
      page_scroll_down(0.90,0.50)
      expect(exists{pay_with_paypal_link}).to eq(false)


    end

    it 'tc14: confirmation info display for Review Order status,Discover',:tc14 do

      $objData.insertTestData('CHECKOUT','TC14')
      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      puts "zip code: #{$zipCode}"
      puts "promo code: #{$promoCode}"
      puts "giftTrade card: #{$giftTradeCard}"
      puts "pur cc: #{$purRC}"
      puts "credit card type: #{$creditCardType}"

      close_new_user_tutorial
      #guest_user_only('952040',true)
      user_login_and_sku_search($userType,$skuNumber,true)
      allow_access_device_location(false)
      sleep 15
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      pdp_checkout_now.click
      sleep 40
      checkout_page('','','','cc',$creditCardType,'Review')


    end

    it 'tc15: cannot place an order for Reject Order status,Discover',:tc15 do

      $objData.insertTestData('CHECKOUT','TC15')
      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      puts "zip code: #{$zipCode}"
      puts "promo code: #{$promoCode}"
      puts "giftTrade card: #{$giftTradeCard}"
      puts "pur cc: #{$purRC}"
      puts "credit card type: #{$creditCardType}"

      close_new_user_tutorial
      #guest_user_only('952040',true)
      user_login_and_sku_search($userType,$skuNumber,true)
      allow_access_device_location(false)
      sleep 15
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      pdp_checkout_now.click
      sleep 40
      checkout_page('','','','cc',$creditCardType,'Reject')


    end

    #Covers TCID: [89720]
    it 'tc16: multiple line items with multiple promo code,PayPal',:tc16 do

      $objData.insertTestData('CHECKOUT','TC16')
      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      puts "zip code: #{$zipCode}"
      puts "promo code: #{$promoCode}"
      puts "giftTrade card: #{$giftTradeCard}"
      puts "pur cc: #{$purRC}"
      puts "credit card type: #{$creditCardType}"

      @billingFname = 'Accept'
      close_new_user_tutorial
      user_login_and_sku_search($userType,$skuNumber.split(",")[0],true)
      allow_access_device_location(false)
      sleep 15
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      pdp_continue_shopping.click
      sku_item_search($skuNumber.split(",")[1])                      #Pre-Order New
      allow_access_device_location(false)
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      pdp_continue_shopping.click
      sku_item_search($skuNumber.split(",")[2])                      #Refurbished
      allow_access_device_location(false)
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      pdp_checkout_now.click
      sleep 40
      page_scroll_down(0.50,0.30)
      page_scroll_down(0.30,0.50)
      shipping_address_only(@billingFname)
      multiple_promoCodeINPUT($promoCode)
      checkout_payment_icon.click
      sleep 10
      page_scroll_down(0.80,0.50)
      pay_with_paypal_link.click
      sleep 5
      place_order_button1.click
      continue_paypal_checkout
      love_this_app_alert_msg
      continueShoppingConfirmation.click


    end


    it 'tc17: multiple line items with multiple GC/TC,Amex',:tc17 do

      $objData.insertTestData('CHECKOUT','TC17')
      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      puts "zip code: #{$zipCode}"
      puts "promo code: #{$promoCode}"
      puts "giftTrade card: #{$giftTradeCard}"
      puts "pur cc: #{$purRC}"
      puts "credit card type: #{$creditCardType}"

      @billingFname = 'Accept'
      close_new_user_tutorial
      user_login_and_sku_search($userType,$skuNumber.split(",")[0],true) #PreOwned
      allow_access_device_location(false)
      sleep 15
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      pdp_continue_shopping.click
      sku_item_search($skuNumber.split(",")[1])                     #Download
      allow_access_device_location(false)
      click_add_to_cart_button
      pdp_continue_shopping.click
      sku_item_search($skuNumber.split(",")[2])                      #Pre-Order New
      allow_access_device_location(false)
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      pdp_continue_shopping.click
      # sku_item_search($skuNumber.split(",")[3])                      #Refurbished
      # allow_access_device_location(false)
      # page_scroll_down(0.50,0.30)
      # click_add_to_cart_button
      # pdp_checkout_now.click
      sleep 40
      page_scroll_down(0.50,0.30)
      page_scroll_down(0.30,0.50)
      shipping_address_only(@billingFname)
      multiple_giftCardINPUT($giftTradeCard.split(",")[0],$giftTradeCard.split(",")[1])
      checkout_page_Payment('cc')
      credit_card_payment_input($creditCardType)
      enter_new_billing_address(@billingFname)
      while !exists{checkout_save_button}
        page_scroll_down(0.80,0.10)
        sleep 2

      end
      checkout_save_button.click
      sleep 10

      page_scroll_down(0.50,0.30)
      sleep 2
      page_scroll_down(0.30,0.50)
      place_order_button1.click
      sleep 10
      love_this_app_alert_msg
      continueShoppingConfirmation.click


    end


    it 'tc18: should be able to delete promo code',:tc18 do

      $objData.insertTestData('CHECKOUT','TC18')
      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      puts "zip code: #{$zipCode}"
      puts "promo code: #{$promoCode}"
      puts "giftTrade card: #{$giftTradeCard}"
      puts "pur cc: #{$purRC}"
      puts "credit card type: #{$creditCardType}"

      close_new_user_tutorial
      user_login_and_sku_search($userType,$skuNumber,true)
      allow_access_device_location(false)
      sleep 15
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      pdp_checkout_now.click
      sleep 40

      page_scroll_down(0.50,0.30)
      page_scroll_down(0.30,0.50)
      promoCodes_tradeCredit_GC_icon.click
      sleep 5
      tap_object(540,960)
      sleep 5
      enter_your_promo_code_input.click
      enter_your_promo_code_input.clear
      enter_your_promo_code_input.send_keys($promoCode)
      save_button_promotion_page.click
      sleep 12
      page_scroll_down(0.20,0.10)
      sleep 5
      #tap_object(1005,1155)
      if exists{remove_promo_icon}
        remove_promo_icon.click
        puts "Remove icon was clicked."
      end


    end

    it 'tc19: should be able to delete gift card',:tc19 do

      $objData.insertTestData('CHECKOUT','TC19')
      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      puts "zip code: #{$zipCode}"
      puts "promo code: #{$promoCode}"
      puts "giftTrade card: #{$giftTradeCard}"
      puts "pur cc: #{$purRC}"
      puts "credit card type: #{$creditCardType}"

      close_new_user_tutorial
      user_login_and_sku_search($userType,$skuNumber,true)
      allow_access_device_location(false)
      sleep 15
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      pdp_checkout_now.click
      sleep 40
      page_scroll_down(0.50,0.30)
      page_scroll_down(0.30,0.50)

      @gift_card_or_trade_card = $giftTradeCard
      if @gift_card_or_trade_card != ''
        my_wallet_icon.click
        gc_number = @gift_card_or_trade_card.split('#')[0]
        gc_pin = @gift_card_or_trade_card.split('#')[1]
        enter_gift_trade_card(gc_number,gc_pin)

        if exists{remove_gc_icon}
          remove_gc_icon.click
          puts "Gift card remove icon is clicked."
          sleep 5
        end

      end



    end


    it 'tc20: Authenticated user pay using Gift Card',:tc20 do

      $objData.insertTestData('CHECKOUT','TC20')
      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      puts "zip code: #{$zipCode}"
      puts "promo code: #{$promoCode}"
      puts "giftTrade card: #{$giftTradeCard}"
      puts "pur cc: #{$purRC}"
      puts "credit card type: #{$creditCardType}"

      close_new_user_tutorial
      #guest_user_only('952040',true)
      user_login_and_sku_search($userType,$skuNumber,true)
      allow_access_device_location(false)
      sleep 15
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      pdp_checkout_now.click
      sleep 40
      checkout_page('',$giftTradeCard,'','gc','','Accept')


    end

    it 'tc21: Guest user with Name/Surname have spaces',:tc21 do

      $objData.insertTestData('CHECKOUT','TC21')
      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      puts "zip code: #{$zipCode}"
      puts "promo code: #{$promoCode}"
      puts "giftTrade card: #{$giftTradeCard}"
      puts "pur cc: #{$purRC}"
      puts "credit card type: #{$creditCardType}"

      close_new_user_tutorial
      #guest_user_only('952040',true)
      user_login_and_sku_search($userType,$skuNumber,true)
      allow_access_device_location(false)
      sleep 15
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      pdp_checkout_now.click
      sleep 40
      checkout_page('',$giftTradeCard,'','gc','','Mike Tyson II')

    end

    it 'tc22: should place an order using trade card and gift card.',:tc22 do

      $objData.insertTestData('CHECKOUT','TC22')
      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      puts "zip code: #{$zipCode}"
      puts "promo code: #{$promoCode}"
      puts "giftTrade card: #{$giftTradeCard}"
      puts "pur cc: #{$purRC}"
      puts "credit card type: #{$creditCardType}"

      close_new_user_tutorial
      #guest_user_only('952040',true)
      user_login_and_sku_search($userType,$skuNumber,true)
      allow_access_device_location(false)
      sleep 15
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      pdp_checkout_now.click
      sleep 40
      checkout_page('',$giftTradeCard,$purRC,'gc','','Accept')


    end

  end

  context 'BOPS' do
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

  end



  context 'HOPS' do
    it 'tc01: should place New PreOrder product as GU',:tc01 do
      $objData.insertTestData('HOPS','TC01')
      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      puts "zip code: #{$zipCode}"
      puts "promo code: #{$promoCode}"
      puts "giftTrade card: #{$giftTradeCard}"
      puts "pur cc: #{$purRC}"
      puts "credit card type: #{$creditCardType}"

      close_new_user_tutorial
      #guest_user_only('100161','true')
      user_login_and_sku_search($userType,$skuNumber,true)
      allow_access_device_location(true)
      page_scroll_down(0.50, 0.40)
      search_for_available_store($zipCode,1005,403,false) # tap 'Hebron Parkway' with x and y coordinates.
      hops_your_details_page
      edit_hops_details_page
      yourDetails_Finish_button.click
      #C sleep 15
      love_this_app_alert_msg
      continue_buttonHops.click



    end

    #Covers TCID: [139940,139945]
    it 'tc02: should place Download condition product as AU',:tc02 do
      $objData.insertTestData('HOPS','TC02')
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
      search_for_available_store($zipCode,1005,403,false) # tap 'Hebron Parkway' with x and y coordinates.
      hops_your_details_page
      yourDetails_Finish_button.click
      #C sleep 15
      love_this_app_alert_msg
      continue_buttonHops.click


    end


    it 'tc03: should place Pre_owned product as Purbasic user',:tc03 do
      $objData.insertTestData('HOPS','TC03')
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
      search_for_available_store($zipCode,1005,403,false) # tap 'Hebron Parkway' with x and y coordinates.
      hops_your_details_page
      yourDetails_Finish_button.click
      #C sleep 15
      love_this_app_alert_msg
      continue_buttonHops.click



    end

    #Covers TCID: [139942,139943]
    it 'tc04: should place Refurbished condition product as Nonpur user',:tc04 do
      $objData.insertTestData('HOPS','TC04')
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
      search_for_available_store($zipCode,1005,403,false) # tap 'Hebron Parkway' with x and y coordinates.
      hops_your_details_page
      yourDetails_Finish_button.click
      #C sleep 15
      love_this_app_alert_msg
      continue_buttonHops.click


    end

    #Covers TCID: [139941]
    it 'tc05: should place New condition product as Purpro user',:tc05 do
      $objData.insertTestData('HOPS','TC05')
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
      search_for_available_store($zipCode,1005,403,false) # tap 'Hebron Parkway' with x and y coordinates.
      hops_your_details_page
      yourDetails_Finish_button.click
      #C sleep 15
      love_this_app_alert_msg
      continue_buttonHops.click


    end

    #Covers TCID: [139944]
    it 'tc06: should place New PreOrder product as AU',:tc06 do
      $objData.insertTestData('HOPS','TC06')
      puts "user type: #{$userType}"
      puts "sku number: #{$skuNumber}"
      puts "zip code: #{$zipCode}"
      puts "promo code: #{$promoCode}"
      puts "giftTrade card: #{$giftTradeCard}"
      puts "pur cc: #{$purRC}"
      puts "credit card type: #{$creditCardType}"

      close_new_user_tutorial
      user_login_and_sku_search($userType,$skuNumber,true)
      allow_access_device_location(true)
      search_for_available_store($zipCode,1005,403,false) # tap 'Hebron Parkway' with x and y coordinates.
      hops_your_details_page
      yourDetails_Finish_button.click
      #C sleep 15
      love_this_app_alert_msg
      continue_buttonHops.click



    end

  end



  context 'DASHBOARD' do

    it 'should view Dashboard menu as GUEST',:tc01 do


      user_login_only('GUEST')
      sleep 5
      hamburger_menu.click
      # if exists{new_user_tutorial}
      #   new_user_tutorial.click
      #   sleep 5
      # else
      #   tap_object(540,960)
      # end
      page_scroll_down(0.50,0.20)
      expect(exists{sign_in_option}).to eq(true)
      expect(exists{pur_option}).to eq(true)
      expect(exists{messages_option}).to eq(true)
      expect(exists{preorder_option}).to eq(false)
      expect(exists{save_trades_option}).to eq(false)
      expect(exists{active_offers_option}).to eq(false)
      expect(exists{gi_news_option}).to eq(true)
      expect(exists{my_library_option}).to eq(false)
      expect(exists{digital_locker_option}).to eq(false)
      expect(exists{settings_option}).to eq(true)
      expect(exists{about_feedback_option}).to eq(true)
      expect(exists{sign_out_option}).to eq(false)

    end

    it 'should view Dashboard menu as NonPur',:tc02 do


      user_login_only('ECPNONPUR')
      sleep 5
      hamburger_menu.click
      if exists{new_user_tutorial}
        new_user_tutorial.click
        sleep 5
      else
        tap_object(540,960)
      end
      page_scroll_down(0.50,0.20)
      expect(exists{sign_in_option}).to eq(false)
      expect(exists{pur_option}).to eq(true)
      expect(exists{messages_option}).to eq(false)
      expect(exists{preorder_option}).to eq(false)
      expect(exists{save_trades_option}).to eq(true)
      expect(exists{active_offers_option}).to eq(false)
      expect(exists{gi_news_option}).to eq(true)
      expect(exists{my_library_option}).to eq(false)
      expect(exists{digital_locker_option}).to eq(false)
      expect(exists{settings_option}).to eq(true)
      expect(exists{about_feedback_option}).to eq(true)
      expect(exists{sign_out_option}).to eq(true)


    end

    it 'should view Dashboard menu as PurPro',:tc03 do


      user_login_only('ECPPRO')
      sleep 5
      hamburger_menu.click
      if exists{new_user_tutorial}
        new_user_tutorial.click
        sleep 5
      else
        tap_object(540,960)
      end
      page_scroll_down(0.50,0.20)
      expect(exists{sign_in_option}).to eq(false)
      expect(exists{pur_option}).to eq(true)
      expect(exists{messages_option}).to eq(false)
      expect(exists{preorder_option}).to eq(true)
      expect(exists{save_trades_option}).to eq(true)
      expect(exists{active_offers_option}).to eq(true)
      expect(exists{gi_news_option}).to eq(true)
      expect(exists{my_library_option}).to eq(true)
      expect(exists{digital_locker_option}).to eq(true)
      expect(exists{settings_option}).to eq(true)
      expect(exists{about_feedback_option}).to eq(true)
      expect(exists{sign_out_option}).to eq(true)


    end

    it 'should view Dashboard menu as PurPlayer',:tc04 do


      user_login_only('ECPPLAYER')
      sleep 5
      hamburger_menu.click
      if exists{new_user_tutorial}
        new_user_tutorial.click
        sleep 5
      else
        tap_object(540,960)
      end
      page_scroll_down(0.50,0.20)
      expect(exists{sign_in_option}).to eq(false)
      expect(exists{pur_option}).to eq(true)
      expect(exists{messages_option}).to eq(false)
      expect(exists{preorder_option}).to eq(true)
      expect(exists{save_trades_option}).to eq(true)
      expect(exists{active_offers_option}).to eq(true)
      expect(exists{gi_news_option}).to eq(true)
      expect(exists{my_library_option}).to eq(true)
      expect(exists{digital_locker_option}).to eq(true)
      expect(exists{settings_option}).to eq(true)
      expect(exists{about_feedback_option}).to eq(true)
      expect(exists{sign_out_option}).to eq(true)


    end
  end


  context 'MY_HOME_STORE' do

    it 'tc01: should select preferred home store location as GU',:tc01 do

      $objData.insertTestData('MYHOMESTORE','TC01')
      puts "user type:#{$userType}"
      puts "zip code: #{$zipCode}"
      puts "sku number: #{$skuNumber}"


      sleep 10
      stores_icon.click
      allow_access_device_location(true)
      store_finder_field.click
      store_finder_field.send_keys($zipCode)
      keypad_search_button_tap
      sleep 10
      store_map_list.click
      sleep 2
      #selected_home_store.click
      tap_store_location(237,291)
      sleep 4
      @store_title = store_title.text
      set_as_home_store.click
      sleep 2
      expect(set_as_home_store.text).to eq("YOUR HOME STORE")
      while !exists{hamburger_menu}
        back
      end
      sku_item_search($skuNumber)
      sleep 5
      expect(pdp_store_name.text).to eq(@store_title)

    end

    it 'tc02: should select preferred home store location as AU',:tc02 do

      $objData.insertTestData('MYHOMESTORE','TC02')
      puts "user type:#{$userType}"
      puts "zip code: #{$zipCode}"
      puts "sku number: #{$skuNumber}"

      user_login_only($userType)
      sleep 10
      stores_icon.click
      allow_access_device_location(true)
      store_finder_field.click
      store_finder_field.send_keys($zipCode)
      keypad_search_button_tap
      sleep 10
      store_map_list.click
      sleep 2
      tap_store_location(237,491)
      sleep 4
      @store_title = store_title.text
      set_as_home_store.click
      sleep 2
      expect(set_as_home_store.text).to eq("YOUR HOME STORE")
      while !exists{hamburger_menu}
        back
      end
      sku_item_search($skuNumber)
      sleep 5
      expect(pdp_store_name.text).to eq(@store_title)


    end

  end

  context 'MY_LIBRARY' do

    it 'tc01: move item from I HAD > I WANT > I HAVE tab',:tc01 do

      $objData.insertTestData('MYLIBRARY','TC01')
      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"

      close_new_user_tutorial
      user_login_only($userType)
      hamburger_menu.click
      close_new_user_dashboard_tutorial
      sleep 2
      page_scroll_down(0.50,0.30)
      my_library_auth.click
      sleep 3
      tap_object(540, 960)
      i_had_tab.click
      sleep 5
      while exists{lib_prod_list_menu}
        lib_prod_list_menu.click
        sleep 3
        lib_menu_delete.click
        sleep 7
      end
      expect(search_empty_result.text).to eq("You have no items in this Game Library list.")
      my_library_add_item.click
      sku_item_search_noTapSearchIcon($skuNumber)
      @product_title = prod_var_title.text
      my_library_corner_label.click
      sleep 5
      i_had_tab2.click
      sleep 7
      page_scroll_down(0.50, 0.80)
      sleep 2
      page_scroll_down(0.80, 0.50)
      sleep 5
      view_my_lib_button.click
      sleep 7
      #expect(lib_prod_name[0].text).to eq('Need for Speed: Most Wanted')
      expect(lib_prod_name[0].text).to eq(@product_title)
      sleep 7
      lib_prod_list_menu.click
      sleep 3
      lib_menu_i_want.click
      sleep 7
      expect(search_empty_result.text).to eq("You have no items in this Game Library list.")
      i_want_tab.click
      sleep 7
      #expect(lib_prod_name[0].text).to eq('Need for Speed: Most Wanted')
      expect(lib_prod_name[0].text).to eq(@product_title)
      sleep 7
      lib_prod_list_menu.click
      sleep 3
      lib_menu_i_have.click
      sleep 7
      expect(search_empty_result.text).to eq("You have no items in this Game Library list.")
      i_have_tab.click
      sleep 7
      #expect(lib_prod_name[0].text).to eq('Need for Speed: Most Wanted')
      expect(lib_prod_name[0].text).to eq(@product_title)
      while exists{lib_prod_list_menu}
        lib_prod_list_menu.click
        sleep 3
        lib_menu_delete.click
        sleep 7
      end
      expect(search_empty_result.text).to eq("You have no items in this Game Library list.")



    end

    it 'tc02: can add and delete item under I HAVE as AU',:tc02 do

      $objData.insertTestData('MYLIBRARY','TC02')
      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"

      close_new_user_tutorial
      user_login_only($userType)
      hamburger_menu.click
      close_new_user_dashboard_tutorial
      sleep 2
      page_scroll_down(0.50,0.30)
      my_library_auth.click
      sleep 3
      tap_object(540, 960)
      i_have_tab.click
      sleep 5
      while exists{lib_prod_list_menu}
        lib_prod_list_menu.click
        sleep 3
        lib_menu_delete.click
        sleep 7
      end
      expect(search_empty_result.text).to eq("You have no items in this Game Library list.")
      my_library_add_item.click
      sku_item_search_noTapSearchIcon($skuNumber)
      @product_title = prod_var_title.text
      my_library_corner_label.click
      sleep 5
      i_have_tab2.click
      sleep 7
      page_scroll_down(0.50, 0.80)
      sleep 2
      page_scroll_down(0.80, 0.50)
      sleep 5
      view_my_lib_button.click
      sleep 7
      #expect(lib_prod_name[0].text).to eq('Need for Speed: Most Wanted')
      expect(lib_prod_name[0].text).to eq(@product_title)
      sleep 7
      lib_prod_list_menu.click
      sleep 3
      lib_menu_delete.click
      sleep 7
      expect(search_empty_result.text).to eq("You have no items in this Game Library list.")

    end

    it 'tc03: move item from I WANT > I HAD > I HAVE tab',:tc03 do

      $objData.insertTestData('MYLIBRARY','TC03')
      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      close_new_user_tutorial
      user_login_only($userType)
      hamburger_menu.click
      close_new_user_dashboard_tutorial
      sleep 2
      page_scroll_down(0.50,0.30)
      my_library_auth.click
      sleep 3
      tap_object(540, 960)
      i_want_tab.click # to be change
      sleep 5
      while exists{lib_prod_list_menu}
        lib_prod_list_menu.click
        sleep 3
        lib_menu_delete.click
        sleep 7
      end
      expect(search_empty_result.text).to eq("You have no items in this Game Library list.")
      my_library_add_item.click
      sku_item_search_noTapSearchIcon($skuNumber)
      @product_title = prod_var_title.text
      my_library_corner_label.click
      sleep 5
      i_want_tab2.click # to be change
      sleep 7
      page_scroll_down(0.50, 0.80)
      sleep 2
      page_scroll_down(0.80, 0.50)
      sleep 5
      view_my_lib_button.click
      sleep 7
      #expect(lib_prod_name[0].text).to eq('Need for Speed: Most Wanted')
      expect(lib_prod_name[0].text).to eq(@product_title)
      sleep 7
      lib_prod_list_menu.click
      sleep 3
      lib_menu_i_had.click # to be change
      sleep 7
      expect(search_empty_result.text).to eq("You have no items in this Game Library list.")
      i_had_tab.click # to be change
      sleep 7
      #expect(lib_prod_name[0].text).to eq('Need for Speed: Most Wanted')
      expect(lib_prod_name[0].text).to eq(@product_title)
      sleep 7
      lib_prod_list_menu.click
      sleep 3
      lib_menu_i_have.click # to be change
      sleep 7
      expect(search_empty_result.text).to eq("You have no items in this Game Library list.")
      i_have_tab.click
      sleep 7
      #expect(lib_prod_name[0].text).to eq('Need for Speed: Most Wanted')
      expect(lib_prod_name[0].text).to eq(@product_title)
      while exists{lib_prod_list_menu}
        lib_prod_list_menu.click
        sleep 3
        lib_menu_delete.click
        sleep 7
      end
      expect(search_empty_result.text).to eq("You have no items in this Game Library list.")



    end

    it 'tc04: move item from I HAVE > I WANT > I HAD tab',:tc04 do

      $objData.insertTestData('MYLIBRARY','TC04')
      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      close_new_user_tutorial
      user_login_only($userType)
      hamburger_menu.click
      close_new_user_dashboard_tutorial
      sleep 2
      page_scroll_down(0.50,0.30)
      my_library_auth.click
      sleep 3
      tap_object(540, 960)
      i_have_tab.click # to be change
      sleep 5
      while exists{lib_prod_list_menu}
        lib_prod_list_menu.click
        sleep 3
        lib_menu_delete.click
        sleep 7
      end
      expect(search_empty_result.text).to eq("You have no items in this Game Library list.")
      my_library_add_item.click
      sku_item_search_noTapSearchIcon($skuNumber)
      @product_title = prod_var_title.text
      my_library_corner_label.click
      sleep 5
      i_have_tab2.click # to be change
      sleep 7
      page_scroll_down(0.50, 0.80)
      sleep 2
      page_scroll_down(0.80, 0.50)
      sleep 5
      view_my_lib_button.click
      sleep 7
      #expect(lib_prod_name[0].text).to eq('Need for Speed: Most Wanted')
      expect(lib_prod_name[0].text).to eq(@product_title)
      sleep 7
      lib_prod_list_menu.click
      sleep 3
      lib_menu_i_want.click # to be change
      sleep 7
      expect(search_empty_result.text).to eq("You have no items in this Game Library list.")
      i_want_tab.click # to be change
      sleep 7
      #expect(lib_prod_name[0].text).to eq('Need for Speed: Most Wanted')
      expect(lib_prod_name[0].text).to eq(@product_title)
      sleep 7
      lib_prod_list_menu.click
      sleep 3
      lib_menu_i_had.click # to be change
      sleep 7
      expect(search_empty_result.text).to eq("You have no items in this Game Library list.")
      i_had_tab.click
      sleep 7
      #expect(lib_prod_name[0].text).to eq('Need for Speed: Most Wanted')
      expect(lib_prod_name[0].text).to eq(@product_title)
      while exists{lib_prod_list_menu}
        lib_prod_list_menu.click
        sleep 3
        lib_menu_delete.click
        sleep 7
      end
      expect(search_empty_result.text).to eq("You have no items in this Game Library list.")



    end

    it 'tc05: can add and delete item under I HAD as AU',:tc05 do

      $objData.insertTestData('MYLIBRARY','TC05')
      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      close_new_user_tutorial
      user_login_only($userType)
      hamburger_menu.click
      close_new_user_dashboard_tutorial
      sleep 2
      page_scroll_down(0.50,0.30)
      my_library_auth.click
      sleep 3
      tap_object(540, 960)
      i_had_tab.click
      sleep 5
      while exists{lib_prod_list_menu}
        lib_prod_list_menu.click
        sleep 3
        lib_menu_delete.click
        sleep 7
      end
      expect(search_empty_result.text).to eq("You have no items in this Game Library list.")
      my_library_add_item.click
      sku_item_search_noTapSearchIcon($skuNumber)
      @product_title = prod_var_title.text
      my_library_corner_label.click
      sleep 5
      i_had_tab2.click
      sleep 7
      page_scroll_down(0.50, 0.80)
      sleep 2
      page_scroll_down(0.80, 0.50)
      sleep 5
      view_my_lib_button.click
      sleep 7
      #expect(lib_prod_name[0].text).to eq('Need for Speed: Most Wanted')
      expect(lib_prod_name[0].text).to eq(@product_title)
      sleep 7
      lib_prod_list_menu.click
      sleep 3
      lib_menu_delete.click
      sleep 7
      expect(search_empty_result.text).to eq("You have no items in this Game Library list.")

    end

    it 'tc06: can add and delete item under I WANT as AU',:tc06 do

      $objData.insertTestData('MYLIBRARY','TC06')
      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      close_new_user_tutorial
      user_login_only($userType)
      hamburger_menu.click
      close_new_user_dashboard_tutorial
      sleep 2
      page_scroll_down(0.50,0.30)
      my_library_auth.click
      sleep 3
      tap_object(540, 960)
      i_want_tab.click
      sleep 5
      while exists{lib_prod_list_menu}
        lib_prod_list_menu.click
        sleep 3
        lib_menu_delete.click
        sleep 7
      end
      expect(search_empty_result.text).to eq("You have no items in this Game Library list.")
      my_library_add_item.click
      sku_item_search_noTapSearchIcon($skuNumber)
      @product_title = prod_var_title.text
      my_library_corner_label.click
      sleep 5
      i_want_tab2.click
      sleep 7
      page_scroll_down(0.50, 0.80)
      sleep 2
      page_scroll_down(0.80, 0.50)
      sleep 5
      view_my_lib_button.click
      sleep 7
      #expect(lib_prod_name[0].text).to eq('Need for Speed: Most Wanted')
      expect(lib_prod_name[0].text).to eq(@product_title)
      sleep 7
      lib_prod_list_menu.click
      sleep 3
      lib_menu_delete.click
      sleep 7
      expect(search_empty_result.text).to eq("You have no items in this Game Library list.")


    end

  end

  context 'PUR' do

    it 'should display PUR PRO powerup rewards pages',:tc01 do

      powerupRewards('ECPPRO')
      purAccountInfo
      purMemberActivity
      purActiveOffers
      purCardDetails
      purRewardsCenter
      purGameInformer

    end

    it 'should display PUR PLAYER powerup rewards pages',:tc02 do

      powerupRewards('ECPPLAYER')
      purAccountInfo
      purMemberActivity
      purActiveOffers
      purCardDetails
      purRewardsCenter
      purGameInformer

    end

    it 'should display NONPUR powerup rewards pages',:tc03 do

      powerupRewards('ECPNONPUR')
      pur_NonPurUsersPage

    end

    it 'should display GUEST powerup rewards pages',:tc04 do
      powerupRewards('GUEST')
      pur_GuestUsersPage

    end

    it 'should display loyalty card balance as Auth',:tc05 do
      powerupRewards('PURELITE')
      purAccountInfo
      purCardDetails
      purCardDetailsEnterPIN('0015')



    end

    it 'should redeem PUR Sweeptakes points as Auth',:tc06 do
      powerupRewards('PURELITE')
      pur_rewardsCenter.click
      sleep 10
      pur_rewardsCenter_sweepstakes.click
      sleep 10
      pur_rewardsCenter_firstListItem.click
      pur_rewardsCenter_getItNow.click
      pur_rewardsCenter_placeYourOrder.click
      sleep 10
      expect(exists{pur_confirmationNumber}).to eq(true)
      pur_continueShopping.click

    end

    it 'should redeem PUR Certificates points as Auth',:tc07 do
      powerupRewards('PURELITE')
      pur_rewardsCenter.click
      sleep 10
      pur_rewardsCenter_certificates.click
      sleep 10
      pur_rewardsCenter_firstListItem.click
      pur_rewardsCenter_getItNow.click
      pur_rewardsCenter_placeYourOrder.click
      sleep 10
      expect(exists{pur_confirmationNumber}).to eq(true)
      pur_continueShopping.click

    end

    it 'should redeem PUR Digital Currency points as Auth',:tc08 do
      powerupRewards('PURELITE')
      pur_rewardsCenter.click
      sleep 10
      pur_rewardsCenter_digitalCurrency.click
      sleep 10
      pur_rewardsCenter_firstListItem.click
      pur_rewardsCenter_getItNow.click
      pur_rewardsCenter_placeYourOrder.click
      sleep 10
      expect(exists{pur_confirmationNumber}).to eq(true)
      pur_continueShopping.click

    end

    it 'PURELITE user deprecation to PRO in PUR page',:tc09 do
      powerupRewards('PURELITE')
      expect(pur_userType.text).to eq("PRO")


    end

  end

  context 'SEARCH' do

    it 'EVS-1182: Build UI for search result sorting drop down as Guest',:tc01 do
      tap_search_icon
      sleep 5
      keypad_search_button_tap
      sleep 5
      select_from_sort_dropdown('Best Matches');
      page_scroll_down(0.50,0.30)
      select_from_sort_dropdown('Price Low To High');
      select_from_sort_dropdown('Price High to Low');
      select_from_sort_dropdown('Product Name A - Z');
      select_from_sort_dropdown('Product Name Z - A');
      select_from_sort_dropdown('Most Popular');
      select_from_sort_dropdown('Top Sellers');
      select_from_sort_dropdown('Release Date Oldest to Newest');
      select_from_sort_dropdown('Release Date Newest to Oldest');
      select_from_sort_dropdown('Most Relevant');

    end

    it 'EVS-1182: Build UI for search result sorting drop down as Pro',:tc02 do

      user_login_only('ECPPRO')
      sleep 5
      tap_search_icon
      sleep 5
      keypad_search_button_tap
      sleep 5
      select_from_sort_dropdown('Best Matches');
      page_scroll_down(0.50,0.30)
      select_from_sort_dropdown('Price Low To High');
      select_from_sort_dropdown('Price High to Low');
      select_from_sort_dropdown('Product Name A - Z');
      select_from_sort_dropdown('Product Name Z - A');
      select_from_sort_dropdown('Most Popular');
      select_from_sort_dropdown('Top Sellers');
      select_from_sort_dropdown('Release Date Oldest to Newest');
      select_from_sort_dropdown('Release Date Newest to Oldest');
      select_from_sort_dropdown('Most Relevant');

    end


    it 'EVS-1182: Build UI for search result sorting drop down as Player',:tc03 do

      user_login_only('ECPPLAYER')
      sleep 5
      tap_search_icon
      sleep 5
      keypad_search_button_tap
      sleep 5
      select_from_sort_dropdown('Best Matches');
      page_scroll_down(0.50,0.30)
      select_from_sort_dropdown('Price Low To High');
      select_from_sort_dropdown('Price High to Low');
      select_from_sort_dropdown('Product Name A - Z');
      select_from_sort_dropdown('Product Name Z - A');
      select_from_sort_dropdown('Most Popular');
      select_from_sort_dropdown('Top Sellers');
      select_from_sort_dropdown('Release Date Oldest to Newest');
      select_from_sort_dropdown('Release Date Newest to Oldest');
      select_from_sort_dropdown('Most Relevant');

    end

    it 'EVS-1182: Build UI for search result sorting drop down as NonPUR',:tc04 do

      user_login_only('ECPNONPUR')
      sleep 5
      tap_search_icon
      sleep 5
      keypad_search_button_tap
      sleep 5
      select_from_sort_dropdown('Best Matches');
      page_scroll_down(0.50,0.30)
      select_from_sort_dropdown('Price Low To High');
      select_from_sort_dropdown('Price High to Low');
      select_from_sort_dropdown('Product Name A - Z');
      select_from_sort_dropdown('Product Name Z - A');
      select_from_sort_dropdown('Most Popular');
      select_from_sort_dropdown('Top Sellers');
      select_from_sort_dropdown('Release Date Oldest to Newest');
      select_from_sort_dropdown('Release Date Newest to Oldest');
      select_from_sort_dropdown('Most Relevant');

    end


    it 'EVS-938: Search Filter UI Category/Video Games as Guest', :tc05 do
      tap_search_icon #search_icon.click
      sleep 5
      keypad_search_button_tap
      sleep 5
      filter_link.click
      select_filter('Category', 'Video Games','TextView')
      select_filter('Price', '$0 - $10', 'RadioButton')
      select_filter('Release Date', 'Available Now','CheckBox')
      # select_filter('Pickup At Store', 'Pickup at store','CheckBox')
      select_filter('Color', 'Black','TextView')
      # select_filter('Only At GameStop', 'Yes','CheckBox')
      #select_filter('Badges', 'Online Only','CheckBox')
      page_scroll_down(0.80,0.10)
      select_filter('Franchise', 'Mortal Kombat','CheckBox')
      select_filter('Condition', 'New','CheckBox')
      select_filter('ESRB Rating', 'Not Rated','CheckBox')
      select_filter('Publisher', 'PDP','CheckBox')
      page_scroll_down(0.80,0.10)
      select_filter('Availability', 'Available Now','CheckBox')
      done_filter_button.click



    end

    it 'EVS-938: Search Filter UI Category/Video Games as Pro', :tc06 do
      user_login_only('ECPPRO')
      sleep 5
      tap_search_icon #search_icon.click
      sleep 5
      keypad_search_button_tap
      sleep 5
      filter_link.click
      select_filter('Category', 'Video Games','TextView')
      select_filter('Price', '$10 - $25', 'RadioButton')
      select_filter('Release Date', 'Available Now','CheckBox')
      # select_filter('Pickup At Store', 'Pickup at store','CheckBox')
      select_filter('Color', 'White','TextView')
      # select_filter('Only At GameStop', 'Yes','CheckBox')
      #select_filter('Badges', 'Online Only','CheckBox')
      page_scroll_down(0.80,0.10)
      select_filter('Franchise', 'Pokemon','CheckBox')
      select_filter('Condition', 'New','CheckBox')
      select_filter('ESRB Rating', 'Not Rated','CheckBox')
      select_filter('Publisher', 'RDS Industries','CheckBox')
      page_scroll_down(0.80,0.10)
      select_filter('Availability', 'Pick up at store','CheckBox')
      done_filter_button.click

    end

    it 'EVS-938: Search Filter UI Category/Toys&Collectibles as Player', :tc07 do
      user_login_only('ECPPLAYER')
      sleep 5
      tap_search_icon #search_icon.click
      sleep 5
      keypad_search_button_tap
      sleep 5
      filter_link.click
      select_filter('Category', 'Toys & Collectibles','TextView')
      select_filter('Price', '$25 - $50', 'RadioButton')
      select_filter('Release Date', 'Available Now','CheckBox')
      # select_filter('Pickup At Store', 'Pickup at store','CheckBox')
      select_filter('Color', 'Black','TextView')
      # select_filter('Only At GameStop', 'Yes','CheckBox')
      #select_filter('Badges', 'Online Only','CheckBox')
      page_scroll_down(0.80,0.10)
      select_filter('Franchise', 'Batman','CheckBox')
      # select_filter('Condition', 'New','CheckBox')
      # select_filter('ESRB Rating', 'Not Rated','CheckBox')
      # select_filter('Publisher', 'RDS Industries','CheckBox')
      page_scroll_down(0.80,0.10)
      select_filter('Availability', 'Pre-release','CheckBox')
      done_filter_button.click

    end

    it 'EVS-938: Search Filter UI Category/Clothing as NonPur', :tc08 do
      user_login_only('ECPNONPUR')
      sleep 5
      tap_search_icon #search_icon.click
      sleep 5
      keypad_search_button_tap
      sleep 5
      filter_link.click
      select_filter('Category', 'Clothing','TextView')
      select_filter('Price', '$25 - $50', 'RadioButton')
      select_filter('Release Date', 'Available Now','CheckBox')
      # select_filter('Pickup At Store', 'Pickup at store','CheckBox')
      select_filter('Color', 'Black','TextView')
      # select_filter('Only At GameStop', 'Yes','CheckBox')
      #select_filter('Badges', 'Online Only','CheckBox')
      page_scroll_down(0.80,0.10)
      select_filter('Franchise', 'Batman','CheckBox')
      # select_filter('Condition', 'New','CheckBox')
      # select_filter('ESRB Rating', 'Not Rated','CheckBox')
      # select_filter('Publisher', 'RDS Industries','CheckBox')
      page_scroll_down(0.80,0.10)
      select_filter('Availability', 'Pick up at store','CheckBox')
      select_filter('Size', '2X-Large','CheckBox')
      done_filter_button.click

    end

    it 'EVS-938: Search Filter UI Category/Electronics as Guest', :tc09 do
      #user_login_only('ECPNONPUR')
      #sleep 5
      tap_search_icon #search_icon.click
      sleep 5
      keypad_search_button_tap
      sleep 5
      filter_link.click
      select_filter('Category', 'Electronics','TextView')
      select_filter('Price', '$25 - $50', 'RadioButton')
      select_filter('Release Date', 'Available Now','CheckBox')
      # select_filter('Pickup At Store', 'Pickup at store','CheckBox')
      select_filter('Color', 'Black','TextView')
      # select_filter('Only At GameStop', 'Yes','CheckBox')
      #select_filter('Badges', 'Online Only','CheckBox')
      page_scroll_down(0.80,0.10)
      select_filter('Franchise', 'Fallout','CheckBox')
      # select_filter('Condition', 'New','CheckBox')
      # select_filter('ESRB Rating', 'Not Rated','CheckBox')
      # select_filter('Publisher', 'RDS Industries','CheckBox')
      page_scroll_down(0.80,0.10)
      select_filter('Availability', 'Pick up at store','CheckBox')
      #select_filter('Size', '2X-Large','CheckBox')
      done_filter_button.click

    end

    it 'EVS-938: Search Filter UI Category/Accessories as Pro', :tc10 do
      user_login_only('ECPPRO')
      sleep 5
      tap_search_icon #search_icon.click
      sleep 5
      keypad_search_button_tap
      sleep 5
      filter_link.click
      select_filter('Category', 'Accessories','TextView')
      select_filter('Price', '$25 - $50', 'RadioButton')
      select_filter('Release Date', 'Available Now','CheckBox')
      # select_filter('Pickup At Store', 'Pickup at store','CheckBox')
      select_filter('Color', 'Black','TextView')
      # select_filter('Only At GameStop', 'Yes','CheckBox')
      #select_filter('Badges', 'Online Only','CheckBox')
      # page_scroll_down(0.80,0.10)
      # select_filter('Franchise', 'Fallout','CheckBox')
      # select_filter('Condition', 'New','CheckBox')
      # select_filter('ESRB Rating', 'Not Rated','CheckBox')
      # select_filter('Publisher', 'RDS Industries','CheckBox')
      #page_scroll_down(0.80,0.10)
      select_filter('Availability', 'Pick up at store','CheckBox')
      #select_filter('Size', '2X-Large','CheckBox')
      done_filter_button.click

    end

    it 'EVS-938: Search Filter UI Category/Premiums as Player', :tc11 do
      user_login_only('ECPPLAYER')
      sleep 5
      tap_search_icon #search_icon.click
      sleep 5
      keypad_search_button_tap
      sleep 5
      filter_link.click
      select_filter('Category', 'Premiums','TextView')
      select_filter('Price', '$0 - $10', 'RadioButton')
      select_filter('Release Date', 'Available Now','CheckBox')
      # select_filter('Pickup At Store', 'Pickup at store','CheckBox')
      #select_filter('Color', 'Black','TextView')
      # select_filter('Only At GameStop', 'Yes','CheckBox')
      #select_filter('Badges', 'Online Only','CheckBox')
      # page_scroll_down(0.80,0.10)
      # select_filter('Franchise', 'Fallout','CheckBox')
      # select_filter('Condition', 'New','CheckBox')
      # select_filter('ESRB Rating', 'Not Rated','CheckBox')
      # select_filter('Publisher', 'RDS Industries','CheckBox')
      #page_scroll_down(0.80,0.10)
      select_filter('Availability', 'Available Now','CheckBox')
      #select_filter('Size', '2X-Large','CheckBox')
      done_filter_button.click

    end

    it 'EVS-938: Search Filter UI Category/Deals as NonPUR', :tc12 do
      user_login_only('ECPNONPUR')
      sleep 5
      tap_search_icon #search_icon.click
      sleep 5
      keypad_search_button_tap
      sleep 5
      filter_link.click
      select_filter('Category', 'Deals','TextView')
      select_filter('Price', '$10 - $25', 'RadioButton')
      select_filter('Release Date', 'Available Now','CheckBox')
      # select_filter('Pickup At Store', 'Pickup at store','CheckBox')
      #select_filter('Color', 'Black','TextView')
      # select_filter('Only At GameStop', 'Yes','CheckBox')
      #select_filter('Badges', 'Online Only','CheckBox')
      # page_scroll_down(0.80,0.10)
      # select_filter('Franchise', 'Fallout','CheckBox')
      # select_filter('Condition', 'New','CheckBox')
      # select_filter('ESRB Rating', 'Not Rated','CheckBox')
      # select_filter('Publisher', 'RDS Industries','CheckBox')
      #page_scroll_down(0.80,0.10)
      select_filter('Availability', 'Available Now','CheckBox')
      #select_filter('Size', '2X-Large','CheckBox')
      done_filter_button.click

    end

    it 'EVS-938: Search Filter UI Category/Gift Cards as PURELITE', :tc13 do
      user_login_only('PURELITE')
      sleep 5
      tap_search_icon #search_icon.click
      sleep 5
      keypad_search_button_tap
      sleep 5
      filter_link.click
      select_filter('Category', 'Gift Cards','TextView')
      select_filter('Price', '$10 - $25', 'RadioButton')
      select_filter('Release Date', 'Available Now','CheckBox')
      # select_filter('Pickup At Store', 'Pickup at store','CheckBox')
      #select_filter('Color', 'Black','TextView')
      # select_filter('Only At GameStop', 'Yes','CheckBox')
      #select_filter('Badges', 'Online Only','CheckBox')
      # page_scroll_down(0.80,0.10)
      # select_filter('Franchise', 'Fallout','CheckBox')
      # select_filter('Condition', 'New','CheckBox')
      # select_filter('ESRB Rating', 'Not Rated','CheckBox')
      # select_filter('Publisher', 'RDS Industries','CheckBox')
      #page_scroll_down(0.80,0.10)
      select_filter('Availability', 'Available Now','CheckBox')
      #select_filter('Size', '2X-Large','CheckBox')
      done_filter_button.click

    end

    it 'EVS-938: Search Filter UI Category/Reservation SKUs as Guest', :tc14 do
      # user_login_only('PURELITE')
      # sleep 5
      tap_search_icon #search_icon.click
      sleep 5
      keypad_search_button_tap
      sleep 5
      filter_link.click
      select_filter('Category', 'Reservation SKUs','TextView')
      select_filter('Price', '$25 - $50', 'RadioButton')
      select_filter('Release Date', 'Available Now','CheckBox')
      # select_filter('Pickup At Store', 'Pickup at store','CheckBox')
      #select_filter('Color', 'Black','TextView')
      # select_filter('Only At GameStop', 'Yes','CheckBox')
      #select_filter('Badges', 'Online Only','CheckBox')
      # page_scroll_down(0.80,0.10)
      # select_filter('Franchise', 'Fallout','CheckBox')
      # select_filter('Condition', 'New','CheckBox')
      # select_filter('ESRB Rating', 'Not Rated','CheckBox')
      # select_filter('Publisher', 'RDS Industries','CheckBox')
      #page_scroll_down(0.80,0.10)
      select_filter('Availability', 'Pick up at store','CheckBox')
      #select_filter('Size', '2X-Large','CheckBox')
      done_filter_button.click

    end

  end

  context 'TRADE' do

    it 'tc01: should save trade for games as nonpur',:tc01 do

      user_login_only('ECPNONPUR')
      sleep 10
      trade_tab.click
      find_trade_values_tab.click
      sleep 5
      tap_object(515,1657) # This closes Trade Center screen.
      sleep 5
      games_tile.click
      trade_item_search('Call of Duty','GAMES')
      save_estimate_button.click
      sleep 10
      expect(saved_trade_message.text).to eq('Estimate Saved!')




    end

    #Covers TCID: [139947]
    it 'tc02: should save trade for consoles as purbasic',:tc02 do

      user_login_only('ECPPLAYER')
      sleep 10
      trade_tab.click
      find_trade_values_tab.click
      sleep 5
      tap_object(515,1657) # This closes Trade Center screen.
      sleep 5
      consoles_tile.click
      trade_item_search('Xbox','CONSOLES')
      save_estimate_button.click
      sleep 10
      expect(saved_trade_message.text).to eq('Estimate Saved!')


    end

    #Covers TCID: [40925,40933]
    it 'tc03: should save trade for electronics as purpro',:tc03 do


      user_login_only('ECPPRO')
      sleep 10
      trade_tab.click
      find_trade_values_tab.click
      sleep 5
      tap_object(515,1657) # This closes Trade Center screen.
      sleep 5
      electronics_tile.click
      trade_item_search('Samsung','ELECTRONICS')
      sleep 5
      electronic_chooseYourProduct_listItem.click
      sleep 3
      tap_object(515,1657)
      save_estimate_button.click
      sleep 10
      expect(saved_trade_message.text).to eq('Estimate Saved!')



    end

    #Covers TCID: [139949]
    it 'tc04: should save trade for accessories as PURBASIC',:tc04 do

      user_login_only('ECPPLAYER')
      sleep 10
      trade_tab.click
      find_trade_values_tab.click
      sleep 5
      tap_object(515,1657) # This closes Trade Center screen.
      sleep 5
      accessories_tile.click
      trade_item_search('Kinect','ACCESSORIES')
      save_estimate_button.click
      sleep 10
      expect(saved_trade_message.text).to eq('Estimate Saved!')



    end

    #Covers TCID: []
    it 'tc05: should delete 1 Active and then All trades',:tc05 do

      user_login_only('ECPPLAYER')
      sleep 10
      trade_tab.click
      view_saved_trades_link.click
      sleep 10
      edit_trade_button.click
      sleep 3
      #saved_trades_listview_item.click
      tap_object(644,577)
      delete_button.click
      sleep 7
      select_all_button.click
      delete_button.click
      sleep 7
      expect(no_saved_trade_message.text).to eq('You have no saved trades.')



    end

  end


  context 'AGEGATE' do

    it 'should not add item to cart Age below 18 GU',:tc01 do

      $objData.insertTestData('AGEGATE','TC01')
      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      puts "zip code: #{$zipCode}"
      puts "promo code: #{$promoCode}"
      puts "giftTrade card: #{$giftTradeCard}"
      puts "pur cc: #{$purRC}"
      puts "credit card type: #{$creditCardType}"

      close_new_user_tutorial
      user_login_and_logout($userType.split(",")[0])
      #guest_user_only('930705',true)
      user_login_and_sku_search($userType.split(",")[1],$skuNumber,true)
      allow_access_device_location(false)
      sleep 10
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      age_older_than_17('No')
      cart_icon.click
      sleep 10
      expect(exists{cart_item_remove_link[0]}).to eq(false)
      press_keycode(4)
      allow_access_device_location(false)
      sleep 10
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      age_older_than_17('Yes')
      pdp_checkout_now.click
      sleep 40

      checkout_page('',$giftTradeCard,'','cc',$creditCardType,'Accept')


    end

    #Covers TCID: [69593,91464,69659]
    it 'should add item to cart Age 18 and above, PURBASIC user', :tc02 do

      $objData.insertTestData('AGEGATE','TC02')
      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      puts "zip code: #{$zipCode}"
      puts "promo code: #{$promoCode}"
      puts "giftTrade card: #{$giftTradeCard}"
      puts "pur cc: #{$purRC}"
      puts "credit card type: #{$creditCardType}"

      close_new_user_tutorial
      user_login_and_sku_search($userType,$skuNumber,true)
      allow_access_device_location(false)
      sleep 10
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      age_older_than_17('Yes')
      pdp_continue_shopping.click
      cart_icon.click
      sleep 10
      expect(exists{cart_item_remove_link[0]}).to eq(true)
      press_keycode(4)
      allow_access_device_location(false)
      sleep 10
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      #age_older_than_17('Yes')
      pdp_checkout_now.click
      sleep 40

      checkout_page($promoCode,'','','cc',$creditCardType,'Accept')

    end

    #Covers TCID: [91496,91456]
    it 'should prompt ageGate again after App closed/restart', :tc03 do #App crash

      $objData.insertTestData('AGEGATE','TC03')
      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      puts "zip code: #{$zipCode}"
      puts "promo code: #{$promoCode}"
      puts "giftTrade card: #{$giftTradeCard}"
      puts "pur cc: #{$purRC}"
      puts "credit card type: #{$creditCardType}"

      close_new_user_tutorial
      user_login_and_logout($userType.split(",")[0])
      #guest_user_only('930705',true)
      user_login_and_sku_search($userType.split(",")[1],$skuNumber,true)
      allow_access_device_location(false)
      sleep 10
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      age_older_than_17('Yes')
      sleep 10
      pdp_continue_shopping.click
      cart_icon.click
      sleep 10
      expect(exists{cart_item_remove_link[0]}).to eq(true)
      press_keycode(4)
      restart_app
      sleep 15
      page_scroll_sidewards(0.90,0.10)
      sleep 5
      page_scroll_sidewards(0.10,0.90)
      tap_cart_icon
      sleep 5
      #cart_icon.click
      cart_header_checkout_button.click
      age_older_than_17('Yes')
      sleep 40

      checkout_page('',$giftTradeCard,'','cc',$creditCardType,'Accept')

    end

    #Covers TCID: [87541,87538,87539]
    it 'should only delete Mature products in cart', :tc04 do

      $objData.insertTestData('AGEGATE','TC04')
      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      puts "zip code: #{$zipCode}"
      puts "promo code: #{$promoCode}"
      puts "giftTrade card: #{$giftTradeCard}"
      puts "pur cc: #{$purRC}"
      puts "credit card type: #{$creditCardType}"

      close_new_user_tutorial
      user_login_and_sku_search($userType,$skuNumber.split(",")[0],true)
      allow_access_device_location(false)
      sleep 10
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      age_older_than_17('Yes')
      pdp_continue_shopping.click

      sku_item_search($skuNumber.split(",")[1])
      allow_access_device_location(false)
      sleep 10
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      pdp_continue_shopping.click

      sku_item_search($skuNumber.split(",")[2])
      allow_access_device_location(false)
      sleep 10
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      pdp_continue_shopping.click
      back_to_home_page
      log_out
      user_login_only($userType)

      sleep 15
      page_scroll_sidewards(0.90,0.10)
      sleep 5
      page_scroll_sidewards(0.10,0.90)
      tap_cart_icon
      sleep 5
      cart_header_checkout_button.click
      age_older_than_17('No')
      yes_or_ok_link.click
      sleep 5
      expect(cart_header_count.text).to eq("2 items in cart")
      cart_header_checkout_button.click
      sleep 40

      checkout_page('',$giftTradeCard,'','cc',$creditCardType,'Accept')




    end


    #Covers TCID: [91501,91455,91457,91492,91506,91512,91533]
    it 'should prompt ageGate once logout and login again', :tc05 do # issue in the cc checkout

      $objData.insertTestData('AGEGATE','TC05')
      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      puts "zip code: #{$zipCode}"
      puts "promo code: #{$promoCode}"
      puts "giftTrade card: #{$giftTradeCard}"
      puts "pur cc: #{$purRC}"
      puts "credit card type: #{$creditCardType}"

      close_new_user_tutorial
      user_login_and_sku_search($userType,$skuNumber,true)
      allow_access_device_location(false)
      sleep 10
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      age_older_than_17('Yes')
      pdp_continue_shopping.click
      cart_icon.click
      sleep 10
      expect(exists{cart_item_remove_link[0]}).to eq(true)
      press_keycode(4)
      allow_access_device_location(false)
      sleep 10
      back_to_home_page
      log_out

      user_login_and_sku_search($userType,$skuNumber,true)
      allow_access_device_location(false)
      sleep 10
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      age_older_than_17('Yes')
      #button_to_click('CHECKOUT NOW')
      pdp_checkout_now.click
      sleep 40

      checkout_page($promoCode,'','','cc',$creditCardType,'Accept')

    end

  end


  context 'Cart' do

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
      sleep 10
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
      click_add_to_cart_button
      pdp_continue_shopping.click
      sleep 5
      cart_icon.click
      sleep 10
      expect(cart_header_count.text).to eq("1 item in cart")

    end

  end




  context 'ERROR CHECK' do

    it 'tc01: should prompt error for invalid input billing address as GU',:tc01 do

      $objData.insertTestData('ERRORCHECK','TC01')
      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      puts "zip code: #{$zipCode}"

      close_new_user_tutorial
      #guest_user_only('952007',true) #PreOwned
      user_login_and_sku_search($userType,$skuNumber,true)
      allow_access_device_location(false)
      sleep 15
      #page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      pdp_checkout_now.click
      sleep 40
      page_scroll_down(0.50,0.30)
      page_scroll_down(0.30,0.50)
      if (confirmation_shipping_info.text == 'Shipping Information')
        summ_shipping_information_link.click
        sleep 10
      end

      #BLANK INPUTS
      enter_new_billing_address2('','','','','','','','','')
      expect(shipping_first_name.text).to eq('First Name')

      #INVALID FIRST NAME
      enter_new_billing_address2('!@#$%','tester','United States of America','625 WESTPORT PRKWY','GRAPEVINE','Texas','76051','2141234123','francisbarro@gamestop.com')
      expect(alert_message.text).to eq("Please enter a valid FirstName.Special characters are not allowed.")
      sleep 2
      yes_or_ok_link.click

      #INVALID LAST NAME
      enter_new_billing_address2('Accept','!@#$%','United States of America','625 WESTPORT PRKWY','GRAPEVINE','Texas','76051','2141234123','francisbarro@gamestop.com')
      expect(alert_message.text).to eq("Please enter a valid LastName.Special characters are not allowed.")
      sleep 2
      yes_or_ok_link.click
      page_scroll_down(0.40,0.10)

      #INVALID ADDRESS
      enter_new_billing_address2('Accept','tester','United States of America','!@#$%','GRAPEVINE','Texas','76051','2141234123','francisbarro@gamestop.com')
      expect(alert_message.text).to eq("Please enter a valid Address. Special characters are not allowed.")
      sleep 2
      yes_or_ok_link.click
      page_scroll_down(0.40,0.10)

      #INVALID CITY
      enter_new_billing_address2('Accept','tester','United States of America','625 WESTPORT PRKWY','!@#$%','Texas','76051','2141234123','francisbarro@gamestop.com')
      expect(alert_message.text).to eq("Please enter a valid City. Special characters are not allowed.")
      sleep 2
      yes_or_ok_link.click
      page_scroll_down(0.40,0.10)


      #INVALID ZIP CODE
      enter_new_billing_address2('Accept','tester','United States of America','625 WESTPORT PRKWY','GRAPEVINE','Texas','1234567890','2141234123','francisbarro@gamestop.com')
      expect(alert_message.text).to eq("Please enter a valid Zip/postal code in the format ##### or #####-####.")
      sleep 2
      yes_or_ok_link.click
      page_scroll_down(0.40,0.10)


      #INVALID PHONE NUMBER ( NO ERROR PROMPT )
      # enter_new_billing_address2('','','','','','','76051','1234567890','')
      # expect(page_error_message.text).to eq('Please enter a valid LastName.Special characters are not allowed.')
      # yes_or_ok_link.click


      #INVALID EMAIL ( NO ERROR PROMPT )
      # enter_new_billing_address2('','','','','','','','2141234123','!@#$%')
      # expect(page_error_message.text).to eq('Please enter a valid LastName.Special characters are not allowed.')
      # yes_or_ok_link.click
      #page_scroll_down(0.10,0.80)
      #enter_new_billing_address2('','','','','','','76051','','')


    end


    it 'tc02: should prompt error for invalid input HOPS as GU',:tc02 do


      $objData.insertTestData('ERRORCHECK','TC02')
      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      puts "zip code: #{$zipCode}"

      close_new_user_tutorial
      #guest_user_only('100161',true)
      user_login_and_sku_search($userType,$skuNumber,true)
      allow_access_device_location(true)
      page_scroll_down(0.50, 0.40)
      search_for_available_store($zipCode,237,241,false) # tap 'Hebron Parkway' with x and y coordinates.


      #INVALID FIRST NAME
      hops_your_details_page2('!@#$%','Wade','francisbarro@gamestop.com','2141234123')
      expect(first_name_err_msg.text).to eq('Please enter a valid first name.')

      #INVALID LAST NAME
      hops_your_details_page2('DWAYNE','!@#$%','francisbarro@gamestop.com','2141234123')
      expect(hops_last_name_error.text).to eq('Please enter a valid last name.')

      #INVALID EMAIL
      hops_your_details_page2('DWAYNE','Wade','!@#$%','2141234123')
      sleep 2
      expect(alert_message.text).to eq('Invalid email.')
      sleep 2
      yes_or_ok_link.click

      # APPIUM CAN NO LONGER DETECT

      # #INVALID PHONE NUMBER
      # hops_your_details_page2('DWAYNE','Wade','francisbarro@gamestop.com','2#######')
      # sleep 2
      # expect(alert_message.text).to eq('Invalid phone number.')
      # sleep 2
      # yes_or_ok_link.click
      #
      # hops_your_details_page2('DWAYNE','Wade','francisbarro@gamestop.com','2141234123')
      # yourDetails_Finish_button.click
      # sleep 15
      # love_this_app_alert_msg
      # continue_buttonHops.click



    end



    it 'tc03: should prompt error for invalid payment card number input Auth',:tc03 do

      $objData.insertTestData('ERRORCHECK','TC03')
      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      puts "zip code: #{$zipCode}"
      puts "promo code: #{$promoCode}"
      puts "giftTrade card: #{$giftTradeCard}"
      puts "pur cc: #{$purRC}"
      puts "credit card type: #{$creditCardType}"

      close_new_user_tutorial
      user_login_and_sku_search($userType,$skuNumber,true)
      allow_access_device_location(false)
      sleep 15
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      pdp_checkout_now.click
      sleep 40
      #checkout_page('','','','cc',$creditCardType,'Accept')
      page_scroll_down(0.50,0.30)
      page_scroll_down(0.30,0.50)

      checkout_payment_icon.click
      sleep 5
      page_scroll_down(0.95,0.50)
      bops_add_new_credit_card_icon.click
      sleep 5

      credit_card_payment_input($creditCardType)
      while (!exists{checkout_save_button})
        page_scroll_down(0.80,0.10)
        sleep 2

      end
      checkout_save_button.click
      sleep 10
      if exists{alert_message}
        expect(alert_message.text).to eq("Please enter a valid payment card number.")
        yes_or_ok_link.click

      end

    end

  end


end