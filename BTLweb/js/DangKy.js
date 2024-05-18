document.addEventListener("DOMContentLoaded", function () {
    var input = document.getElementsByTagName('input');

    for (let i = 0; i < input.length; i++) {
        if (i !== 10) {
            input[i].addEventListener("input", function () {
                validateInput(input[i]);
            });
        } else {
            input[i].addEventListener('input', function () {
                validateConfirmPassword(input[i - 1], input[i]);
            });
        }
    }
});

function validateInput(inputElement) {
    let regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{5,}$/;
    let valid = regex.test(inputElement.value);
    let pvalue = document.querySelector("p." + inputElement.className);

    if (valid) {
        pvalue.innerHTML = "";
    } else {
        pvalue.innerHTML = "Mật khẩu không hợp lệ (A-Z)(a-z)(0-9)(7 kt->)(!@#$%^&*())";
    }
}

function validateConfirmPassword(passwordElement, confirmPasswordElement) {
    let pvalue = document.querySelector("p." + confirmPasswordElement.className);

    if (confirmPasswordElement.value === passwordElement.value) {
        pvalue.innerHTML = "";
    } else {
        pvalue.innerHTML = "Mật khẩu không khớp";
    }
}

function checkDangKy() {
    var name = document.getElementById("hoten").value.trim();
    var phone = document.getElementById("sdt").value.trim();
    var password = document.getElementById("matkhau").value.trim();
    var cfPassword = document.getElementById("matkhaunhaplai").value.trim();
    var check = true;
    var inputMST = document.getElementById("MST")
    if (name === "") {
        alert("Fill name!");
        document.getElementById("hoten").focus();
        check = false;
    } else {
        if (phone === "") {
            alert("Fill phone number!");
            document.getElementById("sdt").focus();
            check = false;
        } else {
            if (phone.length !== 10) {
                alert("Wrong phone number!");
                document.getElementById("sdt").value = "";
                document.getElementById("sdt").focus();
                check = false;
            } else {
                if (password === "") {
                    alert("Fill password!");
                    document.getElementById("matkhau").focus();
                    check = false;

                }
                 else {
                    if (password.length < 6) {
                        alert("Length of password must be at least 6!")
                        document.getElementById("matkhau").value = "";
                        document.getElementById("matkhau").focus();
                        check = false;
                    } else {
                        if (cfPassword === "") {
                            alert("Confirm password!")
                            document.getElementById("matkhaunhaplai").focus();
                            check = false;
                        } else if (!validateInput(document.getElementById("matkhau"))) {
                            check = false;
                        } else {
                            validateConfirmPassword(document.getElementById("matkhau"), document.getElementById("matkhaunhaplai"));
                        }
                    }
                }
            }
        }
    }
    return check;
}
