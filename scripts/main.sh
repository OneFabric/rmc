#!/bin/bash

apiKey=$1 

# TODO: make parameters configurable at run time

# TODO: make movie name configurable at run time

# TODO: loop through movies.txt and obtain list of movies to query
    
    # #https://stackoverflow.com/questions/10929453/read-a-file-line-by-line-assigning-the-value-to-a-variable
    while IFS= read -r line
    do movieList[index]=$line; ((index=index+1)) 
    done < ../input/movies.txt

    # testing 
    # echo ${movieList[@]} # prints contents of array

# TODO: For each movie...

    for movie in "${movieList[@]}"
    do
        # echo "$movie" # print each movie
        # TODO: query API to obtain list of movies 

            curl -vvv -G \
                -o ../output/"$movie"Response.txt \
                --data-urlencode "term=${movie}" \
                --data-urlencode "country=us" \
            	--header 'x-rapidapi-host: utelly-tv-shows-and-movies-availability-v1.p.rapidapi.com' \
            	--header "x-rapidapi-key: $apiKey" \
                --url 'https://utelly-tv-shows-and-movies-availability-v1.p.rapidapi.com/lookup?' \

        # TODO: parse resulting data to obtain information
    done
   


# TODO: conditionally send email to myself