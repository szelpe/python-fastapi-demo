import pytest
from app import filter_products, sort_products
from Product import Product

def test_filter_products_by_name():
    products = [
        Product(sku="1", name="Phone", brand="BrandA", description="Desc", specs="Specs", price=500, avg_score=4.5, stock=10, weight=1.2, size="5x3", location="A1"),
        Product(sku="2", name="Laptop", brand="BrandB", description="Desc", specs="Specs", price=1000, avg_score=4.7, stock=5, weight=2.5, size="15x10", location="B2"),
    ]
    filtered = filter_products(products, query="Phone")
    assert len(filtered) == 1
    assert filtered[0].name == "Phone"

def test_filter_products_by_price_range():
    products = [
        Product(sku="1", name="Phone", brand="BrandA", description="Desc", specs="Specs", price=500, avg_score=4.5, stock=10, weight=1.2, size="5x3", location="A1"),
        Product(sku="2", name="Laptop", brand="BrandB", description="Desc", specs="Specs", price=1000, avg_score=4.7, stock=5, weight=2.5, size="15x10", location="B2"),
    ]
    filtered = filter_products(products, min_price=600, max_price=1200)
    assert len(filtered) == 1
    assert filtered[0].name == "Laptop"

def test_sort_products_by_price():
    products = [
        Product(sku="1", name="Phone", brand="BrandA", description="Desc", specs="Specs", price=500, avg_score=4.5, stock=10, weight=1.2, size="5x3", location="A1"),
        Product(sku="2", name="Laptop", brand="BrandB", description="Desc", specs="Specs", price=1000, avg_score=4.7, stock=5, weight=2.5, size="15x10", location="B2"),
    ]
    sorted_products = sort_products(products, sort_by="price")
    assert sorted_products[0].name == "Phone"
    assert sorted_products[1].name == "Laptop"
