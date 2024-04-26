def compare_by_length(str1, str2):
    if len(str1) > len(str2):
        return 1
    elif len(str2) > len(str1):
        return -1
    else:
        return 0

compare_by_length('patience', 'perseverance') # -1
compare_by_length('strength', 'dignity')      #  1
compare_by_length('humor', 'grace')           #  0