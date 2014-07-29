<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/review.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a  class="button" id="review_save_form"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
          <tr>
            <td><span class="required">*</span> <?php echo $entry_author; ?></td>
            <td><input type="text" name="author" value="<?php echo $author; ?>" />
              <?php if ($error_author) { ?>
              <span class="error"><?php echo $error_author; ?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_product; ?></td>
            <td><input type="text" name="product" value="<?php echo $product; ?>" />
              <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
              <?php if ($error_product) { ?>
              <span class="error"><?php echo $error_product; ?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> 
            <?php 
            switch ($type_id) {
            	case 1:
            		echo 'Картинка';
            		break;
            	case 2:
            		//Видео
            		echo 'Видео';
            		break;
            	default:
            		echo 'Текст';
            		break;
            }
            ?>
            </td>
            <td>
            
            <input type="hidden" value="<?=$type_id;?>" id="type_id"/>
            <?php 
            switch ($type_id) {
				case 0:
					//Текст
					echo '<textarea name="text_text" cols="60" rows="8" id="input_text">'.$text.'</textarea>';
					break;
            	case 1:
            		//Картинка
            		echo '<a class="fancybox" rel="group" href="'.$text.'"><img src="'.$text.'" width="300"></a><br>';
            		echo '<input type="text" id="input_image" value="'.$text.'"/>';
            		break;
            	case 2:
            		//Видео
            		parse_str( parse_url( $text, PHP_URL_QUERY ), $url );
            		echo '<iframe width="560" height="315" src="//www.youtube.com/embed/'.$url['v'].'" frameborder="0" allowfullscreen></iframe><br>';
            		echo '<input type="text" id="input_video" value="'.$text.'"/>';
            		break;
            	default: 
            		echo 'Что-то пошло не так';
            		break;
            } 
            
            ?>
            <br>
            <span class="error" id="text_error"></span>
            <textarea name="text" cols="60" rows="8" id="text" style="display: none;"><?php echo $text; ?></textarea>
              <?php if ($error_text) { ?>
              <span class="error"><?php echo $error_text; ?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_rating; ?></td>
            <td><b class="rating"><?php echo $entry_bad; ?></b>&nbsp;
              <?php if ($rating == 1) { ?>
              <input type="radio" name="rating" value="1" checked />
              <?php } else { ?>
              <input type="radio" name="rating" value="1" />
              <?php } ?>
              &nbsp;
              <?php if ($rating == 2) { ?>
              <input type="radio" name="rating" value="2" checked />
              <?php } else { ?>
              <input type="radio" name="rating" value="2" />
              <?php } ?>
              &nbsp;
              <?php if ($rating == 3) { ?>
              <input type="radio" name="rating" value="3" checked />
              <?php } else { ?>
              <input type="radio" name="rating" value="3" />
              <?php } ?>
              &nbsp;
              <?php if ($rating == 4) { ?>
              <input type="radio" name="rating" value="4" checked />
              <?php } else { ?>
              <input type="radio" name="rating" value="4" />
              <?php } ?>
              &nbsp;
              <?php if ($rating == 5) { ?>
              <input type="radio" name="rating" value="5" checked />
              <?php } else { ?>
              <input type="radio" name="rating" value="5" />
              <?php } ?>
              &nbsp; <b class="rating"><?php echo $entry_good; ?></b>
              <?php if ($error_rating) { ?>
              <span class="error"><?php echo $error_rating; ?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_status; ?></td>
            <td><select name="status">
                <?php if ($status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          
        </table>
      </form>
      <?php 
      if ($type_id==1){
      	echo '<form enctype="multipart/form-data" action="/uploads/upload.php" method="POST" id="mainForm">
            		<input id="uploadImage" type="file" accept="image/*" name="image"/>
            		</form>';
      }
      ?>
      
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$('input[name=\'product\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.product_id
					}
				}));
			}
		});
	},
	select: function(event, ui) {
		$('input[name=\'product\']').val(ui.item.label);
		$('input[name=\'product_id\']').val(ui.item.value);
		
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});
//--></script> 

<script type="text/javascript" src="/js/fancybox/source/jquery.fancybox.pack.js"></script>
<script type="text/javascript" src="/admin/view/javascript/ckeditor/ckeditor.js"></script> 

<script>
$(document).ready(function() {
	$(".fancybox").fancybox();

	//Визуальный редактор
	CKEDITOR.replace('input_text', {
		filebrowserBrowseUrl: 'index.php?route=common/filemanager',
		filebrowserImageBrowseUrl: 'index.php?route=common/filemanager',
		filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager',
		filebrowserUploadUrl: 'index.php?route=common/filemanager',
		filebrowserImageUploadUrl: 'index.php?route=common/filemanager',
		filebrowserFlashUploadUrl: 'index.php?route=common/filemanager'
	});
		
});

</script>

<script>
//Кнопка сохранить отзыв
$('#review_save_form').click(function(){
	var type_id=$('#type_id').val();
	
	switch (type_id) {
		case '0':
			$('#text').val($('.cke_contents iframe').contents().find('body').html());
			$('#form').submit();
			break;
		case '1':
			//Картинка
			if ($('#uploadImage').val()!=''){
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
			        	$('#text').val(result[1]);
			        	$('#form').submit();
					}else{
						$('#text_error').html(result[1]);
					}
				});
			}else{
				$('#form').submit();
			}
			
	    break
	  case '2':
			//Видео
			var url=$('#input_video').val();
			var p = /^(?:https?:\/\/)?(?:www\.)?youtube\.com\/watch\?(?=.*v=((\w|-){11}))(?:\S+)?$/;
		    var result=(url.match(p)) ? RegExp.$1 : false;
		    if (result){
				$('#text').val(url);
				$('#form').submit();
		    }else{
		    	$('#text_error').html('Некоректная ссылка на YouTubе-ролик');
		    }  
	    break
	  default:
	    alert('Я таких значений не знаю')
	}
		
	
})
</script>

<?php echo $footer; ?>