function calculateProfit() {
  const priceInput = document.getElementById('item-price');
  const feeOutput = document.getElementById('add-tax-price');
  const profitOutput = document.getElementById('profit');

  if (priceInput) { // priceInputが存在する場合のみイベントリスナーを設定
    priceInput.addEventListener("input", () => {
      const inputValue = parseInt(priceInput.value, 10); // 入力値を整数に変換
      if (!isNaN(inputValue)) { // inputValueが数値であるかを確認
        const fee = Math.floor(inputValue * 0.1);  // 10%の手数料
        const profit = Math.floor(inputValue - fee);  // 利益を計算（価格から手数料を引く）
        
        feeOutput.innerHTML = fee;  // 手数料を表示
        profitOutput.innerHTML = profit;  // 利益を表示
      } else {
        feeOutput.innerHTML = 0; // 入力が無効な場合は手数料を0に
        profitOutput.innerHTML = 0; // 入力が無効な場合は利益を0に
      }
    });
  }
}

window.addEventListener('turbo:load', calculateProfit);
window.addEventListener('turbo:render', calculateProfit);
