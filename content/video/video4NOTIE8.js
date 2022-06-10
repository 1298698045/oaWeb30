$(function () {
    ajaxMethodGetData('video.video.url', { id: getQueryString('id') }, function (data) {
        videoURL = data.virtualpath;

        var html = '';
        html += '  <video id="my-video" preload="auto" class="video-js" controls>';
        html += '      <source src="' + videoURL + '" type="video/mp4">';
        html += '  </video>';
        $('.m').append(html)
        var myPlayer = videojs('my-video', { "autoplay": true, });
        videojs("my-video").ready(function () {
            var myPlayer = this;
            myPlayer.play();
        });
    })
});