$("#id").focus();

$("#join")
	.submit(
		function() {
			var submitResult = true;

			$(".error").css("display", "none");

			var idReg = /^[a-zA-Z]\w{5,19}$/g;
			if ($("#id").val() == "") {
				$("#idMsg").css("display", "block");
				submitResult = false;
			} else if (!idReg.test($("#id").val())) {
				$("#idRegMsg").css("display", "block");
				submitResult = false;
			} else if ($("#idCheckResult").val() == "0") {
				$("#idCheckMsg").css("display", "block");
				submitResult = false;
			}

			var passwdReg = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*_-]).{6,20}$/g;
			if ($("#password").val() == "") {
				$("#passwdMsg").css("display", "block");
				submitResult = false;
			} else if (!passwdReg.test($("#password").val())) {
				$("#passwdRegMsg").css("display", "block");
				submitResult = false;
			}

			if ($("#repassword").val() == "") {
				$("#repasswdMsg").css("display", "block");
				submitResult = false;
			} else if ($("#password").val() != $("#repassword")
				.val()) {
				$("#repasswdMatchMsg").css("display", "block");
				submitResult = false;
			}

			if ($("#name").val() == "") {
				$("#nameMsg").css("display", "block");
				submitResult = false;
			}

			var emailReg = /^([a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+(\.[-a-zA-Z0-9]+)+)*$/g;
			if ($("#email").val() == "") {
				$("#emailMsg").css("display", "block");
				submitResult = false;
			} else if (!emailReg.test($("#email").val())) {
				$("#emailRegMsg").css("display", "block");
				$("#example_email").css("display", "block");
				submitResult = false;
			} else if ($("#emailCheckResult").val() == "0") {
				$("#emailCheckMsg").css("display", "block");
				submitResult = false;
			}

			var mobile1Reg = /\d{3}/;
			var mobile2Reg = /\d{3,4}/;
			var mobile3Reg = /\d{4}/;
			if ($("#mobile1").val() == ""
				|| $("#mobile2").val() == ""
				|| $("#mobile3").val() == "") {
				$("#mobileMsg").css("display", "block");
				submitResult = false;
			} else if (!mobile1Reg.test($("#mobile1").val())
				|| !mobile2Reg.test($("#mobile2").val())
				|| !mobile3Reg.test($("#mobile3").val())) {
				$("#mobileRegMsg").css("display", "block");
				submitResult = false;
			}

			if ($("#zipcode").val() == "") {
				$("#addressMsg").css("display", "block");
				submitResult = false;
			}

			if ($("#address1").val() == "") {
				$("#addressMsg").css("display", "block");
				submitResult = false;
			}

			return submitResult;
		});

$("#idCheck").click(
	function() {

		$("#idMsg").css("display", "none");
		$("#idRegMsg").css("display", "none");

		var idReg = /^[a-zA-Z]\w{5,19}$/g;
		if ($("#id").val() == "") {
			$("#idMsg").css("display", "block");
			return;
		} else if (!idReg.test($("#id").val())) {
			$("#idRegMsg").css("display", "block");
			return;
		}

		window.open("/sambab/login/id_check.jsp?id="
			+ $("#id").val(), "idcheck",
			"width=540,height=350,left=700,top=400");
	});

$("#id").change(function() {
	$("#idCheckResult").val("0");
});

$("#emailCheck")
	.click(
		function() {
			$("#emailMsg").css("display", "none");
			$("#emailRegMsg").css("display", "none");
			$("#example_email").css("display", "none");

			var emailReg = /^([a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+(\.[-a-zA-Z0-9]+)+)*$/g;
			if ($("#email").val() == "") {
				$("#emailMsg").css("display", "block");
				return;
			} else if (!emailReg.test($("#email").val())) {
				$("#emailRegMsg").css("display", "block");
				$("#example_email").css("display", "block");
				return;
			}

			window.open("/sambab/login/email_check.jsp?email="
				+ $("#email").val(), "emailcheck",
				"width=540,height=350,left=700,top=400");
		});

$("#email").change(function() {
	$("#emailCheckResult").val("0");
});

$("#addressNo").click(function() {
	new daum.Postcode({
		oncomplete: function(data) {
			join.zipcode.value = data.zonecode;

			join.address.value = data.roadAddress;
		}
	}).open();
});