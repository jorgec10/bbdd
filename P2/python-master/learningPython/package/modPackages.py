import re

find_func = []
for func in dir(re):
    if "find" in func:
        find_func.append(func)
print sorted(find_func)