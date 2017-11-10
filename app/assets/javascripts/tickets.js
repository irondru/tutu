//admin/tickets/new рендер выбора начальной и конечной станции билета
function render_stations_select_to_ticket() {
  var slc_first = $('#slc_first_station')[0];
  var slc_last = $('#slc_last_station')[0];
  var slc_trains = $('#slc_trains')[0];
  slc_first.innerHTML = '';
  slc_last.innerHTML = '';
  // получаем ид маршрута выбранного поезда, в json отдается тупо число без ключей
  $.getJSON("/admin/trains/" + slc_trains.options[slc_trains.selectedIndex].value, function (route_id) {
      if (route_id) {
          slc_first.hidden = false;
          slc_last.hidden = false;
          // узнали ид маршрута, теперь узнаем входящие в него станции
          console.log([1]);
          $.getJSON("/admin/routes/" + route_id, function (data) {
              $.each(data, function (val, key) {
                  var option_first = $('<option name="ticket[first_station]" value="' + key + '">' + val + '</option>');
                  var option_last = $('<option name="ticket[first_station]" value="' + key + '">' + val + '</option>');
                  option_first.appendTo(slc_first);
                  option_last.appendTo(slc_last);
              });
          });
      } else {
          slc_first.hidden = true;
          slc_last.hidden = true;
      }
  });
}