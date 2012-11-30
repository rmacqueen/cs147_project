function map_display(content_id, lat, lng) {
  
  var mapcanvas = document.createElement('div');
  mapcanvas.id = 'mapcanvas_' + content_id;
  mapcanvas.style.height = '200px';
  mapcanvas.style.width = '100%';
 
  //document.querySelector('article').appendChild(mapcanvas);
  document.getElementById("map_wrapper_" + content_id).appendChild(mapcanvas);
  var latlng = new google.maps.LatLng(lat, lng);

  var myOptions = {
    zoom: 10,
    center: latlng,
    mapTypeControl: false,
    navigationControlOptions: {style: google.maps.NavigationControlStyle.SMALL},
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  var map = new google.maps.Map(document.getElementById("mapcanvas_" + content_id), myOptions);
 
  var marker = new google.maps.Marker({
      position: latlng,
      map: map,
      title:"I was here!",
      clickable: true,
      visible: true
  });
}

function openDialog(content_id){

  document.getElementById("blog_detail_" + content_id).click();
}