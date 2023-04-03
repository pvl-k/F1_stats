import glob
import pandas as pd
# import os

# Enter path 
dirpath = '/Users/pk/Downloads/data/'

# os.system(f'cd {dirpath}')
fileslist = [filename.rsplit('/', 1)[1] for filename in glob.glob(dirpath + '*.csv')]
print(fileslist)

for filename in fileslist:
    df = pd.read_csv(dirpath + filename)
    columnName = list(df.columns.values)
    # print(columnName)
    # print(df)
    # print(filename[:-4])
