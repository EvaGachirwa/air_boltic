import json
import pandas as pd
from sqlalchemy import create_engine

with open('../data/aeroplane_model.json') as f:
    d = json.load(f)
    print(d)

fleet = []

for item in d:
    aeroplane = {}
    print(item)
    aeroplane['type'] = item
    for indi in d[item]:
        aeroplane['series'] = indi
        aeroplane['max_seats'] = d[item][indi]['max_seats']
        aeroplane['max_weight'] = d[item][indi]['max_weight']
        aeroplane['max_distance'] = d[item][indi]['max_distance']
        aeroplane['engine_type'] = d[item][indi]['engine_type']
    fleet.append(aeroplane)

df = pd.DataFrame(fleet)

engine = create_engine('sqlite://', echo=False)
df.to_sql(name='aeroplane_model', con=engine, if_exists='append')