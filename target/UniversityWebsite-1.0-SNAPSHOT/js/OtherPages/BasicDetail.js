/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
$(document).ready(function(){
    alert("Hello world");
    
});
 $('input[type="radio"][name="SRF"]').change(function () {
            if ($(this).val() === "Yes") {
                $("#srfDate").show();
            } else {
                $("#srfDate").hide();
                $("#srfDate").val("");
            }
        });
        $('input[type="radio"][name="reReg"]').change(function () {
            if ($(this).val() === "Yes") {
                $("#reRegDate").show();
            } else {
                $("#reRegDate").hide();
                $("#reRegDate").val("");
            }
        });



        $('input[type="radio"][name="prePhd"]').change(function () {
            if ($(this).val() === "yes") {

                $("#prePhdLabel").show();
                $("#prePhdDate").show();
            } else {
                $("#prePhdLabel").hide();
                $("#prePhdDate").hide();
                $("#prePhdDate").val("");
            }
        });
        $('input[type="radio"][name="phd"]').change(function () {
            if ($(this).val() === "yes") {
                $("#phdDate").show();
                $("#phdDateLabel").show();
            } else {
                $("#phdDate").hide();
                $("#phdDateLabel").hide();
                $("#phdDate").val("");
            }
        });

