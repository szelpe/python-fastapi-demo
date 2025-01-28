from fastapi import FastAPI, Query, HTTPException, Request
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates
from psycopg import connect
from typing import Optional, List
from Product import Product
from config import DB_CONFIG

app = FastAPI()
templates = Jinja2Templates(directory="templates")

# Load products from PostgreSQL
def load_products_from_db():
    products = []
    with connect(**DB_CONFIG) as conn:
        with conn.cursor() as cur:
            cur.execute("""
                        SELECT sku, name, brand, description, specs, price, avg_score, stock, weight, size, location
                        FROM product
                        """)
            
            if not cur.description:
                return []
            
            columns = [desc[0] for desc in cur.description]
            for row in cur.fetchall():
                product_data = dict(zip(columns, row))
                product = Product(**product_data)
                products.append(product)
    return products

@app.get("/", response_class=HTMLResponse)
async def product_list(
    request: Request,
    s: Optional[str] = Query(default="", alias="s"),
    min_price: Optional[float] = Query(default=None, alias="min_price"),
    max_price: Optional[float] = Query(default=None, alias="max_price"),
    sort_by: Optional[str] = Query(default="name", alias="sort_by")
):
    products = load_products_from_db()
    products = filter_products(products, s, min_price, max_price)
    products = sort_products(products, sort_by)

    return templates.TemplateResponse(
        "product_list.html",
        {
            "request": request,
            "products": products,
            "search_query": s,
            "min_price": min_price,
            "max_price": max_price,
            "sort_by": sort_by
        }
    )

@app.get("/product/{sku}", response_class=HTMLResponse)
async def product_detail(sku: str, request: Request):
    products = load_products_from_db()
    product = next((p for p in products if p.sku == sku), None)
    if product:
        return templates.TemplateResponse("product_detail.html", {"request": request, "product": product})
    else:
        raise HTTPException(status_code=404, detail="Product not found")

def filter_products(products: List[Product], query: Optional[str] = "", min_price: Optional[float] = None, max_price: Optional[float] = None):
    if query:
        products = [p for p in products if p.name.lower().startswith(query.lower())]
    
    if min_price:
        products = [p for p in products if p.price >= min_price]

    if max_price:
        products = [p for p in products if p.price <= max_price]
    
    return products

def sort_products(products: List[Product], sort_by: Optional[str] = "name"):
    if not sort_by:
        return products
    
    return sorted(products, key=lambda x: getattr(x, sort_by))

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="127.0.0.1", port=8000)
