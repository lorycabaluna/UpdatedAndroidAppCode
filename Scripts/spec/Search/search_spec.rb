require_relative '../../dsl/src/dsl'


RSpec.describe 'Search Tests' do
  before(:all) do
    @config = AppiumNativeAppConfig.new
    @config.capabilities[:caps][:automationName] = 'Appium'
    #close_appium(@config.capabilities[:appium_lib][:port])
    #close_emulator(@config.emulator_port)
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
    close_new_user_tutorial
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

  #Covers TCID: [42421]
  # it 'ECOMDEV-10716: Add new Saved Search',:tc01 do
  #
  #   shopTab('GAMES')
  #   saved_searches('ADD')
  #
  # end
  #
  # #Covers TCID: [42420]
  # it 'ECOMDEV-10717: Create/Edit/Delete Saved Search',:tc02 do
  #
  #   shopTab('MY SAVED SEARCHES')
  #   saved_searches('CREATE')
  #   saved_searches('EDIT')
  #   saved_searches('DELETE')
  #
  # end

  # it 'ECOMDEV-10715: Search an item on USER preferred CONSOLES',:tc03 do
  #
  #   @count = 0
  #   user_login_only('ECPPRO')
  #   hamburger_menu.click
  #   close_new_user_dashboard_tutorial
  #   set_console_img.click
  #   select_lists_of_consoles(3)
  #   while (!exists{hamburger_menu})
  #     back
  #     press_keycode(4)
  #   end
  #   shop_tab.click
  #   expect(exists{preferred_console_link}).to eq(true)
  #   preferred_console_link.click
  #
  #   while (!exists{search_result_counts} && @count <=2)
  #       back
  #       press_keycode(4)
  #       preferred_console_link.click
  #       @count +=1
  #
  #   end
  #
  #   expect(exists{search_result_counts}).to eq(true)
  #
  #
  # end

  # it 'ECOMDEV-10714: Search item/ product on SHOPS > COMING SOON products',:tc04 do
  #   @count = 0
  #   shopTab('COMING SOON')
  #   while (!exists{search_result_counts} && @count <=2)
  #     back
  #     shop_comingsoon_link.click
  #     @count +=1
  #
  #   end
  #   expect(exists{search_result_counts}).to eq(true)
  #
  #   select_from_sort_dropdown('Release Date') #Release Date", "Price Ascending", "Price Descending"
  #   select_from_sort_dropdown('Price Ascending')
  #   select_from_sort_dropdown('Price Descending')
  #
  #
  # end



  # it 'ECOMDEV-10713: Search item/ product on SHOPS > COLLECTIBLES category',:tc05 do
  #   @count = 0
  #   shopTab('COLLECTIBLES')
  #   while (!exists{search_result_counts} && @count <=2)
  #     back
  #     shop_comingsoon_link.click
  #     @count +=1
  #
  #   end
  #
  #   expect(exists{search_result_counts}).to eq(true)
  #
  #   select_from_sort_dropdown('Release Date') #Release Date", "Price Ascending", "Price Descending"
  #   select_from_sort_dropdown('Price Ascending')
  #   select_from_sort_dropdown('Price Descending')
  #
  #
  # end

  # it 'ECOMDEV-10707: Search item/ product on SHOPS > GAMES category',:tc06 do
  #   @count = 0
  #   shopTab('GAMES')
  #   while (!exists{search_result_counts} && @count <=2)
  #     back
  #     shop_comingsoon_link.click
  #     @count +=1
  #
  #   end
  #
  #   expect(exists{search_result_counts}).to eq(true)
  #
  #   select_from_sort_dropdown('Release Date') #Release Date", "Price Ascending", "Price Descending"
  #   select_from_sort_dropdown('Price Ascending')
  #   select_from_sort_dropdown('Price Descending')
  #
  #
  # end

  # it 'ECOMDEV-10711: Search item/ product on SHOPS > CONSOLES category',:tc07 do
  #   @count = 0
  #   shopTab('CONSOLES')
  #   while (!exists{search_result_counts} && @count <=2)
  #     back
  #     shop_comingsoon_link.click
  #     @count +=1
  #
  #   end
  #   expect(exists{search_result_counts}).to eq(true)
  #
  #   select_from_sort_dropdown('Release Date') #Release Date", "Price Ascending", "Price Descending"
  #   select_from_sort_dropdown('Price Ascending')
  #   select_from_sort_dropdown('Price Descending')
  #
  #
  # end


  # it 'ECOMDEV-10712: Search item/ product on SHOPS > ELECTRONICS category',:tc08 do
  #   @count = 0
  #   shopTab('ELECTRONICS')
  #   while (!exists{search_result_counts} && @count <=2)
  #     back
  #     shop_comingsoon_link.click
  #     @count +=1
  #
  #   end
  #   expect(exists{search_result_counts}).to eq(true)
  #
  #   select_from_sort_dropdown('Release Date') #Release Date", "Price Ascending", "Price Descending"
  #   select_from_sort_dropdown('Price Ascending')
  #   select_from_sort_dropdown('Price Descending')
  #
  #
  # end

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


  it 'EVS-1720: Search Filter deselection should back to default filter values,GU', :tc15 do
    # user_login_only('PURELITE')
    # sleep 5
    # tap_search_icon #search_icon.click
    # sleep 5
    # keypad_search_button_tap
    clear_cart
    sleep 5
    sku_item_searchOnly("playstation 4")
    sleep 5
    filter_link.click
    select_filter('Category', 'Video Games','TextView')
    page_scroll_down(0.80,0.10)
    select_filter('ESRB Rating', 'Mature','CheckBox')
    page_scroll_down(0.10,0.80)
    select_filter('Category', 'Video Games','TextView')
    page_scroll_down(0.80,0.10)
    expect(exists{filter_category('ESRB Rating')}).to eq(false)
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
    # select_filter('Availability', 'Pick up at store','CheckBox')
    # #select_filter('Size', '2X-Large','CheckBox')
    # done_filter_button.click

  end






  # it 'ECOMDEV-10719: Filter Products and sort by bs,rd,pa,pd ',:tc09 do
  #   tap_search_icon #search_icon.click
  #   sleep 5
  #   keypad_search_button_tap
  #   filter_link.click
  #   select_filter('Products', 'Audio') #[Products,Platform,Condition,Category,Availability,Price,ESRB]
  #   expect(exists{search_result_counts}).to eq(true)
  #
  #   select_from_sort_dropdown('Release Date') #Release Date", "Price Ascending", "Price Descending"
  #   select_from_sort_dropdown('Price Ascending')
  #   select_from_sort_dropdown('Price Descending')
  #
  #
  # end
  #
  # it 'ECOMDEV-10724: Filter Price and sort by bs,rd,pa,pd ',:tc10 do
  #   tap_search_icon #search_icon.click
  #   sleep 5
  #   keypad_search_button_tap
  #   filter_link.click
  #   select_filter('Price', 'Under $20') #[Products,Platform,Condition,Category,Availability,Price,ESRB]
  #   expect(exists{search_result_counts}).to eq(true)
  #
  #   select_from_sort_dropdown('Release Date') #Release Date", "Price Ascending", "Price Descending"
  #   select_from_sort_dropdown('Price Ascending')
  #   select_from_sort_dropdown('Price Descending')
  #
  #
  # end
  #
  # it 'ECOMDEV-10720: Filter Platform and sort by bs,rd,pa,pd ',:tc11 do
  #   tap_search_icon #search_icon.click
  #   sleep 5
  #   keypad_search_button_tap
  #   filter_link.click
  #   select_filter('Platform', 'Android') #[Products,Platform,Condition,Category,Availability,Price,ESRB]
  #   expect(exists{search_result_counts}).to eq(true)
  #
  #   select_from_sort_dropdown('Release Date') #Release Date", "Price Ascending", "Price Descending"
  #   select_from_sort_dropdown('Price Ascending')
  #   select_from_sort_dropdown('Price Descending')
  #
  #
  # end
  #
  # it 'ECOMDEV-10725: Filter ESRB and sort by bs,rd,pa,pd ',:tc12 do
  #   tap_search_icon #search_icon.click
  #   sleep 5
  #   keypad_search_button_tap
  #   filter_link.click
  #   select_filter('ESRB', 'Everyone') #[Products,Platform,Condition,Category,Availability,Price,ESRB]
  #   expect(exists{search_result_counts}).to eq(true)
  #
  #   select_from_sort_dropdown('Release Date') #Release Date", "Price Ascending", "Price Descending"
  #   select_from_sort_dropdown('Price Ascending')
  #   select_from_sort_dropdown('Price Descending')
  #
  #
  # end
  #
  #
  # it 'ECOMDEV-10722: Filter Category and sort by bs,rd,pa,pd ',:tc13 do
  #   tap_search_icon #search_icon.click
  #   sleep 5
  #   keypad_search_button_tap
  #   filter_link.click
  #   select_filter('Category', '3D') #[Products,Platform,Condition,Category,Availability,Price,ESRB]
  #   expect(exists{search_result_counts}).to eq(true)
  #
  #   select_from_sort_dropdown('Release Date') #Release Date", "Price Ascending", "Price Descending"
  #   select_from_sort_dropdown('Price Ascending')
  #   select_from_sort_dropdown('Price Descending')
  #
  #
  # end
  #
  # it 'ECOMDEV-10721: Filter Condition and sort by bs,rd,pa,pd ',:tc14 do
  #   tap_search_icon #search_icon.click
  #   sleep 5
  #   keypad_search_button_tap
  #   filter_link.click
  #   select_filter('Condition', 'New') #[Products,Platform,Condition,Category,Availability,Price,ESRB]
  #   expect(exists{search_result_counts}).to eq(true)
  #
  #   select_from_sort_dropdown('Release Date') #Release Date", "Price Ascending", "Price Descending"
  #   select_from_sort_dropdown('Price Ascending')
  #   select_from_sort_dropdown('Price Descending')
  #
  #
  # end
  #
  #
  # it 'ECOMDEV-10723: Filter Availability and sort by bs,rd,pa,pd ',:tc15 do
  #   tap_search_icon #search_icon.click
  #   sleep 5
  #   keypad_search_button_tap
  #   filter_link.click
  #   select_filter('Availability', 'This Week') #[Products,Platform,Condition,Category,Availability,Price,ESRB]
  #   expect(exists{search_result_counts}).to eq(true)
  #
  #   select_from_sort_dropdown('Release Date') #Release Date", "Price Ascending", "Price Descending"
  #   select_from_sort_dropdown('Price Ascending')
  #   select_from_sort_dropdown('Price Descending')
  #
  #
  # end


end