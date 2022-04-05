let inputs = document.querySelectorAll('form input')
let submitBtn = document.querySelector('form button[type="submit"]')
// submitBtn.addEventListener("click", validateForm)
inputs[1].addEventListener("input", validateForm)

function validateForm() {
    let outlines = document.querySelectorAll('form .input-outline')
    let lables = document.querySelectorAll('.colorStandard-21JIj7')
    let errMessages = document.querySelectorAll('.errorMessage-1kMqS5')

    for (let i = 0; i < inputs.length; i++) {
        inputs[i].addEventListener("input", validateForm)
        if (inputs[i].value == '') {
            outlines[i].classList.add('error-8r7mjf')
            lables[i].classList.add('error-3EBD81')
            errMessages[i].style.display = 'inline'

        } else {
            outlines[i].classList.remove('error-8r7mjf')
            lables[i].classList.remove('error-3EBD81')
            errMessages[i].style.display = 'none'
            submitBtn.disabled = ''
        }
    }
    (!inputs[0].value == '' && !inputs[1].value == '') ?
        submitBtn.disabled = '' : submitBtn.disabled = 'disabled'

}