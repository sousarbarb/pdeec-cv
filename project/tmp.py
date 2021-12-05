#@title Load libraries

# Math and Image
import numpy as np
import matplotlib.pyplot as plt
import cv2
import PIL
# Operating System
import os
import time
import copy
# Utilities
import pandas as pd
import random
import json
# Torch
import torch
import torch.nn as nn
import torch.optim as optim
import torchvision
# TensorFlow
import tensorflow as tf

# Input data files are available in the read-only "../input/" directory
# For example, running this (by clicking run or pressing Shift+Enter)

# You can write up to 20GB to the current directory (/kaggle/working/) that gets
# preserved as output when you create a version using "Save & Run All" 
# You can also write temporary files to /kaggle/temp/, but they won't be saved
# outside of the current session will list all files under the input directory

import os
for dirname, _, filenames in os.walk('/kaggle/input'):
  for filename in filenames:
    print(os.path.join(dirname, filename))