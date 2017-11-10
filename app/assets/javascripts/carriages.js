// carriages/new вызывается в onclick select'а типа вагона и в зависмости от выбранного
// значения прячем лишние поля и лабелы
function HideFields(slc) {
  switch (slc.selectedIndex) {
      case 0:
          DisplayOnly([0, 1, 2, 3], [18, 18, 9, 9]);
          break;
      case 1:
          DisplayOnly([0, 1], [18, 18]);
          break;
      case 2:
          DisplayOnly([1], [null, 18]);
          break;
      case 3:
          DisplayOnly([4], [null, null, null, null, 56]);
          break;
  }
}

// carriages/new прячет инпуты и их лабелы, items массив с элементами
// в котором первые 5 эл-ов инпуты, следующие - лабелы
// pnums - массив с порядковыми номерами элементов которые нужно показывать, остальные скрываюся
// def_values - массив значений по умолчанию
function DisplayOnly(pnums, def_values) {
    var items = $('.field-style').toArray().concat($('label').toArray());
    pnums.forEach(function (item) {
        pnums.push(item + 5); //в pnums только пор. номера инпутов, добавим лабелы
    });
    items.forEach(function (item, index) {
        if ($.inArray(index, pnums) !== -1) {
            if (index < 5) item.value = def_values[index];
            item.style.display = "block";
            item.setAttribute("required", "");
            item.setAttribute("min", "1");
            item.setAttribute("max", "80");
        } else {
            item.value = '';
            item.style.display = "none";
            item.removeAttribute("required");
        }
    });
}