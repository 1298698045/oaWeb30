function createCell(fieldValue, rowspan, rowObj, fieldName) {

    var html = "";
    if (fieldValue == 0 || fieldValue == "0")
        fieldValue = "";

    if (isRead) {
        if (rowspan > 0) {
            html = "<td rowSpan='" + rowspan + "' class='number'>" + fieldValue + "</td>";
        }
        else {
            html = "<td  class='number'>" + fieldValue + "</td>";
        }
        return html;
    }


    var cellinput = "<input type='text' id='cell_" + rowNumber + "_" + cell + "' value='" + fieldValue + "' data-id=\"" + rowObj.ValueId + "\" field-name=\"" + fieldName + "\" />";

    if (rowspan > 0) {
        html = "<td rowSpan='" + rowspan + "' class='number'>" + cellinput + "</td>";
    }
    else {
        html = "<td  class='number'>" + cellinput + "</td>";
    }
    cell++;
    return html;
}

function createDisplayCell(fieldValue, rowspan, rowObj, fieldName) {
    var html = "";
    if (fieldValue == 0 || fieldValue == "0")
        fieldValue = "&nbsp;";
    if (rowspan > 0) {
        html = "<td rowSpan='" + rowspan + "' class='cellName'>" + fieldValue + "</td>";
    }
    else {
        html = "<td  class='cellName'>" + fieldValue + "</td>";
    }
    return html;
}

function createCellName(fieldValue, rowspan, rowObj) {
    var html = "";
    var cellinput = "<input type='hidden' id='cell_" + rowNumber + "_" + cell + "' value='" + fieldValue + "' data-id=\"" + rowObj.ValueId + "\" />";
    if (rowspan > 0) {
        html = "<td rowSpan='" + rowspan + "' class='cellName'>" + fieldValue + cellinput + "</td>";
    }
    else
        html = "<td  class='cellName'>" + fieldValue + cellinput + "</td>";

    cell++;
    return html;
}