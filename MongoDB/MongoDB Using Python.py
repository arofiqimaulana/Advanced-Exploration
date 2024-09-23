import pymongo
import json
from pymongo import MongoClient

# Setup Connection
client = MongoClient(
    host = confprod.host,
    port = int(confprod.port),
    serverSelectionTimeoutMS = 3000,
    username= confprod.login,
    password=confprod.password
)

# Akses server
db = client.warehouse

# Akses collection (database)
collection = db.customer_revenue

# Setup data yang akan diambil
query = {} 
hasil_query = collection.find(query)

# Grab data
ls_dokumen = []
for dokumen in hasil_query:
    ls_dokumen.append(dokumen)

# Data Transformation
ls_all = []
list_userid_delete = []

for k in range(len(ls_dokumen)):
    try:
        userid = ls_dokumen[k]['userid']
        username = ls_dokumen[k]['username']
        serverNode = ls_dokumen[k]['serverNode']
        collectedAt = ls_dokumen[k]['collectedAt']
        try:
            js = json.loads(ls_dokumen[k]['location'])
            for j in range(len(js)):
                try:
                    location = js[j]['location']
                    state = js[j]['state']
                    zip = js[j]['zip']
                    ls_all.append([userid,serverNode,location,state,zip,collectedAt])
                except:
                    pass
        except:
            ls_all.append([userid,serverNode,'NA','NA','NA','NA'])
    except:
        list_userid_delete.append(userid)

df_all = pd.DataFrame(ls_all,columns=['userid','serverNode','location','state','zip','collectedAt'])


# menghapus record uncomplete
if len(list_userid_delete) > 0:
    delete_result = collection.delete_many({
        "server_id":
        {"$in":list_userid_delete}
        })

# update record
for index,row in df.iterrows():
    status_value = row["is_valuable"]

    criteria = {"userid": row["userid"]}

    result = collection.update_one(criteria, {"$set": {"is_valuable": status_value}}, upsert=True)