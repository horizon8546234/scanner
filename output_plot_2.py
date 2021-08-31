import matplotlib.pyplot as plt
with open('system1_2.txt', 'r') as f:
    lines = f.readlines()
    t = [float(line.split()[0]) for line in lines]
    people1_vo_comfort = [float(line.split()[1]) for line in lines]
    d1 = [float(line.split()[2]) for line in lines]
    people2_vo_comfort = [float(line.split()[3]) for line in lines]
    d2 = [float(line.split()[4]) for line in lines]


with open('system2_2.txt', 'r') as f_2:
    lines_2 = f_2.readlines()
    t_2 = [float(line_2.split()[0]) for line_2 in lines_2]
    people1_comfort = [float(line_2.split()[1]) for line_2 in lines_2]
    people2_comfort = [float(line_2.split()[3]) for line_2 in lines_2]

with open('system3_2.txt', 'r') as f_3:
    lines_3 = f_3.readlines()
    t_3 = [float(line_3.split()[0]) for line_3 in lines_3]
    people1_proposed_comfort = [float(line_3.split()[1]) for line_3 in lines_3]
    people2_proposed_comfort = [float(line_3.split()[3]) for line_3 in lines_3]


k=0
mean=0
max_comfort=0
for i in  range (len(t)):
    if(people1_vo_comfort[i]>0):
        mean+=people1_vo_comfort[i]
        k+=1
    if(max_comfort<people1_vo_comfort[i]):
        max_comfort=people1_vo_comfort[i]

print 'system1_people1_mean',mean/k
print 'system1_people1_max',max_comfort   


k=0
mean=0
max_comfort=0
for i in  range (len(t)):
    if(people2_vo_comfort[i]>0):
        mean+=people2_vo_comfort[i]
        k+=1
    if(max_comfort<people2_vo_comfort[i]):
        max_comfort=people2_vo_comfort[i]

print 'system1_people2_mean',mean/k
print 'system1_people2_max',max_comfort

k=0
mean=0
max_comfort=0
for i in  range (len(t_2)):
    if(people1_comfort[i]>0.01):
        mean+=people1_comfort[i]
        k+=1
    if(max_comfort<people1_comfort[i]):
        max_comfort=people1_comfort[i]

print 'system2_people1_mean',mean/k
print 'system2_people1_max',max_comfort   


k=0
mean=0
max_comfort=0
for i in  range (len(t_2)):
    if(people2_comfort[i]>0.01):
        mean+=people2_comfort[i]
        k+=1
    if(max_comfort<people2_comfort[i]):
        max_comfort=people2_comfort[i]

print 'system2_people2_mean',mean/k
print 'system2_people2_max',max_comfort   

k=0
mean=0
max_comfort=0
for i in  range (len(t_3)):
    if(people1_proposed_comfort[i]>0.01):
        mean+=people1_proposed_comfort[i]
        k+=1
    if(max_comfort<people1_proposed_comfort[i]):
        max_comfort=people1_proposed_comfort[i]

print 'system3_people1_mean',mean/k
print 'system3_people1_max',max_comfort   


k=0
mean=0
max_comfort=0
for i in  range (len(t_3)):
    if(people2_proposed_comfort[i]>0.01):
        mean+=people2_proposed_comfort[i]
        k+=1
    if(max_comfort<people2_proposed_comfort[i]):
        max_comfort=people2_proposed_comfort[i]

print 'system3_people2_mean',mean/k
print 'system3_people2_max',max_comfort   


plt.figure(1)
plt.subplot(2, 1, 1)
plt.title("people1_comfort")
plt.xlabel("t(s)")
plt.ylabel("comfort")
plt.plot(t ,people1_vo_comfort,label="System1")
plt.plot(t_2 ,people1_comfort,label="System2")
plt.plot(t_3 ,people1_proposed_comfort,label="Our System")
plt.legend(loc='best')
plt.xlim([0, 6])





plt.figure(1)
plt.subplot(2, 1, 2)
plt.title("people2_comfort")
plt.xlabel("t(s)")
plt.ylabel("comfort")
plt.plot(t ,people2_vo_comfort,label="System1")
plt.plot(t_2 ,people2_comfort,label="System2")
plt.plot(t_3 ,people2_proposed_comfort,label="Our System")
plt.xlim([0, 5.8])


plt.legend(loc='best')
plt.show()
