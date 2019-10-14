#!/bin/bash

# TODO: make parameters configurable at run time

# TODO: make movie name configurable at run time

# TODO: loop through movies.txt and obtain list of movies to query
    # #https://stackoverflow.com/questions/10929453/read-a-file-line-by-line-assigning-the-value-to-a-variable
    while IFS= read -r line
    do movieList[index]=$line; ((index=index+1)) 
    done < ../input/movies.txt

    # testing 
    echo ${movieList[@]} # prints contents of array


# TODO: query API to obtain list of movies 

# TODO: parse resulting data to obtain information

# TODO: conditionally send email to myself