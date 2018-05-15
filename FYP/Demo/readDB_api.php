<?php

function mccToCountry($mcc){
	switch($mcc){
		case '502': return 'Malaysia'; break;
		case '470': return 'Bangladesh'; break;
		case '454'; return 'HongKong'; break;
		// case '404': return 'India'; break;
		default: return 'Malaysia'; break;
	}
}

class myDB extends SQLite3{
	function __construct($dbname){
		$this->open($dbname);
	}
}

function getLatLngBaseTower($qs){
	global $database;

	$data = explode(',', $qs);
	if($data[0] > 2){
		//array holding all query result
		$arrT = array();

		$mcc = $data[2];
		$mnc = $data[3];

		//triangulation variables
		$signalTotal = 0;
		$lat = 0.0;
		$lon = 0.0;

		if(!file_exists($database.mccToCountry($mcc).'.db')){
			$result = array();
			$result['lat'] = isset($lat)? $lat: '-';
			$result['lng'] = isset($lon)? $lon: '-';
			return $result;
		}
		
		//db settings
		$db = new myDB($database.mccToCountry($mcc) .'.db');

		$stmt = $db->prepare('
			SELECT * FROM "celltower" 
			WHERE 
				"mcc" = ? 
			AND "mnc" = ? 
			AND "lac" = ? 
			AND "cellid" = ?
			');
		$stmt->bindParam(1,$mcc, SQLITE3_TEXT);
		$stmt->bindParam(2,$mnc, SQLITE3_TEXT);
		$stmt->bindParam(3,$lac, SQLITE3_TEXT);
		$stmt->bindParam(4,$cellid, SQLITE3_TEXT);

		//looping through each dataset
		for($i=0;$i<$data[0];$i++){
			//if $data incompletes
			if(($i*3)+6 > sizeof($data)){
				break;
			} 
			$lac = $data[4 + ($i*3)];
			$cellid = $data[5 + ($i*3)];

			$result = $stmt->execute();		//query for lat lng from database

			//looping through the returned result
			while($row = $result->fetchArray()){
				/*
				 * $arr = [<latitude>,<longitude>,<signal strength>]
				 */
				$arr = array();
				$arr['lat'] = $row['lat'];
				$arr['lon'] = $row['lon'];
				$arr['sig'] = $data[6 + ($i*3)];
				$signalTotal += floatval($arr['sig']);
				$arrT[] = $arr;
			}		
		}
		// trilateration
		for($i=0;$i<sizeof($arrT);$i++){
			$arr = $arrT[$i];
			$signal = floatval($arr['sig']) / $signalTotal;
			$lat += $signal * floatval($arr['lat']);
			$lon += $signal * floatval($arr['lon']);
		}
	}
	$result = array();
	$result['lat'] = isset($lat)? $lat: '-';
	$result['lng'] = isset($lon)? $lon: '-';
	return $result;
}

?>