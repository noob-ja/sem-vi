<?php
$f = fopen('cell.csv', 'r');
$countrycode = 472;
$country = "Maldives";
$db = new SQLite3('cell_'.$country.'.db');

$db->exec('
	CREATE TABLE "celltower" (
	"id" TEXT,
	"data_source" TEXT,
	"radio_type" TEXT,
	"mcc" TEXT,
	"mnc" TEXT,
	"lac" TEXT,
	"cellid" TEXT,
	"lat" TEXT,
	"lon" TEXT,
	"range" TEXT,
	"time_created" TEXT,
	"time_modified" TEXT,
	PRIMARY KEY (id)
	)
	');

$db->exec('
	CREATE INDEX "details" ON "celltower" ("mcc","mnc","lac","cellid")
	');

$stmt = $db->prepare('
	INSERT INTO "celltower" (
	"id",
	"data_source",
	"radio_type",
	"mcc",
	"mnc",
	"lac",
	"cellid",
	"lat",
	"lon",
	"range",
	"time_created",
	"time_modified"
	) 
	VALUES (?,?,?,?,?,?,?,?,?,?,?,?)
	');
$stmt->bindParam(1, $id, SQLITE3_TEXT );
$stmt->bindParam(2, $data_source, SQLITE3_TEXT );
$stmt->bindParam(3, $radio_type, SQLITE3_TEXT );
$stmt->bindParam(4, $mcc, SQLITE3_TEXT );
$stmt->bindParam(5, $mnc, SQLITE3_TEXT );
$stmt->bindParam(6, $lac, SQLITE3_TEXT );
$stmt->bindParam(7, $cellid, SQLITE3_TEXT );
$stmt->bindParam(8, $lat, SQLITE3_TEXT );
$stmt->bindParam(9, $lon, SQLITE3_TEXT );
$stmt->bindParam(10, $range, SQLITE3_TEXT );
$stmt->bindParam(11, $time_created, SQLITE3_TEXT );
$stmt->bindParam(12, $time_modified, SQLITE3_TEXT );
$db->exec('BEGIN TRANSACTION');
$count = 0;
while ($row = fgetcsv($f, 0, ',')){
	if(intval($row[3]) == $countrycode){
		list($id, $data_source, $radio_type, $mcc, $mnc, $lac, $cellid, $lat, $lon, $range, $time_created, $time_modified) = $row;
		$stmt->execute();
	}
}
$db->exec('COMMIT');
// fclose($fto);
fclose($f);
?>