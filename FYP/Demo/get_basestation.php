<?php
$f = fopen('Log.txt','r');
$output = fopen('Extracted.txt','w');

$ok = 0;
$no = 0;
while ($row = fgets($f)){
	$data = explode(']', $row);
	$data = explode(',', substr($data[1], 1));
	$valid = @explode('*', $data[0])[3];
	if($valid == "UD" || $valid == "UD2") {
		$ok++;
		$n = $data[17];
		if($n > 0){
			$s = $data[17] . ',' . $data[18] . ',' . $data[19] . ',' . $data[20];
			for($i = 0;$i < $n; $i++){
				$s = @($s . ',' . $data[21] . ',' . $data[22] . ',' . $data[23]);
			}
			$s = $s . "\n";
		}
		fwrite($output,$s);
	}else{
		if($valid != NULL){
			$no++;	
		}
	}
}
echo $ok . "\n";
echo $no . "\n";
fclose($f);
fclose($output);
?>