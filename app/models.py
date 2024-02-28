from flask_login import UserMixin
from pydantic import BaseModel
from pydantic_mongo import ObjectIdField, AbstractRepository
from typing import Optional

class User(UserMixin, BaseModel):
    id: Optional[ObjectIdField] = None
    username: str
    email: str
    token: str 

class UserRepository(AbstractRepository[User]):
    class Meta:
        collection_name = "user"
