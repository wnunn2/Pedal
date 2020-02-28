const priceUpdate = () => {
  const endDateInput = document.querySelector("#booking_end_date");
  const startDateInput = document.querySelector("#booking_start_date");
  const dayPrice = parseInt(document.querySelector('[data-price]').dataset.price, 10)
  console.log(dayPrice)
  endDateInput.addEventListener("change", (event) => {
    const endDate = new Date(endDateInput.value)
    const startDate = new Date(startDateInput.value)
    // console.log(endDate)
    const diffTime = Math.abs(endDate - startDate);
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
    const newPrice = diffDays * dayPrice;
    const totalPrice = document.querySelector("#total-price");
    totalPrice.innerText = newPrice
  })
}
export {priceUpdate}
