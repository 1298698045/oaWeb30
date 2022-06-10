﻿Sfdc.ns("Identity.CapsLockDetector");
Identity.CapsLockDetector = function (a) {
    this.pwcaps = document.getElementById("pwcaps");
    if (null !== this.pwcaps) {
        var b = function (a) {
            this.capsLockOn = null
        };
        a = a ? Sfdc.Array.toArray(a) : Sfdc.select("input[type\x3dpassword]");
        b();
        Sfdc.Array.forEach(a, function (a) {
            Sfdc.Event.add(a, "keypress", this.updateCaps, this);
            Sfdc.Event.add(a, "keyup", this.checkCapsLockKey, this);
            Sfdc.Event.add(a, "keydown", this.checkCapsLockKey, this);
            Sfdc.Event.add(a, "blur", b, this)
        }, this)
    }
};
Sfdc.provide("Identity.CapsLockDetector", Identity.CapsLockDetector);
Identity.CapsLockDetector.prototype.showCapsLockWarning = function (a, b) {
    b ? (a.parentNode.insertBefore(this.pwcaps, a.nextSibling || null), Sfdc.Dom.show(this.pwcaps, !1)) : Sfdc.Dom.hideByDisplay(this.pwcaps)
};
Identity.CapsLockDetector.prototype.checkCapsLockKey = function (a) {
    var b = "undefined" === typeof a.which ? a.keyCode : a.which;
    null !== this.capsLockOn && b == Sfdc.Event.keyCode.CAPSLOCK && (this.capsLockOn = !this.capsLockOn, this.showCapsLockWarning(a.target, this.capsLockOn))
};
Identity.CapsLockDetector.prototype.updateCaps = function (a) {
    var b = String.fromCharCode("undefined" === typeof a.which ? a.keyCode : a.which);
    if (b.toLocaleLowerCase() != b.toLocaleUpperCase()) {
        var c = b.toLocaleLowerCase() == b && a.shiftKey,
            b = b.toUpperCase() == b && !a.shiftKey;
        this.capsLockOn = this.capsLockOn || c || b
    }
    this.showCapsLockWarning(a.target, this.capsLockOn)
};
Sfdc.ns("Identity.PasswordValidator");
Identity.PasswordValidator = function (b, a) {
    this.password = a;
    this.requirements = b;
    this.specialCharacters = RegExp("[" + (new ChangePassword).SPECIAL_CHAR + "]")
};
Identity.PasswordValidator.prototype.hasLetters = function () {
    return /[a-z]/i.test(this.password)
};
Identity.PasswordValidator.prototype.hasNumbers = function () {
    return /\d/.test(this.password)
};
Identity.PasswordValidator.prototype.hasEnoughCharacters = function () {
    return 0 !== this.password.length && this.password.length >= this.requirements.length
};
Identity.PasswordValidator.prototype.hasUpper = function () {
    return /[A-Z]/.test(this.password)
};
Identity.PasswordValidator.prototype.hasLower = function () {
    return /[a-z]/.test(this.password)
};
Identity.PasswordValidator.prototype.hasSpecial = function () {
    return this.specialCharacters.test(this.password)
};
Sfdc.ns("Identity.ChangePasswordRequirements");
Identity.ChangePasswordRequirements = function (b) {
    //debugger;
    this.requirements = b;
    this.newPassword = document.getElementById(ChangePasswordConstants.pNEW_PASSWORD_ELEM);
    this.passwordConfirm = document.getElementById(ChangePasswordConstants.pNEW_PASSWORD_CONFIRMATION_ELEM);
    this.answerField = document.getElementById(ChangePasswordConstants.pANSWER_ELEM);
    this.oldPasswordField = document.getElementById(ChangePasswordConstants.pOLD_PASSWORD_ELEM);
    var a = function (a) {
        a = this.validatePassword(this.newPassword.value, this.passwordConfirm.value);
        this.updatePasswordComponentState(a)
    },
        c = function (a) {
            a = this.validatePassword(this.newPassword.value, this.passwordConfirm.value);
            this.updatePasswordButton(a)
        };
    Sfdc.Array.forEach([this.newPassword, this.passwordConfirm], function (b) {
        Sfdc.Event.add(b, "keyup", a, this)
    }, this);
    Sfdc.Array.forEach([this.newPassword, this.passwordConfirm, this.answerField, this.oldPasswordField], function (a) {
        null !== a && Sfdc.Event.add(a, "keyup", c, this)
    }, this);
    this.updatePasswordButton({
        passwordIsGood: !1,
        confirmPasswordIsGood: !1
    });
    this.capsLockDetector =
        new Identity.CapsLockDetector
};
Sfdc.provide("Identity.ChangePasswordRequirements", Identity.ChangePasswordRequirements);
Identity.ChangePasswordRequirements.prototype.validatePassword = function (b, a) {
    var c = {
        passwordIsGood: !1,
        blankPassword: !0,
        confirmPasswordIsGood: !1,
        confirmPasswordStartsOk: !1,
        blankConfirmPassword: !0,
        hasEnoughCharacters: !1,
        hasLetters: !1,
        hasNumbers: !1,
        hasUpper: !1,
        hasLower: !1,
        hasSpecial: !1
    };
    c.blankPassword = 0 === b.length;
    var e = new Identity.PasswordValidator(this.requirements, b);
    c.hasEnoughCharacters = c.passwordIsGood = e.hasEnoughCharacters();
    for (var d in c)
        if (c.hasOwnProperty(d) && "function" === typeof e[d]) {
            var f =
                d.substr(3).toLowerCase();
            !0 === this.requirements[f] && (f = e[d](), c[d] = f, c.passwordIsGood = c.passwordIsGood && f)
        }
    c.blankConfirmPassword = 0 === a.length;
    c.confirmPasswordStartsOk = 0 === b.indexOf(a);
    c.confirmPasswordIsGood = b == a;
    return c
};
Identity.ChangePasswordRequirements.prototype.forEachValidSubkey = function (b, a, c) {
    Sfdc.Array.forEach(Object.keys(b), function (e) {
        b[e][a] && c(b[e][a])
    })
};
Identity.ChangePasswordRequirements.prototype.setRequirementState = function (b, a, c, e) {
    this.forEachValidSubkey(b, "element", function (b) {
        b.className = a
    });
    this.forEachValidSubkey(b, "icon", function (a) {
        a.src = c;
        a.alt = e
    })
};
Identity.ChangePasswordRequirements.prototype.updateNewPasswordField = function (b) {
    for (var a = "charcount letters numbers special upper lower".split(" "), c = {}, e = 0; e < a.length; e++) c[a[e]] = {
        element: document.getElementById(a[e]),
        icon: document.getElementById(a[e] + "icon")
    };
    a = document.getElementById("newpassword-message");
    Sfdc.Dom.removeClass(this.newPassword, ["error", "password-good", "password-weak"]);
    Sfdc.Dom.removeClass(a, ["password-none-color", "password-weak-color", "password-good-color"]);
    if (b.blankPassword) Sfdc.Dom.addClass(a,
        "password-none-color"), a.innerHTML = "", this.setRequirementState(c, "password-none-color", "/img/iconCheckDisabled.png", LC.getLabel("Page_Change_Password", "js_invalid_password"));
    else if (b.passwordIsGood) Sfdc.Dom.addClass(this.newPassword, "password-good"), Sfdc.Dom.addClass(a, "password-good-color"), a.innerHTML = LC.getLabel("Page_Change_Password", "js_good_password"), this.setRequirementState(c, "password-good-color", "/img/iconCheckEnabled.png", LC.getLabel("Page_Change_Password", "js_good_password"));
    else {
        Sfdc.Dom.addClass(this.newPassword,
            "password-weak");
        Sfdc.Dom.addClass(a, "password-weak-color");
        a.innerHTML = LC.getLabel("Page_Change_Password", "js_weak_password");
        control = {
            hasEnoughCharacters: c.charcount,
            hasLetters: c.letters,
            hasNumbers: c.numbers,
            hasSpecial: c.special,
            hasUpper: c.upper,
            hasLower: c.lower
        };
        for (var d in control) control.hasOwnProperty(d) && null !== control[d].element && (b[d] ? (Sfdc.Dom.addClass(control[d].element, "password-good-color"), control[d].icon.src = "/img/iconCheckEnabled.png", control[d].icon.alt = LC.getLabel("Page_Change_Password",
            "js_good_password")) : (Sfdc.Dom.removeClass(control[d].element, "password-good-color"), control[d].icon.src = "/img/iconCheckDisabled.png", control[d].icon.alt = LC.getLabel("Page_Change_Password", "js_invalid_password")))
    }
};
Identity.ChangePasswordRequirements.prototype.updateConfirmPasswordField = function (b) {
    var a = document.getElementById("confirmpassword-message");
    Sfdc.Dom.removeClass(this.passwordConfirm, ["error", "password-good", "password-weak"]);
    Sfdc.Dom.removeClass(a, ["password-none-color", "password-weak-color", "password-good-color"]);
    b.blankConfirmPassword ? (Sfdc.Dom.addClass(a, "password-none-color"), a.innerHTML = "") : b.confirmPasswordIsGood ? (Sfdc.Dom.addClass(this.passwordConfirm, "password-good"), Sfdc.Dom.addClass(a,
        "password-good-color"), b.passwordIsGood && (a.innerHTML = LC.getLabel("Page_Change_Password", "js_match"))) : b.confirmPasswordStartsOk ? (Sfdc.Dom.addClass(a, "password-none-color"), a.innerHTML = LC.getLabel("Page_Change_Password", "js_partial_match")) : (Sfdc.Dom.addClass(this.passwordConfirm, "password-weak"), Sfdc.Dom.addClass(a, "password-weak-color"), a.innerHTML = LC.getLabel("Page_Change_Password", "js_no_match"))
};
Identity.ChangePasswordRequirements.prototype.updatePasswordButton = function (b) {
    var a = document.getElementById("password-button");
    b = b.confirmPasswordIsGood && b.passwordIsGood;
    null !== this.answerField && (b = null !== this.oldPasswordField ? 0 < this.oldPasswordField.value.length && (b || 0 < this.answerField.value.length) : b && 0 < this.answerField.value.length);
    a.disabled = !b;
    b ? Sfdc.Dom.addClass(a, "primary") : Sfdc.Dom.removeClass(a, "primary")
};
Identity.ChangePasswordRequirements.prototype.updatePasswordComponentState = function (b) {
    this.updateNewPasswordField(b);
    this.updateConfirmPasswordField(b)
};