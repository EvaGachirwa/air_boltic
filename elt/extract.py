import json

with open('/data/aeroplane_model.json') as f:
    d = json.load(f)
    print(d)