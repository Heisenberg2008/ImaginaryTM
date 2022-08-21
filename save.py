import pickup
import users

# Execution when called starts here:
users_temp = users.userstable
users_temp.append(pickup.new_user_data)
file2 = open("users.py", "w")
str2 = repr(users_temp)
file2.write("userstable = " + str2)
file2.close()
# print(str(users.userstable))