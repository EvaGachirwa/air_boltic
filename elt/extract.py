import json
import pandas as pd
from sqlalchemy import create_engine

FLEET = []
ENGINE = create_engine('sqlite:///air_boltic.db', echo=False)
AEROPLANE_MODEL_JSON_FILEPATH = '../data/aeroplane_model.json'
TRIP_CSV_FILEPATH = '../data/Air Boltic data - trip.csv'
ORDER_CSV_FILEPATH = '../data/Air Boltic data - order.csv'
CUSTOMER_GROUP_CSV_FILEPATH = '../data/Air Boltic data - customer_group.csv'
CUSTOMER_CSV_FILEPATH = '../data/Air Boltic data - customer.csv'
AEROPLANE_CSV_FILEPATH = '../data/Air Boltic data - aeroplane.csv'


def get_json_data(filepath):
    with open(filepath) as f:
        d = json.load(f)
        return d
    
def get_csv_data(filepath):
    return pd.read_csv(filepath)

    
def load_to_database(df, table_name, engine, disposation):
    return df.to_sql(name=table_name, con=engine, if_exists=disposation, index=False)

json_data = get_json_data(AEROPLANE_MODEL_JSON_FILEPATH)

for item in json_data:
    aeroplane = {}
    aeroplane['type'] = item
    for indi in json_data[item]:
        aeroplane['series'] = indi
        aeroplane['max_seats'] = json_data[item][indi]['max_seats']
        aeroplane['max_weight'] = json_data[item][indi]['max_weight']
        aeroplane['max_distance'] = json_data[item][indi]['max_distance']
        aeroplane['engine_type'] = json_data[item][indi]['engine_type']
    FLEET.append(aeroplane)

aeroplane_model_df = pd.DataFrame(FLEET)
trip_df = get_csv_data(TRIP_CSV_FILEPATH)
order_df = get_csv_data(ORDER_CSV_FILEPATH)
customer_group_df = get_csv_data(CUSTOMER_GROUP_CSV_FILEPATH)
customer_df = get_csv_data(CUSTOMER_CSV_FILEPATH)
aeroplane_df = get_csv_data(AEROPLANE_CSV_FILEPATH)

load_to_database(df=aeroplane_model_df, table_name='aeroplane_models', engine=ENGINE, disposation='append')
load_to_database(df=trip_df, table_name='trips', engine=ENGINE, disposation='append')
load_to_database(df=order_df, table_name='orders', engine=ENGINE, disposation='append')
load_to_database(df=customer_group_df, table_name='customer_groups', engine=ENGINE, disposation='append')
load_to_database(df=customer_df, table_name='customers', engine=ENGINE, disposation='append')
load_to_database(df=aeroplane_df, table_name='aeroplanes', engine=ENGINE, disposation='append')