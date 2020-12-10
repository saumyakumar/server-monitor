library(httr)   # Httr is like a package which provides the request fictions like get(),post() to make api calls
library(ggplot2)  # Ggplot2 is a plotting package that helps to create plot between the specified variables
serverHealth=NULL
serverTime=NULL
serverBaseUrl <- "https://stark-brushlands-30519.herokuapp.com"
startTime <- Sys.time()
repeat{
  loopTime <- Sys.time()
  if(difftime(loopTime,startTime,units="secs") >= 3600){
    break
  }
  getServerData <- content(GET(serverBaseUrl))  # Fetching server health data and accessing it
  serverHealth <- append(serverHealth, getServerData$status)  # Adding server health data in an array
  getServerTime <- as.POSIXct(getServerData$timeStamp/1000, origin = "1970-01-01")  # Converting the server timestamp to standard date and time
  serverTime <- append(serverTime, getServerTime)  
  serverPlotting <- data.frame(serverHealth, serverTime)  # Converting the integer to frame 
  graphIntialize <- ggplot(serverPlotting, aes(x = serverTime,y = serverHealth))
  graphPlot <- graphIntialize + geom_point()
  print(graphPlot)
  Sys.sleep(300)  # repeat logic will be triggered every 5 mins
}

x <- Sys.time()
y <- Sys.time() 
if(difftime(y,x,units="secs") >= 3600){
  print("hi")
}
difftime(y,x,units="secs")
