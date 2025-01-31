#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdbool.h>
#include "main.h"

#define MAX_CHAR 99

int main() {
    printf("Welcome to the Imaginary TM network. Sign in or sign up by \n");
    printf("typing 'new' as the username. (Max. characters are 99) \n");

    char username[MAX_CHAR]; // These are the strings to confirm with DB
    char password[MAX_CHAR];

    fgets(username, MAX_CHAR, stdin);

    if (strcmp(username, "new\n") == 0) {
        char confirm;
        printf("You entered 'new' as your username. Register at Imaginary TM? (Y/N) > ");
        confirm = fgetc(stdin);
        confirm = tolower(confirm);
        if((int)confirm == (int)'n') {printf("Sign up aborted. \n"); return 2;}
        if((int)confirm != (int)'y') {printf("Invalid Input. \n"); return 3;}
        else {
            puts("Creating new account... WIP");
            
            char *new_username = makeNewAccountUsername();
            printf("DEBUG: new_username is %s\n",new_username);

            return 0;
        }
    } else {
        printf("Please enter your password. \n");
        fgets(password, MAX_CHAR, stdin);
        return 0;
    }
}

char *makeNewAccountUsername() {
    char confirm[2];
    char *new_username = malloc(MAX_CHAR * sizeof(char));

    if (new_username == NULL) {
        printf("FATAL: Memory Allocation failed in makeNewAccountUsername() !!");
        return NULL;
    }

    while (getchar() != '\n');

    while (true) {
        printf("Please enter your new username >");
        fgets(new_username, MAX_CHAR, stdin);
        size_t len = strlen(new_username);
        if (len > 0 && new_username[len - 1] == '\n') {
            new_username[len - 1] = '\0';
        }
        printf("Does %s look correct? (Y/N) >", new_username);
        confirm[0] = fgetc(stdin);
        confirm[0] = tolower(confirm[0]);
        while (getchar() != '\n');
        if (confirm[0] == 'y') {return new_username;}
        if (confirm[0] == 'n') {
            printf("Retry? (Y/N) > ");
            confirm[0] = fgetc(stdin);
            confirm[0] = tolower(confirm[0]);
            if (confirm[0] == 'y') {
                memset(new_username, '\0', MAX_CHAR);
                while (getchar() != '\n');
                continue;
            }
            else {
                free(new_username);
                return NULL;
            }
        } 
        else {puts("Invalid Input. \n"); continue;}
    }
}

char *makeNewAccountPassword() {
    char confirm[MAX_CHAR];
    char *new_password = malloc(MAX_CHAR * sizeof(char));

    if(new_password = NULL) {
        puts("FATAL: Memory Allocation failed in makeNewAccountPassword() !!");
        return NULL;
    }

    while (getchar() != '\n');

    while (true) {
        printf("Please enter your new password >");
        fgets(new_password, MAX_CHAR, stdin);
        size_t len = strlen(new_password);
        if (len > 0 && new_password[len - 1] == '\n') {
            new_password[len - 1] = '\0';
        }
        printf("Does %s look correct? (Y/N) >", new_password);
        confirm[0] = fgetc(stdin);
        confirm[0] = tolower(confirm[0]);
        while (getchar() != '\n');
        if (confirm[0] == 'y') {return new_password;} 
        if (confirm[0] == 'n') {
            printf("Retry? (Y/N) >");
            confirm[0] = fgetc(stdin);
            confirm[0] = tolower(confirm[0]);
            if (confirm[0] == 'y') {
                memset(new_password, '\0', MAX_CHAR);
                while (getchar() != '\n');
                continue;
            } 
            else {
                free(new_password);
                return NULL;
            }
        }
        else {puts("Invalid Input. \n"); continue;}
    }
}