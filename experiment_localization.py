# -*- coding: utf-8 -*-
"""
Created on Sat Dec 28 21:58:28 2024

@author: 贾乃征
"""

import numpy as np
import pandas as pd
import joblib
import pandas as pd
import numpy as np
import geatpy as ea
import seaborn as sns


'''定义stacking集中输出的函数'''
def stackingpredict(testset):
    '返回TDOA的时间戳'
    stacking_xpred=stacking_x.predict(testset)
    stacking_ypred=stacking_y.predict(testset)
    stackingoutput=np.array([stacking_xpred,stacking_ypred]).T
    return stackingoutput


'''
Simulation COMSOL
'''
stacking_x=joblib.load('stacking_x_simulation.pkl') 
stacking_y=joblib.load('stacking_y_simulation.pkl')  
tdoaset=np.array([[-7.26016666666667,-6.80283333333333,-14.14160416666675],
[-4.92347916666667,-5.44512500000000,-10.5258125000000],
[-4.759125,-4.501875,-8.1248125],
[-3.22991666666667,-2.6153750000000,-3.60864583333333],
[-1.99368750000000,-1.99368750000000,-0.936104166666667],
[-0.314416666666670,-0.986125000000005,0.771749999999997]])
            
pointset=np.array([[20,20],[19,19],[18,18],[17,17],[16,16],[15,15]])
temp1=tdoaset[:,0].copy()
temp2=tdoaset[:,1].copy()

tdoaset[:,0]=temp2
tdoaset[:,1]=temp1

import time
for i in range(6):
    time_start=time.time()
    stackingoutput=stackingpredict(np.array(tdoaset[i,:]).reshape(1,-1))
    time_end=time.time()
    rmse_eachpoint=np.array(np.sqrt(np.sum((stackingoutput-pointset[i,:])**2,axis=1)))
    print(stackingoutput)
    print(rmse_eachpoint)
    print(time_end-time_start)
del stacking_y
del stacking_x
'''
experiment
'''

'''
Scenario 1
'''
TDOA_NLOS=pd.read_csv(r"scenario1.csv",header=None)
stacking_x=joblib.load('stacking_x__scenario1.pkl') 
stacking_y=joblib.load('stacking_y__scenario1.pkl') 
stacking_error1=np.sqrt(np.sum((stackingpredict(np.array(TDOA_NLOS))-[20,20])**2,axis=1))
del stacking_y
del stacking_x
'''
Scenario 2
'''
TDOA_NLOS=pd.read_csv(r"scenario2.csv",header=None)
stacking_x=joblib.load('stacking_x__scenario2.pkl') 
stacking_y=joblib.load('stacking_y__scenario2.pkl') 
stacking_error2=np.sqrt(np.sum((stackingpredict(np.array(TDOA_NLOS))-[15,15])**2,axis=1))
del stacking_y
del stacking_x
'''
Scenario 3
'''
TDOA_NLOS=pd.read_csv(r"scenario3.csv",header=None)
stacking_x=joblib.load('stacking_x__scenario3.pkl') 
stacking_y=joblib.load('stacking_y__scenario3.pkl') 
stacking_error3=np.sqrt(np.sum((stackingpredict(np.array(TDOA_NLOS))-[1.4,0.5])**2,axis=1)) 
del stacking_y
del stacking_x