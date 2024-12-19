dic = {}
with open("favorite_foods.log" ,'r') as f:
    for l in f:
        for w in l.split():
            dic[w] = dic.get(w,0)+1

# sort list with key
sort_freqs = sorted(dic.items(), key=lambda x: x[1], reverse=True)

#
print("Select your favorite food below:\n")
food = ["salad","fish","pizza","watermelon","broccoli","cake","bananas","burgers","pie","rice","spaghetti"]

for i in food:
	print(i)

fave = raw_input("\nWhich of the foods above is your favorite? ")

# print the food frequency
#print ('\n'.join(['%s of your friends like %s as well' % (v, k) for k, v in sort_freqs]))

for k, v in sort_freqs:
	if (k == fave):
		print(v),
		print("of your friends like"),
		print(k),
		print("as well!")
