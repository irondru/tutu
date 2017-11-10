// route/new перемещает options между select'ами
function mov_slc(src, dst) {
    var slc_src = document.getElementById(src);
    var slc_dst = document.getElementById(dst);
    slc_dst.appendChild(slc_src.options[slc_src.selectedIndex]);
}
//route/new  выделяет все option перед отправкой формы
function select_all() {
    var lnk = document.getElementById("sel_dst").options;
    for (var i = 0; i < lnk.length; i++) lnk[i].selected = true;
}
// route/new добовляет поля даты/время на вкладке "расписание"
function render_datetime_fields(src) {
    var slc_src = document.getElementById(src);
    $('#schedules_table').append('<tr class="schedules">' +
        '<td>' + slc_src.options[slc_src.selectedIndex].text + '</td>' +
        '<td><input type="datetime-local" class="date-time" name="schedule[arrivals][]" ></td>' +
        '<td><input type="datetime-local" class="date-time" name="schedule[departures][]" ><br></td>' +
        '</tr>');
}
// route/new
function delete_datetime_fields() {
    var inputs = $('.schedules');
    var slc = document.getElementById("sel_dst");
    inputs[slc.selectedIndex].parentNode.removeChild(inputs[slc.selectedIndex]);
}
// route/new переключатель табов
function change_tab(a) {
  $(a).parent().addClass('active');
  $(a).parent().siblings().removeClass('active');
  target = $(a).attr('href');
  $('.tab-content > div').not(target).hide();
  $(target).fadeIn(500);
  return false;
}
