//принимает объект на котором была вызвана (ссылка)
function edit_station(a) {
    var id = $(a).data('id'); //получаем ид редактируемой станции
    // проходимся по всем эл-м, что бы при клике по новой ссылке декативировать остальные эл-ты
    $.merge($('.inline-edit-field'), $(':submit')).each(function (index, field) {
        if ($(field).data('id') == id) {
            field.disabled = !field.disabled; //включаем или выключаем ркдактирование нужной станции
        } else {
            field.disabled = true;
        }
    });
    return false;
}