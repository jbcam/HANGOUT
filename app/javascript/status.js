// const status = document.querySelector('.status');
// const btnHide = document.getElementById('hideFirst');
// const btnShow = document.getElementById('showFirst');

// btnHide.addEventListener('click', () => {
//   firstDiv.hidden = true;
// });

// btnShow.addEventListener('click', () => {
//   firstDiv.hidden = false;
// });
function toggleStatus() {
  const notAvailable = document.getElementById("not-available");
  consoloe.log(notAvailable)
  const userAvailable = document.getElementById("available");
  const toggleActive = document.querySelector(".switch");

  var checkbox = toggleActive.querySelector("input");
  console.log(checkbox);

  checkbox.addEventListener( 'change', function() {
      if(this.checked) {
          // Checkbox is checked..
        notAvailable.classList.add("d-none");
        userAvailable.classList.remove("d-none");
      } else {
          // Checkbox is not checked..
        notAvailable.classList.remove("d-none");
        userAvailable.classList.add("d-none");
      }
  });
};

export { toggleStatus };
