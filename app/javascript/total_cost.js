window.addEventListener('DOMContentLoaded', (event) => {
  // 全ての event-cost-input 要素を取得
  const costInputs = document.querySelectorAll('.event-cost-input');

  // 各 event-cost-input 要素にイベントリスナーを追加
  costInputs.forEach((input) => {
      input.addEventListener('input', updateCosts);
  });
});

function numberWithCommas(x) {
  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function updateCosts() {
  // 再度全ての event-cost-input 要素を取得
  const costInputs = document.querySelectorAll('.event-cost-input');

  // 各 event-cost-input 要素の値を合計
  let subtotal = 0;
  costInputs.forEach((input) => {
      const value = Number(input.value);
      if (!isNaN(value)) {
          subtotal += value;
      }
  });

  // 税額と税込価格を計算
  const taxRate = 0.1;  // 税率を10%とする
  const taxAmount = Math.round(subtotal * taxRate);
  const totalCost = subtotal + taxAmount;

  // subtotal-display, tax-amount-display, total-cost-display 要素を取得し、計算結果を設定
  const subtotalDisplay = document.getElementById('subtotal-display');
  const taxAmountDisplay = document.getElementById('tax-amount-display');
  const totalCostDisplay = document.getElementById('total-cost-display');
  const totalCostHidden = document.getElementById('total-cost-hidden');
  subtotalDisplay.textContent = numberWithCommas(subtotal);
  taxAmountDisplay.textContent = numberWithCommas(taxAmount);
  totalCostDisplay.textContent = numberWithCommas(totalCost);
  totalCostHidden.value = totalCost;
}