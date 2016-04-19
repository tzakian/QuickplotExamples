{-# LANGUAGE QuasiQuotes #-}
module ScatterAndLinePlot where

import QuickPlot
import QuickPlot.Plotly
import Control.Concurrent

blueBoxSizes   = [1.1, 1.8, 2.9, 3.3] :: [Double]
orangeBoxSizes = [3.1, 3.8, 5.9, 2.3] :: [Double]

blueBoxTrace = [plotly|{
                        y    : #{ blueBoxSizes },
                        type : "box"
                     }|]

orangeBoxTrace = [plotly|{
                           y : #{ orangeBoxSizes },
                           type : "box"
                         }|]

x1,x2 :: [Double]
x1 = [1,2,3,4]
x2 = [2,3,4,5]

y1,y2,y3 :: [Double]
y1 = [10,15,13,17]
y2 = [16,5,11,9]
y3 = [12,9,15,12]

plot1 = [plotly|{
    x : #{ x1 },
    y : #{ y1 },
    mode : "markers",
    type : "scatter"
    }|]

plot2 = [plotly|{
    x : #{ x2 },
    y : #{ y2 },
    mode : "lines",
    type : "scatter"
    }|]

plot3 = [plotly|{
    x : #{ x1 },
    y : #{ y3 },
    mode : "lines+markers",
    type : "scatter"
    }|]

-- barChart = [plotly|
-- {
--     "data": [
--         {
--             "x": [
--                 20,
--                 14,
--                 23
--             ],
--             "y": [
--                 "giraffes",
--                 "orangutans",
--                 "monkeys"
--             ],
--             "marker": {
--                 "color": "rgba(55, 128, 191, 0.6)",
--                 "line": {
--                     "color": "rgba(55, 128, 191, 1.0)",
--                     "width": 1
--                 }
--             },
--             "name": "SF Zoo",
--             "orientation": "h",
--             "type": "bar"
--         },
--         {
--             "x": [
--                 12,
--                 18,
--                 29
--             ],
--             "y": [
--                 "giraffes",
--                 "orangutans",
--                 "monkeys"
--             ],
--             "marker": {
--                 "color": "rgba(255, 153, 51, 0.6)",
--                 "line": {
--                     "color": "rgba(255, 153, 51, 1.0)",
--                     "width": 1
--                 }
--             },
--             "name": "LA Zoo",
--             "orientation": "h",
--             "type": "bar"
--         }
--     ],
--     "layout": {
--         "barmode": "stack"
--     }
--     }|]

main :: IO ()
main = do
   runQuickPlot
   putStrLn "Quick! You have 15 seconds to open your browser and visit the address above me"
   threadDelay 3000000 -- wait 15 seconds
   {-plot [blueBoxTrace, orangeBoxTrace]-}
   plot [plot1, plot2, plot3]
   {-plot [barChart]-}
