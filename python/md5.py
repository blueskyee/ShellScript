import hashlib
with open ("gaid_uber_6_3.txt") as myfile:
	data=myfile.readlines()
	for line in data:
		hash_object = hashlib.md5(line.encode())
		print(hash_object.hexdigest())
