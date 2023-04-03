path_last = "0001"
id =10

path_number_current = 0
string_current = ""
if 0 <= id <= 9999:
    string_current = str(id)
    if len(string_current) < 4:
        for i in range(4-len(string_current)):
            string_current = "0" + string_current
print(string_current)
# path = ""
# for i in path_last:
#     if(i != 0):
#         path_lastest_string += i
# path_number_current = int(path_lastest_string) + 1


