
var qnaNum = -1;
$(document).ready(function(){
	$('.qa_li .question').click(function(){
		q = $(".qa_li .question").index(this);
		if(q!=qnaNum){
			$('.qa_li .answer').stop(true, true).slideUp(400);
			$('.qa_li').removeClass('open');
			TweenMax.to($('.qa_li .question').eq(qnaNum).find('.iconDiv'), 0.4, {rotation:0});
			qnaNum = q;
			$('.qa_li').eq(qnaNum).addClass('open');
			$('.qa_li .answer').eq(qnaNum).stop(true, true).slideDown(400);
			//TweenMax.to($('.qa_li .question').eq(qnaNum).find('.iconDiv'), 0.4, {rotation:180});
			TweenMax.to($('.qa_li .question').eq(qnaNum).find('.iconDiv'), 0.4, {rotation:0});
		}else{
			$('.qa_li .answer').eq(qnaNum).stop(true, true).slideUp(400);
			$('.qa_li').eq(qnaNum).removeClass('open');
			TweenMax.to($('.qa_li').eq(qnaNum).find('.question p'), 0.4, {rotation:0});
			qnaNum = -1;
		}
	});
});	