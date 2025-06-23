import "@hotwired/turbo-rails"
import "./controllers"       // se tiver Stimulus
// -- nosso código abaixo --
document.addEventListener("turbo:load", () => {
  const container = document.getElementById("enderecos-container")
  const templateDiv = document.getElementById("endereco-template")
  const addBtn = document.getElementById("add-endereco")

  if (!container || !templateDiv || !addBtn) return

  addBtn.addEventListener("click", e => {
    e.preventDefault()
    let html = templateDiv.innerHTML.replace(/NEW_RECORD/g, new Date().getTime())
    container.insertAdjacentHTML("beforeend", html)
  })

  container.addEventListener("click", e => {
    if (e.target.matches(".remove-endereco")) {
      e.preventDefault()
      const fieldset = e.target.closest(".nested-fields")
      const destroyInput = fieldset.querySelector('input[name*="[_destroy]"]')
      if (destroyInput) {
        destroyInput.value = '1'
        fieldset.style.display = 'none'
      } else {
        fieldset.remove()
      }
    }
  })
})
