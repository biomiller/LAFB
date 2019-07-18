const express = require("express");
const bodyParser = require("body-parser");

//Two implementation of prize generation: smallReward (less generous), bigReward (more generous)
//const reward = require("./routes/smallReward");
//const reward = require("./routes/bigReward");
const reward = require("./routes/reward");

const app = express();

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.use("/prize", reward);

const port = process.env.PORT || 5002;

app.listen(port, () => console.log(`server running on port ${port}`));
