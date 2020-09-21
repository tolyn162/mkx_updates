content=$(
	echo "https://mkmobileupdate.com/tag/upcoming-challenges/" |
	wget -O- -i- |
	hxnormalize -x  |
	hxselect -i "main.site-main" |
	lynx -stdin -dump
)

newChar=$(
	echo "$content" |
	head -3 | tail -1 |
	sed -E 's/\[[0-9]*\](.*)Challenge Requirements \| Mortal Kombat Mobile/\1/'
)

oldChar=$(cat oldChar)

if [ "$newChar" == "$oldChar" ]; then
	echo No change
	echo no > ./update
fi

echo yes > ./update
echo "$newChar" > ./oldChar

duration=$(
	echo "$content" |
	head -10 |
	xargs |
	sed -E 's/.*Duration (.*)\) Hello Gamers .*/\1/'
)

reqs=$(
	echo "$content" |
	grep " 1. https:" |
	sed -E 's/.*1. //' |
	wget -O- -i- |
	hxnormalize -x  |
	hxselect -i "div.entry-content" |
	lynx -stdin -dump |
	sed -E 's/.*Click here to view (.*)/\1:/' |
	sed -E 's/.*(\[.*\]|Normal|Hard|Elder|Boss Fight).*//' |
	xargs |
	sed -E 's/.*NORMAL/NORMAL/' |
	sed -E 's/References.*//' |
	sed 's/ Tower /\n  Tower /g' |
	sed -E 's/ (HARD|ELDER)/\n\n\1/'
)

printf "%s\n%s\n\n%s\n" "$newChar" "$duration" "$reqs"> ./content
