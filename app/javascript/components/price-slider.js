const range = document.querySelector('input[type=range]');
const output = document.querySelector('output');
if (range) {
  output.textContent = range.value + " €";
  const width = parseInt(range.max, 10)- parseInt(range.min, 10);
  let position = parseInt(range.value - 1000, 10) / width;
  output.style.marginLeft = `calc(${position*90}% - 10px)`;
  range.addEventListener('change', e => {
    output.textContent = e.currentTarget.value + " €";
    position = parseInt(range.value - 1000, 10) / width;
    output.style.marginLeft = `calc(${position*88}% - 10px)`;
  })
}
