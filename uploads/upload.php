<?php
//0-загрузка успешна
//1-какая-то проблема

$extensions = array (
		'jpeg',
		'jpg',
		'png',
		'gif' 
);
$max_size = 1000000;
$path = '/home/klen/ocstore.obedkin.ru/uploads/';
$response = '';
if ($_SERVER ['REQUEST_METHOD'] === 'POST') {
	if ($_FILES ['image'] ['size'] > $max_size) {
		$response = '1|Файл слишком большой';
	} else {
		$ext = strtolower ( pathinfo ( $_FILES ['image'] ['name'], PATHINFO_EXTENSION ) );
		if (in_array ( $ext, $extensions )) {
			$uniqid=uniqid ();
			$path = $path . $uniqid . '.' . $ext;
			if (move_uploaded_file ( $_FILES ['image'] ['tmp_name'], $path )) {
				//$response = "<img style='height: 200px' src='$path' />";
				$response='0|/uploads/'.$uniqid.'.' . $ext;
			}
		} else {
			$response = '1|Файл не загружен, либо не является изображением';
		}
	}
}

echo $response;