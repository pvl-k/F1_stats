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
    columnType = [str(elem) for elem in df.dtypes]
    
    for i in range(len(columnType)):
        if columnType[i] == 'object':
            columnType[i] = 'String'
        elif columnType[i] == 'int64':
            columnType[i] = 'UInt64'
        elif columnType[i] == 'int32':
            columnType[i] = 'UInt32'
        elif columnType[i] == 'float64':
            columnType[i] = 'Float64'
        elif columnType[i] == 'float32':
            columnType[i] = 'Float32'    
    
    columnNameTypes = dict(zip(columnName, columnType))
    
    s = ''
    for item in columnNameTypes:
        s += item + ' ' + columnNameTypes[item] + ', \n'
        
        
    print(s)
    
    
    
    
    
    # print(columnNameTypes)
    # print(df)
    # print(filename[:-4])
    
    # dataList = []
    # for x in dataTypes:
    #     if(x == 'int64'):
    #         dataList.append('int')
    #     elif (x == 'float64'):
    #         dataList.append('float')
    #     elif (x == 'bool'):
    #         dataList.append('boolean')
    #     else:
    #         dataList.append('varchar')
    # return dataListcolumnDataType = getColumnDtypes(resultDF.dtypes)