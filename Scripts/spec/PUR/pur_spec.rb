require_relative '../../dsl/src/dsl'


RSpec.describe 'PowerUp Rewards tests' do
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
    clear_data
    # restart_adb
    sleep 10
    start_emulator(@config.capabilities[:caps][:deviceName],@config.emulator_port)
    start_appium(@config.capabilities[:appium_lib][:port])
    sleep 10
    # clear_data
    @app = AndroidApp.new(@config)
    start_driver
    set_wait(20)
    close_new_user_dashboard_tutorial
  end

  after(:each) do |example|
    get_screenshot($log.log_trace_path, example)
    quit_driver
    close_appium(@config.capabilities[:appium_lib][:port])
    close_emulator(@config.emulator_port)
    sleep 7
  end

  after(:all) do
    close_appium(@config.capabilities[:appium_lib][:port])
    close_emulator(@config.emulator_port)
    sleep 5
  end



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