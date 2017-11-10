// search/index рендер таблицы результата поиска билетов
function render_rezult_table() {
    var slc_first = $('#slc_first_station')[0];
    var slc_last = $('#slc_last_station')[0];
    var result_table = $('#result_table')[0];
    if (slc_first.selectedIndex == slc_last.selectedIndex ||
        slc_first.selectedIndex == 0 || slc_last.selectedIndex == 0) return;
    rezult_table = $('#found_data');
    rezult_table.empty();
    var notice = $('#notfound')[0];
    // ответ приходит в виде массива элементы которого хеши с найденными поездами
    // маршрутом и расписанием
    $.getJSON('/search?search[first_station]=' + slc_first.options[slc_first.selectedIndex].value
        + '&search[last_station]=' + slc_last.options[slc_last.selectedIndex].value,
        function (data) {
            if (data == '') {
                result_table.hidden = true;
                notice.innerHTML = 'Ничего не найдено.';
                return;
            }
            result_table.hidden = false
            data.forEach(function (elem) {
                notice.innerHTML = '';
                rezult_table.append('<tr>' +
                    '<td>' + elem.train_number + '</td>' +
                    '<td>' + elem.route_number + '</td>' +
                    '<td>' + elem.route_name + '</td>' +
                    '<td><input class="date-time-clear" type="datetime-local" value="' + elem.departure + '" disabled></td>' +
                    '<td><input class="date-time-clear" type="datetime-local" value="' + elem.arrival + '" disabled></td>' +
                    '<td>' +
                    '<form action="/tickets/new" method="get">' +
                    '<input name="choice[first_station_id]" type="hidden" value="' + elem.first_station + '">' +
                    '<input name="choice[last_station_id]" type="hidden" value="' + elem.last_station + '">' +
                    '<input name="choice[train_id]" type="hidden" value="' + elem.train_id + '">' +
                    '<input type="submit" class="blue-btn" value="Купить">' +
                    '</form>' +
                    '</td>' +
                    '</tr>');

            });
        }
    );
}