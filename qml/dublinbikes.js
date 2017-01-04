
var api = (function () {
    "use strict";
    var stations = [];
    function networkCall(url, callback, errorcallback) {
        var request = new XMLHttpRequest();
        request.onreadystatechange = function() {
            if (request.readyState === XMLHttpRequest.DONE) {
                if (request.status === 200) {
                    callback(request.responseText);
                } else {
                    errorcallback();
                }
            }
        };
        request.open("GET", url, true);
        request.send(null);
    }

    function loadStationData(success, failure) {
        networkCall("https://api.citybik.es/v2/networks/dublinbikes", function (data) {
            var bikeData = JSON.parse(data);
            stations = bikeData.network.stations;
            success();
        }, function () {
            failure();
        });
    }

    return {
        stations: function () {
            return stations;
        },
        getStationString: function (index) {
            var station = stations[index];
            if(station) {
                return station.name + " - " + station.free_bikes + "/" + (station.empty_slots + station.free_bikes);
            }
        },
        current: 0,
        coverString: "SailBikeDublin",
        loading: false,
        loadStationData: loadStationData
    }
}());
