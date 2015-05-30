var jData = {};
function functionCall(obj){
  jData =  obj;
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
function getData(){

  var xmlhttp = new XMLHttpRequest();
  var url = "./api.json";

  xmlhttp.onreadystatechange = function() {
      if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
          //var myArr = JSON.parse(xmlhttp.responseText);
          eval(xmlhttp.responseText);
      }
      if (xmlhttp.readyState == 4 && xmlhttp.status != 200) {
          //var myArr = JSON.parse(xmlhttp.responseText);
          alert(xmlhttp.status );
      }
  }
  xmlhttp.open("GET", url, true);
  xmlhttp.send();
}
