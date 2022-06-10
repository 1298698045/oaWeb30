$(function () {

    videoURL = tools.q("url");
    //video
    var html = '';
    html += '<object id="flash_fallback_1" class="vjs-flash-fallback" type="application/x-shockwave-flash" data="/content/video/view/js/videojs/flowplayer.swf">';
    html += '<param name="movie" value="/content/video/v/flowplayer.swf" />';
    html += '<param name="allowfullscreen" value="true" />';
    html += '<param name="SCALE" value="showall" /> ';
    html += "<param name='flashvars' value='config={\"playlist\":[\"/content/video/view/images/confident.jpg\", {\"url\": \""+videoURL+"\",\"autoPlay\":true,\"autoBuffering\":true}]}' />";
    html += '</object>';

    html = "<video class=\"video-js\" controls preload=\"auto\" data-setup='{\"autoplay\":true,\"techOrder\": [\"flash\", \"html5\"]}'><source src=\"" + videoURL + "\" type=\"video/mp4\"></source></video>";

    $('.m').append(html)

    
    
});