const changePriceValue = (event) => {
  const endDateInput = document.querySelector("#booking_end_date");
  const startDateInput = document.querySelector("#booking_start_date");
  const dayPrice = parseInt(document.querySelector('[data-price]').dataset.price, 10)
  const endDate = new Date(endDateInput.value)
  console.log(typeof endDateInput.value)
  const startDate = new Date(startDateInput.value)
  const diffTime = Math.abs(endDate - startDate);
  const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
  const newPrice = diffDays * dayPrice;
  const totalPrice = document.querySelector("#total-price");
  if (endDateInput.value !== "") {
    totalPrice.innerText = newPrice
  }
}

const priceUpdate = () => {
  const endDateInput = document.querySelector("#booking_end_date");
  const startDateInput = document.querySelector("#booking_start_date");
  if (endDateInput) {
    endDateInput.addEventListener("change", changePriceValue)
  }
  if (startDateInput) {
    startDateInput.addEventListener("change", changePriceValue)
  }
}
export {priceUpdate}
