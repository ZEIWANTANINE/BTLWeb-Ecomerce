function validateLoginForm() {
    var phone = document.getElementById("sdt").value.trim();
    var pass = document.getElementById("matkhau").value.trim();
    var error = document.getElementById("error");

    console.log("Hàm validateLoginForm đang chạy. IncorrectAttempts:", incorrectAttempts, "IsAccountLocked:", isAccountLocked);

    if (isAccountLocked) {
        alert('Tài khoản của bạn đã bị khoá.');
        return false;
    }

    var isValid = true;

    if (phone === "") {
        error.innerHTML = "Vui lòng nhập số điện thoại!";
        isValid = false;
    } else if (pass === "") {
        error.innerHTML = "Vui lòng nhập mật khẩu!";
        isValid = false;
    }

    if (!isValid) {
        incorrectAttempts++;

        if (incorrectAttempts === 3) {
            alert('Bạn đã nhập sai quá 3 lần. Tài khoản của bạn sẽ bị khoá.');
            isAccountLocked = true;
        } else {
            error.innerHTML = 'Số điện thoại hoặc mật khẩu không đúng. Vui lòng thử lại.';
        }

        return false;
    }

    incorrectAttempts = 0;
    return true;
}
