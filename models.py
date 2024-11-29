from pydantic import BaseModel
from typing import Optional
from sqlalchemy import Column, Integer, String, ForeignKey, Date, Enum, Text, DECIMAL, TIMESTAMP, DateTime, Boolean
from sqlalchemy.orm import relationship
from db_config.db_config import Base
from sqlalchemy.sql import func

class OroscopoRequest(BaseModel):
    nome: str
    data_nascita: str  # Ad esempio, '1990-01-01'
    ora_nascita: str   # Ad esempio, '15:30'
    luogo_nascita: str # Ad esempio, '45.07, 7.68' (latitudine e longitudine)
    lingua: Optional[str] = "it"  # Linguaggio opzionale, di default "it"
    tipi: Optional[str] = "generico"  # Tipo di oroscopo, di default "generico"


class User(Base):
    __tablename__ = "users"
    id = Column(Integer, primary_key=True, index=True)
    username = Column(String(255), unique=True, nullable=False)
    email = Column(String(255), unique=True, nullable=False)
    password_hash = Column(String(255), nullable=False)
    created_at = Column(DateTime, default=func.current_timestamp(), nullable=False)
    updated_at = Column(DateTime, default=func.current_timestamp(), onupdate=func.current_timestamp(), nullable=False)
    #is_verified = Column(Boolean, default=False)  # Aggiungi il campo is_verified
    horoscopes = relationship("Horoscope", back_populates="user")


class Horoscope(Base):
    __tablename__ = "horoscopes"
    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("users.id"), nullable=False)
    birthdate = Column(Date, nullable=False)
    birthplace = Column(String(255), nullable=False)
    sun_sign = Column(String(50))
    ascendant_sign = Column(String(50))
    moon_sign = Column(String(50))
    generated_text = Column(Text, nullable=False)
    pdf_filename = Column(String(255))
    created_at = Column(TIMESTAMP, default='CURRENT_TIMESTAMP')

    user = relationship("User", back_populates="horoscopes")
    astrological_details = relationship("AstrologicalDetail", back_populates="horoscope")


class AstrologicalDetail(Base):
    __tablename__ = "astrological_details"
    id = Column(Integer, primary_key=True, index=True)
    horoscope_id = Column(Integer, ForeignKey("horoscopes.id"), nullable=False)
    mercury = Column(String(100))
    venus = Column(String(100))
    mars = Column(String(100))
    jupiter = Column(String(100))
    saturn = Column(String(100))
    neptune = Column(String(100))
    uranus = Column(String(100))
    created_at = Column(TIMESTAMP, default='CURRENT_TIMESTAMP')

    horoscope = relationship("Horoscope", back_populates="astrological_details")
