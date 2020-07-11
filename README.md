 This repo consists of a multistage dockerfile build example.
In this a GO lang simple program is built using multistage build and it's image can be created by:
        docker built -t multistage .
After this the image can be run using :
        docker run multistage  
To check the image size use :
        docker images
And find the tag or if you have multiple docker images you can find the specific tag with the grep command.

