<?php
require_once('readDB_api.php');
$database = 'cell_';

$f = fopen('Extracted.txt','r');
$f2 = fopen('Result.txt','w');
while(!feof($f)){
	$line = fgets($f);
	if(empty($line) || $line=='') continue;
	$result = getLatLngBaseTower($line);
	echo $result['lat'] . '     ' . $result['lng'].PHP_EOL;
	if($result['lat']=='-'||$result['lng']=='-') continue;
	fwrite($f2, $result['lat'].','.$result['lng'].PHP_EOL);
}
fclose($f);
fclose($f2);
?>