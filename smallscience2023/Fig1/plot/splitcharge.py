#!/usr/bin/python3

nline = 90957 # for one timestep
count = 0
url_list = []

with open("charge.cub") as f:
  for line in f:
    url_list.append(line)
    if len(url_list) < nline:
      continue
    filename = str("%d"%(count+1)+".cube")
    with open(filename,'w') as file:
      for url in url_list[1:-1]:
        file.write(url)
      file.write(url_list[-1].strip())
      url_list=[]
      count+=1
# if url_list:
#   filename=str(count)+".cube"
#   with open(filename,'w') as file:
#     for url in url_list:
#       file.write(url)
print('done')
