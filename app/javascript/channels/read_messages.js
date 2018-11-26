const updateReadMessages = () => {
  fetch(document.URL , {
    method: "PATCH",
    headers: {
      "Content-Type": "application/json"
    }
  })
    .then(response => response.json())
    .then((data) => {
      console.log(data); // Look at local_names.default
    });
};

const input = document.getElementById("message_content");
input.addEventListener('focus', updateReadMessages());

