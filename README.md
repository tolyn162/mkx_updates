# MKX updates
A set of scripts to update my database of the current challenge in Mortal Kombat mobile.

## What
I play [Mortal Kombat mobile](https://twitter.com/MKMobileGame) excessively. [This website](http://mkmobileupdate.com/) contains game info including upcoming challenges and requirements. These scripts help me recieve them as push notifications neatly formatted instead of me searching through the website each time.

## How
1. The script `scrape.sh` uses wget, html-xml-utils and other stream editing tools to scrape and neatly puts everything into the file `content`
2. The script `notify.sh` uses wget to send an api request to [wirepusher](http://wirepusher.com/) which pushes content to my phone.
3. A cron job triggers my github workflow which automatically runs the scripts once per day.

## Why
This project helped me experiment with the following:
 - Webscraping with bash
 - Data wrangling with bash
 - Push notifications from bash to android
 - Github actions

> If you would like to recieve notifications too, 1) download [wirepusher](https://play.google.com/store/apps/details?id=com.mrivan.wirepusher) and get user Id, 2) fork this repo, 3) add your user Id to `uids` and 4) make a pull request. Or simply raise an issue with your user Id.
