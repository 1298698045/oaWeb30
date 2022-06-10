function ExportExcel(headerText,tableElement,skipTopRow) {

    var dataTable = {};
    dataTable.HeaderText = headerText;
    dataTable.Trs = [];

    $(tableElement).find('tr').each(function (i,e) {

        var tr = {};
        tr.Tds = [];

        var trChildName = 'td';
        if ($(this).children('td').length == 0)
            trChildName = 'th';
       
        $(this).children(trChildName).each(function (l) {
            var td = {};

            td.Colspan = $(this).attr('Colspan');
            td.Rowspan = $(this).attr('Rowspan');
            td.Text = $(this).text().trim().replace(/\s/g, "");
            var style = $(this).attr('style');

            if (style != undefined && style.toLowerCase().indexOf("bold") >= 0)
                td.IsBold = true;

            td.FontSize = $(this).css("font-size");

            if (td.Colspan == undefined)
                td.Colspan = 1;
            if (td.Rowspan == undefined)
                td.Rowspan = 1;
            if (td.Text == undefined)
                td.Text = '';
            if (td.FontSize == undefined)
                td.FontSize = '';
            td.FontSize = td.FontSize.replace('px', '');

            var colIndex = $(this).index();

            var colIndexShould = 0;

            var rowIndex = $(this).closest("tr").index();
            var rowspans = $(tableElement).find("td[rowspan]").filter(function () {
                return this.rowSpan > 1;
            });

            rowspans.each(function (j, e) {
              
                var rowspan = $(this);
                var rowspanIndex = rowspan.closest("tr").index();
                var rowspanColumnIndex = rowspan.index();

                var rowspanQuantity = parseInt(rowspan.attr("rowspan"));

                if (rowIndex > rowspanIndex && rowIndex <= rowspanIndex + rowspanQuantity - 1 && colIndex >= rowspanColumnIndex) {//&& colIndex <= rowspanColumnIndex
                    //debugger
                    if (colIndexShould + 1 <= rowspanColumnIndex)
                        colIndexShould++;
                }
            });

            $(this).prevAll('td').each(function (k, e) {

                if ($(this).attr('Colspan') != undefined) {
                    colIndexShould += Number($(this).attr('Colspan'));
                }
                else {
                    colIndexShould++;
                }
            });

            td.ColumnIndex = colIndexShould;
            tr.Tds.push(td);
        });

        if (skipTopRow && i == 0) {

        } else
            dataTable.Trs.push(tr);
    });
    //console.log(dataTable);
    //return;

    //comm.datatable.export ,call api to export.
    openWindowWithPost("/apps/CommandProcessor.ashx?cmd=comm.datatable.export", {
        DataTable: dataTable,
    });
}

function openWindowWithPost(url, data) {
    var form = document.createElement("form");
    form.target = "_blank";
    form.method = "POST";
    form.action = url;
    form.style.display = "none";

    for (var key in data) {

        var input = document.createElement("input");
        input.type = "hidden";
        input.name = key;

        if (typeof data[key] == 'object') {
            input.value = JSON.stringify(data[key]);

        } else {
            input.value = data[key];
        }
        form.appendChild(input);
    }

    document.body.appendChild(form);
    form.submit();
    document.body.removeChild(form);
}