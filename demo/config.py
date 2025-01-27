from dotenv import load_dotenv
import os

# Load environment variables from .env file
load_dotenv()

DB_CONFIG = {
    "dbname": os.getenv("DB_NAME", "default_db"),
    "user": os.getenv("DB_USER", "default_user"),
    "password": os.getenv("DB_PASSWORD", ""),
    "host": os.getenv("DB_HOST", "localhost"),
    "port": int(os.getenv("DB_PORT", 5432)),
}
