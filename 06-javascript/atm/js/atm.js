// https://developer.mozilla.org/en-US/docs/Web/API/GlobalEventHandlers.onload
// The load event fires at the end of the document loading process.
// At this point, all of the objects in the document are in the DOM,
// and all the images and sub-frames have finished loading.

$(document).ready(function () {

  var ATM = {
    checkingBalance: 0,
    savingsBalance: 0,

    totalBalance: function () {
      return this.checkingBalance + this.savingsBalance;
    },

    checkingDeposit: function (amount) {
      amount = parseFloat(amount, 10);
      if (amount < 0) {
        return;
      }
      this.checkingBalance += amount;
    },

    savingsDeposit: function (amount) {
      amount = parseFloat(amount, 10);
      if (amount < 0) {
        return;
      }
      this.savingsBalance += amount;
    },

    checkingWithdraw: function (amount) {
      amount = parseFloat(amount, 10);
      if (amount < 0) {
        return;
      }
      if (amount <= this.checkingBalance) {
        this.checkingBalance -= amount;
      } else if (amount <= this.totalBalance()) {
        // Remove overdraft bit from the other account.
        this.savingsBalance -= (amount - this.checkingBalance);
        this.checkingBalance = 0;
      }
    },

    savingWithdraw: function (amount) {
      amount = parseFloat(amount, 10);
      if (amount < 0) {
        return;
      }
      if (amount <= this.savingsBalance) {
        this.savingsBalance -= amount;
      } else if (amount <= this.totalBalance()) {
        // Remove overdraft bit from the other account.
        this.checkingBalance -= (amount - this.savingsBalance);
        this.savingsBalance = 0;
      }
    }
  };

  var $checkingInput = $('#checkingAmount');
  var $savingsInput = $('#savingsAmount');

  var $checkingAmount = $('#balance1');
  var $savingsAmount = $('#balance2');

  var updateChecking = function() {
    var amount = '$' + ATM.checkingBalance.toFixed(2);
    $checkingAmount.text(amount);
    if (ATM.checkingBalance === 0) {
      $checkingAmount.addClass('zero');
    } else {
      $checkingAmount.removeClass('zero');
    }
  };

  var updateSavings = function() {
    var amount = '$' + ATM.savingsBalance.toFixed(2);
    $savingsAmount.text(amount);
    if (ATM.savingsBalance === 0) {
      $savingsAmount.addClass('zero');
    } else {
      $savingsAmount.removeClass('zero');
    }
  };

  var updateAccounts = function () {
    updateChecking();
    updateSavings();
  };

  // The click event is raised when the user clicks on an element.
  $("#checkingDeposit").on('click', function (event) {
    var balance = ATM.checkingDeposit($checkingInput.val());
    updateAccounts();
    $checkingInput.val('');
  });

  $("#savingsDeposit").on('click', function (event) {
    var balance = ATM.savingsDeposit($savingsInput.val());
    updateAccounts();
    $savingsInput.val('');
  });

  $("#checkingWithdraw").on('click', function (event) {
    var balance = ATM.checkingWithdraw($checkingInput.val());
    updateAccounts();
    $checkingInput.val('');
  });

  $("#savingsWithdraw").on('click', function (event) {
    var balance = ATM.savingWithdraw($savingsInput.val());
    updateAccounts();
    $savingsInput.val('');
  });

  updateAccounts();

  // window.ohGod = function () {
  //   debugger;
  // };
});
