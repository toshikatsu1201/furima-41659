const pay = () => {
  const publicKey = gon.public_key
  const payjp = Payjp(publicKey)//PAY.JPテスト公開鍵
  const elements = payjp.elements();
  const cardNumberElement = elements.create('cardNumber');
  const cardExpiryElement = elements.create('cardExpiry');
  const cardCvcElement = elements.create('cardCvc');

  cardNumberElement.mount('#number-form');
  cardExpiryElement.mount('#expiry-form');
  cardCvcElement.mount('#cvc-form');

  const form = document.getElementById('charge-form')
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    payjp.createToken(cardNumberElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      cardNumberElement.clear();
      cardExpiryElement.clear();
      cardCvcElement.clear();
      renderDom.submit();// document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("turbo:load", pay);
// window.addEventListener("turbo:render", pay);