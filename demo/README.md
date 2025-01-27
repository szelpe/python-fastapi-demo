# Python Demo WebApp

### 1. **Set Up Your Environment**

#### Install Python
Ensure you have Python 3.8+ installed. You can download it from [python.org](https://www.python.org/).

#### Create a Virtual Environment
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

---

### 2. **Install Dependencies**
Install the required libraries:
```bash
pip install fastapi uvicorn psycopg[binary] jinja2 python-multipart
```

---

### 3. **PostgreSQL**: Create database


  ```sql
  CREATE DATABASE devops_for_execs;
  ```

---

### 4. **Create the `product` Table**

Run the `schema.sql` file to create the database structure and load the seed data.

---

### 5. **Prepare Your Directory Structure**
Organize your project as follows:
```
.
├── app.py                # Your main FastAPI application
├── Product.py            # Product class (Pydantic model)
├── templates/
│   ├── product_list.html # Template for listing products
│   └── product_detail.html # Template for product details
```

---

### 7. **Run the Application**

Run the FastAPI server using `uvicorn`:
```bash
uvicorn app:app --reload
```

Visit the following URLs in your browser:
- **Product List:** [http://127.0.0.1:8000/](http://127.0.0.1:8000/)
- **Product Detail Example:** [http://127.0.0.1:8000/product/12345](http://127.0.0.1:8000/product/12345)

---

### Generate requirements.txt

```bash
pip install pipreqs
pipreqs . --force --ignore .venv
```

---

### 9. **Optional: Dockerize the Application**
Create a `Dockerfile` and `docker-compose.yml` to deploy the application if needed. Let me know if you’d like assistance with this!