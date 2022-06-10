function formatterDate(value) {
    var date = new Date(value);//long转换成date
    var year = date.getFullYear().toString();
    var month = (date.getMonth() + 1);
    var day = date.getDate().toString();
    if (month < 10) {
        month = "0" + month;
    }
    if (day < 10) {
        day = "0" + day;
    }
    return year + "-" + month + "-" + day;
}
function formatBool(value) {
    if (!value)
        return "";
    if (value == "True")
        return "<img src='/img/checkbox_checked.gif'>";
    if (value == "False")
        return "<img src='/img/checkbox_unchecked.gif'>";
    return value;
}
function formatNumeric(value) {
    if (!value)
        return "";

    if (value == "0.00" || value == "0" || value == "0.000")
        return "";
    return value;
}
function encodeForSearch(a) {
    return window.encodeURIComponent ? encodeURIComponent(a) : escape(a);
}