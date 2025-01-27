#!/bin/bash

pip install -r requirements.txt
gunicorn -w 4 -k uvicorn.workers.UvicornWorker app:app --bind=0.0.0.0:8000
