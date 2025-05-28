from typing import Union

from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def read_root():
    return {"message": "Hello World!"}


@app.get("/items/{item_id}")
def read_item(item_id: int, q: Union[str, None] = None):
    return {"item_id": item_id, "q": q}


@app.get("/api/v1/health")
def read_health():
    return {"status": "healthy"}


@app.get("/api/v1/me")
def read_me():
    return {"message": "It's me, again!"}
