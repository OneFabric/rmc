# Readme

Note that this applet is still in testing. However, feedback and criticism are welcome!

## Installation

Sign up for [UTelly](https://rapidapi.com/utelly/api/utelly/endpoints). You will need to enter credit card info, but you will only be charged if you exceed a certain amount of requests per month. See 'Assumptions' for more details. Make note of your API key. 

Clone this repository onto your mac, keeping note of the path to 'main.sh'

Give [permissions](https://bash.cyberciti.biz/guide/Setting_up_permissions_on_a_script) for 'main.sh' and 'setup.sh'

run 'setup.sh XYZ'. where XYZ is your API key. 

That's it! *Technically* your app should be running now. If it doesn't, and you need help troubleshooting, feel free to contact me. 

## Usage

Nothing much you need to do actively. When you are alerted to the prescence of a movie, you might want to remove it from the file 'movies.txt', and add another one if you wish. 

## Contributions

Any and all contributions are welcome! 

## Assumptions

The path to 'main.sh' from '~/' is '~/Desktop/rmc/scripts/main.sh'

'main.sh' is runnable ( i.e. has permissions to be run ).

'movies.txt' has movies in the format as specified on [imdb.com](https://www.imdb.com/)

You have an API key from rapidAPI, uTelly that you can pass in when you run 'main.sh'. 

Searches for country code, US. 

Right now, works only on mac ( because osascript is being used).

Note that a verbal announcement is made when a movie is found. Working on making it such that the user can pick how they want to be notified. 

The cron setting right now is to make 'main.sh' run every 2 hours. This should still make only 360 requests *per* movie ( in the 'movies.txt' file ) per month, which should keep the user in the free range of using UTelly. ( 1000 per month is free; after that a cent per request ). So if you check for 2 movies every 2 hours, that will bring you closer to paying for requests. If 2 hours is too frequent, or you would rather check many movies once per day, I recommend changing the cron [settings](https://www.ostechnix.com/a-beginners-guide-to-cron-jobs/).