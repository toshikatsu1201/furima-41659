window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById('item-price');
  const feeOutput = document.getElementById('add-tax-price');
  const profitOutput = document.getElementById('profit');

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    feeOutput.innerHTML = Math.floor(inputValue * 0.1);  // 10%の手数料
    profitOutput.innerHTML = Math.floor(inputValue * 0.9);  // 利益を計算して表示エリアに反映する（価格の90%を計算し、小数点以下は切り捨て）
 })
});