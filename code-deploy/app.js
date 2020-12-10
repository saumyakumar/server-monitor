const express = require("express");

const app = express();

app.get("/", (req,res)=>{

  // Random number generated (0 || 1).
  serverStatus = Math.floor(Math.random()*Math.floor(2));
 
  // Current Time Stamp.
  time = new Date().getTime();

  res.json(
      {
        status:serverStatus,
        timeStamp: time
      }
    );
});

app.listen(process.env.PORT || 3000,()=>{
    console.log("Server Started");
})