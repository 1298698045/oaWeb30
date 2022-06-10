$(function () {
    //ext-comp-1016

    var content_width = $("#homeContentDest").width();

    var rightList = $("#ext-comp-1016");
    var elementStyle = rightList.attr('style');
    var newStyle = elementStyle + " ;height:100%;width:" + (Number(content_width)-260) + "px;";
    rightList.attr("style", newStyle);
});

var postFileExtName = new Array();

function InitPLUpload(elementId, uploadUrl, folderId, filters, maxfileCount, showlist, showthumbs) {

    var uploader = $(elementId).plupload({
        runtimes: 'html5,flash,silverlight,html4',
        url: uploadUrl,
        max_file_size: '500mb',
        chunk_size: '1mb',
        max_file_count: maxfileCount + 1,
        max_files: maxfileCount,
        multipart_params: { "FolderId": folderId, "localName_Pre": elementId},
        multi_selection: false,
        unique_names: true,
        filters: [
            { title: "上传文件", extensions: 'mp4,jpeg,jpg,png' }
        ],
        //rename: true,
        //sortable: true,
        dragdrop: true,
        views: {
            list: showlist,
            thumbs: showthumbs,
            active: 'list'
        },
        flash_swf_url: 'plupload/plupload-3.1.2/js/Moxie.swf',
        silverlight_xap_url: 'plupload/plupload-3.1.2/js/Moxie.xap',
        init: {
            FilesAdded: function (up, files) {

                var fileCount = up.files.length;
                var ids = $.map(up.files, function (item) { return item.id; });

                //check file extenson name.
                var fileExtensions = new Array();

                for (i = 0; i < fileCount; i++) {

                    var name = up.getFile(ids[i]).name;
                    var extname = name.substr(name.lastIndexOf('.') + 1);
                    fileExtensions.push(extname);

                    //not mp4  not image
                    if (('mp4,jpeg,jpg,png').indexOf(extname) == -1) {
                        up.removeFile(up.getFile(ids[i]));
                        $('#' + ids[i]).remove();
                        alert('请上传视频文件或图片');
                    }
                }

                if (fileExtensions.length == 2) {
                    if (fileExtensions.toString().indexOf("mp4") === -1) {
                        alert('请上传视频文件');
                        up.removeFile(up.getFile(ids[1]));
                        $('#' + ids[1]).remove();
                    }
                    else if (fileExtensions.toString().indexOf("jpeg") === -1 && fileExtensions.toString().indexOf("jpg") === -1 && fileExtensions.toString().indexOf("png") === -1) {
                        alert('请上传封面文件');
                        up.removeFile(up.getFile(ids[1]));
                        $('#' + ids[1]).remove();
                    }
                }

                //check file count.
                if (up.files.length > maxfileCount) {
                    for (i = 0; i < fileCount; i++) {
                        //if (up.getFile(ids[i]).processed == 0) {
                        up.removeFile(up.getFile(ids[maxfileCount]));
                        $('#' + ids[maxfileCount]).remove();
                        //}
                        break;
                    }
                    alert('最多上传' + maxfileCount + '个文件');

                    return false;
                }
                //up.start();
            },
            BeforeUpload: function (up, file) {

                var fileCount = up.files.length;
                var ids = $.map(up.files, function (item) { return item.id; });

                //check file extenson name.
                var fileExtensions = new Array();
                postFileExtName = new Array();

                for (i = 0; i < fileCount; i++) {

                    var name = up.getFile(ids[i]).name;
                    var extname = name.substr(name.lastIndexOf('.') + 1);
                    fileExtensions.push(extname);
                    postFileExtName.push(extname);
                }
                if (fileExtensions.indexOf('mp4') === -1) {
                    up.stop();
                    alert('请上传视频文件');
                    return true;
                } else if (fileExtensions.indexOf('jpg') === -1 && fileExtensions.indexOf('jpeg') === -1 && fileExtensions.indexOf('png') === -1) {
                    up.stop();
                    alert('请上传封面文件');
                    return true;
                }

                return true;

                var filename = file.name;
                if (!(filesArry.indexOf(filename) >= 0)) {
                    filesArry.push(filename);
                    return true;

                } else {
                    up.removeFile(file);
                    return false;
                }
            },
            UploadComplete: function (up,files) {
                //console.log(folderId);
                loadGrids(folderId);
            }
        }
    });

    $('.plupload_filelist_header td.plupload_file_name').html('请上传MP4格式的视频文件和视频的封面');
}