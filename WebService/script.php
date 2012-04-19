<?php


$link = mysql_connect('localhost', 'user', 'pass'));

mysql_select_db('db_name', $link));

$sql    = ' SELECT E.dates, E.times, E.title, L.venue, L.street, L.plz, L.city
            FROM jos_eventlist_events E, jos_eventlist_venues L
            WHERE E.published = 1
            AND E.locId=L.id
            ORDER BY dates DESC
            ';

$result = mysql_query($sql, $link);


$i=0;

while ($row = mysql_fetch_assoc($result)) {
    $tab[$i]=array(
    "date" =>  mb_convert_encoding (($row['dates']), "UTF-8", "ISO-8859-1" ),
    "heure" => mb_convert_encoding (($row['times']), "UTF-8", "ISO-8859-1" ),
    "titre" => mb_convert_encoding (($row['title']), "UTF-8", "ISO-8859-1" ),
    "adresse" => mb_convert_encoding (($row['street']), "UTF-8", "ISO-8859-1" ),
    "codepostal" => mb_convert_encoding (($row['plz']), "UTF-8", "ISO-8859-1" ),
    "ville" => mb_convert_encoding (($row['city']), "UTF-8", "ISO-8859-1" ),
    );
    $i++;
 
}

echo json_encode($tab);

mysql_free_result($result);
mysql_close($link);
 
?>