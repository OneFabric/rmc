#!/bin/bash

apiKey=$1 

# TODO: make parameters configurable at run time

# loop through movies.txt and obtain list of movies to query
    
    # #https://stackoverflow.com/questions/10929453/read-a-file-line-by-line-assigning-the-value-to-a-variable
    while IFS= read -r line
    do movieList[index]=$line; ((index=index+1)) 
    done < ../input/movies.txt

    index=0

#  For each movie...

    for movie in "${movieList[@]}"
    do
        # query API to obtain list of movies 

            curl -vvv -G \
                -o ../output/"$movie"Response.txt \
                --data-urlencode "term=${movie}" \
                --data-urlencode "country=us" \
            	--header 'x-rapidapi-host: utelly-tv-shows-and-movies-availability-v1.p.rapidapi.com' \
            	--header "x-rapidapi-key: $apiKey" \
                --url 'https://utelly-tv-shows-and-movies-availability-v1.p.rapidapi.com/lookup?' \

        # parse resulting data to obtain information
            
            result=$(jq .results ../output/"$movie"Response.txt)

            # if movie is not available for streaming, '[]' will be returned.
            if [ "$result" != "[]" ] 
            then 
                echo "No result. Setting foundList to movie at index"
                foundList[$index]=$movie
                atLeastOneMovie=1
            fi

        ((index=index+1)) 
    done

# conditionally send notification
    
    if [ $atLeastOneMovie -ge 1 ]
    then 
        notification="The following movies are now available: ${foundList[@] }"
        osascript -e `say ${notification}` # Resource: https://code-maven.com/display-notification-from-the-mac-command-line
    fi