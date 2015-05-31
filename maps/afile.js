var jData = {};
var i18nData = [];
var geocode_results = {};
i18nData[""]

function lonlat2zipcode(cb){
	// 
	var zipcode = "";
	//ajax("http://maps.googleapis.com/maps/api/geocode/json?latlng=37.7875322,-122.3967094&sensor=true",
	
	ajax("./api2.json", function(txt){
		try{
			var a = JSON.parse(txt);
			geocode_results = a;
			cb(a);
		}catch(e){
			alert(e);
		}
	});
	return zipcode;
}
/**
*
*/
function start_search(){
	lonlat2zipcode(function(a){
		alert(a.results[0].address_components[7].types[0]);
		var ac = a.results[0].address_components;
		//var ac = a["results"][0]["address_components"];
		for(var i=0;ac.length;i++){
			if(ac[i]["types"][0] == "postal_code"){
				document.getElementById("location").value = ac[i]["short_name"];
				return;
			}
		}
		document.getElementById("location").value = "Zip not found :(";
	});
}
/**
* find_me fill in location input with latlon coordinates
*/
function find_me(){
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else {
        alert("Geolocation is not supported by this browser.");
    }
}
function showPosition(position) {
    var v = 'lat:' + position.coords.latitude;
    v += " lon: " + position.coords.longitude;
    document.getElementById("location").value = v;
}

function i18n(lang, text){


}

// latlon 2 zipcode
// address to zipcode
// location to eta
// sort by eta

// http://maps.googleapis.com/maps/api/geocode/json?latlng=40.714224,-73.961452&sensor=false

function functionCall(obj){
  jData =  obj;
}
//TODO put actual language list
function languageList(){
  return [{'1':'English','2':'Spanish'}];
}

function item2html(item){


}
function decodeHtml(html) {
    var txt = document.createElement("textarea");
    txt.innerHTML = html;
    return txt.value;
}
function render(jData){
  var dx = "";
  for(var i=0;i<jData.items.length;i++){
    dx+="<h1>" + jData.items[i].title + "</h1>";
    dx+="<p>" + decodeHtml(jData.items[i].content) + "</p>";
  }
  document.getElementById("org_list").innerHTML = dx;

}
function fetch_organization_list(){
  ajax("./api.json",function(x){eval(x);render(jData)});
}
function ajax(url,func){

  var xmlhttp = new XMLHttpRequest();

  xmlhttp.onreadystatechange = function() {
      if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
          //var myArr = JSON.parse(xmlhttp.responseText);
          func(xmlhttp.responseText);
      }
      if (xmlhttp.readyState == 4 && xmlhttp.status != 200) {
          //var myArr = JSON.parse(xmlhttp.responseText);
          alert(xmlhttp.status );
      }
  }
  xmlhttp.open("GET", url, true);
  xmlhttp.send();

}
