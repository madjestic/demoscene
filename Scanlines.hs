{-# LANGUAGE DataKinds #-}
module Scanlines where

import LambdaCube.GL
import Utility

data Scanlines = Scanlines
    { scanlinesFrequency :: Exp F Float
    , scanlinesHigh :: Exp F V4F
    , scanlinesLow :: Exp F V4F
    }

scanlines = Scanlines
    { scanlinesFrequency = floatF 100
    , scanlinesHigh = Const $ V4 1 1 1 1
    , scanlinesLow = Const $ V4 0 0 0 0
    }

fScanlines :: Scanlines -> Exp F V2F -> Exp F V4F -> Exp F V4F
fScanlines sl uv fromColor = fromColor @* mix' sl1 sl2 r
  where
    r = sin' (v @* floatF (2*pi) @* scanlinesFrequency sl) @/ floatF 2 @+ floatF 0.5
    sl1 = scanlinesLow sl
    sl2 = scanlinesHigh sl
    V2 _ v = unpack' uv

-- Scanlines from a texture, useable as a render pass.
-- Use @fScanlines@ to use it as part of a bigger fragment shader.
fxScanlines :: Scanlines -> Exp Obj (Image 1 V4F) -> Exp F V2F -> Exp F V4F
fxScanlines sl img uv = fScanlines sl uv c
  where
    c = texture' (Sampler LinearFilter ClampToEdge $ Texture (Texture2D (Float RGBA) n1) (V2 512 512) NoMip [img]) uv
