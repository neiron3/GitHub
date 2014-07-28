<?php if ($reviews) { ?>
<?php foreach ($reviews as $review) { ?>
<div class="review-list">
  <div class="author"><b><?php echo $review['author']; ?></b> <?php echo $text_on; ?> <?php echo $review['date_added']; ?></div>
  <div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $review['rating'] . '.png'; ?>" alt="<?php echo $review['reviews']; ?>" /></div>
  <div class="text"><?=html_entity_decode($review['text']); ?>
</div>
</div>
<?php } ?>
<div class="pagination"><?php echo $pagination; ?></div>
<?php } else { ?>
<div class="content"><?php echo $text_no_reviews; ?></div>
<?php } ?>


<div id="review_tabs" class="htabs">
	<a href="#review-tab-text">Текст</a>
	<a href="#review-tab-image">Картинки</a>
	<a href="#review-tab-video">Видео</a>    
</div>
<div id="review-tab-text" class="tab-content">
	Текст
</div>
<div id="review-tab-image" class="tab-content">
	Картинки
</div>
<div id="review-tab-video" class="tab-content">
	Видео
</div>

<script type="text/javascript">
$('#review_tabs a').tabs();
</script> 
