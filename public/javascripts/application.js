// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var a;
var year,month,date,tdate,tmonth,tyear;
var year5,month5,date5,tdate5,tmonth5,tyear5;

function initialize() {
  var mapOptions = {
    center: new google.maps.LatLng(-33.8688, 151.2195),
    zoom: 13
  };
  var map = new google.maps.Map(document.getElementById('map-canvas'),
    mapOptions);

  var input = /** @type {HTMLInputElement} */(
      document.getElementById('pac-input'));

  var types = document.getElementById('type-selector');
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(types);

  var autocomplete = new google.maps.places.Autocomplete(input);
  autocomplete.bindTo('bounds', map);

  var infowindow = new google.maps.InfoWindow();
  var marker = new google.maps.Marker({
    map: map
  });

  google.maps.event.addListener(autocomplete, 'place_changed', function() {
    infowindow.close();
    marker.setVisible(false);
    var place = autocomplete.getPlace();
    if (!place.geometry) {
      return;
    }

    // If the place has a geometry, then present it on a map.
    if (place.geometry.viewport) {
      map.fitBounds(place.geometry.viewport);
    } else {
      map.setCenter(place.geometry.location);
      map.setZoom(17);  // Why 17? Because it looks good.
    }
    marker.setIcon(/** @type {google.maps.Icon} */({
      url: place.icon,
      size: new google.maps.Size(71, 71),
      origin: new google.maps.Point(0, 0),
      anchor: new google.maps.Point(17, 34),
      scaledSize: new google.maps.Size(35, 35)
    }));
    marker.setPosition(place.geometry.location);
    marker.setVisible(true);

    var address = '';
    if (place.address_components) {
      address = [
        (place.address_components[0] && place.address_components[0].short_name || ''),
        (place.address_components[1] && place.address_components[1].short_name || ''),
        (place.address_components[2] && place.address_components[2].short_name || '')
      ].join(' ');
    }

    infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
    infowindow.open(map, marker);
  });

  // Sets a listener on a radio button to change the filter type on Places
  // Autocomplete.
  function setupClickListener(id, types) {
    var radioButton = document.getElementById(id);
    google.maps.event.addDomListener(radioButton, 'click', function() {
      autocomplete.setTypes(types);
    });
  }

  setupClickListener('changetype-all', []);
  setupClickListener('changetype-establishment', ['establishment']);
  setupClickListener('changetype-geocode', ['geocode']);
}

google.maps.event.addDomListener(window, 'load', initialize);



function myclickfn()
{
  a=document.getElementById("main_book").value;
  alert(a);
}


function datefn1()
{
  var dateEntered = document.getElementById("from_date").value;
  year = dateEntered.substring(0,4);
  month = dateEntered.substring(5,7);
  date = dateEntered.substring(8,10);
  var d= new Date();
  tdate = d.getDate();
  tmonth = d.getMonth()+1;
  tyear = d.getFullYear();
  
  if(tyear < year )
  {
    
  }
  else if (tyear == year)
  {
    if(tmonth < month )
    {
        datefn2(date,month,year);
    }
    else if(tmonth == month)
    {
        if(tdate<date)
        {

        }
        else
        {
          document.getElementById("from_date").focus();
          alert("date part is wrong");
        }
    }
    else
    {
        document.getElementById("from_date").focus();
        alert("month is wrong");
    }
  }
  else
  { 
      document.getElementById("from_date").focus();
      alert("year is wrong");
  }
  
}

function datefn2()
{
  var Entered = document.getElementById("to_date").value;
  year1 = Entered.substring(0,4);
  month1 = Entered.substring(5,7);
  date1 = Entered.substring(8,10);
  /*alert("year1"+year1);
  alert("mn1"+month1);
  alert("dt1"+date1);*/
  if(year<year1)
  {

  }
  else if(year == year1)
  {
      if(month < month1)
      {

      }
      else if(month == month1)
      {
          if(date < date1)
          {

          }
          else 
          {
            document.getElementById("to_date").focus();
            alert("date is wrong");
          }
      }
      else
      {
        document.getElementById("to_date").focus();
        alert("month is wrong");
      }
  }
  else
  {
      document.getElementById("to_date").focus();
      alert("year is wrong");
  }
}

function ch1()
{
  var dateEntered123 = document.getElementById("property_ch_in").value;
  year5 = dateEntered123.substring(0,4);
  month5 = dateEntered123.substring(5,7);
  date5= dateEntered123.substring(8,10);
  var d5= new Date();
  tdate5 = d5.getDate();
  tmonth5 = d5.getMonth()+1;
  tyear5 = d5.getFullYear();
  
  if(tyear5 < year5 )
  {
    
  }
  else if (tyear5 == year5)
  {
    if(tmonth < month )
    {
        ch2(date5,month5,year5);
    }
    else if(tmonth5 == month5)
    {
        if(tdate5<date5)
        {

        }
        else
        {
          document.getElementById("property_ch_in").focus();
          alert("date part is wrong");
        }
    }
    else
    {
        document.getElementById("property_ch_in").focus();
        alert("month is wrong");
    }
  }
  else
  { 
      document.getElementById("property_ch_in").focus();
      alert("year is wrong");
  }
  
}

function ch2()
{
  var Entered123 = document.getElementById("property_ch_out").value;
  year1 = Entered123.substring(0,4);
  month1 = Entered123.substring(5,7);
  date1 = Entered123.substring(8,10);
  /*alert("year1"+year1);
  alert("mn1"+month1);
  alert("dt1"+date1);*/
  if(year5<year1)
  {

  }
  else if(year5 == year1)
  {
      if(month5 < month1)
      {

      }
      else if(month5 == month1)
      {
          if(date5 < date1)
          {

          }
          else 
          {
            document.getElementById("property_ch_out").focus();
            alert("date is wrong");
          }
      }
      else
      {
        document.getElementById("property_ch_out").focus();
        alert("month is wrong");
      }
  }
  else
  {
      document.getElementById("property_ch_out").focus();
      alert("year is wrong");
  }
}

