import os
import python.users as users
import subprocess
import python.pickup as pickup
os.system("cls")

print("Welcome to the Imaginary TM network. Sign in or sign up by \n")
print("typing 'new' as the username.")
print()

username = input("Username : ")
password = input("Password : ")
username = username.lower()

# Make a new account
def newaccount(y):
    if username == "new":
        print("You entered 'new' as your username. Register at Imaginary TM?")
        yn = input("Y/N >")
        yn = yn.upper()
        if yn == "N": 
            print("Login aborted.")
            y = False
            exit()
        if yn == "Y": 
            y = True
            return y
        else:
            print("Enter Y or N.")
            y = False
        return y

# Making a new account
if newaccount(False) == True:
    print("Making account.")
    username = input("Enter your new username : ")
    password = input("Enter your new password : ")
    username = username.lower()
    userdata = username + password

    #TODO check if account already exists
    
    # Put in temporary file and signal database to pick it up
    file1 = open("pickup.py","w")
    str1 = repr(userdata)
    file1.write("new_user_data = " + str1)
    file1.close()
    p = subprocess.Popen('save.py', shell=True)
    out,err = p.communicate()


# Merge the strings to get the final format
userdata = username + password

# Check the database for login info and login if sucessful.
if userdata in users.userstable and username != "new":
    print("Logged in as: " + username)
elif userdata not in users.userstable and username != "new":
    print("Login failed. Aborting...")