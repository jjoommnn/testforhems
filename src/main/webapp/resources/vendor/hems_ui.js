$(function () {

	var timer = null;
	var timer2 = null;
	var $play = $('.nowWatch .jsPlay');
	var $play2 = $('.energyTip .jsPlay');
	var rollTime = 3000;
	var rollTime2 = 3000;


	var rollingEventListView = function() {
		var $eventListView = $('.nowWatch');
		var liNum = $eventListView.find('> ul > li').length;
		var num = $eventListView.data('num');
		if(typeof num === 'undefined') {
			$eventListView.data('num', num=1);
		}
		num = num+1 <= liNum ? num+1 : 1;
		$eventListView.trigger('changeView', 'cont0'+num);
	}
	var rollingEventListView2 = function() {
		var $eventListView = $('.energyTip');
		var liNum = $eventListView.find('> ul > li').length;
		var num = $eventListView.data('num');
		if(typeof num === 'undefined') {
			$eventListView.data('num', num=1);
		}
		num = num+1 <= liNum ? num+1 : 1;
		$eventListView.trigger('changeView2', 'cont0'+num);
	}
	$(document)
		.on('click', '.noticeBtn a', function() {
			var $list = $('.noticeList');
			var $li = $list.find('li');
			var index = $list.find('li.on').index();
			if($(this).hasClass('pre')){
				$($li[index-1]).addClass('on');
				$($li[index-1]).siblings().removeClass('on');
			}else{
				$($li[index+1]).addClass('on');
				$($li[index+1]).siblings().removeClass('on');
			}
		})
		.on('changeView2', 'div.energyTip', function(e, cls) {
			var $eventListView = $(this);
			var $eventList= $('.energyTip ul');
			var $li = $eventList.find('li');
			var current = $eventListView.attr('class').match(/cont[0-9][0-9]/g)[0];
			var num = parseInt(cls.match(/cont([0-9][0-9])/)[1], 10);
			var $btnList =  $(this).find('.btWrap ul li');
			if(current != cls) {
				$($btnList[num-1]).addClass('on');
				$($btnList[num-1]).siblings().removeClass('on');
				$($li[num-1]).addClass('on');
				$($li[num-1]).siblings().removeClass('on');
				$eventListView.removeClass('cont01 cont02 cont03 cont04 cont05').addClass(cls).data('num', num);

				if($play.hasClass('on')){
					clearTimeout(timer2);
				}else{
					clearTimeout(timer2);
					timer2 = setTimeout(rollingEventListView2, rollTime2);
				}
			}
			e.stopPropagation();
		})
		.on('click', '.energyTip .btWrap li', function() {
			var $current = $(this);
			var index = $current.index();
			$(this).trigger('changeView2', 'cont0'+[index+1]);
		})
		.on('changeView', 'div.nowWatch', function(e, cls) {
			var $eventListView = $(this);
			var $eventList= $('.nowWatch ul');
			var $li = $eventList.find('li');
			var current = $eventListView.attr('class').match(/cont[0-9][0-9]/g)[0];
			var num = parseInt(cls.match(/cont([0-9][0-9])/)[1], 10);
			var $btnList =  $(this).find('.btWrap ul li');
			if(current != cls) {
				$($btnList[num-1]).addClass('on');
				$($btnList[num-1]).siblings().removeClass('on');
				$($li[num-1]).addClass('on');
				$($li[num-1]).siblings().removeClass('on');
				$eventListView.removeClass('cont01 cont02 cont03 cont04 cont05').addClass(cls).data('num', num);

				if($play.hasClass('on')){
					clearTimeout(timer);
				}else{
					clearTimeout(timer);
					timer = setTimeout(rollingEventListView, rollTime);
				}
			}
			e.stopPropagation();
		})
		.on('click', '.nowWatch .btWrap li', function() {
			var $current = $(this);
			var index = $current.index();
			$(this).trigger('changeView', 'cont0'+[index+1]);
		})
		.on('mouseover', '.iconQ', function() {
			var dataID = $(this).data('info');
			if ($('#'+dataID).hasClass("on")){
				$('#'+dataID).removeClass('on');
			}else{
				$('#'+dataID).addClass('on');
			}
		})
		.on('click', '.info_pop .iconClose', function() {
			var $infoPop = $(this).parent().parent();
			if($infoPop.hasClass('on')){
				$infoPop.removeClass('on');
			}else{
				$infoPop.addClass('on');
			}
		})
		.on('click', '.energyTip .jsPlay .iconStop', function() {
			var $play2 = $('.jsPlay');
			if($play2.hasClass('on')){
				$play2.removeClass('on');
				timer2 = setTimeout(rollingEventListView2, rollTime2);
			}else{
				$play2.addClass('on');
				clearTimeout(timer2);
			}
		})
		.on('click', '.nowWatch .jsPlay .iconStop', function() {
			var $play = $('.jsPlay');
			if($play.hasClass('on')){
				$play.removeClass('on');
				timer = setTimeout(rollingEventListView, rollTime);
			}else{
				$play.addClass('on');
				clearTimeout(timer);
			}

		})
		.on('click', 'ul.jslnb > li ', function() {
			var $lnb = $(this);
			if($lnb.hasClass('on')){
				$lnb.removeClass('on');
			}else{
				$lnb.addClass('on').siblings().removeClass('on');
			}
			console.log('111');
		})


	if($play.hasClass('on')){
		clearTimeout(timer);
	}else{
		timer = setTimeout(rollingEventListView, rollTime);
	}
	if($play2.hasClass('on')){
		clearTimeout(timer2);
	}else{
		timer2 = setTimeout(rollingEventListView2, rollTime2);
	}


});