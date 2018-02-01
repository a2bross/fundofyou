const inputFile = document.getElementById("project_photo");

if (inputFile) {
  inputFile.addEventListener('change', e => {
    const result = inputFile.parentElement.nextElementSibling.nextElementSibling;
    let fileName = "";
    fileName = e.target.value.split( '\\' ).pop();
    if (fileName) {
      result.textContent = fileName;
    }
  })
}
