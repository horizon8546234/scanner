#!/usr/bin/env python
import numpy as np
import math
import matplotlib.pyplot as plt
import matplotlib.patches as patches
import time
from sympy import *
from datetime import datetime



# simulation 2
fig, ax = plt.subplots()
fig.set_size_inches(8,8)

ax.clear()
ax.grid('on')

ax.add_patch(plt.Circle((0, 0), 0.3, color='green', alpha=0.5))
ax.add_patch(plt.Circle((0, 5), 0.1, color='red', alpha=0.5))

ax.add_patch(plt.Circle((-0.6,6.5), 0.3, color='black', alpha=0.5))
ax.add_patch(plt.Circle((0.6,4), 0.3, color='black', alpha=0.5))    

ax.plot([-1.5,-1.5],[-1,9],color='black', alpha=10,linewidth=5)   
ax.plot([1.5,1.5],[-1,9],color='black', alpha=10,linewidth=5)   

ax.plot()
plt.xlim(-5,5)
plt.ylim(-1,9)
plt.xlabel("x(m)")
plt.ylabel("y(m)")

ax.set_xticks(np.linspace(-5, 5, 11))
ax.set_yticks(np.linspace(-1, 9, 11))
plt.show(block=True)
plt.pause(0.0000001)
time.sleep(settle_time) 
    




# # simulation 2
# fig, ax = plt.subplots()
# fig.set_size_inches(8,8)

# ax.clear()
# ax.grid('on')

# ax.add_patch(plt.Circle((0, 0), 0.3, color='green', alpha=0.5))
# ax.add_patch(plt.Circle((0, 5), 0.1, color='red', alpha=0.5))

# ax.add_patch(plt.Circle((-4,7), 0.3, color='black', alpha=0.5))
# ax.add_patch(plt.Circle((0.5,7.5), 0.3, color='black', alpha=0.5))    

# # ax.plot([0,0],[-1,9],color='black', alpha=10,linewidth=5)   

# ax.plot()
# plt.xlim(-5,5)
# plt.ylim(-1,9)
# plt.xlabel("x(m)")
# plt.ylabel("y(m)")

# ax.set_xticks(np.linspace(-5, 5, 11))
# ax.set_yticks(np.linspace(-1, 9, 11))
# plt.show(block=True)
# plt.pause(0.0000001)
# time.sleep(settle_time) 
    
    

