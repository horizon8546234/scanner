import matplotlib.pyplot as plt
with open('vo_2_2.txt', 'r') as f:
    lines = f.readlines()
    t = [float(line.split()[0]) for line in lines]
    people1_comfort = [float(line.split()[1]) for line in lines]
    d1 = [float(line.split()[2]) for line in lines]
    people2_comfort = [float(line.split()[3]) for line in lines]
    d2 = [float(line.split()[4]) for line in lines]

k=0
mean=0
max_comfort=0
for i in  range (len(t)):
    if(d2[i]<6):
        mean+=people2_comfort[i]
        k+=1
    if(max_comfort<people2_comfort[i]):
        max_comfort=people2_comfort[i]

print mean/k
print max_comfort  


plt.figure(1)
plt.subplot(2, 2, 1)
plt.title("people1_comfort")
plt.xlabel("t(s)")
plt.ylabel("comfort")
plt.plot(t ,people1_comfort)

plt.figure(1)
plt.subplot(2, 2, 2)
plt.title("distance1")
plt.xlabel("t(s)")
plt.ylabel("d(m)")
plt.plot(t ,d1)



plt.figure(1)
plt.subplot(2, 2, 3)
plt.title("people2_comfort")
plt.xlabel("t(s)")
plt.ylabel("comfort")
plt.plot(t ,people2_comfort)

plt.figure(1)
plt.subplot(2, 2, 4)
plt.title("distance2")
plt.xlabel("t(s)")
plt.ylabel("d(m)")
plt.plot(t ,d2)


plt.show()