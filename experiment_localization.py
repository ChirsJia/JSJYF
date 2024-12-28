# -*- coding: utf-8 -*-
"""
Created on Sat Dec 28 21:58:28 2024

@author: 贾乃征
"""

import numpy as np
import pandas as pd
import joblib


'''定义stacking集中输出的函数'''
def stackingpredict(testset):
    '返回TDOA的时间戳'
    stacking_xpred=stacking_x.predict(testset)
    stacking_ypred=stacking_y.predict(testset)
    stackingoutput=np.array([stacking_xpred,stacking_ypred]).T
    return stackingoutput



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