/*This tool calculates how long u have been running a program*/

#include <stdio.h>
#include <time.h>
#include <unistd.h>
#include <stdlib.h>

int main (void) {
    int hour, minute, second;

    hour = minute = second = 0; // We Set it to 0 by default

    while (1) {
        system("clear");

        // format of HH - MM - SS
        printf("you have been running this app for %02d : %02d : %02d",hour,minute,second);
    

        fflush(stdout);

        // Increase second every frame
        second++;

        if(second == 60) {
            minute += 1;
            second = 0;
        }

        if(minute == 60) {
            hour += 1;
            minute = 0;
        }

        // if new day
        if(hour == 24) {
            minute = 0;
            second = 0;
            hour = 0;
        }

        sleep (1); // we sleep for 1 second to update every second, if this line wasnt here, then everything it would stay at 0:0:0 for ever
    }

}