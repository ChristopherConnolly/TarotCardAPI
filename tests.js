process.env.NODE_ENV = "test";

let chai = require("chai");
let chaiHttp = require("chai-http");
let should = chai.should();

let server = require("./app");

chai.use(chaiHttp);

//Define our sample card
let card = {
  id: 998,
  cardname: "Ace of tests",
  cardsuit: "Tests",
  imagefile: "tests.jpg",
  cardsummary: "a test summary",
  carddescription: "a test description",
  cardsummaryreversed: "a test summary reversed",
  carddescriptionreversed: "a test description reversed",
  cardnotes: "a test cardnotes"
};

/*
*  Test Post method
*/

describe("/Post tarot", () => {
  it("it should POST a card ", done => {
    chai
      .request(server)
      .post("/api/tarot/")
      .send(card)
      .end((err, res) => {
        res.should.have.status(201);
        done();
      });
  });
});

describe("/GET tarot", () => {
  it("Should get all cards", done => {
    chai
      .request(server)
      .get("/api/tarot/")
      .end((err, res) => {
        res.should.have.status(200);
        done();
      });
  });
});

/*
 * Test the /GET/:id route
 */
describe("/GET/:id card", () => {
  it("it should GET a card by the given id", done => {
    chai
      .request(server)
      .get("/api/tarot/" + card.id)
      .end((err, res) => {
        res.should.have.status(200);
        res.body[0].should.have.property("id");
        res.body[0].should.have.property("id").eql(card.id);
        done();
      });
  });
});

/*
* Test the PUT/:id route
*/
describe("/PUT/:id card", () => {
  it("it should UPDATE card 999, created in Post", done => {
    chai
      .request(server)
      
      .put(
        "/api/tarot/" + card.id,
        console.log("PUTTING GGG api/tarot/" + card.id)
      )
      .send({
        carddescription: "card put success description"
      })
      .end((err, res) => {
        res.should.have.status(200);
        done();
      });
  });
});

/*
* Test /Delete/:id functionality
*/
describe("/DELETE/:id card", () => {
  it("it should DELETE card 999, created in Post and edited in Put", () => {
    chai
      .request(server)
      .delete("/api/tarot/" + card.id)
      .send({
        id: 999
      })
      .end((err, res) => {
        res.should.have.status(200);
        res.body.should.have.property("message").eql("Deleted");
        done();
      });
  });
});
