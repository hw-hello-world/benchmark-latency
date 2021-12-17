var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  const { first_name, last_name } = req.query;
  res.send(`[NodeJS] Hello Mr. ${first_name} ${last_name}`);
});

module.exports = router;
