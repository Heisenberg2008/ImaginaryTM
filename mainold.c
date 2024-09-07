#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdbool.h>

int MAX_CHAR = 99;

int main() {
    printf("Welcome to the Imaginary TM network. Sign in or sign up by \n");
    printf("typing 'new' as the username. (Max. characters are 99) \n");

    char username[MAX_CHAR];
    char password[MAX_CHAR];
    char new[4] = "new";

    fgets(username, MAX_CHAR, stdin);

    if(strcmp(username, "new\n") == 0) {
        char confirm;
        printf("You entered 'new' as your username. Register at Imaginary TM? (Y/N) > ");
        confirm = fgetc(stdin);
        confirm = tolower(confirm);
        if((int)confirm == (int)'n') {printf("Sign up aborted. \n"); return 2;}
        if((int)confirm != (int)'y') {printf("Invalid Input. \n"); return 3;}
        else {
            while(getchar() != '\n');
            makeNewAccount();
            return 0;
        }
    }

    printf("Please enter your password. \n");
    fgets(password, MAX_CHAR, stdin);
    return 0;
}

void stringLowercase(char *str) {
    int i = 0;
    while (str[i]) {
        str[i] = tolower((unsigned char) str[i]);
        i++;
    }
}

int makeNewAccount() {
    char confirm[MAX_CHAR];
    char confirmedY[1] = 'y\n';
    char new_username[MAX_CHAR];
    char new_password[MAX_CHAR];
    printf("Making new account...\n");

    while(true) {
        printf("Please enter your new username >");
        fgets(new_username, MAX_CHAR, stdin);
        size_t len = strlen(new_username);
        if (len > 0 && new_username[len - 1] == '\n') {
            new_username[len - 1] = '\0';
        }
        printf("Does %s look correct? (Y/N) >", new_username);
        while (getchar() != '\n');
        fgets(confirm, 1, stdin);
        stringLowercase(confirm);
        printf("DEBUG: GOT HERE");
        if (strcmp(confirm, confirmedY) != 0) {
            printf("Retry?");
            confirm[MAX_CHAR] = '\0';
            confirm[MAX_CHAR] = fgetc(stdin);
            confirm[MAX_CHAR] = tolower(confirm);
            if (strcmp(confirm, 'y') != 0) { return 10; }
        }
    }

    while(true) {
        printf("Please enter your new password >");
        fgets(new_password, MAX_CHAR, stdin);
        size_t len = strlen(new_password);
        if (len > 0 && new_password[len - 1] == '\n') {
            new_password[len - 1] = '\0';
        }
        printf("Does %s look correct? (Y/N) >", new_password);
        while (getchar() != '\n');
        fgets(confirm, 1, stdin);
        stringlowercase(confirm);
        while (getchar() != '\n');
        if (strcmp(confirm[0], 'y\n') != 0) {
            printf("Retry?");
            confirm[MAX_CHAR] = '\0';
            confirm[MAX_CHAR] = fgetc(stdin);
            confirm[MAX_CHAR] = tolower(confirm);
            if (strcmp(confirm, 'y') != 0) { return 10; }
        }
    }
}