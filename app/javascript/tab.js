function tabColor() {

  const tab_next = document.getElementById("button-tab-next");
  const tab_past = document.getElementById("button-tab-past");
  if (tab_next) {
    tab_next.addEventListener("click", (event) => {
      tab_next.classList.add("next-active");
      tab_past.classList.remove("past-active");
    });
  }
  if (tab_past) {
    tab_past.addEventListener("click", (event) => {
      tab_next.classList.remove("next-active");
      tab_past.classList.add("past-active");
    });
  }
}

export { tabColor };
