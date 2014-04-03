// https://developer.mozilla.org/en-US/docs/Web/API/GlobalEventHandlers.onload
// The load event fires at the end of the document loading process.
// At this point, all of the objects in the document are in the DOM,
// and all the images and sub-frames have finished loading.
window.onload = function () {

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

  var checkingInput = document.getElementById('checkingAmount');
  var savingsInput = document.getElementById('savingsAmount');

  var checkingAmount = document.getElementById('balance1');
  var savingsAmount = document.getElementById('balance2');

  var updateChecking = function() {
    amount = '$' + ATM.checkingBalance.toFixed(2);
    checkingAmount.innerHTML = amount;
    if (ATM.checkingBalance === 0) {
      checkingAmount.className = 'balance zero';
    } else {
      checkingAmount.className = 'balance';
    }
  };

  var updateSavings = function() {
    amount = '$' + ATM.savingsBalance.toFixed(2);
    savingsAmount.innerHTML = amount;
    if (ATM.savingsBalance === 0) {
      savingsAmount.className = 'balance zero';
    } else {
      savingsAmount.className = 'balance';
    }
  };

  var updateAccounts = function () {
    updateChecking();
    updateSavings();
  };

  // The click event is raised when the user clicks on an element.
  document.getElementById("checkingDeposit").addEventListener('click', function (event) {
    var balance = ATM.checkingDeposit(checkingInput.value);
    updateAccounts();
    checkingInput.value = '';
  });

  document.getElementById("savingsDeposit").addEventListener('click', function (event) {
    var balance = ATM.savingsDeposit(savingsInput.value);
    updateAccounts();
    savingsInput.value = '';
  });

  document.getElementById("checkingWithdraw").addEventListener('click', function (event) {
    var balance = ATM.checkingWithdraw(checkingInput.value);
    updateAccounts();
    checkingInput.value = '';
  });

  document.getElementById("savingsWithdraw").addEventListener('click', function (event) {
    var balance = ATM.savingWithdraw(savingsInput.value);
    updateAccounts();
    savingsInput.value = '';
  });

  updateAccounts();

  // window.ohGod = function () {
  //   debugger;
  // };
};
