// train/new рендер радиобатонов со станциями в маршруте
function render_stations_radiobuttons_to_train(path, curr_station_id) {
    rezult_table = $('#route_stations');
    rezult_table.empty();
    var slc = $('#slc_routes')[0];
    // получаем станции выбранного маршрута key: title, value: id
    // если поменять местами в котроллере - список будет упорядоччен по id
    $.getJSON(path + "/" + slc.options[slc.selectedIndex].value, function (data) {
        $.each(data, function (val, key) {
            var checked = (key == curr_station_id) ? "checked" : '';
            rezult_table.append('<tr>' +
                '<td><input type="radio" id="rdbtn' + key + '" ' +
                'name="train[railway_station_id]" ' + checked + ' value="' + key + '"></td>' +
                '<td><label for="rdbtn' + key + '">' + val + '</label></td>' +
                '</tr>');
        });
    })
}