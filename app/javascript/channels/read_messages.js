const updateReadMessages = () => {
  fetch(document.URL , {
    method: "PATCH",
    headers: {
      "Content-Type": "application/json",
      'X-CSRF-Token': Rails.csrfToken()
    }
  })
    // .then(response => response.json())
    // .then((data) => {
    //   console.log(data); // Look at local_names.default
    // });
};

try {
  const input = document.getElementById("message_content");
  input.addEventListener('focus', updateReadMessages());
} catch(e) {};

