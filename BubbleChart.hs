{-# LANGUAGE QuasiQuotes, OverloadedStrings #-}
module BubbleChart where

import QuickPlot
import QuickPlot.Plotly
import Control.Concurrent

country :: [String]
country = ["Switzerland (2011)", "Chile (2013)", "Japan (2014)",
           "United States (2012)", "Slovenia (2014)", "Canada (2011)",
           "Poland (2010)", "Estonia (2015)", "Luxembourg (2013)", "Portugal (2011)"]

votingPop, regVoters :: [Double]
votingPop = [40, 45.7, 52, 53.6, 54.1, 54.2, 54.5, 54.7, 55.1, 56.6]
regVoters = [49.1, 42, 52.7, 84.3, 51.7, 61.1, 55.3, 64.2, 91.1, 58.9]

trace1 = [plotly|{
  type : "scatter",
  x : #{ votingPop },
  y : #{ country },
  mode : "markers",
  name : "Percent of estimated voting age population",
  marker : {
    color : "rgba(156, 165, 196, 0.95)",
    line : {
      color : "rgba(156, 165, 196, 1.0)",
      width : 1
    },
    symbol : "circle",
    size : 16
  }
  }|]

trace2 = [plotly|{
  x : #{ regVoters },
  y : #{ country },
  mode : "markers",
  name : "Percent of estimated registered voters",
  marker : {
    color : "rgba(204, 204, 204, 0.95)",
    line : {
      color : "rgba(217, 217, 217, 1.0)",
      width : 1
    },
    symbol : "circle",
    size : 16
  }
  }|]

dat = [trace1, trace2]

layout = [plotly|{
  title : "Votes cast for ten lowest voting age population in OECD countries",
  xaxis : {
    showgrid : false,
    showline : true,
    linecolor : "rgb(102, 102, 102)",
    titlefont : {
      font : {
        color : "rgb(204, 204, 204)"
      }
    },
    tickfont : {
      font : {
        color : "rgb(102, 102, 102)"
      }
    },
    autotick : false,
    dtick : 10,
    ticks : "outside",
    tickcolor : "rgb(102, 102, 102)"
  },
  margin : {
    l : 140,
    r : 40,
    b : 150,
    t : 80
  },
  legend : {
    font : {
      size : 9
    },
    yanchor : "middle",
    xanchor : "right"
  },
  width : 1000,
  height : 1000,
  paper_bgcolor : "rgb(254, 247, 234)",
  plot_bgcolor : "rgb(254, 247, 234)",
  hovermode : "closest"
  }|]

main :: IO ()
main = do
   runQuickPlot
   putStrLn "Quick! You have 15 seconds to open your browser and visit the address above me"
   threadDelay 3000000 -- wait 15 seconds
   plot (dat, layout)
