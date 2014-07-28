<?php 
//Формируем массивы с отзывами
$review_text=array();
$review_image=array();
$review_video=array();

foreach ($reviews as $review) { ?>
	<? if ($review['type_id']==0):?>
		<?php 
		$review_text[]='<div class="review-list">
						  <div class="author"><b>'.$review['author'].'</b>'.$text_on.$review['date_added'].'</div>
						  <div class="rating"><img src="catalog/view/theme/default/image/stars-'.$review['rating'].'.png'.'"alt="'.$review['reviews'].'" /></div>
						  <div class="text">'.html_entity_decode($review['text']).'</div></div>';
		?>
	<? endif;?>
	
	<? if ($review['type_id']==1):?>
		<?php 
		$review_image[]='<div class="review-list">
						  <div class="author"><b>'.$review['author'].'</b>'.$text_on.$review['date_added'].'</div>
						  <div class="rating"><img src="catalog/view/theme/default/image/stars-'.$review['rating'].'.png'.'"alt="'.$review['reviews'].'" /></div>
						  <div class="text"><a class="fancybox" rel="group" href="'.$review['text'].'" title="'.$review['author'].'"><img src="'.$review['text'].'" width="300" alt="'.$review['author'].'"></a></div></div>';
		?>
	<? endif;?>
	
	<? if ($review['type_id']==2):?>
		<?php 
		//ссылка вида: http://www.youtube.com/watch?v=tLu4eHou9K8
		parse_str( parse_url( $review['text'], PHP_URL_QUERY ), $url );
		//echo $my_array_of_vars['v'];
		
		$review_video[]='<div class="review-list">
						  <div class="author"><b>'.$review['author'].'</b>'.$text_on.$review['date_added'].'</div>
						  <div class="rating"><img src="catalog/view/theme/default/image/stars-'.$review['rating'].'.png'.'"alt="'.$review['reviews'].'" /></div>
						  <div class="text"><iframe width="560" height="315" src="//www.youtube.com/embed/'.$url['v'].'" frameborder="0" allowfullscreen></iframe></div></div>';
		?>
	<? endif;?>
	
	<?php 
}?>

<p>Для просмотра и добавления отзывов выберите нужный тип:</p>

<div id="review_tabs" class="htabs">
	<a href="#review-tab-text">Текст (<?=count($review_text);?>)</a>
	<a href="#review-tab-image">Картинки (<?=count($review_image);?>)</a>
	<a href="#review-tab-video">Видео (<?=count($review_video);?>)</a>    
</div>

<div id="review-tab-text" class="tab-content">
	<?foreach ($review_text as $review){
		echo $review;
	}?>
	<h2 id="review-title-text">Добавить текстовый комментарий</h2>
    <b>Ваше имя:</b><br />
    <input type="text" id="review_text_form_name" value="" />
    <br />
    <br />
    <b>Текст отзыва</b>
    <textarea cols="40" rows="8" style="width: 98%;" id="review_text_form_text"></textarea>
    <br />
    <b>Ваша оценка: </b> <span>Плохо</span>&nbsp;
    <input type="radio" name="rating" value="1" />
    &nbsp;
    <input type="radio" name="rating" value="2" />
    &nbsp;
    <input type="radio" name="rating" value="3" />
    &nbsp;
    <input type="radio" name="rating" value="4" />
    &nbsp;
    <input type="radio" name="rating" value="5" />
    &nbsp;<span>Хорошо</span><br />
    <br />
    <b>Код с картинки:</b><br />
    <input type="text" value="" id="review_text_form_captcha"/>
    <br />
    <img src="index.php?route=product/product/captcha" alt="" id="captcha" /><br />
    <br />
    <div class="buttons">
      <div class="right"><a id="review_text_form_submit" class="button">Добавить</a></div>
    </div>
</div>

<div id="review-tab-image" class="tab-content">
	<?foreach ($review_image as $review){
		echo $review;
	}?>
	<h2 id="review-title-image">Добавить картинку</h2>
    <b>Ваше имя:</b><br />
    <input type="text" id="review_image_form_name" value="" />
    <br />
    <br />
    <b>Картинка</b><br/>
    <form enctype="multipart/form-data" action="/uploads/upload.php" method="POST" id="mainForm">
	  <input id="uploadImage" type="file" accept="image/*" name="image"/>
	</form>
    <br />
    <br />
    <b>Ваша оценка: </b><br> <span>Плохо</span>&nbsp;
    <input type="radio" name="rating" value="1" />
    &nbsp;
    <input type="radio" name="rating" value="2" />
    &nbsp;
    <input type="radio" name="rating" value="3" />
    &nbsp;
    <input type="radio" name="rating" value="4" />
    &nbsp;
    <input type="radio" name="rating" value="5" />
    &nbsp;<span>Хорошо</span><br />
    <br />
    <b>Код с картинки:</b><br />
    <input type="text" value="" id="review_image_form_captcha"/>
    <br />
    <img src="index.php?route=product/product/captcha" alt="" id="captcha" /><br />
    <br />
    <div class="buttons">
      <div class="right"><a id="review_image_form_submit" class="button">Добавить</a></div>
    </div>
</div>
<div id="review-tab-video" class="tab-content">
	<?foreach ($review_video as $review){
		echo $review;
	}?>
	<h2 id="review-title-video">Добавить видео</h2>
    <b>Ваше имя:</b><br />
    <input type="text" id="review_video_form_name" value="" />
    <br />
    <br />
    <b>Ссылка на ролик с YouTube:</b><br>
    <input type="text" id="review_video_form_text" value="" placeholder="http://www.youtube.com/watch?v=7Zu7GVfx6Ng" style="width: 98%;"/>
    <br />
    <b>Ваша оценка: </b><br> <span>Плохо</span>&nbsp;
    <input type="radio" name="rating" value="1" />
    &nbsp;
    <input type="radio" name="rating" value="2" />
    &nbsp;
    <input type="radio" name="rating" value="3" />
    &nbsp;
    <input type="radio" name="rating" value="4" />
    &nbsp;
    <input type="radio" name="rating" value="5" />
    &nbsp;<span>Хорошо</span><br />
    <br />
    <b>Код с картинки:</b><br />
    <input type="text" value="" id="review_video_form_captcha"/>
    <br />
    <img src="index.php?route=product/product/captcha" alt="" id="captcha" /><br />
    <br />
    <div class="buttons">
      <div class="right"><a id="review_video_form_submit" class="button">Добавить</a></div>
    </div>
</div>



<!-- <div class="pagination"><?php echo $pagination; ?></div> -->




<script type="text/javascript" src="/admin/view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript" src="/js/fancybox/source/jquery.fancybox.pack.js"></script>


<script type="text/javascript">

//Вкладки
$('#review_tabs a').tabs();

//Fancybox
$(document).ready(function() {
	$(".fancybox").fancybox();
});

//Визуальный редактор
CKEDITOR.replace('review_text_form_text', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager',
	filebrowserUploadUrl: 'index.php?route=common/filemanager',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager'
});

//Кнопка оставить текстовый отзыв
$('#review_text_form_submit').bind('click', function() {
	$('.success, .warning').remove();
	$('input[name=\'name\']').val($('#review_text_form_name').val());
	$('input[name=\'captcha\']').val($('#review_text_form_captcha').val());
	$('input[name=\'rating_id\']').val($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val():'');
	$('input[name=\'type_id\']').val('0');
	$('textarea[name=\'text\']').val($('.cke_contents iframe').contents().find('body').html());
	$('#button-review').click();
});

//Кнопка добавить картинку
$('#review_image_form_submit').bind('click', function() {
	$('.success, .warning').remove();
	var data = new FormData($('#mainForm')[0]);
	    $.ajax({
	      type: "POST",
	      url: "/uploads/upload.php",
	      data: data,
	      contentType: false,
	      processData: false,
	      beforeSend: function() {
				//TODO сделать загрузчик
		      $('#loader').show();
	      }
	    }).done(function (result) {
	        result=result.split('|');
	        if (result[0]==0){
	        	$('input[name=\'name\']').val($('#review_image_form_name').val());
	        	$('input[name=\'captcha\']').val($('#review_image_form_captcha').val());
	        	$('input[name=\'rating_id\']').val($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val():'');
	        	$('input[name=\'type_id\']').val('1');
	        	$('textarea[name=\'text\']').val(result[1]);
	        	$('#button-review').click();
			}else{
				//alert(result[1]);
				$('#review-title-image').after('<div class="warning">' + result[1] + '</div>');
			}
	});
});

//Кнопка оставить видео-комментарий
$('#review_video_form_submit').bind('click', function() {
	$('.success, .warning').remove();
	$('input[name=\'name\']').val($('#review_video_form_name').val());
	$('input[name=\'captcha\']').val($('#review_video_form_captcha').val());
	$('input[name=\'rating_id\']').val($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val():'');
	$('input[name=\'type_id\']').val('2');
	$('textarea[name=\'text\']').val($('#review_video_form_text').val());
	//Валидный URL от YouTube
	var url=$('#review_video_form_text').val();
	var p = /^(?:https?:\/\/)?(?:www\.)?youtube\.com\/watch\?(?=.*v=((\w|-){11}))(?:\S+)?$/;
    var result=(url.match(p)) ? RegExp.$1 : false;
    if (result){
		//$('textarea[name=\'text\']').val(result);
		$('#button-review').click();
    }else{
    	$('#review-title-video').after('<div class="warning">Неккоректная ссылка на ролик с YouTube</div>');
    } 
	
});

//AJAX-загрузка картинки
/*$("#mainForm").submit(function (event) {
    event.preventDefault();
    var data = new FormData($('#mainForm')[0]);
    $.ajax({
      type: "POST",
      url: "/uploads/upload.php",
      data: data,
      contentType: false,
      processData: false,
      beforeSend: function() {
        $('#loader').show();
      }
    }).done(function (html) {
        alert(html);
        //$("#results").append(html);
        //$('#loader').hide();
        //$('#mainForm')[0].reset();
      });
});*/


</script> 

