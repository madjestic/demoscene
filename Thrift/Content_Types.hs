{-# LANGUAGE DeriveDataTypeable #-}
{-# OPTIONS_GHC -fno-warn-missing-fields #-}
{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-----------------------------------------------------------------
-- Autogenerated by Thrift Compiler (0.7.0-dev)                      --
--                                                             --
-- DO NOT EDIT UNLESS YOU ARE SURE YOU KNOW WHAT YOU ARE DOING --
-----------------------------------------------------------------

module Thrift.Content_Types where
import Prelude ( Bool(..), Enum, Double, String, Maybe(..),
                 Eq, Show, Ord,
                 return, length, IO, fromIntegral, fromEnum, toEnum,
                 (&&), (||), (==), (++), ($), (-) )

import Control.Exception
import Data.ByteString.Lazy
import Data.Int
import Data.Typeable ( Typeable )
import qualified Data.Map as Map
import qualified Data.Set as Set

import Thrift


data AttributeType = AT_Float|AT_Vec2|AT_Vec3|AT_Vec4|AT_Mat2|AT_Mat3|AT_Mat4|AT_Int|AT_Word  deriving (Show,Eq, Typeable, Ord)
instance Enum AttributeType where
  fromEnum t = case t of
    AT_Float -> 0
    AT_Vec2 -> 1
    AT_Vec3 -> 2
    AT_Vec4 -> 3
    AT_Mat2 -> 4
    AT_Mat3 -> 5
    AT_Mat4 -> 6
    AT_Int -> 7
    AT_Word -> 8
  toEnum t = case t of
    0 -> AT_Float
    1 -> AT_Vec2
    2 -> AT_Vec3
    3 -> AT_Vec4
    4 -> AT_Mat2
    5 -> AT_Mat3
    6 -> AT_Mat4
    7 -> AT_Int
    8 -> AT_Word
    _ -> throw ThriftException
data PrimitiveType = PT_Points|PT_TriangleStrip|PT_Triangles  deriving (Show,Eq, Typeable, Ord)
instance Enum PrimitiveType where
  fromEnum t = case t of
    PT_Points -> 0
    PT_TriangleStrip -> 1
    PT_Triangles -> 2
  toEnum t = case t of
    0 -> PT_Points
    1 -> PT_TriangleStrip
    2 -> PT_Triangles
    _ -> throw ThriftException
data ImageType = IT_RGBA8|IT_RGBAF|IT_JPG|IT_PNG  deriving (Show,Eq, Typeable, Ord)
instance Enum ImageType where
  fromEnum t = case t of
    IT_RGBA8 -> 0
    IT_RGBAF -> 1
    IT_JPG -> 2
    IT_PNG -> 3
  toEnum t = case t of
    0 -> IT_RGBA8
    1 -> IT_RGBAF
    2 -> IT_JPG
    3 -> IT_PNG
    _ -> throw ThriftException
data PropertyType = PT_Bool|PT_Float|PT_Int|PT_String|PT_Unsupported  deriving (Show,Eq, Typeable, Ord)
instance Enum PropertyType where
  fromEnum t = case t of
    PT_Bool -> 0
    PT_Float -> 1
    PT_Int -> 2
    PT_String -> 3
    PT_Unsupported -> 4
  toEnum t = case t of
    0 -> PT_Bool
    1 -> PT_Float
    2 -> PT_Int
    3 -> PT_String
    4 -> PT_Unsupported
    _ -> throw ThriftException
data Extrapolation = E_Constant|E_Linear  deriving (Show,Eq, Typeable, Ord)
instance Enum Extrapolation where
  fromEnum t = case t of
    E_Constant -> 0
    E_Linear -> 1
  toEnum t = case t of
    0 -> E_Constant
    1 -> E_Linear
    _ -> throw ThriftException
data Interpolation = I_Constant|I_Linear|I_Bezier  deriving (Show,Eq, Typeable, Ord)
instance Enum Interpolation where
  fromEnum t = case t of
    I_Constant -> 0
    I_Linear -> 1
    I_Bezier -> 2
  toEnum t = case t of
    0 -> I_Constant
    1 -> I_Linear
    2 -> I_Bezier
    _ -> throw ThriftException
data VertexAttribute = VertexAttribute{f_VertexAttribute_attrName :: Maybe String,f_VertexAttribute_attrType :: Maybe AttributeType,f_VertexAttribute_attrData :: Maybe [ByteString]} deriving (Show,Eq,Ord,Typeable)
write_VertexAttribute oprot record = do
  writeStructBegin oprot "VertexAttribute"
  case f_VertexAttribute_attrName record of {Nothing -> return (); Just _v -> do
    writeFieldBegin oprot ("attrName",T_STRING,1)
    writeString oprot _v
    writeFieldEnd oprot}
  case f_VertexAttribute_attrType record of {Nothing -> return (); Just _v -> do
    writeFieldBegin oprot ("attrType",T_I32,2)
    writeI32 oprot (fromIntegral $ fromEnum _v)
    writeFieldEnd oprot}
  case f_VertexAttribute_attrData record of {Nothing -> return (); Just _v -> do
    writeFieldBegin oprot ("attrData",T_LIST,3)
    (let {f [] = return (); f (_viter2:t) = do {writeBinary oprot _viter2;f t}} in do {writeListBegin oprot (T_STRING,fromIntegral $ Prelude.length _v); f _v;writeListEnd oprot})
    writeFieldEnd oprot}
  writeFieldStop oprot
  writeStructEnd oprot
read_VertexAttribute_fields iprot record = do
  (_,_t4,_id5) <- readFieldBegin iprot
  if _t4 == T_STOP then return record else
    case _id5 of 
      1 -> if _t4 == T_STRING then do
        s <- readString iprot
        read_VertexAttribute_fields iprot record{f_VertexAttribute_attrName=Just s}
        else do
          skip iprot _t4
          read_VertexAttribute_fields iprot record
      2 -> if _t4 == T_I32 then do
        s <- (do {i <- readI32 iprot; return $ toEnum $ fromIntegral i})
        read_VertexAttribute_fields iprot record{f_VertexAttribute_attrType=Just s}
        else do
          skip iprot _t4
          read_VertexAttribute_fields iprot record
      3 -> if _t4 == T_LIST then do
        s <- (let {f 0 = return []; f n = do {v <- readBinary iprot;r <- f (n-1); return $ v:r}} in do {(_etype9,_size6) <- readListBegin iprot; f _size6})
        read_VertexAttribute_fields iprot record{f_VertexAttribute_attrData=Just s}
        else do
          skip iprot _t4
          read_VertexAttribute_fields iprot record
      _ -> do
        skip iprot _t4
        readFieldEnd iprot
        read_VertexAttribute_fields iprot record
read_VertexAttribute iprot = do
  _ <- readStructBegin iprot
  record <- read_VertexAttribute_fields iprot (VertexAttribute{f_VertexAttribute_attrName=Nothing,f_VertexAttribute_attrType=Nothing,f_VertexAttribute_attrData=Nothing})
  readStructEnd iprot
  return record
data Mesh = Mesh{f_Mesh_attributes :: Maybe [VertexAttribute],f_Mesh_primitive :: Maybe PrimitiveType,f_Mesh_indexData :: Maybe [ByteString]} deriving (Show,Eq,Ord,Typeable)
write_Mesh oprot record = do
  writeStructBegin oprot "Mesh"
  case f_Mesh_attributes record of {Nothing -> return (); Just _v -> do
    writeFieldBegin oprot ("attributes",T_LIST,1)
    (let {f [] = return (); f (_viter13:t) = do {write_VertexAttribute oprot _viter13;f t}} in do {writeListBegin oprot (T_STRUCT,fromIntegral $ Prelude.length _v); f _v;writeListEnd oprot})
    writeFieldEnd oprot}
  case f_Mesh_primitive record of {Nothing -> return (); Just _v -> do
    writeFieldBegin oprot ("primitive",T_I32,2)
    writeI32 oprot (fromIntegral $ fromEnum _v)
    writeFieldEnd oprot}
  case f_Mesh_indexData record of {Nothing -> return (); Just _v -> do
    writeFieldBegin oprot ("indexData",T_LIST,3)
    (let {f [] = return (); f (_viter14:t) = do {writeBinary oprot _viter14;f t}} in do {writeListBegin oprot (T_STRING,fromIntegral $ Prelude.length _v); f _v;writeListEnd oprot})
    writeFieldEnd oprot}
  writeFieldStop oprot
  writeStructEnd oprot
read_Mesh_fields iprot record = do
  (_,_t16,_id17) <- readFieldBegin iprot
  if _t16 == T_STOP then return record else
    case _id17 of 
      1 -> if _t16 == T_LIST then do
        s <- (let {f 0 = return []; f n = do {v <- (read_VertexAttribute iprot);r <- f (n-1); return $ v:r}} in do {(_etype21,_size18) <- readListBegin iprot; f _size18})
        read_Mesh_fields iprot record{f_Mesh_attributes=Just s}
        else do
          skip iprot _t16
          read_Mesh_fields iprot record
      2 -> if _t16 == T_I32 then do
        s <- (do {i <- readI32 iprot; return $ toEnum $ fromIntegral i})
        read_Mesh_fields iprot record{f_Mesh_primitive=Just s}
        else do
          skip iprot _t16
          read_Mesh_fields iprot record
      3 -> if _t16 == T_LIST then do
        s <- (let {f 0 = return []; f n = do {v <- readBinary iprot;r <- f (n-1); return $ v:r}} in do {(_etype26,_size23) <- readListBegin iprot; f _size23})
        read_Mesh_fields iprot record{f_Mesh_indexData=Just s}
        else do
          skip iprot _t16
          read_Mesh_fields iprot record
      _ -> do
        skip iprot _t16
        readFieldEnd iprot
        read_Mesh_fields iprot record
read_Mesh iprot = do
  _ <- readStructBegin iprot
  record <- read_Mesh_fields iprot (Mesh{f_Mesh_attributes=Nothing,f_Mesh_primitive=Nothing,f_Mesh_indexData=Nothing})
  readStructEnd iprot
  return record
data Property = Property{f_Property_propertyTypeName :: Maybe String,f_Property_propertyType :: Maybe PropertyType,f_Property_propertySize :: Maybe Int16,f_Property_propertyData :: Maybe ByteString} deriving (Show,Eq,Ord,Typeable)
write_Property oprot record = do
  writeStructBegin oprot "Property"
  case f_Property_propertyTypeName record of {Nothing -> return (); Just _v -> do
    writeFieldBegin oprot ("propertyTypeName",T_STRING,1)
    writeString oprot _v
    writeFieldEnd oprot}
  case f_Property_propertyType record of {Nothing -> return (); Just _v -> do
    writeFieldBegin oprot ("propertyType",T_I32,2)
    writeI32 oprot (fromIntegral $ fromEnum _v)
    writeFieldEnd oprot}
  case f_Property_propertySize record of {Nothing -> return (); Just _v -> do
    writeFieldBegin oprot ("propertySize",T_I16,3)
    writeI16 oprot _v
    writeFieldEnd oprot}
  case f_Property_propertyData record of {Nothing -> return (); Just _v -> do
    writeFieldBegin oprot ("propertyData",T_STRING,4)
    writeBinary oprot _v
    writeFieldEnd oprot}
  writeFieldStop oprot
  writeStructEnd oprot
read_Property_fields iprot record = do
  (_,_t31,_id32) <- readFieldBegin iprot
  if _t31 == T_STOP then return record else
    case _id32 of 
      1 -> if _t31 == T_STRING then do
        s <- readString iprot
        read_Property_fields iprot record{f_Property_propertyTypeName=Just s}
        else do
          skip iprot _t31
          read_Property_fields iprot record
      2 -> if _t31 == T_I32 then do
        s <- (do {i <- readI32 iprot; return $ toEnum $ fromIntegral i})
        read_Property_fields iprot record{f_Property_propertyType=Just s}
        else do
          skip iprot _t31
          read_Property_fields iprot record
      3 -> if _t31 == T_I16 then do
        s <- readI16 iprot
        read_Property_fields iprot record{f_Property_propertySize=Just s}
        else do
          skip iprot _t31
          read_Property_fields iprot record
      4 -> if _t31 == T_STRING then do
        s <- readBinary iprot
        read_Property_fields iprot record{f_Property_propertyData=Just s}
        else do
          skip iprot _t31
          read_Property_fields iprot record
      _ -> do
        skip iprot _t31
        readFieldEnd iprot
        read_Property_fields iprot record
read_Property iprot = do
  _ <- readStructBegin iprot
  record <- read_Property_fields iprot (Property{f_Property_propertyTypeName=Nothing,f_Property_propertyType=Nothing,f_Property_propertySize=Nothing,f_Property_propertyData=Nothing})
  readStructEnd iprot
  return record
data Segment = Segment{f_Segment_interpolation :: Maybe Interpolation,f_Segment_leftTime :: Maybe Double,f_Segment_leftValue :: Maybe Double,f_Segment_time :: Maybe Double,f_Segment_value :: Maybe Double,f_Segment_rightTime :: Maybe Double,f_Segment_rightValue :: Maybe Double} deriving (Show,Eq,Ord,Typeable)
write_Segment oprot record = do
  writeStructBegin oprot "Segment"
  case f_Segment_interpolation record of {Nothing -> return (); Just _v -> do
    writeFieldBegin oprot ("interpolation",T_I32,1)
    writeI32 oprot (fromIntegral $ fromEnum _v)
    writeFieldEnd oprot}
  case f_Segment_leftTime record of {Nothing -> return (); Just _v -> do
    writeFieldBegin oprot ("leftTime",T_DOUBLE,2)
    writeDouble oprot _v
    writeFieldEnd oprot}
  case f_Segment_leftValue record of {Nothing -> return (); Just _v -> do
    writeFieldBegin oprot ("leftValue",T_DOUBLE,3)
    writeDouble oprot _v
    writeFieldEnd oprot}
  case f_Segment_time record of {Nothing -> return (); Just _v -> do
    writeFieldBegin oprot ("time",T_DOUBLE,4)
    writeDouble oprot _v
    writeFieldEnd oprot}
  case f_Segment_value record of {Nothing -> return (); Just _v -> do
    writeFieldBegin oprot ("value",T_DOUBLE,5)
    writeDouble oprot _v
    writeFieldEnd oprot}
  case f_Segment_rightTime record of {Nothing -> return (); Just _v -> do
    writeFieldBegin oprot ("rightTime",T_DOUBLE,6)
    writeDouble oprot _v
    writeFieldEnd oprot}
  case f_Segment_rightValue record of {Nothing -> return (); Just _v -> do
    writeFieldBegin oprot ("rightValue",T_DOUBLE,7)
    writeDouble oprot _v
    writeFieldEnd oprot}
  writeFieldStop oprot
  writeStructEnd oprot
read_Segment_fields iprot record = do
  (_,_t36,_id37) <- readFieldBegin iprot
  if _t36 == T_STOP then return record else
    case _id37 of 
      1 -> if _t36 == T_I32 then do
        s <- (do {i <- readI32 iprot; return $ toEnum $ fromIntegral i})
        read_Segment_fields iprot record{f_Segment_interpolation=Just s}
        else do
          skip iprot _t36
          read_Segment_fields iprot record
      2 -> if _t36 == T_DOUBLE then do
        s <- readDouble iprot
        read_Segment_fields iprot record{f_Segment_leftTime=Just s}
        else do
          skip iprot _t36
          read_Segment_fields iprot record
      3 -> if _t36 == T_DOUBLE then do
        s <- readDouble iprot
        read_Segment_fields iprot record{f_Segment_leftValue=Just s}
        else do
          skip iprot _t36
          read_Segment_fields iprot record
      4 -> if _t36 == T_DOUBLE then do
        s <- readDouble iprot
        read_Segment_fields iprot record{f_Segment_time=Just s}
        else do
          skip iprot _t36
          read_Segment_fields iprot record
      5 -> if _t36 == T_DOUBLE then do
        s <- readDouble iprot
        read_Segment_fields iprot record{f_Segment_value=Just s}
        else do
          skip iprot _t36
          read_Segment_fields iprot record
      6 -> if _t36 == T_DOUBLE then do
        s <- readDouble iprot
        read_Segment_fields iprot record{f_Segment_rightTime=Just s}
        else do
          skip iprot _t36
          read_Segment_fields iprot record
      7 -> if _t36 == T_DOUBLE then do
        s <- readDouble iprot
        read_Segment_fields iprot record{f_Segment_rightValue=Just s}
        else do
          skip iprot _t36
          read_Segment_fields iprot record
      _ -> do
        skip iprot _t36
        readFieldEnd iprot
        read_Segment_fields iprot record
read_Segment iprot = do
  _ <- readStructBegin iprot
  record <- read_Segment_fields iprot (Segment{f_Segment_interpolation=Nothing,f_Segment_leftTime=Nothing,f_Segment_leftValue=Nothing,f_Segment_time=Nothing,f_Segment_value=Nothing,f_Segment_rightTime=Nothing,f_Segment_rightValue=Nothing})
  readStructEnd iprot
  return record
data FCurve = FCurve{f_FCurve_extrapolation :: Maybe Extrapolation,f_FCurve_keyframes :: Maybe [Segment]} deriving (Show,Eq,Ord,Typeable)
write_FCurve oprot record = do
  writeStructBegin oprot "FCurve"
  case f_FCurve_extrapolation record of {Nothing -> return (); Just _v -> do
    writeFieldBegin oprot ("extrapolation",T_I32,1)
    writeI32 oprot (fromIntegral $ fromEnum _v)
    writeFieldEnd oprot}
  case f_FCurve_keyframes record of {Nothing -> return (); Just _v -> do
    writeFieldBegin oprot ("keyframes",T_LIST,2)
    (let {f [] = return (); f (_viter40:t) = do {write_Segment oprot _viter40;f t}} in do {writeListBegin oprot (T_STRUCT,fromIntegral $ Prelude.length _v); f _v;writeListEnd oprot})
    writeFieldEnd oprot}
  writeFieldStop oprot
  writeStructEnd oprot
read_FCurve_fields iprot record = do
  (_,_t42,_id43) <- readFieldBegin iprot
  if _t42 == T_STOP then return record else
    case _id43 of 
      1 -> if _t42 == T_I32 then do
        s <- (do {i <- readI32 iprot; return $ toEnum $ fromIntegral i})
        read_FCurve_fields iprot record{f_FCurve_extrapolation=Just s}
        else do
          skip iprot _t42
          read_FCurve_fields iprot record
      2 -> if _t42 == T_LIST then do
        s <- (let {f 0 = return []; f n = do {v <- (read_Segment iprot);r <- f (n-1); return $ v:r}} in do {(_etype47,_size44) <- readListBegin iprot; f _size44})
        read_FCurve_fields iprot record{f_FCurve_keyframes=Just s}
        else do
          skip iprot _t42
          read_FCurve_fields iprot record
      _ -> do
        skip iprot _t42
        readFieldEnd iprot
        read_FCurve_fields iprot record
read_FCurve iprot = do
  _ <- readStructBegin iprot
  record <- read_FCurve_fields iprot (FCurve{f_FCurve_extrapolation=Nothing,f_FCurve_keyframes=Nothing})
  readStructEnd iprot
  return record
