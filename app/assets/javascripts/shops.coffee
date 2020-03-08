# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#shop_postcode").jpostal({
    postcode : [ "#shop_postcode" ],
    address  : {
                  "#shop_prefecture_code" : "%3",
                  "#shop_address_city"            : "%4",
                  "#shop_address_street"          : "%5%6%7"
                }
  })
