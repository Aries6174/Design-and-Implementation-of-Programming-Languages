print("Favorite foods, from most popular to least popular")

dic = {}
with open("favorite_foods.log" ,'r') as f:
    for l in f:
        for w in l.split():
            dic[w] = dic.get(w,0)+1

# sort list with key
sort_freqs = sorted(dic.items(), key=lambda x: x[1], reverse=True)

print("Favourite foods, from most popular to least popular")

# print the food frequency
print ('\n'.join(['%s,%s' % (k, v) for k, v in sort_freqs]))
