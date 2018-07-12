
SB
done: Date/time formatting
done: User log_in
done: User log_out
done: Owner sees info on their listings
* Buy option lockout rental option
* Destroy listing:
      -destroys exchanges and notifies Renter
      -remove owner
      -maintains ratings of user
done: Renter has a list of rentals
done: add migration for locking in price for exchange so owner can't jack it up cost of exchange

* analytics fixed for Skateboard with expansion later
* add to layout the link back to user's show page

MS
* Calendar display of rentals (unavailable)
  ---possibly use: https://github.com/bokmann/fullcalendar-rails/blob/master/README.md
* rate owner and buyer



SC
* adding location searches
* location specific statistics for owners (and renters?)


Testing
------------
* Rout Testing:
  -Any URL goes to path not found and render index
  -not logged-in from listings show page can't create new exchange

* Login Path:
  * Not logged in
    * can't see user/show
  * Logged in-Essa
    -can't rent own item
    -Can't view exchange if not a part of it

* Methods
  * Exchange
    * #get_owner_name
    * #get_rental_cost
    * #get_renter_name
    * #start_date_format
    * #end_date_format

  * Listing
    - #date_conflict?(st,end)
    - #future_exchanges

* Validation-will
  - no duplicate listing names
  * end_date > start_date
  - list without buy_price
