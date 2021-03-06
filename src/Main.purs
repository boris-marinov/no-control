module Main where

import Data.Maybe
import Graphics.Canvas
import Main.Types
import Prelude
import Effect (Effect)
import Effect.Console (log)
import Main.Level (generateMap)
import Main.Step (step)
import NoControl.Engine (Map)
import NoControl.Engine.Effect (loop, renderFrame)
import Random.LCG (randomSeed)

main :: Effect Unit
main = do
  canvas <- getCanvasElementById "app"
  seed <- randomSeed
  let
    gameMap = generateMap seed
  case canvas of
    Nothing -> log "No canvas"
    Just canvas -> do
      setCanvasDimensions canvas { width: gameMap.cameraPosition.width, height: gameMap.cameraPosition.height }
      ctx <- getContext2D canvas
      _ <-
        loop
          ( \oldMap keys ->
              renderFrame ctx (step oldMap keys)
          )
          gameMap
      pure unit
