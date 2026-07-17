
<link rel="stylesheet" href="{{ asset('assets/frontend/css/select2.min.css') }}">
<script src="{{ asset('assets/frontend/js/select2.min.js') }}"></script>




<script>
    "use strict";
    var select = $(".at-select2").select2({});
    if(select) {
        $(select).each(function(){
            $(this).data('select2').$dropdown.addClass('select2-drop-container');
        });
    }

    // map for lat long pick
    var map = L.map('map').setView([40.706486, -74.014700], 5);
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 15,
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);

    // Create a popup
    var popup = L.popup();

    // Define a function to handle map clicks
    function onMapClick(e) {
        var lat = e.latlng.lat.toFixed(5);  
        var lng = e.latlng.lng.toFixed(5);
        popup
            .setLatLng(e.latlng)
            .setContent("You clicked at:<br>Latitude: " + lat + "<br>Longitude: " + lng)
            .openOn(map);
        document.getElementById('latitude').value = lat;
        document.getElementById('longitude').value = lng;
    }
    map.on('click', onMapClick);

    var mapMarker = null;
    function updateMapMarker(lat, lng) {
        var latlng = L.latLng(lat, lng);
        if (mapMarker) {
            mapMarker.setLatLng(latlng);
        } else {
            mapMarker = L.marker(latlng).addTo(map);
        }
        map.setView(latlng, 13);
    }

    var geocodeTimer = null;
    function autoGeocodeAddress() {
        clearTimeout(geocodeTimer);
        geocodeTimer = setTimeout(function() {
            var address = ($('#list_address').val() || $('#address').val() || $('textarea[name="address"]').val() || '').trim();
            var city = $('#city').val() || '';
            var country = $('#country').val() || '';
            if (!address) {
                return;
            }

            fetch((window.apiBaseUrl || '/api') + '/location/geocode', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                body: JSON.stringify({ address: address, city: city, country: country })
            })
            .then(function(response) { return response.json(); })
            .then(function(data) {
                if (data.success && data.data) {
                    document.getElementById('latitude').value = data.data.latitude;
                    document.getElementById('longitude').value = data.data.longitude;
                    updateMapMarker(data.data.latitude, data.data.longitude);
                }
            });
        }, 800);
    }

    $('#list_address, #address, textarea[name="address"]').on('input', autoGeocodeAddress);
    $('#city, #country').on('change', autoGeocodeAddress);

    // depended country and state
    $("#country").on('change', function(){
        var country = $("#country").val();
        var url = "{{route('admin.country.city',['id'=>':id'])}}";
        url = url.replace(':id', country);
        $.ajax({
            url: url,
            success: function(result){
                var cityDropdown = $("#city");
                cityDropdown.html($('<option>', {
                        value: '',
                        text: "{{get_phrase('Select listing City')}}"
                    }));
                $.each(result, function(index, city) {
                    cityDropdown.append($('<option>', {
                        value: city.id,
                        text: city.name
                    }));
                });
            }
        })
    })

    // image preview
document.getElementById('image-input').addEventListener('change', function(event) {
    const imageContainer = document.getElementById('image-container');
    const maxFiles = parseInt(event.target.getAttribute('data-max_length')) || 20;

    // Clear previous images if re-selecting
    imageContainer.innerHTML = '';

    // Get the selected files
    const files = Array.from(event.target.files).slice(0, maxFiles);

    files.forEach(file => {
        if (file && file.type.startsWith('image/')) {
            const reader = new FileReader();
            reader.onload = function(e) {
                // Create preview element
                const imageDiv = document.createElement('div');
                imageDiv.classList.add('image-preview');
                imageDiv.style.position = "relative";
                imageDiv.style.margin = "5px";

                // Create image element
                const img = document.createElement('img');
                img.src = e.target.result;
                img.style.width = "50px"; // set size as desired
                img.style.height = "50px";
                img.style.borderRadius = "5px";
                img.style.objectFit = "cover";
                img.style.margin = "5px 0";

                // Optional: Add a remove button
                const removeBtn = document.createElement('button');
                removeBtn.innerHTML = '&times;';
                removeBtn.classList.add('remove-image');
                removeBtn.style.position = "absolute";
                removeBtn.style.top = "-5px";
                removeBtn.style.right = "-8px";
                removeBtn.style.padding = "0px 6px";
                removeBtn.style.background = "red";
                removeBtn.style.color = "white";
                removeBtn.style.border = "none";
                removeBtn.style.cursor = "pointer";
                removeBtn.style.borderRadius = "50%";

                // Remove button event listener
                removeBtn.onclick = function() {
                    imageContainer.removeChild(imageDiv);
                };

                // Append image and button to preview container
                imageDiv.appendChild(img);
                imageDiv.appendChild(removeBtn);
                imageContainer.appendChild(imageDiv);
            };
            reader.readAsDataURL(file);
        }
    });
});

    /*function listing_image_delete(url, key){
        $.ajax({
            url: url,
            success: function(result){
if(result == 1 || result === "1"){
    $("#image-icon"+key).hide();
}
            }
        });
    }*/
  

function listing_image_delete(url, key){
    $.ajax({
        url: url,
        type: "GET",
        success: function(result){

            if(result.status == 1){
                $("#image-icon"+key).hide();
            }else{
                alert(result.msg);
            }

        },
        error: function(xhr){
            console.log(xhr.responseText);
        }
    });
}

  
  
  

    function listing_floor_plan_delete(url, key){
        $.ajax({
            url: url,
            success: function(result){
                if(result == 1){
                    $("#floor-plan-icon"+key).hide();
                }
            }
        });
    }

    function service_select(key) {
        var checkbox = document.getElementById('flexCheckDefau' + key);
        document.getElementById('service-checked' + key).classList.toggle('d-none');
    }
    function team_select(key) {
        var checkbox = document.getElementById('flexCheckDefault' + key);
        document.getElementById('team-checked' + key).classList.toggle('d-none');
    }
    function feature_select(key) {
        var checkbox = document.getElementById('flexCheckDefau' + key);
        document.getElementById('feature-checked' + key).classList.toggle('d-none');
    }
    function menu_select(key) {
        var checkbox = document.getElementById('flexCheckDefault' + key);
        document.getElementById('menu-checked' + key).classList.toggle('d-none');
    }

</script>