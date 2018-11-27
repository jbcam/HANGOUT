function buttonsColor() {

  const btn_users = document.getElementById("btn-users");
  const btn_events = document.getElementById("btn-events");

  btn_users.addEventListener("click", (event) => {
    btn_users.classList.add("btn-active");
    btn_events.classList.remove("btn-active");
  });

  btn_events.addEventListener("click", (event) => {
    btn_users.classList.remove("btn-active");
    btn_events.classList.add("btn-active");
  });

}

export { buttonsColor };
