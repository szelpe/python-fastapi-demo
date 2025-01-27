from pydantic import BaseModel
from typing import Optional

class Product(BaseModel):
    sku: str
    name: str
    brand: Optional[str]
    description: Optional[str]
    specs: Optional[str]
    price: float
    avg_score: Optional[float]
    stock: Optional[int]
    weight: Optional[float]
    size: Optional[str]
    location: Optional[str]

    def is_in_stock(self) -> bool:
        return self.stock is not None and self.stock > 0
