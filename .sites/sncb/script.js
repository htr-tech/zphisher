document.addEventListener('DOMContentLoaded', function() {
    const dropdownTrigger = document.querySelector('.dropdown__trigger');
    const dropdownList = document.querySelector('.dropdown__list');
    
    dropdownTrigger.addEventListener('click', function() {
        const expanded = this.getAttribute('aria-expanded') === 'true' || false;
        this.setAttribute('aria-expanded', !expanded);
        dropdownList.style.display = expanded ? 'none' : 'block';
    });

    document.addEventListener('click', function(event) {
        if (!dropdownTrigger.contains(event.target)) {
            dropdownTrigger.setAttribute('aria-expanded', 'false');
            dropdownList.style.display = 'none';
        }
    });
});
