document.addEventListener('DOMContentLoaded', function() {
    // Initialize the map
    const map = L.map('map').setView([23.6850, 90.3563], 7); // Centered on Bangladesh

    // Add tile layer (using OpenStreetMap)
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);

    // Add some sample markers (in a real app, these would come from your database)
    const emergencies = [
        {
            lat: 22.3569,
            lng: 91.7832,
            title: "Cyclone Mocha",
            type: "cyclone",
            severity: "critical"
        },
        {
            lat: 24.8949,
            lng: 91.8687,
            title: "Sylhet Floods",
            type: "flood",
            severity: "high"
        },
        {
            lat: 22.1987,
            lng: 92.2347,
            title: "Landslide",
            type: "landslide",
            severity: "medium"
        }
    ];

    // Define icon colors based on severity
    const getIconColor = (severity) => {
        switch(severity) {
            case 'critical': return 'red';
            case 'high': return 'orange';
            case 'medium': return 'blue';
            default: return 'green';
        }
    };

    // Create custom icons
    const getCustomIcon = (severity) => {
        return L.divIcon({
            className: `custom-icon ${severity}`,
            html: `<i class="fas fa-exclamation-triangle"></i>`,
            iconSize: [30, 30]
        });
    };

    // Add markers to the map
    emergencies.forEach(emergency => {
        const marker = L.marker([emergency.lat, emergency.lng], {
            icon: getCustomIcon(emergency.severity)
        }).addTo(map);
        
        marker.bindPopup(`
            <h6>${emergency.title}</h6>
            <p><strong>Type:</strong> ${emergency.type}</p>
            <p><strong>Severity:</strong> ${emergency.severity}</p>
            <button class="btn btn-sm btn-primary mt-2 w-100">View Details</button>
        `);
    });

    // Add a layer control
    const baseLayers = {
        "Street Map": L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '&copy; OpenStreetMap'
        }),
        "Satellite": L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
            attribution: 'Tiles &copy; Esri'
        })
    };

    L.control.layers(baseLayers).addTo(map);

    // Handle location sharing
    document.getElementById('shareLocation').addEventListener('click', function() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(position) {
                const userLat = position.coords.latitude;
                const userLng = position.coords.longitude;
                
                // Add user marker
                const userMarker = L.marker([userLat, userLng], {
                    icon: L.divIcon({
                        className: 'custom-icon user',
                        html: `<i class="fas fa-user"></i>`,
                        iconSize: [30, 30]
                    })
                }).addTo(map);
                
                userMarker.bindPopup(`
                    <h6>Your Location</h6>
                    <p>Lat: ${userLat.toFixed(4)}</p>
                    <p>Lng: ${userLng.toFixed(4)}</p>
                `).openPopup();
                
                // Center map on user
                map.setView([userLat, userLng], 13);
                
                alert('Location shared successfully!');
            }, function(error) {
                alert('Error getting location: ' + error.message);
            });
        } else {
            alert('Geolocation is not supported by your browser');
        }
    });

    // Handle map refresh
    document.getElementById('refreshMap').addEventListener('click', function() {
        // In a real app, this would fetch new data from the server
        alert('Map data refreshed');
        document.getElementById('lastUpdated').textContent = 'Just now';
    });
});
