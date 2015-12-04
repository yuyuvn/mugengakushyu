jQuery(document).ready(function($){
    
    historys = [];
    current_position = 0;
    
    function checkCompleted(){
        if($(".ch-fillable:not(.filled):first").length!=0) return;
        checkAnswer();
    }
    function checkAnswer(){
        $('.filled').unbind("click");
        var str_answer = "";
        $('.ch-answer').each(function( index ) {
          str_answer+=($(this).find('.ch-info-front .kanji').html().trim()=='')?'*':$(this).find('.ch-info-front .kanji').html().trim();
        });
        $.ajax({
               url:'/learns/check',
               type: 'POST',
               dataType: 'json',
               data: {word_id:$('.info-word').attr('data-id'),answer:str_answer},
               success: function(data){
                 if(data.status==200){
                     
                    $('.info-word .title').html(data.word.pronounce);
                    $('.info-word .mean').html(data.word.mean);
                    
                    $.each(data.matchs, function( index, match ) {
                         $('.ch-fillable:eq('+index+')').find('.ch-info-front .kanji').html(match.correct.text);
                         $('.ch-fillable:eq('+index+')').find('.ch-info-front .meaning').html(match.correct.mean);
                         $(".ch-answer:not(.ch-fillable)").addClass('not-event');
                         $(".ch-answer").find('.ch-info-front').addClass('ch-success');
                         $(".ch-answer").removeClass('ch-answer');
                        if(match.is_matched){
                            $('.ch-fillable:eq('+index+')').addClass('not-event');
                        }else {
                            $('.ch-fillable:eq('+index+')').addClass('ch-error');
                            $('.ch-fillable:eq('+index+')').find('.ch-info-back .kanji').html(match.not_correct.text);
                            $('.ch-fillable:eq('+index+')').find('.ch-info-back .meaning').html(match.not_correct.mean);
                        }
                    });
                    $('.ch-fillable .ch-info-front').addClass('margin-top-zezo');
                    $(".ch-chose").addClass('ch-help');
                    $('.ch-chose').unbind("click");
                    $('.ch-help').bind("click",hanldeHelp);
                 }
                 
                 historys.push($('.content')[0].outerHTML);
                 current_position = historys.length-1;
                 
                 $(".ch-fillable").addClass("filled");
               },
               error: function(xhr, err) {
                 
               }
        });
        $('.btn-next').attr('data-answered','true')
    }
    function hanldeFill(){
        $this = $(this);
        $(this).find('.ch-info-front').animate({marginTop: "100%"},function() {
            $this.find('.ch-info-front .kanji').html('');
            $this.removeClass('filled');
          });
    }
    function hanldeChose(){
        if($(".ch-fillable:not(.filled):first").length==0) return;
        $(".ch-fillable:not(.filled):first").find('.ch-info-front .kanji').html($(this).find('.ch-info-front .kanji').html());
        $(".ch-fillable:not(.filled):first").find('.ch-info-front').animate({marginTop: "0%"},function() {
            checkCompleted();
        });
        $(".ch-fillable:not(.filled):first").addClass('filled');
        $('.filled').unbind("click");
        $('.filled').bind("click",hanldeFill);
    }
    function hanldeHelp(){
        $.ajax({
               url:'/learns/kanji',
               type: 'POST',
               dataType: 'json',
               data: {kanji:$(this).find('.ch-info-front .kanji').html().trim()},
               success: function(data){
                 if(data.status==200){
                   $('.info-kanji .text').html(data.info.text);
                   $('.info-kanji .mean').html(data.info.mean);
                   $('.info-kanji dl .other_mean').html(data.info.other_mean);
                   $('.info-kanji dl .kun').html(data.info.kun);
                   $('.info-kanji dl .on').html(data.info.on);
                   $('.info-kanji').collapse('show');
                 }
               },
               error: function(xhr, err) {
                 
               }
        });
    }
    function hanldeNext(){
        console.log(historys.length+'/'+current_position);
        console.log(historys);
        if(current_position==0||(current_position+1)==historys.length){
            if($(this).attr('data-answered')=='false'){
                checkAnswer();
            }else{
                $.ajax({
                       url:'/learns/questtion',
                       type: 'GET',
                       dataType: 'json',
                       success: function(data){
                         if(data.status==200){
                             $( ".content" ).replaceWith(data.html);
                             $('.btn-prev').removeClass('hidden');
                             $('.btn-prev').attr('data-prev',historys.length-1);
                            //  current_position = historys.length;
                         }
                       },
                       error: function(xhr, err) {
                         
                       }
                });
            }
        } else{
            current_position ++;
            $( ".content" ).replaceWith(historys[current_position]);
        }
    }
    function hanldePrev(){
        console.log(historys);
        if(current_position==0||(current_position+1)==historys.length){
            historys.push($('.content')[0].outerHTML);
        }
        current_position = parseInt($('.btn-prev').attr('data-prev'))+1;
        $( ".content" ).replaceWith(historys[$('.btn-prev').attr('data-prev')]);
    }
    $('body').on('click','.ch-chose',hanldeChose);
    $('body').on('click','.btn-next',hanldeNext);
    $('body').on('click','.btn-prev',hanldePrev);
});

