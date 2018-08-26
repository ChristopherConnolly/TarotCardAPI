const initport = 3002;
const dbConfig = {
  host: "127.0.0.1",
  user: "root",
  password: "mysql",
  database: "tarotdata"
};

//pull in node modules
var express = require("express");
var bodyParser = require("body-parser");
var sql = require("mysql2");
var app = express();

//bodyParser comes with JSON support
app.use(bodyParser.json());

//serve image files
app.use(express.static("img/Rider-Waite"));

//Cross Origin Request Services (CORS) Setup - just in case we're on different ips
app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  //Setting some headers: the four HTML methods we will be allowing
  res.header("Access-Control-Allow-Methods", "GET,POST,PUT,DELETE");
  res.header(
    "Access-Control-Allow-Headers",
    "Origin, X-Requested-With, contentType,Content-Type, Accept, Authorization"
  );
  next();
});

//set up API interface on port specified above
try {
  var apiserve = app.listen(initport);
  console.log("App listening on ", apiserve.address().port);
} catch (err) {
  console.log("App start failure");
}

const sqlconnection = sql.createConnection(dbConfig);

console.log("ready to serve /");
app.get("/", (req, res) =>
  res.send("Node Server is running - try using an API command")
);

app.get("/api/tarot", (req, res) => {
  var sqlToList = "select * from cardorder";
  console.log(
    "list of all cards requested from" + req.connection.remoteAddress
  );
  sqlconnection.query(sqlToList, function(err, result) {
    if (err) throw err;
    //  console.log(result );
    res.json(result);
  });
});

//Get one card
app.get("/api/tarot/:id", (req, res) => {
  var sqlToList = "select * from cardorder WHERE id = ?";
  console.log(
    "card" + req.params.id + " requested from " + req.connection.remoteAddress
  );
  sqlconnection.query(sqlToList, req.params.id, function(err, result) {
    if (err) throw err;
    console.log(result);
    res.json(result);
  });
});

//POST API
app.post("/api/tarot", (req, res) => {
  var sqlToPost = "INSERT INTO cardorder VALUES ( ?,?,?,?,?,?,?,?,? );";
  console.log("post request from" + req.connection.remoteAddress);
  console.log(req.body);

  try {
    sqlconnection.query(sqlToPost, [
      req.body.id,
      req.body.cardname,
      req.body.cardsuit,
      req.body.imagefile,
      req.body.cardsummary,
      req.body.carddescription,
      req.body.cardsummaryreversed,
      req.body.carddescriptionreversed,
      req.body.cardnotes
    ]);
    res.sendStatus(201);
  } catch (err) {
    res.sendStatus(400);
    console.log("error " + err);
  }
});

//PUT API
app.put("/api/tarot/:id", (req, res) => {
  console.log(
    "card" + req.params.id + " requested from " + req.connection.remoteAddress
  );
  var sqlToList = "select * from cardorder WHERE id = ?";
  sqlconnection.query(sqlToList, req.params.id, function(err, result) {
    if (err) throw err;
    var cardToCompare = result[0];
    console.log("result " + JSON.stringify(cardToCompare));
    console.log("request body " + JSON.stringify(req.body));
    var put = req.body;
    Object.keys(req.body).forEach(key => {
      cardToCompare[key] = req.body[key];
    });
    console.log("Resulting card " + JSON.stringify(cardToCompare));

    var sqlToPut =
      "UPDATE cardorder SET cardname = ?, cardsuit = ?, imagefile = ?, cardsummary = ?,carddescription = ?, cardsummaryreversed = ?, carddescriptionreversed = ?, cardnotes = ? WHERE id = ? ;";
    try {
      sqlconnection.query(sqlToPut, [
        cardToCompare.cardname,
        cardToCompare.cardsuit,
        cardToCompare.imagefile,
        cardToCompare.cardsummary,
        cardToCompare.carddescription,
        cardToCompare.cardsummaryreversed,
        cardToCompare.carddescriptionreversed,
        cardToCompare.cardnotes,
        cardToCompare.id
      ]);
      res.sendStatus(200);
    } catch (err) {
      console.log("error " + err);
      res.sendStatus(504);
    }
  });
});

// URL PUT
app.put("/api/tarot/", (req, res) => {
  console.log(
    "card" + req.body.id + " requested from " + req.connection.remoteAddress
  );
  var sqlToList = "select * from cardorder WHERE id = ?";
  sqlconnection.query(sqlToList, req.body.id, function(err, result) {
    if (err) throw err;
    var cardToCompare = result[0];
    console.log("result " + JSON.stringify(cardToCompare));
    console.log("request body " + JSON.stringify(req.body));
    Object.keys(req.body).forEach(key => {
      cardToCompare[key] = req.body[key];
    });
    console.log("Resulting card " + JSON.stringify(cardToCompare));

    var sqlToPut =
      "UPDATE cardorder SET cardname = ?, cardsuit = ?, imagefile = ?, cardsummary = ?,carddescription = ?, cardsummaryreversed = ?, carddescriptionreversed = ?, cardnotes = ? WHERE id = ? ;";
    try {
      sqlconnection.query(sqlToPut, [
        cardToCompare.cardname,
        cardToCompare.cardsuit,
        cardToCompare.imagefile,
        cardToCompare.cardsummary,
        cardToCompare.carddescription,
        cardToCompare.cardsummaryreversed,
        cardToCompare.carddescriptionreversed,
        cardToCompare.cardnotes,
        cardToCompare.id
      ]);
      res.sendStatus(200);
    } catch (err) {
      console.log("error " + err);
      res.sendStatus(504);
    }
  });
});

// DELETE API
// Via json - reads the id passed in by JSON
app.delete("/api/tarot", function(req, res) {
  var sqlToDelete = "DELETE FROM cardorder WHERE id=" + req.body.id;
  console.log(
    "delete request from " +
      req.connection.remoteAddress +
      "to delete card " +
      req.body.id
  );
  sqlconnection.query(sqlToDelete);
  res.sendStatus(200);
});
// Via URL - reads the id from the address
app.delete("/api/tarot/:id", function(req, res) {
  var sqlToDelete = "DELETE FROM cardorder WHERE id=" + req.params.id;
  console.log(
    "delete request from " +
      req.connection.remoteAddress +
      "to delete card " +
      req.params.id
  );
  sqlconnection.query(sqlToDelete);
  res.sendStatus(200);
});

module.exports = app;
