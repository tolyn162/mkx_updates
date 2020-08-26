curl -g -s -G "https://wirepusher.com/send" \
--data-urlencode "id=$1" \
--data-urlencode "title=New mkx Challenge" \
--data-urlencode "message=$(cat content)"
