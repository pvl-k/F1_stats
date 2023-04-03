import glob
# import os

dirpath = '/Users/pk/Downloads/data/'
# os.system(f'cd {dirpath}')
fileslist = [filename.rsplit('/', 1)[1][:-4] for filename in glob.glob(dirpath + '*.csv')]
print(fileslist)