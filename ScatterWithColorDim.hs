{-# LANGUAGE QuasiQuotes #-}
module ScatterWithColorDim where

import QuickPlot
import QuickPlot.Plotly
import Control.Concurrent
import System.Random

randomNums :: Int -> [Double]
randomNums i = let g = mkStdGen 1
               in take i $ randoms g

trace = [plotly|{
    marker : {
      color      : #{ randomNums 500 },
      size       : "16",
      showscale  : true,
      colorscale : "Viridis"
    },
    y    : #{ randomNums 500 },
    type : "scatter",
    name : "y",
    mode : "markers"
  }|]

main :: IO ()
main = do
   runQuickPlot
   putStrLn "Quick! You have 15 seconds to open your browser and visit the address above me"
   threadDelay 3000000 -- wait 15 seconds
   plot [trace]
