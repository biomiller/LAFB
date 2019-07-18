const express = require("express");
const router = express.Router();
const axios = require('axios');

// @route   GET account/test
// @desc    Tests route
// @access  Public
router.get("/test", (req, res) => {
  res.json({
    message: "account"
  });
});

// @route   GET account/all
// @desc    Get all accounts
// @access  Public

router.get("/all", (req, res) => {
  
  axios.get('http://db_connector:5001/account/all')
  .then(response => {
   
res.send(response.data)
  })
  .catch(error => {
    console.log(error);
  });


});

// @route   POST account/createaccount
// @desc    Create an account
// @access  Public
router.post("/createAccount", (req, res) => {

  let prizeDecider = Math.floor(Math.random() * 100);
  let prize;

  if (prizeDecider >= 75){
    prize = "£50";

    axios.get('http://notificationserver:9000/notify').catch(error => {
      console.log(error);
    });

  }else{
    prize = "No Prize"
  }

    const newAccount = {
      firstName: req.body.firstName,
      lastName: req.body.lastName,
      accountnumber: req.body.accountnumber,
      prize: prize
    };

    axios.post('http://db_connector:5001/account/createAccount', newAccount)
    .then(response => {

      res.send(response.data);

    }) .catch(error => {
      console.log(error);
    });



});

module.exports = router;
