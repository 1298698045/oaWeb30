$(function () {
  

    $('.order-menu').on('mouseover', 'span', function () {

        var index = $(this).index()
        $(this).addClass('selected')
        $(this).siblings().removeClass('selected')

        $(this).parent().parent().parent().next().children().children().hide().eq(index).show();



    })


    $('#SI_Order_A').on('mouseover', 'span', function () {

        var index = $(this).index()
      
        $(this).parent().parent().next().next().next().children().hide().eq(index).show();


    })

    $('#SI_Order_B').on('mouseover', 'span', function () {
        var index = $(this).index()
        $(this).parent().parent().next().next().next().children().hide().eq(index).show();



    })
    var left = 0;
    $('#SI_Guess_Prevs').click(function () {
        left = left - 50;
        if ($('#current-video').css('left') > -5000) {
            $('#current-video').css('left', left + 'px')
        }
    })
})