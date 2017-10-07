<?php 

$json = json_encode('acción',JSON_UNESCAPED_UNICODE);

echo "
<pre>";
print($json);


print("DECOFICIA:::".json_decode($json));



?>
