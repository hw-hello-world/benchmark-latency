var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  const { firstName, lastName } = req.query;
  res.send(`[NodeJS] Hello Mr. ${firstName} ${lastName}`);
});

module.exports = router;
