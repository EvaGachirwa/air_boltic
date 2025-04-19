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

engine = create_engine('sqlite:///air_boltic.db', echo=False)
df.to_sql(name='aeroplane_models', con=engine, if_exists='append')

trip_df = pd.read_csv('../data/Air Boltic data - trip.csv')
order_df = pd.read_csv('../data/Air Boltic data - order.csv')
customer_group_df = pd.read_csv('../data/Air Boltic data - customer_group.csv')
customer_df = pd.read_csv('../data/Air Boltic data - customer.csv')
aeroplane_df = pd.read_csv('../data/Air Boltic data - aeroplane.csv')

trip_df.to_sql(name='trips', con=engine, if_exists='append')
order_df.to_sql(name='orders', con=engine, if_exists='append')
customer_group_df.to_sql(name='customer_groups', con=engine, if_exists='append')
customer_df.to_sql(name='customers', con=engine, if_exists='append')
aeroplane_df.to_sql(name='aeroplanes', con=engine, if_exists='append')