import requests
import pandas as pd

TOKEN = "TU_TOKEN_AQUI"
SERIE = "SP30578"
url = f"https://www.banxico.org.mx/SieAPIRest/service/v1/series/{SERIE}/datos"

r = requests.get(url, headers={"Bmx-Token": TOKEN})
r.raise_for_status()

data = r.json()["bmx"]["series"][0]["datos"]
df = pd.DataFrame(data)
df["fecha"] = pd.to_datetime(df["fecha"])
df["dato"] = pd.to_numeric(df["dato"], errors="coerce")

print(df.tail())
