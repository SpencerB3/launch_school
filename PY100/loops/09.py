fish_list = ['Dory', 'Marlin', 'Gill', 'Nemo', 'Bruce']

# for fish in fish_list:
#     print(fish)
#     if fish == 'Nemo':
#         break

index = 0

while index < len(fish_list):
    print(fish_list[index])
    if fish_list[index] == 'Nemo':
        break

    index += 1