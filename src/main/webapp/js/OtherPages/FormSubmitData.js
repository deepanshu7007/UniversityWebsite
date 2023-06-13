function formSubmitData(formData, serverName)
{

    $.ajax({
        url: serverName,
        method: 'POST',
        data: formData,
        processData: false,
        contentType: false,
        success: function (data, textStatus, jqXHR) {
            alert("DATA SUCCESSFULLY SUBMITTED");
        },
        error: function (error) {
            console.log("SOMETHING WENT WRONG");
        }
    });

for (var pair of formData.entries()) {
    console.log(pair[0]+ ', ' + pair[1]); 
}
    console.warn("ServletName" + serverName);
}


