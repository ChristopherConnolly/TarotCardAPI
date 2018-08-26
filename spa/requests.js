const tarotdata = "http://localhost:3002/api/tarot";
const documentroot = "http://localhost:3002/";



//Populate Datatable
var cardsJSON = $.ajax({ url: tarotdata, async: 0 });
console.log("Card get all - result" + cardsJSON.responseJSON);
$('#cardstable').DataTable({
    data: cardsJSON.responseJSON, dataType: JSON, "columns": [{ "data": "id" }, {
        "data":
            "cardname"
    }, { "data": "cardsuit" }, { "data": "imagefile" }, { "data": "cardsummary" }, {
        "data": "carddescription"
    }, { "data": "cardsummaryreversed" }, { "data": "carddescriptionreversed" }, { "data": "cardnotes" }]
});





// var findAllCardsPopulateList = function() {
//   console.log("Finding all Cards to populate list");
//   $.ajax({
//     type: "GET",
//     url: tarotdata,
//     dataType: "json", // data type of response
//     success: CardRenderList
//   });
// };

var findAllCard = function () {
    console.log("Finding all Cards");
    $.ajax({
        type: "GET",
        url: tarotdata,
        dataType: "json", // data type of response
        // success: CardRenderList
    });
};

// //Search function
// var findCardByName = function (CardSearchKey) {
//     console.log('Finding Card by Name: ' + CardSearchKey); //CHECK THIS
//     $.ajax({
//         type: 'GET',
//         url: tarotdata + ':' + CardSearchKey,
//         dataType: "json",
//         success: CardRenderList
//     });
// };
// var findCardByName = function (CustomerSearchKey) {
//     console.log('Finding Card by name: ' + CardSearchKey);
//     $.ajax({
//         type: 'GET',
//         url: tarotdata + '/search/' + CustomerSearchKey,
//         dataType: "json",
//         success: customerRenderList
//     });
// };

//Find by ID
var findCardById = function (id) {
    console.log("Find Card by ID: " + id);
    $.ajax({
        type: "GET",
        url: tarotdata + "/" + id,
        dataType: "json",
        success: function (data) {
            $("#CardBtnDelete").attr("class", "btn btn-info btn-lg");
            console.log("Find Card by ID success: " + data.cardId);
            currentCard = data;
            renderDetailsCard(currentCard);
        }
    });
};

//Adding
document.getElementById("cardBtnPost").addEventListener("click", function () {
    event.preventDefault();
    console.log("Adding Card via Post...");
    $.ajax({
        type: "POST",
        contentType: "application/json",
        url: tarotdata,
        dataType: "json",
        data: CardsFormToJSON(),
        success: function (data, textStatus) {
            alert("Card created successfully " + textStatus);
        },
        error: function (textStatus, errorThrown) {
            alert("Adding Card via Post Error: " + errorThrown);
        }
    });
});

//Update
document.getElementById("cardBtnPut").addEventListener("click", function () {
    event.preventDefault();
    console.log("Updating Card using Put..." + $("#cardId").val());
    $.ajax({
        type: "PUT",
        async: "0",
        contentType: "application/json",
        url: tarotdata + "/" + $("#cardId").val(),
        dataType: "json",
        data: CardsFormToJSON(),
        success: function (data, textStatus) {
            var xyz = tarotdata + "/" + $("#cardId").val();
            alert("Card at " + xyz + " updated successfully" + textStatus);
        },
        error: function (textStatus, errorThrown) {
            alert("Updating Card error: " + errorThrown);
        }
    });
}
);


//Rendering Elements

var CardRenderList = function (data) {
    console.log("rendering" + data);

    //Make a list
    var list = data == null ? [] : data instanceof Array ? data : [data];
    $("#CardList li").remove();
    $.each(list, function (index, Card) {
        $("#CardList").append(
            '<li><a href="javascript:void(0)" id="' +
            Card.is +
            '">' +
            this.cardname +
            "  " +
            this.cardsuit +
            "</a></li>"
        );
    });
    return true;
};

//renderDetails
var renderDetailsCard = function (Card) {
    $("#id").val(Card.id);
    $("#cardname").val(Card.cardname);
    $("#cardsuit").val(Card.cardsuit);
    $("#imagefile").val(Card.imagefile);
    $("#cardsummary").val(Card.cardsummary);
    $("#carddescription").val(Card.carddescription);
    $("#cardsummaryreversed").val(Card.cardsummaryreversed);
    $("#carddescriptionreversed").val(Card.carddescriptionreversed);
    $("#cardnotes").val(Card.cardnotes);
};

//For to JSON
// Helper function to serialize all the form fields into a JSON string
var CardsFormToJSON = function () {
    return JSON.stringify({
        id: $("#cardId").val(),
        cardname: $("#cardname").val(),
        cardsuit: $("#cardsuit").val(),
        imagefile: $("#imagefile").val(),
        cardsummary: $("#cardsummary").val(),
        carddescription: $("#carddescription").val(),
        cardsummaryreversed: $("#cardsummaryreversed").val(),
        carddescriptionreversed: $("#carddescriptionreversed").val(),
        cardnotes: $("#cardnotes").val()
    });
};

//RESETFORM
// var tempScrollTop = $(window).scrollTop();
//
// ..//Your code
//
// $(window).scrollTop(tempScrollTop);

// Trigger search when pressing 'Return' on search key input field

// $(document).on('keydown', '#CardSearchKey', function (e) {
//     if (e.which == 8 || e.which == 13 || e.which == 46) {
//         CardSearch($('#CardSearchKey').val());
//        return false;
//     }
// });
// $(document).on('keypress', '#customerSearchKey', function (e) {
//     if (e.which == 8 || e.which == 13 || e.which == 46) {
//         CustomerSearch($('#customerSearchKey').val());
//         return false;
//     }
// });
// $(document).on('keypress', '#bookingSearchKey', function (e) {
//     if (e.which == 8 || e.which == 13 || e.which == 46) {
//         BookingSearch($('#bookingSearchKey').val());
//         return false;
//     }
// });


//DELETE

document.getElementById("cardBtnDelete").addEventListener("click", function () {
    event.preventDefault();
    console.log("deleting card");
    console.log("Deleting Card by cardId ...");
    $.ajax({
        type: "DELETE",
        async: "0",
        url: tarotdata + "/" + $("#cardId").val(),
        success: function (data, textStatus) {
            alert("Card deleted successfully, code :" + textStatus);
            dropdownlist.empty();
        },
        error: function (textStatus, errorThrown) {
            alert("Error Deleting Card, code " + textStatus);
        }
    });
    return false;
});


//Front end code for populating a list box
var dropdownlist = $("#carddropdown");
document.getElementById("cardBtnSearch").addEventListener("click", function () {
    event.preventDefault();
    console.log("cardbtnsearch");
    $.ajax({
        type: "GET",
        url: tarotdata,
        async: 0,
        success: function (data) {
            // console.log("Card get all populate list - result" + data);

            for (var key = "id" in data) {
                dropdownlist.append(
                    $("<option></option>")
                        .val(JSON.stringify(data[key]))
                        .html(JSON.stringify(data[key].id))
                );
            }
        }
    });
});



document.getElementById("cardBtnPop")
    .addEventListener("click", function () {
        event.preventDefault();
        var selectedId = JSON.parse(document.getElementById("carddropdown").value);
        console.log("yoyoy" + selectedId);
        $("#cardId").val(selectedId.id);
        $("#cardname").val(selectedId.cardname);
        $("#cardsuit").val(selectedId.cardsuit);
        $("#imagefile").val(selectedId.imagefile);
        $("#cardsummary").val(selectedId.cardsummary);
        $("#carddescription").val(selectedId.carddescription);
        $("#cardsummaryreversed").val(selectedId.cardsummaryreversed);
        $("#carddescriptionreversed").val(selectedId.carddescriptionreversed);
        $("#cardnotes").val(selectedId.cardnotes);
        $("#pic").attr("src", documentroot + selectedId.imagefile);
    });
